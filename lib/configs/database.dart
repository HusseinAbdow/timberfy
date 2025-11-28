import 'package:postgres/postgres.dart';
import 'package:timberfy/configs/config.dart';
import 'package:timberfy/models/shoe.dart';

class DatabaseHelper {
  // SINGLETON
  static final DatabaseHelper instance = DatabaseHelper._internal();
  factory DatabaseHelper() => instance;
  DatabaseHelper._internal();

  PostgreSQLConnection? _connection;
  //connecting only once to db
  Future<PostgreSQLConnection> connect() async {
    // If already connected → return immediately
    if (_connection != null && !_connection!.isClosed) {
      return _connection!;
    }

    _connection = PostgreSQLConnection(
      dbHost,
      dbPort,
      dbName,
      username: dbUserName,
      password: dbPassword,
    );

    try {
      await _connection!.open().timeout(Duration(seconds: 5));
      print("Connected to PostgreSQL successfully");
    } catch (e) {
      print("Failed to connect: $e");
      rethrow;
    }

    return _connection!;
  }

  // ---- FETCH SHOES ----
  Future<List<Shoe>> getShoes({
    required String gender,
    required String type,
  }) async {
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
  WHERE s.gender = @gender
    AND s.type = @type;
  ''',
      substitutionValues: {'gender': gender, 'type': type},
    );

    return result.map((row) => Shoe.fromRow(row)).toList();
  }

  // ---- FETCH SINGLE SHOE ----
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

    if (result.isEmpty) return null;
    return Shoe.fromRow(result.first);
  }

  Future<bool> isLiked(int shoeId) async {
    final conn = await connect();
    final result = await conn.query(
      'SELECT 1 FROM likes WHERE shoeid = @id',
      substitutionValues: {'id': shoeId},
    );

    return result.isNotEmpty;
  }

  Future<void> likeShoe(int shoeId) async {
    final conn = await connect();
    await conn.query(
      'INSERT INTO likes (shoeid) VALUES (@id) ON CONFLICT DO NOTHING',
      substitutionValues: {'id': shoeId},
    );
  }

  Future<void> unlikeShoe(int shoeId) async {
    final conn = await connect();
    await conn.query(
      'DELETE FROM likes WHERE shoe_id = @id',
      substitutionValues: {'id': shoeId},
    );
  }

  Future<bool> isInCart(int shoeId) async {
    final conn = await connect();
    final result = await conn.query(
      'SELECT 1 FROM cart WHERE shoe_id = @id',
      substitutionValues: {'id': shoeId},
    );

    return result.isNotEmpty;
  }

  Future<void> addToCart(int shoeId) async {
    final conn = await connect();
    await conn.query(
      'INSERT INTO cart (shoe_id) VALUES (@id) ON CONFLICT DO NOTHING',
      substitutionValues: {'id': shoeId},
    );
  }

  Future<void> removeFromCart(int shoeId) async {
    final conn = await connect();
    await conn.query(
      'DELETE FROM cart WHERE shoe_id = @id',
      substitutionValues: {'id': shoeId},
    );
  }
Future<List<Shoe>> getCartItems() async {
  final conn = await connect();

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

  return result.map((row) => Shoe.fromRow(row)).toList();
}


}
