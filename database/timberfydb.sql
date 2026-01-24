--
-- Timberfy PostgreSQL Database Schema & Sample Data
--

SET standard_conforming_strings = on;

--
-- TABLE: appuser
--

CREATE TABLE public.appuser (
    userid BIGINT NOT NULL,
    username VARCHAR(50) NOT NULL,
    profilepic VARCHAR(255)
);

CREATE SEQUENCE public.appuser_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE;

ALTER SEQUENCE public.appuser_userid_seq
    OWNED BY public.appuser.userid;

ALTER TABLE ONLY public.appuser
    ALTER COLUMN userid SET DEFAULT nextval('public.appuser_userid_seq');

ALTER TABLE ONLY public.appuser
    ADD CONSTRAINT appuser_pkey PRIMARY KEY (userid);

ALTER TABLE ONLY public.appuser
    ADD CONSTRAINT appuser_username_key UNIQUE (username);

--
-- TABLE: cart
--

CREATE TABLE public.cart (
    id INTEGER NOT NULL,
    shoe_id INTEGER NOT NULL,
    quantity INTEGER DEFAULT 1
);

CREATE SEQUENCE public.cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE;

ALTER SEQUENCE public.cart_id_seq
    OWNED BY public.cart.id;

ALTER TABLE ONLY public.cart
    ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq');

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);

--
-- TABLE: likes
--

CREATE TABLE public.likes (
    shoeid INTEGER NOT NULL
);

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (shoeid);

--
-- TABLE: shoe
--

CREATE TABLE public.shoe (
    shoeid BIGINT NOT NULL,
    name VARCHAR(250) NOT NULL,
    maindescription VARCHAR(300) NOT NULL,
    briefdescription VARCHAR(250) NOT NULL,
    price NUMERIC(7,2) NOT NULL,
    gender VARCHAR(12) NOT NULL,
    type VARCHAR(50) NOT NULL
);

CREATE SEQUENCE public.shoe_shoeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE;

ALTER SEQUENCE public.shoe_shoeid_seq
    OWNED BY public.shoe.shoeid;

ALTER TABLE ONLY public.shoe
    ALTER COLUMN shoeid SET DEFAULT nextval('public.shoe_shoeid_seq');

ALTER TABLE ONLY public.shoe
    ADD CONSTRAINT shoe_pkey PRIMARY KEY (shoeid);

--
-- TABLE: shoeimage
--

CREATE TABLE public.shoeimage (
    imageid BIGINT NOT NULL,
    shoeid BIGINT NOT NULL,
    imagepath VARCHAR(255) NOT NULL
);

CREATE SEQUENCE public.shoeimage_imageid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE;

ALTER SEQUENCE public.shoeimage_imageid_seq
    OWNED BY public.shoeimage.imageid;

ALTER TABLE ONLY public.shoeimage
    ALTER COLUMN imageid SET DEFAULT nextval('public.shoeimage_imageid_seq');

ALTER TABLE ONLY public.shoeimage
    ADD CONSTRAINT shoeimage_pkey PRIMARY KEY (imageid);

ALTER TABLE ONLY public.shoeimage
    ADD CONSTRAINT shoeimage_shoeid_fkey
    FOREIGN KEY (shoeid) REFERENCES public.shoe(shoeid);

--
-- DATA
--

COPY public.likes (shoeid) FROM stdin;
1
23
4
\.

COPY public.shoe (shoeid, name, maindescription, briefdescription, price, gender, type) FROM stdin;
1	Green Stride Blue	Premium Timberlandr leather meets eco-conscious cushioning. Breathable comfort and rugged outsole for everyday adventures.	Step bold in blue	168.00	male	sneakers
2	Green Stride Red	Durable design with striking red accents, built to stand out while providing lasting comfort.	Energy in every step.	175.00	male	sneakers
3	Green Stride White	Clean look, lightweight stride. A modern sneaker for everyday wear.	Pure comfort in white.	160.00	male	sneakers
4	Green Stride Brown	Premium Timberlandr leather meets eco-conscious cushioning. Breathable comfort and rugged outsole for everyday adventures.	Step bold in brown	168.00	male	sneakers
5	Motion Scramble Black	All-terrain grip with a sleek black look, crafted for motion and durability.	Black style, strong motion.	190.00	male	sneakers
6	Motion Scramble	Versatile sneaker with modern design, made to adapt to city streets and trails.	Versatility in every step.	185.00	male	sneakers
7	Timber Brown	Classic Timberlandr boot with warm brown leather, rugged outsole for long-lasting wear.	Classic style, timeless strength.	210.00	male	boots
8	Timber Dark Brown	Deep leather tones combined with durable comfort. Perfect for tough days and tougher style.	Strong look, stronger feel.	220.00	male	boots
9	Timber Grey	Modern grey finish on a rugged boot silhouette. Blends outdoor strength with urban design.	Grey never looked this bold.	215.00	male	boots
10	Stone Street Grey	Grey leather with a modern twist. Durable outsole for confident movement.	Cool tone, tough step.	215.00	male	boots
11	Briton Square	Sleek low-cut design for casual comfort. Polished leather finish with modern edges.	Smart, simple, stylish.	160.00	male	low
12	Briton Square 2	Updated edition of Briton Square with added comfort and flexibility.	Everyday wear, leveled up.	165.00	male	low
13	Emerson	Casual low shoe built for durability and flexible everyday use.	Comfort that stays.	150.00	male	low
14	Green Stride Blue (Women)	Eco-conscious cushioning meets timeless blue design, made to fit every step.	Bold comfort in blue.	160.00	female	sneakers
15	Green Stride Light Green	Fresh green tones with lightweight build, perfect for casual days.	Light and fresh comfort.	165.00	female	sneakers
16	Green Stride Light Brown	Earthy tones blended with soft comfort. Built for long-lasting steps.	Brown elegance, light on feet.	170.00	female	sneakers
17	Green Stride White (Women)	Minimal white sneaker with maximum comfort, styled for everyday use.	Clean look, pure comfort.	155.00	female	sneakers
18	Motion Madsen	Active lifestyle sneaker crafted for durability and flexible motion.	Keep moving in style.	180.00	female	sneakers
19	Roxie Lane	Bold boot design with premium finish, crafted to make a statement.	Own the streets with Roxie.	210.00	female	boots
20	Stone Street Brown	Earthy tones in a rugged boot silhouette. Made for versatile styling.	Brown roots, bold steps.	220.00	female	boots
21	Stone Street Grey	Grey leather with a modern twist. Durable outsole for confident movement.	Cool tone, tough step.	215.00	female	boots
22	Stone Street White	Bright white boots for a standout look.	Shine with every step.	225.00	female	boots
23	Stone Street Low 1	Low cut design, crafted for simplicity and comfort.	Everyday casual wear.	140.00	female	low
24	Stone Street Low 2	A softer, refined version of the Stone Street with premium comfort.	Style meets simplicity.	145.00	female	low
25	Stone Street Low 3	Final design of Stone Street series with added durability.	Finish strong, walk light.	150.00	female	low
\.

COPY public.shoeimage (imageid, shoeid, imagepath) FROM stdin;
94	1	assets/images/men/sneakers/greenstride-blue1.png
95	1	assets/images/men/sneakers/greenstride-blue2.png
96	1	assets/images/men/sneakers/greenstride-blue3.png
97	2	assets/images/men/sneakers/greenstride-red1.png
98	2	assets/images/men/sneakers/greenstride-red2.png
99	2	assets/images/men/sneakers/greenstride-red3.png
100	3	assets/images/men/sneakers/greenstridewhite1.png
101	3	assets/images/men/sneakers/greenstridewhite2.png
102	3	assets/images/men/sneakers/greenstridewhite3.png
\.
