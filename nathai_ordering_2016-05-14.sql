-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2016 at 02:23 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nathai_ordering`
--

-- --------------------------------------------------------

--
-- Table structure for table `billings`
--

CREATE TABLE `billings` (
  `id` int(11) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `billing_no` tinyint(4) NOT NULL,
  `table_no` char(3) NOT NULL,
  `total_customer` tinyint(4) DEFAULT NULL,
  `total_price` decimal(6,0) DEFAULT NULL,
  `total_vat` decimal(6,0) DEFAULT NULL,
  `payment_cash` decimal(6,0) DEFAULT NULL,
  `payment_return` decimal(6,0) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(4) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_th` varchar(50) NOT NULL,
  `name_jp` varchar(50) NOT NULL,
  `ordering` tinyint(4) NOT NULL DEFAULT '1',
  `parent_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_en`, `name_th`, `name_jp`, `ordering`, `parent_id`) VALUES
(1, 'Kao Man Gai Set', 'Kao Man Gai Set', 'Kao Man Gai Set', 1, NULL),
(2, 'Lunch Set', 'Lunch Set', 'Lunch Set', 1, NULL),
(3, 'Lunch Drink', 'Lunch Drink', 'Lunch Drink', 1, NULL),
(4, 'Alcohol Drink', 'Alcohol Drink', 'Alcohol Drink', 1, NULL),
(5, 'Soft Drink', 'Soft Drink', 'Soft Drink', 1, NULL),
(6, 'Appetizer', 'Appetizer', 'Appetizer', 1, NULL),
(7, 'Salad', 'Salad', 'Salad', 1, NULL),
(8, 'Rice and Noodle', 'Rice and Noodle', 'Rice and Noodle', 1, NULL),
(9, 'Curry and Soup', 'Curry and Soup', 'Curry and Soup', 1, NULL),
(10, 'Dessert', 'Dessert', 'Dessert', 1, NULL),
(11, 'Take Out', 'Take Out', 'Take Out', 1, NULL),
(12, 'Other', 'Other', 'Other', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name_th` tinytext NOT NULL,
  `name_en` tinytext NOT NULL,
  `name_jp` tinytext NOT NULL,
  `name_kitchen` tinytext NOT NULL,
  `image_url` tinytext,
  `price` int(11) NOT NULL,
  `type` enum('food','dessert','drink','other') NOT NULL DEFAULT 'food',
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `category_id`, `name_th`, `name_en`, `name_jp`, `name_kitchen`, `image_url`, `price`, `type`, `parent_id`) VALUES
(1, 4, 'Asahi (เบียร์สด)', 'Asahi Super Dry (Draft)', 'アサヒスーパードライ(生)', 'DRAFT BEER', NULL, 450, 'food', NULL),
(2, 4, 'Asahi (เบียร์ขวด)', 'Asahi Super Dry', 'アサヒスーパードライ', 'SUPER DRY BEER', NULL, 600, 'food', NULL),
(3, 4, 'เบียร์สิงห์', 'Singha beer', 'シンハービール', 'SINGHA BEER', NULL, 600, 'food', NULL),
(4, 4, 'เบียร์ช้าง', 'Chang Beer', 'チャーンビール', 'CHANG BEER', NULL, 600, 'food', NULL),
(5, 4, 'เบียร์ลาว', 'Laos Beer', 'ラオスビール', 'LAOS BEER', NULL, 600, 'food', NULL),
(6, 4, 'เบียร์ไฮเนเก้นส์', 'Hinekens', 'ハイネケンビール', 'HINEKENS', NULL, 600, 'food', NULL),
(7, 4, 'ไฮบอล', 'Highball', 'ハイボール', 'Highball', NULL, 450, 'food', NULL),
(8, 4, 'เลม่อนซาว่า  ', 'Lemon Sour', 'レモンサワー ', 'Lemon Sour', NULL, 450, 'food', NULL),
(9, 4, 'อุลงไฮ', 'Oolong High', 'ウーロンハイ ', 'Oolong High', NULL, 450, 'food', NULL),
(10, 4, 'ซีกัวซาว่า', 'Seek sour', 'シークサワー   ', 'Seek sour', NULL, 450, 'food', NULL),
(11, 4, 'Spy Red', 'Spy red', 'スパイレッド', 'SPY RED', NULL, 600, 'food', NULL),
(12, 4, 'Spy Classic', 'Spy Classic', 'スパイクラシック ', 'SPY CLASSIC', NULL, 600, 'food', NULL),
(13, 4, 'เหล้าบ้วย (ร็อค/น้ำ/โซดา)', 'Plum Wine', '梅酒（ロック/水割り/ソーダ割り）', 'Plum Wine (R/W/S)', NULL, 450, 'food', NULL),
(14, 4, 'แสงโสม (ร็อค/น้ำ/โซดา)', 'Sang Som', 'セーンソム（ロック/水割り/ソーダ割り） ', 'Sang Som (R/W/S)', NULL, 650, 'food', NULL),
(15, 4, 'หงษ์ทอง (ร็อค/น้ำ/โซดา)', 'Hong Thong', 'ホン・トーン（ロック/水割り/ソーダ割り） ', 'Hong Thong (R/W/S)', NULL, 550, 'food', NULL),
(16, 4, 'วิสกี้ผสมชาไทย', 'Wisky, Thai Tea', '', 'Wisky, Thai Tea', NULL, 550, 'food', NULL),
(17, 5, 'Cola', 'Cola', 'コーラ ', 'COLA', NULL, 300, 'food', NULL),
(18, 5, 'Ginger ale', 'Ginger Ale', 'ジンジャエール', 'Ginger Ale', NULL, 300, 'food', NULL),
(19, 5, 'น้ำมะนาว', 'Lemonade', 'レモネード', 'Lemonade', NULL, 400, 'food', NULL),
(20, 5, 'น้ำฝรั่ง', 'Guava Juice', 'グアバジュース', 'Guava Juice', NULL, 400, 'food', NULL),
(21, 5, 'น้ำส้ม', 'Orange Juice', 'オレンジジュース', 'Orange Juice', NULL, 400, 'food', NULL),
(22, 5, 'น้ำมะพร้าว', 'Coconut Juice', 'ココナッツジュース', 'Coconut Juice', NULL, 400, 'food', NULL),
(23, 5, 'น้ำมะม่วง', 'Mango Juice', 'マンゴージュース', 'Mango Juice', NULL, 400, 'food', NULL),
(24, 5, 'น้ำสัปปะรด', 'Pineapple Juice', 'パイナップルジュース', 'Pineapple Juice', NULL, 400, 'food', NULL),
(25, 5, 'น้ำลิ้นจี่', 'Litchi Juice', 'ライチジュース', 'Litchi Juice', NULL, 400, 'food', NULL),
(26, 5, 'กาแฟเย็น', 'Ice Coffee', 'アイスコーヒー', 'Ice Coffee', NULL, 500, 'food', NULL),
(27, 5, 'กาแฟร้อน', 'Hot coffee', 'ホットコーヒー', 'Hot coffee', NULL, 450, 'food', NULL),
(28, 5, 'ชาไทย', 'Thai Tea', 'タイ茶', 'Thai Tea', NULL, 400, 'food', NULL),
(29, 5, 'ชาดอกคำฝอย', 'Safflower', 'サフラワー茶', 'Safflower', NULL, 400, 'food', NULL),
(30, 5, 'ชาตะไคร้', 'Lemongrass', 'レモングラス茶', 'Lemongrass', NULL, 400, 'food', NULL),
(31, 5, 'ชบาชา กระเจี๊ยบแดง', 'Hibiscus Roselle', 'ハイビスカス・ローゼル茶', 'Hibiscus Roselle', NULL, 400, 'food', NULL),
(32, 5, 'อัญชัน', 'Butterfly Pea', 'バタフライピー茶', 'Butterfly Pea', NULL, 400, 'food', NULL),
(33, 5, 'อุรงชา', 'Orong Tea', 'ウーロン茶', 'Orong Tea', NULL, 400, 'food', NULL),
(34, 5, 'ชาจัสมิน', 'Jasmin Tea', 'ジャスミン茶', 'Jasmin Tea', NULL, 400, 'food', NULL),
(35, 6, 'ปอเปียะสดกุ้ง', 'Fresh Shrimp roll ', 'エビ生春巻き　', 'PO. SOD  ', NULL, 500, 'food', NULL),
(36, 6, 'ปอเปี๊ยะทอด', 'Deep fried spring rolls', '揚げ春巻き　', 'PO. TOD', NULL, 650, 'food', NULL),
(37, 6, 'ไก่ย่าง', 'Grilled chicken (Yakitori)', 'タイスタイル　焼き鳥  ', 'GAI YANG', NULL, 700, 'food', NULL),
(38, 6, 'กุ้งกระเบื้อง', 'Deep fried shrimp cake with rice paper', 'エビすり身の薄揚げ', 'KUNG KA BEANG', NULL, 750, 'food', NULL),
(39, 6, 'ผัดผักบุ้ง', 'Stir fried morning glory', '空心菜炒め', 'PAD PAKBUNG', NULL, 750, 'food', NULL),
(40, 6, 'ทอดมันกุ้ง  ', 'Deep fried shrimp patties', '海老のすり身揚げ ', 'TODMAN KUNG  ', NULL, 750, 'food', NULL),
(41, 6, 'หมูสะเต๊ะ', 'Grilled meat skewers pork', '豚肉のサテ', 'MOO SATE', NULL, 650, 'food', NULL),
(42, 6, 'ไก่สะเต๊ะ ', 'Grilled meat skewers chicken', '鳥肉のサテ', 'GAI SATE', NULL, 600, 'food', NULL),
(43, 6, 'คอหมูย่าง', 'Seasoned grilled pork neck', '豚肉のグリル', 'K.MOO GAI', NULL, 750, 'food', NULL),
(44, 6, 'กุ้งทอดกระเทียม', 'Fried shrimp with garlic', 'エビとにんにく揚げ', 'KUNG TOD KATAEM ', NULL, 800, 'food', NULL),
(45, 6, 'ไข่เจี๋ยวหมูสับ', 'Thai''s Omelet', 'Thai''s Omelet', 'KAI JEIW', NULL, 650, 'food', NULL),
(46, 6, 'ปีกไก่ทอด', 'Fried Chicken', 'チキン　から揚げ', 'Deep Fried Chicken Wings', NULL, 650, 'food', NULL),
(47, 7, 'ส้มตำไทย', 'Somtam Thai', 'ソムタム　タイ', 'SOM TOM', NULL, 750, 'food', NULL),
(48, 7, 'ยำอาโวคาโดกุ้งสด', 'Avocado and shrimp spicy salad', 'エビとアボガド サラダ', 'YAM AVOCADO', NULL, 800, 'food', NULL),
(49, 7, 'ยำวุ้นเส้น', 'Grass noodle spicy salad', '春ざめ　サラダ', 'YAM WUNSAN', NULL, 550, 'food', NULL),
(50, 7, 'ยำตะไคร้กุ้งสด', 'Lemongrass and shrimp spicy salad', 'レモングラス　サラダ', 'YAM TAKAI KUNG', NULL, 750, 'food', NULL),
(51, 7, 'น้ำตกคอย่าง', 'Grilled pork shoulder in spicy condiment', 'ピートロ 焼き 辛い調味料　サラダ', 'NAMTOK K.MOO', NULL, 850, 'food', NULL),
(52, 7, 'ยำคอหมูย่าง', 'Seasoned grilled pork spicy salad', '豚トロ炙り焼きサラダ', 'YAM K.MOO', NULL, 650, 'food', NULL),
(53, 7, 'ลาบไก่', 'Minced chicken salad with fresh thai herb', '鶏ひき肉のイサーンサラダ', 'LAB GAI', NULL, 650, 'food', NULL),
(54, 8, 'ข้าวกระเพราไก่ไข่ดาว', 'Minced chicken stir fried with basil leaf', 'カパオカイ　ライス', 'KAO KAPAO', NULL, 950, 'food', NULL),
(55, 8, 'ข้าวไก่ผัดเม็ดมะม่วงหิมพานต์', 'Rice and Stir-fried Chicken with cashew nuts', '', 'KAO GAI MET', NULL, 950, 'food', NULL),
(56, 8, 'ข้าวผัดกุ้ง', 'Thai fried rice with prawns', 'エビ　シャハン ', 'KAO PAD KUNG', NULL, 850, 'food', NULL),
(57, 8, 'ข้าวมันไก่', 'Chicken Rice', 'カオマンガイ', 'KAO MAN GAI', NULL, 950, 'food', NULL),
(58, 8, 'ก๋วยเตี๋ยวต้มยำกุ้ง', 'Noodle in spicy soup', '', 'TIEW TOM YAM', NULL, 900, 'food', NULL),
(59, 8, 'ก๋วยเตี๋ยวไก่', 'Noodle in chicken soup', '', 'TIEW GAI', NULL, 800, 'food', NULL),
(60, 8, 'ก๋วยเตี๋ยวเนื้อ', 'Noodle in beef soup', '', 'TIEW NUE', NULL, 1050, 'food', NULL),
(61, 8, 'ข้าวซอยไก่', 'Noodle in Chicken Curry', 'カオソイガイ', 'KAO SOI GAI', NULL, 950, 'food', NULL),
(62, 8, 'ผัดไทย', 'Fried Noodles', 'パッタイ', 'PAD THAI', NULL, 850, 'food', NULL),
(63, 8, 'สปาเก็ตตี้ผัดขี้เมา', 'Spicy spaghetti', '', 'SPA. KEEMAO', NULL, 850, 'food', NULL),
(64, 8, 'สปาเก็ตตี้เขียวหวาน', 'Green curry spaghetti', '', 'SPA. KAEW GAI', NULL, 850, 'food', NULL),
(65, 8, 'ผัดผักรวมมิตร', 'Stir fried vegetable', '野菜炒め', 'PAD PAK', NULL, 650, 'food', NULL),
(66, 8, 'ผัดเปรี้ยวหวาน', 'Sour and Sweet Stir-Fry', '', 'PAD PEW WAN', NULL, 750, 'food', NULL),
(67, 8, 'ผัดผักกวางตุ้ง', 'Stir fried Bog Choy and crispy pork', '', 'PAD PAKBUNG', NULL, 850, 'food', NULL),
(68, 8, 'ไก่ผัดเม็ดมะม่วงหิมพานต์', 'Stir fried Chicken with cashew nuts', '', 'GAI MEI', NULL, 750, 'food', NULL),
(69, 9, 'แกงเขียวหวานไก่', 'Green curry with chicken', 'グリーン カレー', 'GANG KAEW GAI', NULL, 950, 'food', NULL),
(70, 9, 'แกงแดงไก่', 'Red curry with chicken', 'チキン　レッドカレー ', 'GANG DANG GAI', NULL, 950, 'food', NULL),
(71, 9, 'มัสมั่นเนื้อ', 'Massaman curry with Beef', '牛肉マッサマン', 'MASAMAN NUE', NULL, 1000, 'food', NULL),
(72, 9, 'พะแนงไก่', 'Panaeng curry with pork', 'チキンパネンカレー', 'PA NANG', NULL, 900, 'food', NULL),
(73, 9, 'ฉู่ฉี่กุ้ง', 'Fried shrimp with spicy sauce', '', 'CHUCHI KUNG', NULL, 800, 'food', NULL),
(74, 9, 'แกงป่าไก่', 'Jungle soup with chicken', '', 'GANG PA GAI', NULL, 750, 'food', NULL),
(75, 9, 'ต้มยำกุ้ง', 'Thai prawn soup', 'トムヤムクン。スープ', 'TOM YAM KUNG', NULL, 1100, 'food', NULL),
(76, 9, 'ต้มข่าไก่', 'Coconut soup with chicken', '鶏肉のココナットミルクスープ', 'TOM KA GAI', NULL, 950, 'food', NULL),
(77, 9, 'แกงจืดเต้าหู้หมูสับ', 'clear soup with tofu and pork', '', 'TOFU SOUP', NULL, 750, 'food', NULL),
(78, 10, 'ขนมชั้น', 'Layer Sweet Cake', 'ァイヤーカッケ', 'Layer Sweet Cake', NULL, 400, 'food', NULL),
(79, 10, 'สังขยาฟักทอง', 'Pumpkin custard', 'かぼちゃのカスタード', 'Pumpkin Custard', NULL, 400, 'food', NULL),
(80, 10, 'ขนมถ้วย', 'Coconut milk custard (2 Cups)', 'ココナッツミルクのカスタード（2コ）', 'Coconut Custard', NULL, 300, 'food', NULL),
(81, 10, 'ขนมหม้อแกง', 'Baked pudding of coconut custard', 'ココナッツカスタードの焼プリン', 'Baked Pudding', NULL, 350, 'food', NULL),
(82, 10, 'สาคูกะทิ', 'Tapioca in coconut milk', 'タピオカ入りココナッツミルク', 'Tapioca', NULL, 450, 'food', NULL),
(83, 10, 'ไอติมกระทิ', 'Coconut milk ice cream', 'ココナッツアイスクリーム', 'Coconut Ice Cream', NULL, 450, 'food', NULL),
(84, 10, 'ไอติมกะทิใส่สาคูข้าวโพด', 'Tapioca and corn in coconut milk ice cream', 'タピオカとスイートコーン入りココナッツミルクアイス', 'Tapioca Ice Cream', NULL, 550, 'food', NULL),
(85, 10, 'ไอติมมะม่วง', 'Mango ice cream', 'マンゴーアイスクリーム', 'Mango Ice Cream', NULL, 500, 'food', NULL),
(86, 10, 'พุดดิ้งมะม่วง', 'Mango pudding', 'マンゴープリン', 'Mango Pudding', NULL, 550, 'food', NULL),
(87, 10, 'ข้าวเหนียวมะม่วง', 'Putting coconut milk on mango and sticky rice', 'マンゴーともち米のココナッツミルク掛け  ', 'Mango Sticky Rice', NULL, 950, 'food', NULL),
(88, 12, 'ข้าวหอมมะลิ', 'Jasmine Rices', 'シャツミン　ライス', 'Jasmine Rices', NULL, 200, 'food', NULL),
(89, 12, 'ข้าวเหนียว', 'Sticky Rice', 'Sticky Rice', 'Sticky Rice', NULL, 300, 'food', NULL),
(90, 12, 'ผักชี', 'Coriander', 'Coriander', 'PAK CHEE', NULL, 200, 'food', NULL),
(91, 1, 'A1 SET', 'A1 SET', '', 'A1', NULL, 800, 'food', NULL),
(92, 1, 'A2 SET', 'A2 SET', '', 'A2', NULL, 800, 'food', NULL),
(93, 1, 'A3 SET', 'A3 SET', '', 'A3', NULL, 800, 'food', NULL),
(94, 1, 'B1 SET', 'B1 SET', '', 'B1', NULL, 800, 'food', NULL),
(95, 1, 'B2 SET', 'B2 SET', '', 'B2', NULL, 800, 'food', NULL),
(96, 1, 'B3 SET', 'B3 SET', '', 'B3', NULL, 800, 'food', NULL),
(97, 1, 'C1 SET', 'C1 SET', '', 'C1', NULL, 800, 'food', NULL),
(98, 1, 'C2 SET', 'C2 SET', '', 'C2', NULL, 800, 'food', NULL),
(99, 1, 'C3 SET', 'C3 SET', '', 'C3', NULL, 800, 'food', NULL),
(100, 1, 'A1 (L) SET', 'A1 (L) SET', '', 'A1 (L)', NULL, 900, 'food', NULL),
(101, 1, 'A2 (L) SET', 'A2 (L) SET', '', 'A2 (L)', NULL, 900, 'food', NULL),
(102, 1, 'A3 (L) SET', 'A3 (L) SET', '', 'A3 (L)', NULL, 900, 'food', NULL),
(103, 1, 'B1 (L) SET', 'B1 (L) SET', '', 'B1 (L)', NULL, 900, 'food', NULL),
(104, 1, 'B2 (L) SET', 'B2 (L) SET', '', 'B2 (L)', NULL, 900, 'food', NULL),
(105, 1, 'B3 (L) SET', 'B3 (L) SET', '', 'B3 (L)', NULL, 900, 'food', NULL),
(106, 1, 'C1 (L) SET', 'C1 (L) SET', '', 'C1 (L)', NULL, 900, 'food', NULL),
(107, 1, 'C2 (L) SET', 'C2 (L) SET', '', 'C2 (L)', NULL, 900, 'food', NULL),
(108, 1, 'C3 (L) SET', 'C3 (L) SET', '', 'C3 (L)', NULL, 900, 'food', NULL),
(109, 2, 'ณ.ไทย Special', 'NaThai Special ', 'ナ・タイ スペシャル', 'NaThai Special', NULL, 1100, 'food', NULL),
(110, 2, 'กระเพาาไก่ไข่ดาว', 'Basil Fried Chicken and fried egg', 'ガパオガイ ライス', 'KAPAO', NULL, 900, 'food', NULL),
(111, 2, 'ข้าวผัดกุ้ง', 'Fried Rice with Prawns', 'エビ。シャーハン', 'KAO PAD KUNG', NULL, 850, 'food', NULL),
(112, 2, 'แกงเขียวหวาน', 'Green Curry', 'グリーンカレー', 'Green Curry', NULL, 850, 'food', NULL),
(113, 2, 'ก๋วยเตี๋ยวต้มยำกุ้ง', 'Tom Yam Kung Noodle', 'トム・ヤム・クン ヌードル', 'TIEW TOM YAM', NULL, 900, 'food', NULL),
(114, 2, 'ข้าวซอยไก่', 'Noodle in Chicken Curry', 'チキンカレー　ヌードル', 'KAO SOI', NULL, 950, 'food', NULL),
(115, 3, 'ผัดไทยห่อไข่', 'Pat Thai (Thailand shrimp wrapped in fried egg)', 'パッドタイとエビ卵の包み', 'PAT THAI', NULL, 850, 'food', NULL),
(116, 2, 'ปอเปี๊ยะสด', 'Shrimp Spring Roll', 'エビ生春巻き', 'PO. SOD', NULL, 250, 'food', NULL),
(117, 2, 'ยำวุ้นเส้น', 'Noodle Grass with Spicy Salad', '春雨のサラダ', 'YAM WAN SAN', NULL, 500, 'food', NULL),
(118, 2, 'ส้มตำไทย', 'Somtam', 'ソムタム', 'SOM TAM', NULL, 550, 'food', NULL),
(119, 2, 'ผักชี', 'Coriander', 'パクチー', 'PAK CHEE', NULL, 100, 'food', NULL),
(120, 3, 'ชาไทย', 'Thai Tea', 'タイ茶', 'Thai Tea', NULL, 400, 'food', NULL),
(121, 3, 'ชาจัสมิน', 'Jasmine Tea', 'ジャスミン茶', 'Jasmine Tea', NULL, 400, 'food', NULL),
(122, 3, 'ชาตะไคร้', 'Lemon Grass', 'レモングラスティー', 'Lemon Grass', NULL, 400, 'food', NULL),
(123, 3, 'ชากระเจี๊ยบ', 'Roselle Tea', 'ローゼルティー', 'Roselle Tea', NULL, 400, 'food', NULL),
(124, 3, 'ชาอัญชัน', 'Butterfly pea', 'バタフライピー茶', 'Butterfly pea', NULL, 400, 'food', NULL),
(125, 3, 'ชาคำฝอย', 'Safflower Tea', 'サフラワー茶', 'Safflower Tea', NULL, 400, 'food', NULL),
(126, 3, 'กาแฟร้อน', 'Hot Coffee', 'ホットコーヒー', 'Hot Coffee', NULL, 400, 'food', NULL),
(127, 3, 'น้ำฝรั่ง', 'Guava Juice', 'グアバ ジュース', 'Guava Juice', NULL, 400, 'food', NULL),
(128, 3, 'น้ำส้ม', 'Orange Juice', 'オレンジジュース', 'Orange Juice', NULL, 400, 'food', NULL),
(129, 3, 'น้ำมะพร้าว', 'CoConut Juice', 'ココナッツ', 'CoConut Juice', NULL, 400, 'food', NULL),
(130, 3, 'น้ำมะม่วง', 'Mango Juice', 'マンゴージュース', 'Mango Juice', NULL, 400, 'food', NULL),
(131, 3, 'น้ำสัปปะรด', 'Pine Apple Juice', 'パイナップル ジュース', 'Pine Apple Juice', NULL, 400, 'food', NULL),
(132, 3, 'น้ำลิ้นจี่', 'Lycee Juice', 'ライチ ジュース', 'Lycee Juice', NULL, 400, 'food', NULL),
(133, 3, 'น้ำมะนาว', 'Lemonade', 'レモネード', 'Lemonade', NULL, 400, 'food', NULL),
(134, 3, 'กาแฟเย็น', 'Ice Coffee', 'アイス　コーヒー', 'Ice Coffee', NULL, 400, 'food', NULL),
(135, 3, 'เบียร์สด', 'Draft Beer', '生ビール', 'Draft Beer', NULL, 400, 'food', NULL),
(136, 3, 'ชาเย็นไข่มุข', 'Pearl Tea', 'タピオカ　ミルク　ティー', 'Pearl Tea', NULL, 450, 'food', NULL),
(137, 3, 'เบียร์สิงห์', 'Singha Beer', 'シンハービール', 'Singha Beer', NULL, 550, 'food', NULL),
(138, 11, 'T.O. ข้าวมันไก่', 'T.O. Kao Man Gai', 'T.O. Kao Man Gai', 'T.O. KAO MAN GAI', NULL, 650, 'food', NULL),
(139, 11, 'T.O. กระเพรา', 'T.O. Kapao Rices', 'T.O. Kapao Rices', 'T.O. KAPAO', NULL, 800, 'food', NULL),
(140, 11, 'T.O. ข้าวมันไก่', 'T.O. Kao Man Gai', 'T.O. Kao Man Gai', 'T.O. KAO MAN GAI', NULL, 650, 'food', NULL),
(141, 11, 'T.O. กระเพรา', 'T.O. Kapao Rices', 'T.O. Kapao Rices', 'T.O. KAPAO', NULL, 800, 'food', NULL),
(142, 11, 'T.O. ผัดไทย', 'T.O. Pad Thai', 'T.O. Pad Thai', 'T.O. PADTHAI', NULL, 750, 'food', NULL),
(143, 11, 'T.O. ข้าวผัดกุ้ง', 'T.O. Thai Fried Rices with Prawns', 'T.O. Thai Fried Rices with Prawns', 'T.O. KAO PAD KUNG', NULL, 750, 'food', NULL),
(144, 11, 'T.O. แกงเขียวหวานไก่', 'T.O. Chicken Green Curry with Rices', 'T.O. Chicken Green Curry with Rices', 'T.O. GANG KAEW WAN GAI', NULL, 700, 'food', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderings`
--

CREATE TABLE `orderings` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `billing_no` tinyint(4) NOT NULL,
  `ordering_no` tinyint(4) NOT NULL,
  `total_customer` tinyint(4) NOT NULL,
  `ordering_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ordering_items`
--

CREATE TABLE `ordering_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `billing_no` tinyint(4) NOT NULL,
  `ordering_no` tinyint(4) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(6,0) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `table_no` char(3) NOT NULL,
  `billing_no` tinyint(4) DEFAULT NULL,
  `total_customer` tinyint(4) DEFAULT NULL,
  `total_price` decimal(6,0) DEFAULT NULL,
  `used` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `table_no`, `billing_no`, `total_customer`, `total_price`, `used`) VALUES
(1, 'C1', NULL, NULL, NULL, 'N'),
(2, 'C2', NULL, NULL, NULL, 'N'),
(3, 'C3', NULL, NULL, NULL, 'N'),
(4, 'C4', NULL, NULL, NULL, 'N'),
(5, 'C5', NULL, NULL, NULL, 'N'),
(6, 'C6', NULL, NULL, NULL, 'N'),
(7, 'C7', NULL, NULL, NULL, 'N'),
(8, 'C8', NULL, NULL, NULL, 'N'),
(9, 'C9', NULL, NULL, NULL, 'N'),
(10, '10', NULL, NULL, NULL, 'N'),
(11, '11', NULL, NULL, NULL, 'N'),
(12, '12', NULL, NULL, NULL, 'N'),
(13, '13', NULL, NULL, NULL, 'N'),
(14, '14', NULL, NULL, NULL, 'N'),
(15, '15', NULL, NULL, NULL, 'N'),
(16, '16', NULL, NULL, NULL, 'N'),
(17, '17', NULL, NULL, NULL, 'N'),
(18, '18', NULL, NULL, NULL, 'N'),
(19, '19', NULL, NULL, NULL, 'N'),
(20, '20', NULL, NULL, NULL, 'N'),
(21, 'TO1', NULL, NULL, NULL, 'N'),
(22, 'TO2', NULL, NULL, NULL, 'N'),
(23, 'TO3', NULL, NULL, NULL, 'N'),
(24, 'TO4', NULL, NULL, NULL, 'N'),
(25, 'TO5', NULL, NULL, NULL, 'N');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billings`
--
ALTER TABLE `billings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `today_billing_no_unique` (`date`,`billing_no`) USING BTREE,
  ADD KEY `table_no_idx` (`table_no`) USING BTREE;

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderings`
--
ALTER TABLE `orderings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ordering_item_idx` (`date`,`billing_no`,`ordering_no`) USING BTREE;

--
-- Indexes for table `ordering_items`
--
ALTER TABLE `ordering_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_ordering_idx` (`date`,`billing_no`,`ordering_no`) USING BTREE;

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `table_no_unique` (`table_no`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billings`
--
ALTER TABLE `billings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT for table `orderings`
--
ALTER TABLE `orderings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ordering_items`
--
ALTER TABLE `ordering_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `billings`
--
ALTER TABLE `billings`
  ADD CONSTRAINT `billing_table_fk` FOREIGN KEY (`table_no`) REFERENCES `tables` (`table_no`);

--
-- Constraints for table `orderings`
--
ALTER TABLE `orderings`
  ADD CONSTRAINT `ordering_billing_fk` FOREIGN KEY (`date`,`billing_no`) REFERENCES `billings` (`date`, `billing_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ordering_items`
--
ALTER TABLE `ordering_items`
  ADD CONSTRAINT `item_ordering_fk` FOREIGN KEY (`date`,`billing_no`,`ordering_no`) REFERENCES `orderings` (`date`, `billing_no`, `ordering_no`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
