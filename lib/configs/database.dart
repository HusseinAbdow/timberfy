import 'package:postgres/postgres.dart';
import 'package:timberfy/configs/config.dart';
import 'package:timberfy/models/shoe.dart';

// DatabaseHelper handles all database operations
// Uses Singleton pattern to keep a single DB connection
class DatabaseHelper {
  // SINGLETON instance
  static final DatabaseHelper instance = DatabaseHelper._internal();
  factory DatabaseHelper() => instance;
  DatabaseHelper._internal();

  // Holds the PostgreSQL connection
  PostgreSQLConnection? _connection;

  // Connects to the database (only once)
  Future<PostgreSQLConnection> connect() async {
    // If already connected and connection is open → reuse it
    if (_connection != null && !_connection!.isClosed) {
      return _connection!;
    }

    // Create new PostgreSQL connection using config values
    _connection = PostgreSQLConnection(
      dbHost,
      dbPort,
      dbName,
      username: dbUserName,
      password: dbPassword,
    );

    try {
      // Try opening connection with timeout
      await _connection!.open().timeout(Duration(seconds: 5));
      print("Connected to PostgreSQL successfully");
    } catch (e) {
      // Print error and rethrow so UI can handle it
      print("Failed to connect: $e");
      rethrow;
    }

    return _connection!;
  }

  // ---- FETCH SHOES BY GENDER & TYPE ----
  Future<List<Shoe>> getShoes({
    required String gender,
    required String type,
  }) async {
    // Ensure DB connection exists
    final conn = await connect();

    // SQL query to fetch shoes + their images
    final result = await conn.query(
      '''
  SELECT 
    s.shoeid,
    s.name,
    s.maindescription,
    s.briefdescription,
    s.price,
    s.gender,
    s.type,
    ARRAY(
      SELECT imagepath 
      FROM shoeimage 
      WHERE shoeid = s.shoeid
    ) AS image_paths
  FROM shoe s
  WHERE s.gender = @gender
    AND s.type = @type;
  ''',
      // Safe parameter substitution (prevents SQL injection)
      substitutionValues: {'gender': gender, 'type': type},
    );

    // Convert each row into a Shoe model
    return result.map((row) => Shoe.fromRow(row)).toList();
  }

  // ---- FETCH SINGLE SHOE BY ID ----
  Future<Shoe?> getShoeById(int id) async {
    final conn = await connect();

    final result = await conn.query(
      '''
      SELECT 
        s.shoeid,
        s.name,
        s.maindescription,
        s.briefdescription,
        s.price,
        s.gender,
        s.type,
        ARRAY(
          SELECT imagepath 
          FROM shoeimage 
          WHERE shoeid = s.shoeid
        ) AS image_paths
      FROM shoe s
      WHERE s.shoeid = @id
      ''',
      substitutionValues: {'id': id},
    );

    // If no shoe found → return null
    if (result.isEmpty) return null;

    // Convert first row into Shoe object
    return Shoe.fromRow(result.first);
  }

  // ---- LIKES ----
  Future<bool> isLiked(int shoeId) async {
    final conn = await connect();

    // Check if shoe exists in likes table
    final result = await conn.query(
      'SELECT 1 FROM likes WHERE shoeid = @id',
      substitutionValues: {'id': shoeId},
    );

    return result.isNotEmpty;
  }

  Future<void> likeShoe(int shoeId) async {
    final conn = await connect();

    // Insert like, ignore if already liked
    await conn.query(
      'INSERT INTO likes (shoeid) VALUES (@id) ON CONFLICT DO NOTHING',
      substitutionValues: {'id': shoeId},
    );
  }

  Future<void> unlikeShoe(int shoeId) async {
    final conn = await connect();

    // Remove like entry
    await conn.query(
      'DELETE FROM likes WHERE shoe_id = @id',
      substitutionValues: {'id': shoeId},
    );
  }

  // ---- CART ----
  Future<bool> isInCart(int shoeId) async {
    final conn = await connect();

    // Check if shoe exists in cart
    final result = await conn.query(
      'SELECT 1 FROM cart WHERE shoe_id = @id',
      substitutionValues: {'id': shoeId},
    );

    return result.isNotEmpty;
  }

  Future<void> addToCart(int shoeId) async {
    final conn = await connect();

    // Add shoe to cart, avoid duplicates
    await conn.query(
      'INSERT INTO cart (shoe_id) VALUES (@id) ON CONFLICT DO NOTHING',
      substitutionValues: {'id': shoeId},
    );
  }

  Future<void> removeFromCart(int shoeId) async {
    final conn = await connect();

    // Remove shoe from cart
    await conn.query(
      'DELETE FROM cart WHERE shoe_id = @id',
      substitutionValues: {'id': shoeId},
    );
  }

  // ---- FETCH ALL CART ITEMS ----
  Future<List<Shoe>> getCartItems() async {
    final conn = await connect();

    // Join cart table with shoe table to get full shoe data
    final result = await conn.query('''
    SELECT 
      s.shoeid,
      s.name,
      s.maindescription,
      s.briefdescription,
      s.price,
      s.gender,
      s.type,
      ARRAY(
        SELECT imagepath 
        FROM shoeimage 
        WHERE shoeid = s.shoeid
      ) AS image_paths
    FROM shoe s
    INNER JOIN cart c ON c.shoe_id = s.shoeid;
  ''');

    // Convert DB rows to Shoe objects
    return result.map((row) => Shoe.fromRow(row)).toList();
  }
}
