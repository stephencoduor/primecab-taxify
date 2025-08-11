-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 23, 2025 at 12:26 AM
-- Server version: 8.0.36-cll-lve
-- PHP Version: 8.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pixelstrap_taxido`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint UNSIGNED NOT NULL,
  `log_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_locality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `is_primary`, `title`, `address`, `street_address`, `area_locality`, `postal_code`, `country_id`, `state`, `city`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 16, 0, 'Home', '123 Main St', 'Znz', 'Downtown', '979780', 12, NULL, 'Bz', NULL, NULL, 1, '2025-01-23 00:39:19', '2025-01-23 00:39:19', NULL),
(2, 17, 0, NULL, '45 Gangnam-daero, Seoul, South Korea', '45 Gangnam-daero', 'Gangnam', '06070', 410, NULL, 'Seoul', NULL, NULL, 1, '2025-01-23 01:21:12', '2025-01-28 03:03:59', NULL),
(3, 18, 0, NULL, '78 Victoria Island, Lagos, Nigeria', '78 Victoria Island', 'Lekki Phase 1', '101241', 566, NULL, 'Lagos', NULL, NULL, 1, '2025-01-23 01:23:04', '2025-01-28 03:01:27', NULL),
(4, 19, 0, NULL, '456 Avenida Corrientes, Buenos Aires, Argentina', '456 Avenida Corrientes', 'San Nicolas', 'C1043', 32, NULL, 'Buenos Aires', NULL, NULL, 1, '2025-01-23 01:29:18', '2025-01-28 02:29:23', NULL),
(5, 20, 0, NULL, '45 Sukhumvit Road, Bangkok, Thailand', '45 Sukhumvit Road', 'Khlong Toei', '10110', 764, NULL, 'Bangkok', NULL, NULL, 1, '2025-01-23 01:31:45', '2025-01-28 02:27:44', NULL),
(6, 21, 0, NULL, '101 Nelson Mandela Boulevard, Cape Town, South Africa', '101 Nelson Mandela Boulevard', 'City Bowl', '8001', 710, NULL, 'Cape Town', NULL, NULL, 1, '2025-01-23 01:33:56', '2025-01-28 02:23:08', NULL),
(7, 22, 0, NULL, 'Avenida Paulista, Bela Vista, São Paulo, Brazil', 'Avenida Paulista', 'Bela Vista', '01310-000', 76, NULL, 'São Paulo', NULL, NULL, 1, '2025-01-23 01:35:43', '2025-01-28 02:16:47', NULL),
(8, 23, 0, NULL, '12 Arbat Street, Moscow, Russia', '12 Arbat Street', 'Moscow', '101000', 643, NULL, 'Moscow', NULL, NULL, 1, '2025-01-23 01:39:09', '2025-01-28 02:19:31', NULL),
(9, 24, 0, NULL, '88 Zhongshan Road, Pudong, Shanghai, China', '88 Zhongshan Road', 'Pudong', '200120', 156, NULL, 'Shanghai', NULL, NULL, 1, '2025-01-23 01:41:05', '2025-01-28 02:14:44', NULL),
(10, 25, 0, NULL, '321 Maple Street, Perth Amboy, NJ, USA', '321, Maple Street', 'Mid-town', '94102', 840, NULL, 'Perth Amboy', NULL, NULL, 1, '2025-01-23 01:43:01', '2025-01-23 01:43:01', NULL),
(11, 26, 0, NULL, '654 Pine Street, Manchester, NH, USA', '654, Pine Street', 'Downtown', '89101', 840, NULL, 'Las Vegas', NULL, NULL, 1, '2025-01-23 01:44:40', '2025-01-23 01:44:40', NULL),
(12, 27, 0, NULL, '25 George Street, Sydney, NSW, Australia', '25 George Street', 'Sydney CBD', '2000', 36, NULL, 'Sydney', NULL, NULL, 1, '2025-01-23 01:50:03', '2025-01-28 02:06:55', NULL),
(13, 28, 0, NULL, '3-1-1 Marunouchi, Chiyoda, Tokyo, Japan', '3-1-1 Marunouchi', 'Chiyoda', '100-0005', 392, NULL, 'Tokyo', NULL, NULL, 1, '2025-01-23 01:52:02', '2025-01-28 02:04:58', NULL),
(14, 29, 0, NULL, '123 River Rd, Bogota, NJ, USA', '123, River Road', 'East Side', '44101', 840, NULL, 'Bogota', NULL, NULL, 1, '2025-01-23 01:57:52', '2025-01-23 01:57:52', NULL),
(15, 30, 0, NULL, '45 Rue de Rivoli, 1st Arrondissement, Paris, France', '45 Rue de Rivoli', '1st Arrondissement', '75001', 250, NULL, 'Paris', NULL, NULL, 1, '2025-01-23 02:01:19', '2025-01-28 02:03:01', NULL),
(16, 31, 0, NULL, '456 King Street East, Toronto, ON, Canada', '456, King Street East', 'Old Toronto', 'M5A 1L4', 120, NULL, 'Toronto', NULL, NULL, 1, '2025-01-23 02:02:04', '2025-01-23 02:02:04', NULL),
(17, 32, 0, NULL, '101 Oak Blvd, Huxley, IA, USA', '101 Oak Blvd', 'Industrial Park', '30301', 840, NULL, 'Georgia', NULL, NULL, 1, '2025-01-23 02:08:48', '2025-01-23 02:08:48', NULL),
(18, 33, 0, NULL, '123 Mountain Rd NW, Albuquerque, NM, USA', '123, Mountain Road Northwest', 'Hillside', '80201', 840, NULL, 'Denver', NULL, NULL, 1, '2025-01-23 02:11:55', '2025-01-23 22:21:39', '2025-01-23 22:21:39'),
(19, 34, 0, NULL, '56 Paseo de la Reforma, Polanco, Mexico City, Mexico', '56 Paseo de la Reforma', 'Polanco', '11560', 484, NULL, 'Mexico City', NULL, NULL, 1, '2025-01-23 02:16:34', '2025-01-28 01:57:11', NULL),
(20, 35, 0, NULL, '123 Sheikh Zayed Road , Downtown Dubai, UAE', '123 Sheikh Zayed Road', 'Downtown Dubai', '00000', 784, NULL, 'Dubai', NULL, NULL, 1, '2025-01-23 02:20:23', '2025-01-28 01:54:49', NULL),
(21, 36, 0, NULL, '32 MG Road, Koramangala, Bengaluru, India', '32 MG Road', 'Koramangala', '560095', 356, NULL, 'Bengaluru', NULL, NULL, 1, '2025-01-23 02:23:49', '2025-01-28 01:53:01', NULL),
(22, 33, 0, NULL, '123 Mountain Rd NW, Albuquerque, NM, USA', '123, Mountain Road Northwest', 'Hillside', '80201', 840, NULL, 'Albuquerque', NULL, NULL, 1, '2025-01-23 22:37:43', '2025-01-23 22:37:43', NULL),
(23, 54, 0, NULL, '12 Moi Avenue, Nairobi, Kenya', '12 Moi Avenue', 'Central Business District', '00100', 404, NULL, 'Nairobi', NULL, NULL, 1, '2025-01-28 03:10:33', '2025-01-28 03:10:33', NULL),
(24, 55, 0, NULL, '25 Al-Tahrir Square, Cairo, Egypt', '25 Al-Tahrir Square', 'Downtown Cairo', '11511', 818, NULL, 'Cairo', NULL, NULL, 1, '2025-01-28 03:22:20', '2025-01-28 03:22:20', NULL),
(25, 65, 0, NULL, '112 Oak Avenue, Anna Maria, FL, USA', '112, Oak Avenue', 'North Park', '34216', 840, NULL, 'Anna Maria', NULL, NULL, 1, '2025-04-29 03:57:13', '2025-04-29 03:57:13', NULL),
(26, 66, 0, NULL, '345 Maple Street, Brooklyn, NY, USA', '345, Maple Street', 'Brooklyn', '11225', 840, NULL, 'Dallas', NULL, NULL, 1, '2025-04-29 04:04:53', '2025-04-29 04:04:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

CREATE TABLE `airports` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_points` geometry DEFAULT NULL,
  `locations` json DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`id`, `name`, `place_points`, `locations`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"Heathrow Airport\"}', 0x000000000103000000010000000e0000007e592ce90354dfbf82f16eb0f8bd4940f7582ce9c3a5dcbf1330cec668be4940f7582ce9c35cdabfb00ae5b1ffbd49407e592ce9035ad9bfa3c5684546bc4940e0582ce9e397d9bf079d8dd7e7ba49400d592ce9a36ddabfbe92066bc1b949403a592ce96370dbbf70be412c27b94940e0582ce9e3eedcbf8881c73d51b94940e0582ce9e383debf4f516d4666b949409d2c96f4b117e0bf3da069ad70ba4940872c96f4d160e0bfddc96a22cfbb4940922c96f4c152e0bffcea2a8949bd49407b2c96f4e114e0bfdfac70a4c0bd49407e592ce90354dfbf82f16eb0f8bd4940, '[{\"lat\": 51.484151891872166, \"lng\": -0.48950288554023613}, {\"lat\": 51.48757252757758, \"lng\": -0.4476175095636736}, {\"lat\": 51.48436568912153, \"lng\": -0.4119119431574236}, {\"lat\": 51.47089450469792, \"lng\": -0.39611909647773613}, {\"lat\": 51.460200256488214, \"lng\": -0.3998956467707049}, {\"lat\": 51.45121515103289, \"lng\": -0.4129419114191424}, {\"lat\": 51.446507961369946, \"lng\": -0.4287347580988299}, {\"lat\": 51.44779178849686, \"lng\": -0.4520807053644549}, {\"lat\": 51.44843368852423, \"lng\": -0.4767999436457049}, {\"lat\": 51.45656364114324, \"lng\": -0.5028924729425799}, {\"lat\": 51.46725874151458, \"lng\": -0.5118188645441424}, {\"lat\": 51.47880663486069, \"lng\": -0.5101022507746111}, {\"lat\": 51.48244147779153, \"lng\": -0.5025491501886736}, {\"lat\": 51.484151891872166, \"lng\": -0.48950288554023613}]', 1, 1, '2025-07-08 19:45:47', '2025-07-08 19:45:47', NULL),
(2, '{\"en\":\"Singapore Changi Airport\"}', 0x00000000010300000001000000120000004edd2cf659fd59401888776428eff53fbfdc2c16d0fd5940ac6b41a6c421f63f88dc2c3619fe5940c8650444c14ef63f0cdd2cb689fe5940c205b495e671f63f33db2c964eff59405566c7421e76f63fe3db2c965c005a40d325556f4a3ff63fbfdc2c16a0005a40ee14401aa7f6f53fbfdc2c16a0005a40f587f9d9c0def53f17dd2c1673005a40b5a380354da2f53f72dc2c76e6ff59406d9832c4a161f53fb7db2c16bfff59401daf9368261ef53fe0dc2c3654ff59408c465fa5df0bf53f51dc2c5662fe59409850a51ed804f53fcddb2cd6f1fd5940ce5dab06c623f53f64dd2cb6f4fc594044febdcf1b44f53feedb2cf6a5fc59407490fd4ed692f53fbcdd2cb6c7fc5940e7c159ab81d3f53f4edd2cf659fd59401888776428eff53f, '[{\"lat\": 1.3708881306160972, \"lng\": 103.95861582165706}, {\"lat\": 1.3832441801411526, \"lng\": 103.9658255994891}, {\"lat\": 1.3942272812768306, \"lng\": 103.97028879528987}, {\"lat\": 1.4028077934056569, \"lng\": 103.977155250368}, {\"lat\": 1.4038374527502882, \"lng\": 103.98917154675472}, {\"lat\": 1.3904518460207436, \"lng\": 104.00565103894222}, {\"lat\": 1.3727179551508846, \"lng\": 104.0097709119891}, {\"lat\": 1.3668831362378582, \"lng\": 104.0097709119891}, {\"lat\": 1.3521244134846977, \"lng\": 104.00702432995784}, {\"lat\": 1.3363359130830827, \"lng\": 103.9984412611102}, {\"lat\": 1.3198608479533207, \"lng\": 103.99603800183284}, {\"lat\": 1.315398832306852, \"lng\": 103.98951486950862}, {\"lat\": 1.3136826703167452, \"lng\": 103.97475199109066}, {\"lat\": 1.3212337742351077, \"lng\": 103.96788553601252}, {\"lat\": 1.3291280856064165, \"lng\": 103.95243601208676}, {\"lat\": 1.3483489118161989, \"lng\": 103.94762949353206}, {\"lat\": 1.364137334192637, \"lng\": 103.9496894300555}, {\"lat\": 1.3708881306160972, \"lng\": 103.95861582165706}]', 1, 1, '2025-07-08 21:13:13', '2025-07-08 21:13:13', NULL),
(3, '{\"en\":\"Los Angeles International Airport\"}', 0x0000000001030000000100000019000000e614dac9359c5dc0eba8436d0ffa40406716dae99d9b5dc06a6876145afa40401a16da49e49a5dc0b73ae5be5efa40400916da39229a5dc07fa8de677ffa4040d215da5903995dc07fa8de677ffa40409e16dac984985dc0ca56c11368fa4040af14dae946985dc007fb791630fa4040f315da79b7975dc057b607c954f94040e516dab995975dc0274c9ccc12f840400617dad9b1975dc0b1eaf11f66f740406d14daa90e985dc07c1391731bf740406a15da496e985dc054f5971d04f74040a916da2906995dc0a3e05f1bbef640404415da7979995dc0721ab6c5b4f640400416da89e1995dc0ebfe33c6c2f64040c014daf9709a5dc0ebfe33c6c2f640401a16da49e49a5dc0a15b7f71d5f640404f15dad9629b5dc03982f271e3f640402a16da59a69b5dc00c5730730df74040f315da79ef9b5dc0d378742082f740406814daf9059c5dc0aefcf776dff740408914da19229c5dc0b9f9edcbbaf84040cf16daf9329c5dc0e57b99742ff94040b416da89579c5dc019ee81719ff94040e614dac9359c5dc0eba8436d0ffa4040, '[{\"lat\": 33.95359578899113, \"lng\": -118.44078298852293}, {\"lat\": 33.9558740213551, \"lng\": -118.43151327416744}, {\"lat\": 33.95601640885249, \"lng\": -118.42018362328854}, {\"lat\": 33.95701311466235, \"lng\": -118.40833898827876}, {\"lat\": 33.95701311466235, \"lng\": -118.39082952782957}, {\"lat\": 33.956301183132425, \"lng\": -118.38310476586666}, {\"lat\": 33.95459252315607, \"lng\": -118.3793282155737}, {\"lat\": 33.94789994122057, \"lng\": -118.37057348534908}, {\"lat\": 33.93807370788322, \"lng\": -118.36851354882565}, {\"lat\": 33.93280410110835, \"lng\": -118.37023016259518}, {\"lat\": 33.93052525123366, \"lng\": -118.37589498803464}, {\"lat\": 33.9298130981425, \"lng\": -118.38173147485104}, {\"lat\": 33.92767660314054, \"lng\": -118.3910011892065}, {\"lat\": 33.927391733091106, \"lng\": -118.39803930566158}, {\"lat\": 33.92781903780799, \"lng\": -118.40439077660884}, {\"lat\": 33.92781903780799, \"lng\": -118.41314550683346}, {\"lat\": 33.92838877409591, \"lng\": -118.42018362328854}, {\"lat\": 33.92881607381088, \"lng\": -118.42790838525144}, {\"lat\": 33.93009796009354, \"lng\": -118.4320282582983}, {\"lat\": 33.933658654090145, \"lng\": -118.43649145409908}, {\"lat\": 33.93650710209558, \"lng\": -118.43786474511472}, {\"lat\": 33.943200579832684, \"lng\": -118.43958135888424}, {\"lat\": 33.94676072592088, \"lng\": -118.44061132714596}, {\"lat\": 33.95017832607511, \"lng\": -118.44284292504636}, {\"lat\": 33.95359578899113, \"lng\": -118.44078298852293}]', 1, 1, '2025-07-08 21:23:41', '2025-07-08 21:23:41', NULL),
(4, '{\"en\":\"San Francisco International Airport\"}', 0x0000000001030000000100000014000000f42fa05e169a5ec09556280b8fd14240762fa08ee6995ec0768e0f7d26d242401b2ea03e73995ec02c4b47934ed242403630a09ee6985ec0d012384f07d24240b22fa01e76985ec01d30fdace3d14240c82fa0de10985ec069ee6f0b5ed14240652fa07ebc975ec03ab85867a7d04240682ea0de5c975ec08bd26e6676d04240232fa03e84975ec0d4a2c9bb8ecf4240582ea0ce9a965ec0c7f87383dcce4240422ea00e00975ec085679355bfcd4240a22fa00eb4975ec0b785d8a968ce42407d30a08ef7975ec072bb5bcac3cd42407230a02e76975ec03c0495462ccd4240c92da0ee78985ec0d7481294a6cc4240162ea08e32995ec0c69bf9193ecd4240ad2fa06e9d995ec0914d7e25cfce4240c92da0eee0995ec05ba30de74bcf42403030a0ee0d9a5ec0eb7a0d90d1cf4240f42fa05e169a5ec09556280b8fd14240, '[{\"lat\": 37.63717784375798, \"lng\": -122.40761533396704}, {\"lat\": 37.64179957637385, \"lng\": -122.40469709055884}, {\"lat\": 37.643022928057555, \"lng\": -122.39765897410376}, {\"lat\": 37.640848066691646, \"lng\": -122.3890759052561}, {\"lat\": 37.63976061213191, \"lng\": -122.38220945017798}, {\"lat\": 37.635682515767826, \"lng\": -122.37602964060768}, {\"lat\": 37.63010875541698, \"lng\": -122.37087979929908}, {\"lat\": 37.62861328517195, \"lng\": -122.36504331248268}, {\"lat\": 37.62154338212486, \"lng\": -122.36744657176}, {\"lat\": 37.6161045376079, \"lng\": -122.3531986774729}, {\"lat\": 37.60740155885198, \"lng\": -122.35937848704322}, {\"lat\": 37.61256907532125, \"lng\": -122.37036481516822}, {\"lat\": 37.60753755072738, \"lng\": -122.37448468821508}, {\"lat\": 37.602913687479, \"lng\": -122.36658826487523}, {\"lat\": 37.59883356945818, \"lng\": -122.38238111155492}, {\"lat\": 37.603457686308545, \"lng\": -122.39371076243384}, {\"lat\": 37.61569660823038, \"lng\": -122.40023389475806}, {\"lat\": 37.61950386205584, \"lng\": -122.40435376780492}, {\"lat\": 37.62358284624285, \"lng\": -122.40710034983618}, {\"lat\": 37.63717784375798, \"lng\": -122.40761533396704}]', 1, 1, '2025-07-08 21:26:35', '2025-07-08 21:26:35', NULL),
(5, '{\"en\":\"Dubai International Airport\"}', 0x0000000001030000000100000015000000544f0b8324ab4b407c77c74473443940394f0b0376ac4b402d06a7a0984639402c4f0bc3d2ad4b400770a9e948453940514f0ba3d2af4b402c390b2ff9433940004f0b436db14b4071d5b791764239405a4f0b2332b24b409e1c4ccf26413940864f0ba3cfb24b402a5bbe7c65403940844f0bc345b34b406756b3870b3f39404b4f0b0305b44b408d44c1349d3d3940804f0b0332b44b40127ed5a0943c3940804f0b0332b44b40e9684292aa3b3940514f0ba30ab44b40b49409836d3b3940094f0bc3ccb34b4092fe27ce443b39402a4f0be318b14b403ddc7546263b3940424f0b833db04b40eb15a50a393c39403b4f0be3cfae4b400f26aa09e63c39400b4f0ba3b6ad4b40c243e36fe43d39401f4f0b835fac4b4031b9ee62eb3f3940024f0b2357ab4b402fa28d3ccb4039407d4f0b23d0aa4b40fb65763862423940544f0b8324ab4b407c77c74473443940, '[{\"lat\": 25.267383860299525, \"lng\": 55.3370517544959}, {\"lat\": 25.27576641156887, \"lng\": 55.34735143711309}, {\"lat\": 25.270643810145373, \"lng\": 55.357994442484184}, {\"lat\": 25.265520992507636, \"lng\": 55.37361562778692}, {\"lat\": 25.259621722585138, \"lng\": 55.3861469083045}, {\"lat\": 25.25449843986713, \"lng\": 55.392155056497856}, {\"lat\": 25.25154857299229, \"lng\": 55.39696157505254}, {\"lat\": 25.24626968506208, \"lng\": 55.40056646396856}, {\"lat\": 25.2406800243232, \"lng\": 55.406402950784965}, {\"lat\": 25.236642887232076, \"lng\": 55.40777624180059}, {\"lat\": 25.233071461880876, \"lng\": 55.40777624180059}, {\"lat\": 25.23213976844722, \"lng\": 55.40657461216192}, {\"lat\": 25.231518635524953, \"lng\": 55.404686337015434}, {\"lat\": 25.23105278375088, \"lng\": 55.3835719876502}, {\"lat\": 25.23524538545965, \"lng\": 55.37687719394903}, {\"lat\": 25.23788509754203, \"lng\": 55.365719204447075}, {\"lat\": 25.241766922936325, \"lng\": 55.35713613559942}, {\"lat\": 25.249685462267344, \"lng\": 55.34666479160528}, {\"lat\": 25.25310114343531, \"lng\": 55.33859670688848}, {\"lat\": 25.2593112267548, \"lng\": 55.334476833841606}, {\"lat\": 25.267383860299525, \"lng\": 55.3370517544959}]', 1, 1, '2025-07-08 21:28:10', '2025-07-08 21:28:10', NULL),
(6, '{\"en\":\"John F. Kennedy International Airport\"}', 0x000000000103000000010000000f00000070dba8dadd7452c0d9ab1ad369544440acdba87a5c7452c0c05abd089d55444079dba85ab97352c0899fc95cf255444093dba8da677252c015149e19ae5544409edba83a817152c0573c4d2b3f55444086dba89a407052c0308d6f690354444096dba8bad56f52c0158c9d3f6153444073dba8ba7b6f52c0ed8d2021e151444077dba87a5f7152c06170ee2bb64f4440a7dba8ba787252c0d6d8f851694f4440a3dba8fab07252c03c1bc7dd4f504440a3dba8fab07252c070e9c9d92d51444086dba89a787452c099f879db8b5244408fdba81abc7452c0aa1ae45b0353444070dba8dadd7452c0d9ab1ad369544440, '[{\"lat\": 40.65947951128278, \"lng\": -73.82604090204238}, {\"lat\": 40.6688548016146, \"lng\": -73.81814447870254}, {\"lat\": 40.67145881504915, \"lng\": -73.80818811883925}, {\"lat\": 40.6693756124366, \"lng\": -73.78758875360488}, {\"lat\": 40.66599026938688, \"lng\": -73.77351252069472}, {\"lat\": 40.65635412165512, \"lng\": -73.75394312372207}, {\"lat\": 40.651405288627394, \"lng\": -73.74741999139785}, {\"lat\": 40.63968290414364, \"lng\": -73.74192682733535}, {\"lat\": 40.62274693625022, \"lng\": -73.77145258417129}, {\"lat\": 40.62040161753357, \"lng\": -73.7886187218666}, {\"lat\": 40.62743732664127, \"lng\": -73.79205194940566}, {\"lat\": 40.63421175345442, \"lng\": -73.79205194940566}, {\"lat\": 40.64489310699147, \"lng\": -73.81986109247207}, {\"lat\": 40.64854000699884, \"lng\": -73.82398096551894}, {\"lat\": 40.65947951128278, \"lng\": -73.82604090204238}]', 1, 1, '2025-07-08 21:32:09', '2025-07-08 21:32:09', NULL),
(7, '{\"en\":\"Toronto Pearson International Airport\"}', 0x0000000001030000000100000018000000bb33cbb5b2ea53c0872c32b92bd84540b933cbd5c0e953c07698aac113da4540ac33cb9501e953c06cb26946aeda4540c033cb755ee853c007a58839f3d94540b033cb5515e853c08082d70530d945409d33cb7550e753c0c0f8f8568dd845409a33cb955ee653c0e398a89623d84540a333cb15eee553c0203a6c0c03d845408733cbb599e553c04d1442fb0ed745408b33cb7561e553c060cc6c0523d64540ac33cb957de553c010a4e8b85fd54540aa33cbb5f3e553c0bb72433ccdd44540c233cb5534e753c0a56efb10d9d34540be33cb956ce753c08249431c67d34540c633cb15b0e753c08249431c67d34540b733cbf51ae853c09aac66c301d445409433cbf574e853c014c62383ddd44540b333cb3507e953c014c9219c0ad64540a333cb1572e953c0f6fe3cbf12d64540b733cbf536ea53c04250983cb9d545408733cbb585ea53c042e09e0fead545408933cb95c3ea53c04c47c4ef94d645408933cb95c3ea53c0aac561bf78d74540bb33cbb5b2ea53c0872c32b92bd84540, '[{\"lat\": 43.68883433294214, \"lng\": -79.66715760082168}, {\"lat\": 43.703727920816846, \"lng\": -79.65239472240371}, {\"lat\": 43.70844345246312, \"lng\": -79.6407217487709}, {\"lat\": 43.70273513004444, \"lng\": -79.63076538890762}, {\"lat\": 43.696778040150846, \"lng\": -79.62630219310684}, {\"lat\": 43.691813346450594, \"lng\": -79.61428589672012}, {\"lat\": 43.68858607513744, \"lng\": -79.59952301830215}, {\"lat\": 43.68759303364325, \"lng\": -79.59265656322403}, {\"lat\": 43.68014469839581, \"lng\": -79.58750672191543}, {\"lat\": 43.67294376194408, \"lng\": -79.58407349437637}, {\"lat\": 43.66698371276254, \"lng\": -79.5857901081459}, {\"lat\": 43.66251328748074, \"lng\": -79.59299988597793}, {\"lat\": 43.655061838883626, \"lng\": -79.61256928295059}, {\"lat\": 43.651584179740176, \"lng\": -79.61600251048965}, {\"lat\": 43.651584179740176, \"lng\": -79.62012238353653}, {\"lat\": 43.65630381120103, \"lng\": -79.62664551586074}, {\"lat\": 43.663010017840875, \"lng\": -79.63213867992324}, {\"lat\": 43.672198788162866, \"lng\": -79.6410650715248}, {\"lat\": 43.67244711378413, \"lng\": -79.64758820384903}, {\"lat\": 43.6697154754374, \"lng\": -79.65960450023574}, {\"lat\": 43.671205475402786, \"lng\": -79.66441101879043}, {\"lat\": 43.67642018398245, \"lng\": -79.6681875690834}, {\"lat\": 43.6833724238783, \"lng\": -79.6681875690834}, {\"lat\": 43.68883433294214, \"lng\": -79.66715760082168}]', 1, 1, '2025-07-08 21:33:36', '2025-07-08 21:33:36', NULL),
(8, '{\"en\":\"Zurich Airport\"}', 0x0000000001030000000100000010000000ca436df8b809214088833ae47bbc4740d2436df85e092140f198717a16be4740d9436df8d40b21402701f0b9bdbe4740b5436df806162140e77f0ceeccbe4740d9436df8e419214009d0c83ebbbd4740d2436df8de1f2140e581a5198bbc4740d2436df87e2521404f4bc4f4a6bb4740ca436df8a82821401f3e25ee85ba4740ca436df8782b21401fb7d425c0b94740a7436df86a2a21409523a9bb43b84740d2436df87e2521406b6004aa6eb74740d9436df8841f214055d13f5713b74740bc436df87c182140e9bb60c3bab74740a7436df8ea1321406ea8dea355b94740bc436df83c0d2140e529827a3cbb4740ca436df8b809214088833ae47bbc4740, '[{\"lat\": 47.47253086907524, \"lng\": 8.51898933728978}, {\"lat\": 47.48506098315007, \"lng\": 8.518302691781967}, {\"lat\": 47.49016498774511, \"lng\": 8.523109210336655}, {\"lat\": 47.490628963569186, \"lng\": 8.543021930063217}, {\"lat\": 47.48227677159582, \"lng\": 8.550575030649155}, {\"lat\": 47.472995000662486, \"lng\": 8.562248004281967}, {\"lat\": 47.46603259644164, \"lng\": 8.573234332406967}, {\"lat\": 47.45721222704387, \"lng\": 8.57941414197728}, {\"lat\": 47.45117638479739, \"lng\": 8.58490730603978}, {\"lat\": 47.4395670486334, \"lng\": 8.582847369516342}, {\"lat\": 47.43306470121073, \"lng\": 8.573234332406967}, {\"lat\": 47.43027773491001, \"lng\": 8.561561358774155}, {\"lat\": 47.43538706038821, \"lng\": 8.547828448617905}, {\"lat\": 47.44792602893785, \"lng\": 8.538902057016342}, {\"lat\": 47.46278315883294, \"lng\": 8.525855792367905}, {\"lat\": 47.47253086907524, \"lng\": 8.51898933728978}]', 1, 1, '2025-07-08 21:35:42', '2025-07-08 21:35:42', NULL),
(9, '{\"en\":\"Frankfurt am Main Airport\"}', 0x000000000103000000010000001300000093e89ce9b1fa2040455ca7096105494073e89ce9560a21407d81823c8906494093e89ce90114214012b39acffc06494085e89ce9f51f2140e2273eefa207494093e89ce9512d214056aff560f207494093e89ce99138214075c6ca99f907494070e89ce9233d2140c8ddb278d106494093e89ce9313e21402638b44eea0549408ce89ce98b3e2140e977cbd17904494093e89ce9313e2140427ea83fa80349407ee89ce96f3c2140001b37f7c002494085e89ce9d530214024f6d6721601494088e89ce93828214024f6d6721601494069e89ce9bd1b214083d72a87f90049407ee89ce96f0f214083d72a87f900494065e89ce96a052140d18dbcad1d0149407ae89ce9ecfb2040c7f330154602494069e89ce9fdf920405b97e91c8403494093e89ce9b1fa2040455ca70961054940, '[{\"lat\": 50.04202385589452, \"lng\": 8.489638615039667}, {\"lat\": 50.05106312153227, \"lng\": 8.520194340137323}, {\"lat\": 50.05459017804839, \"lng\": 8.539077091602167}, {\"lat\": 50.05965986762037, \"lng\": 8.562423038867792}, {\"lat\": 50.06208431240381, \"lng\": 8.588515568164667}, {\"lat\": 50.062304710399424, \"lng\": 8.610488224414667}, {\"lat\": 50.053267562234495, \"lng\": 8.619414616016229}, {\"lat\": 50.04621299552654, \"lng\": 8.621474552539667}, {\"lat\": 50.03496763644216, \"lng\": 8.622161198047479}, {\"lat\": 50.02857204177093, \"lng\": 8.621474552539667}, {\"lat\": 50.02151384535525, \"lng\": 8.618041325000604}, {\"lat\": 50.00849757667691, \"lng\": 8.595382023242792}, {\"lat\": 50.00849757667691, \"lng\": 8.578559208301385}, {\"lat\": 50.00761499015693, \"lng\": 8.554183292774042}, {\"lat\": 50.00761499015693, \"lng\": 8.530150700000604}, {\"lat\": 50.00871822077455, \"lng\": 8.510581303027948}, {\"lat\": 50.01776375665908, \"lng\": 8.49204187431701}, {\"lat\": 50.02746926694672, \"lng\": 8.488265324024042}, {\"lat\": 50.04202385589452, \"lng\": 8.489638615039667}]', 1, 1, '2025-07-08 21:36:43', '2025-07-08 21:36:43', NULL),
(10, '{\"en\":\"London City Airport\"}', 0x0000000001030000000100000013000000350a2d61781e8c3ff7a6e1d74ac14940868596303cf8953fad44cada7bc14940c3424b181e9ca03f7ea5ba5b8dc1494045424b189ea9a93f121c5c5b86c149408d424b189e3bae3f284800da6dc1494059a1250c4fd7b13f14561a584ec1494023a1250ccfceb23f4cd34e5416c1494047a1250ccf55b33f8218364ec9c0494023a1250ccf28b33f27d5c94252c049403ea1250c0fadb23fb9264339febf49403ea1250c0febb03f2d7d41b6e5bf49407b424b181e9ead3f823bc8b1c2bf494057424b181edfa83f28bf5231bfbf49408d424b189e63a43f28bf5231bfbf49407b424b181ef6a03f2d7d41b6e5bf49401a8596303ce7973fcde0c13b13c04940868596303cc0913f7d13fb4467c04940ed092d6178788c3fc5bdce4ed0c04940350a2d61781e8c3ff7a6e1d74ac14940, '[{\"lat\": 51.51009653585568, \"lng\": 0.013729992356847909}, {\"lat\": 51.511592243922934, \"lng\": 0.021454754319738537}, {\"lat\": 51.512126413474896, \"lng\": 0.032441082444738534}, {\"lat\": 51.511912746405734, \"lng\": 0.05012220427091041}, {\"lat\": 51.511164903771686, \"lng\": 0.05904859587247291}, {\"lat\": 51.5102033737747, \"lng\": 0.06969160124356666}, {\"lat\": 51.508493937004914, \"lng\": 0.07346815153653541}, {\"lat\": 51.506143356718226, \"lng\": 0.07552808805997291}, {\"lat\": 51.50251040320498, \"lng\": 0.07484144255216041}, {\"lat\": 51.49994579104325, \"lng\": 0.07295316740567603}, {\"lat\": 51.49919775197685, \"lng\": 0.06608671232755103}, {\"lat\": 51.49812910344109, \"lng\": 0.057846966233801034}, {\"lat\": 51.4980222372094, \"lng\": 0.04857725187833229}, {\"lat\": 51.4980222372094, \"lng\": 0.03982252165372291}, {\"lat\": 51.49919775197685, \"lng\": 0.033127727952551034}, {\"lat\": 51.50058695761398, \"lng\": 0.02334302946622291}, {\"lat\": 51.50315153369508, \"lng\": 0.017334881272863534}, {\"lat\": 51.50635705084618, \"lng\": 0.013901653733801034}, {\"lat\": 51.51009653585568, \"lng\": 0.013729992356847909}]', 1, 1, '2025-07-08 22:31:44', '2025-07-08 22:31:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ambulances`
--

CREATE TABLE `ambulances` (
  `id` bigint UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` double DEFAULT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ambulances`
--

INSERT INTO `ambulances` (`id`, `name`, `description`, `price`, `driver_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'LifeCare Ambulance', 'Fast-response ambulance with GPS tracking, ventilator support, and cardiac monitoring equipment.', NULL, 65, '2025-04-29 03:57:13', '2025-04-29 03:57:13', NULL),
(2, 'MedicoAid Transport', 'Safe and comfortable transport for non-emergency patients with certified medical staff on board.', NULL, 36, '2025-04-29 03:59:36', '2025-04-29 03:59:36', NULL),
(3, 'LifeSaver Ambulance', 'Emergency medical transport providing prompt and reliable service with a team of skilled paramedics for patient stabilization.', NULL, 66, '2025-04-29 04:04:53', '2025-04-29 04:04:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assigned_tickets`
--

CREATE TABLE `assigned_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `ticket_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assigned_tickets`
--

INSERT INTO `assigned_tickets` (`id`, `ticket_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 2, 1, NULL, NULL, NULL),
(3, 2, 5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_tokens`
--

INSERT INTO `auth_tokens` (`email`, `phone`, `token`, `created_at`) VALUES
(NULL, '+911234567899', '123456', '2025-01-23 00:38:06'),
(NULL, '+919865656356', '123456', '2025-01-23 00:54:32'),
(NULL, '+919865656356', '123456', '2025-01-23 00:54:33'),
(NULL, '+919865656356', '123456', '2025-01-23 00:54:34'),
(NULL, '+919652365263', '123456', '2025-01-23 00:56:34'),
(NULL, '+919652365263', '123456', '2025-01-23 00:56:35'),
(NULL, '+911234567890', '123456', '2025-01-23 01:01:18'),
(NULL, '+911234567890', '123456', '2025-01-23 01:01:21'),
(NULL, '+919712928612', '123456', '2025-01-23 01:01:28'),
(NULL, '++919712928612', '123456', '2025-01-23 01:03:02'),
(NULL, '+911234567899', '123456', '2025-01-23 01:15:17'),
(NULL, '++12045550314', '123456', '2025-01-24 05:09:55'),
(NULL, '917990661829', '123456', '2025-01-24 05:12:06'),
(NULL, '+912055550201', '123456', '2025-01-24 19:30:06'),
(NULL, '+912055550201', '123456', '2025-01-24 19:31:27'),
(NULL, '+912055550201', '123456', '2025-01-24 19:31:30'),
(NULL, '+919712928612', '123456', '2025-01-24 19:33:13'),
(NULL, '+912055550201', '123456', '2025-01-24 19:34:59'),
(NULL, '+912055550201', '123456', '2025-01-24 19:35:05'),
(NULL, '+912055550201', '123456', '2025-01-24 19:35:10'),
(NULL, '+912055550201', '123456', '2025-01-24 19:35:10'),
(NULL, '+912055550201', '123456', '2025-01-24 19:35:11'),
(NULL, '+912055550201', '123456', '2025-01-24 19:35:13'),
(NULL, '+912055550201', '123456', '2025-01-24 19:35:14'),
(NULL, '+912055550201', '123456', '2025-01-24 19:35:14'),
(NULL, '+912055550201', '123456', '2025-01-24 19:35:14'),
(NULL, '+912055550201', '123456', '2025-01-24 19:35:14'),
(NULL, '+912055550201', '123456', '2025-01-24 19:35:16'),
(NULL, '+912055550201', '123456', '2025-01-24 19:35:16'),
(NULL, '+912055550201', '123456', '2025-01-24 19:35:16'),
(NULL, '+912055550201', '123456', '2025-01-24 19:35:16'),
(NULL, '+912055550201', '123456', '2025-01-24 19:35:16'),
(NULL, '+912045550314', '123456', '2025-01-24 19:38:27'),
(NULL, '++12045550314', '123456', '2025-01-24 19:38:38'),
(NULL, '12055550214', '123456', '2025-01-24 19:53:12'),
(NULL, '+12055550214', '123456', '2025-01-24 20:05:31'),
(NULL, '+912045550314', '123456', '2025-01-27 02:56:27'),
(NULL, '+912055550214', '123456', '2025-01-27 04:01:27'),
(NULL, '+12055550214', '123456', '2025-01-27 04:01:58'),
(NULL, '+12055550214', '123456', '2025-01-27 04:03:28'),
(NULL, '+12055550217', '123456', '2025-01-27 04:04:07'),
(NULL, '+12055550214', '123456', '2025-01-27 04:12:34'),
(NULL, '12055550214', '123456', '2025-01-27 04:13:20'),
(NULL, '+919712928612', '123456', '2025-01-27 04:17:12'),
(NULL, '+919712928612', '123456', '2025-01-27 04:18:58'),
(NULL, '+912055550214', '123456', '2025-01-27 20:28:56'),
(NULL, '+12055550214', '123456', '2025-01-27 20:29:09'),
(NULL, '+12055550214', '123456', '2025-01-27 20:37:47'),
(NULL, '+12055550216', '123456', '2025-01-27 20:45:46'),
(NULL, '12055550218', '123456', '2025-01-27 20:54:47'),
(NULL, '+912055550214', '123456', '2025-01-27 20:56:51'),
(NULL, '+12055550214', '123456', '2025-01-27 20:57:20'),
(NULL, '+12055550214', '123456', '2025-01-27 20:59:30'),
(NULL, '12055550214', '123456', '2025-01-27 21:02:18'),
(NULL, '12055550214', '123456', '2025-01-27 21:04:39'),
(NULL, '++12045550314', '123456', '2025-01-27 21:06:10'),
(NULL, '12055550214', '123456', '2025-01-27 21:35:57'),
(NULL, '+12045550314', '123456', '2025-01-28 01:08:23'),
(NULL, '919876543210', '123456', '2025-01-28 04:31:13'),
(NULL, '++12045550314', '123456', '2025-01-28 04:34:45'),
(NULL, '+912055550305', '123456', '2025-01-28 22:01:42'),
(NULL, '+912055550305', '123456', '2025-01-28 22:01:42'),
(NULL, '++12055550305', '123456', '2025-01-28 22:02:25'),
(NULL, '++12055550305', '123456', '2025-01-28 22:02:26'),
(NULL, '+919265633079', '123456', '2025-01-28 22:06:31'),
(NULL, '+919265633079', '123456', '2025-01-28 22:06:32'),
(NULL, '+919265633079', '123456', '2025-01-28 22:07:01'),
(NULL, '12055550209', '920276', '2025-01-29 01:10:09'),
(NULL, '12055550213', '277441', '2025-01-29 02:44:18'),
(NULL, '12055550215', '269161', '2025-01-29 03:24:29'),
(NULL, '12055550211', '284930', '2025-01-29 04:57:19'),
(NULL, '12055550212', '951946', '2025-01-29 06:24:47'),
(NULL, '12055550210', '652487', '2025-01-29 06:41:35'),
(NULL, '12055550219', '733871', '2025-01-30 00:06:04'),
(NULL, '12055550205', '116030', '2025-01-30 00:20:43'),
(NULL, '12055550299', '917362', '2025-01-30 00:33:36'),
(NULL, '12053250310', '595109', '2025-01-30 04:12:57'),
(NULL, '12055550218', '652070', '2025-01-30 05:53:16'),
(NULL, '12055550209', '378713', '2025-02-18 03:55:24'),
(NULL, '+10123456789', '123456', '2025-03-07 05:43:15'),
(NULL, '+10123456789', '123456', '2025-03-07 05:47:30'),
(NULL, '+11234567895', '123456', '2025-03-07 05:57:14'),
(NULL, '+10123456789', '123456', '2025-03-20 02:22:10'),
(NULL, '+11234567890', '123456', '2025-03-20 02:23:16'),
(NULL, '+12055550214', '123456', '2025-03-20 02:23:55'),
(NULL, '+12045550314', '123456', '2025-03-20 02:33:42'),
(NULL, '+12055550214', '123456', '2025-03-20 03:24:07'),
(NULL, '+11234567890', '123456', '2025-03-20 03:31:27'),
(NULL, '+11234567890', '123456', '2025-03-20 03:35:14'),
(NULL, '+11234567890', '123456', '2025-03-20 05:15:40'),
(NULL, '+10123456789', '123456', '2025-03-20 05:37:38'),
(NULL, '+10123456789', '123456', '2025-04-28 04:55:11'),
(NULL, '+12055550215', '123456', '2025-04-29 06:05:35'),
(NULL, '+12045550325', '123456', '2025-04-29 06:05:58'),
(NULL, '+10123456789', '123456', '2025-04-29 06:44:41'),
(NULL, '+11234567890', '123456', '2025-04-29 06:45:25'),
(NULL, '+10123456789', '123456', '2025-04-29 23:31:06'),
(NULL, '+15551234567', '123456', '2025-04-29 23:31:23'),
(NULL, '+16235559876', '123456', '2025-04-29 23:41:59'),
('rider@example.com', '+', '123456', '2025-06-14 00:46:46');

-- --------------------------------------------------------

--
-- Table structure for table `backup_logs`
--

CREATE TABLE `backup_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_by_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `banner_image_id`, `order`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\n  \"en\": \"Find the Best Car for Rent\",\n  \"fr\": \"Trouvez la meilleure voiture à louer\",\n  \"ar\": \"ابحث عن أفضل سيارة للإيجار\",\n  \"de\": \"Finden Sie das beste Mietauto\"\n}\n', 'find-the-best-car-for-rent', '{\"en\":\"665\"}', 1, 1, 1, '2025-03-06 05:57:49', '2025-03-06 05:57:49', NULL),
(2, '{\n  \"en\": \"Fast & Secure Deliveries!\",\n  \"fr\": \"Livraisons rapides et sécurisées !\",\n  \"ar\": \"توصيل سريع وآمن!\",\n  \"de\": \"Schnelle und sichere Lieferungen!\"\n}\n', 'fast-secure-deliveries', '{\"en\":\"661\"}', 2, 1, 1, '2025-03-06 05:58:14', '2025-03-06 05:58:14', NULL),
(3, '{\n  \"en\": \"Efficient Freight Transport\",\n  \"fr\": \"Transport de fret efficace\",\n  \"ar\": \"نقل البضائع بكفاءة\",\n  \"de\": \"Effizienter Gütertransport\"\n}\n', 'efficient-freight-transport', '{\"en\":\"659\"}', 3, 1, 1, '2025-03-06 05:58:37', '2025-03-06 05:58:37', NULL),
(4, '{\n  \"en\": \"Ride All Day!\",\n  \"fr\": \"Roulez toute la journée !\",\n  \"ar\": \"اركب طوال اليوم!\",\n  \"de\": \"Fahre den ganzen Tag!\"\n}\n', 'ride-all-day', '{\"en\":\"653\"}', 4, 1, 1, '2025-03-06 05:59:06', '2025-03-06 05:59:06', NULL),
(5, '{\n  \"en\": \"Best Travel Packages!\",\n  \"fr\": \"Meilleurs forfaits de voyage !\",\n  \"ar\": \"أفضل باقات السفر!\",\n  \"de\": \"Beste Reisepakete!\"\n}\n', 'best-travel-packages', '{\"en\":\"655\"}', 5, 1, 1, '2025-03-06 05:59:33', '2025-03-06 05:59:33', NULL),
(6, '{\n  \"en\": \"Same-Day Parcel Delivery\",\n  \"fr\": \"Livraison de colis le jour même\",\n  \"ar\": \"توصيل الطرود في نفس اليوم\",\n  \"de\": \"Paketzustellung am selben Tag\"\n}\n', 'same-day-parcel-delivery', '{\"en\":\"657\"}', 6, 1, 1, '2025-03-06 06:00:03', '2025-03-06 06:00:03', NULL),
(7, '{\n  \"en\": \"Get 15% Off on Your First Ride\",\n  \"fr\": \"Obtenez 15 % de réduction sur votre première course\",\n  \"ar\": \"احصل على خصم 15% على رحلتك الأولى\",\n  \"de\": \"Erhalten Sie 15 % Rabatt auf Ihre erste Fahrt\"\n}\n', 'get-15-off-on-your-first-ride', '{\"en\":\"649\"}', 7, 1, 1, '2025-03-06 06:00:34', '2025-03-06 06:00:34', NULL),
(8, '{\n  \"en\": \"Your Trusted Partner in Freight & Logistics\",\n  \"fr\": \"Votre partenaire de confiance en fret et logistique\",\n  \"ar\": \"شريكك الموثوق في الشحن والخدمات اللوجستية\",\n  \"de\": \"Ihr vertrauenswürdiger Partner für Fracht und Logistik\"\n}\n', 'your-trusted-partner-in-freight-logistics', '{\"en\":\"663\"}', 8, 1, 1, '2025-03-06 06:01:05', '2025-03-06 06:01:05', NULL),
(9, '{\n  \"en\": \"Ride More, Save More!\",\n  \"fr\": \"Roulez plus, économisez plus !\",\n  \"ar\": \"اركب أكثر، ووفّر أكثر!\",\n  \"de\": \"Mehr fahren, mehr sparen!\"\n}\n', 'ride-more-save-more', '{\"en\":\"651\"}', 9, 1, 1, '2025-03-06 06:01:44', '2025-03-06 06:01:44', NULL),
(10, '{\n  \"en\": \"Quick & Reliable Ambulance Service\",\n  \"fr\": \"Service Ambulancier Rapide et Fiable\",\n  \"ar\": \"خدمة إسعاف سريعة وموثوقة\",\n  \"de\": \"Schneller und Zuverlässiger Krankenwagenservice\"\n}\n', 'quick-reliable-ambulance-service', '{\"en\":\"739\"}', 10, 1, 1, '2025-04-26 03:48:31', '2025-04-26 03:48:31', NULL),
(11, '{\n  \"en\": \"24/7 Emergency Ambulance at Your Service\",\n  \"fr\": \"Ambulance d\'Urgence 24/7 à Votre Service\",\n  \"ar\": \"إسعاف طوارئ على مدار 24 ساعة في خدمتكم\",\n  \"de\": \"24/7 Notarztwagen Zu Ihren Diensten\"\n}\n', '24-7-emergency-ambulance-at-your-service', '{\"en\":\"735\"}', 11, 1, 1, '2025-04-26 03:50:48', '2025-04-26 03:50:48', NULL),
(12, '{\n  \"en\": \"Fast Response Ambulance – Anytime, Anywhere\",\n  \"fr\": \"Ambulance à Réponse Rapide – À Tout Moment, Partout\",\n  \"ar\": \"إسعاف استجابة سريعة – في أي وقت، وأي مكان\",\n  \"de\": \"Schnelle Reaktions-Ambulanz – Jederzeit, Überall\"\n}\n', 'fast-response-ambulance-anytime-anywhere', '{\"en\":\"737\"}', 12, 1, 1, '2025-04-26 03:52:38', '2025-04-26 03:52:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banner_services`
--

CREATE TABLE `banner_services` (
  `id` bigint UNSIGNED NOT NULL,
  `banner_id` bigint UNSIGNED NOT NULL,
  `service_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner_services`
--

INSERT INTO `banner_services` (`id`, `banner_id`, `service_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 1),
(5, 4, 2),
(6, 5, 1),
(7, 6, 2),
(8, 7, 1),
(9, 7, 2),
(10, 8, 3),
(11, 9, 3),
(12, 10, 4),
(13, 11, 4),
(14, 12, 4);

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` bigint UNSIGNED NOT NULL,
  `ride_request_id` bigint UNSIGNED DEFAULT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `ride_id` bigint UNSIGNED DEFAULT NULL,
  `amount` decimal(8,4) DEFAULT NULL,
  `status` enum('rejected','accepted') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `ride_request_id`, `driver_id`, `ride_id`, `amount`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 25, NULL, 155.0000, 'accepted', '2025-01-29 02:07:57', '2025-01-29 02:09:04', NULL),
(2, 1, 25, 1, 158.0000, 'rejected', '2025-01-29 02:08:52', '2025-01-29 02:09:04', NULL),
(3, 4, 30, 3, 630.0000, 'rejected', '2025-01-29 03:32:44', '2025-01-29 03:34:07', NULL),
(4, 4, 30, NULL, 620.0000, 'accepted', '2025-01-29 03:33:54', '2025-01-29 03:48:57', NULL),
(5, 5, 30, 4, 75.0000, 'accepted', '2025-01-29 03:48:40', '2025-01-29 03:49:30', NULL),
(6, 6, 25, NULL, 76.0000, 'rejected', '2025-01-29 04:05:07', '2025-01-29 04:07:11', NULL),
(7, 6, 29, NULL, 75.0000, 'rejected', '2025-01-29 04:05:42', '2025-01-29 04:07:11', NULL),
(8, 6, 30, 5, 70.0000, 'accepted', '2025-01-29 04:07:03', '2025-01-29 06:56:09', NULL),
(9, 8, 26, 6, 172.0000, 'rejected', '2025-01-29 06:55:42', '2025-01-29 06:58:02', NULL),
(10, 8, 26, NULL, 165.0000, 'accepted', '2025-01-29 06:57:46', '2025-01-29 06:58:02', NULL),
(11, 17, 21, 13, 375.0000, 'accepted', '2025-01-30 01:26:14', '2025-01-30 06:24:44', NULL),
(12, 19, 18, NULL, 55.0000, 'rejected', '2025-01-30 06:24:22', '2025-01-30 06:26:41', NULL),
(13, 19, 18, 15, 53.0000, 'rejected', '2025-01-30 06:25:52', '2025-01-30 06:26:41', NULL),
(14, 19, 18, NULL, 50.0000, 'accepted', '2025-01-30 06:26:31', '2025-01-30 06:26:41', NULL),
(15, 22, 18, 16, 50.0000, 'accepted', '2025-01-30 06:46:09', '2025-01-30 06:46:48', NULL),
(16, 34, 25, 18, 730.0000, 'accepted', '2025-02-18 04:29:00', '2025-02-18 04:29:53', NULL),
(17, 35, 31, 19, 105.0000, 'accepted', '2025-03-20 02:24:14', '2025-03-20 02:24:22', NULL),
(18, 38, 25, 20, 104.0000, 'accepted', '2025-03-20 03:51:04', '2025-03-20 03:51:11', NULL),
(19, 39, 25, 21, 4300.0000, 'accepted', '2025-03-20 03:53:46', '2025-03-20 03:54:26', NULL),
(20, 40, 25, 22, 130.0000, 'accepted', '2025-03-20 03:56:26', '2025-03-20 03:56:37', NULL),
(21, 41, 25, 23, 315.0000, 'accepted', '2025-03-20 04:05:28', '2025-03-20 04:05:35', NULL),
(22, 42, 25, 24, 312.0000, 'accepted', '2025-03-20 04:06:57', '2025-03-20 04:07:05', NULL),
(23, 44, 25, 25, 200.0000, 'accepted', '2025-03-20 04:10:49', '2025-03-20 04:10:56', NULL),
(24, 45, 25, 26, 105.0000, 'accepted', '2025-03-20 04:14:52', '2025-03-20 04:14:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `blog_thumbnail_id` bigint UNSIGNED DEFAULT NULL,
  `blog_meta_image_id` bigint UNSIGNED DEFAULT NULL,
  `is_featured` int NOT NULL DEFAULT '0',
  `is_sticky` int NOT NULL DEFAULT '0',
  `is_draft` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `created_by_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `description`, `content`, `meta_title`, `meta_description`, `blog_thumbnail_id`, `blog_meta_image_id`, `is_featured`, `is_sticky`, `is_draft`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\n  \"en\": \"Why ride booking is the future of urban mobility\",\n  \"fr\": \"Pourquoi la réservation de trajets est l\'avenir de la mobilité urbaine\",\n  \"de\": \"Warum Fahrtenbuchung die Zukunft der urbanen Mobilität ist\",\n  \"ar\": \"لماذا يُعتبر حجز الرحلات مستقبل التنقل الحضري\"\n}\n', 'why-ride-booking-is-the-future-of-urban-mobility', '{\n  \"en\": \"Discover how ride-booking services are reshaping urban mobility, offering greater convenience, flexibility, and reducing traffic congestion and pollution.\",\n  \"fr\": \"Découvrez comment les services de réservation de trajets redéfinissent la mobilité urbaine en offrant commodité, flexibilité et en réduisant les embouteillages et la pollution.\",\n  \"de\": \"Entdecken Sie, wie Fahrtenbuchungsdienste die urbane Mobilität neu gestalten und mehr Komfort, Flexibilität sowie eine Reduzierung von Verkehrsstaus und Umweltverschmutzung bieten.\",\n  \"ar\": \"اكتشف كيف تُعيد خدمات حجز الرحلات تشكيل التنقل في المدن، مما يوفر راحة ومرونة أكبر ويقلل من الازدحام والتلوث.\"\n}\n', '{\n  \"en\": \"<p>The future of urban mobility is here, driven by ride-booking services. As cities grow and traffic congestion increases, traditional transportation methods are reaching their limits. Ride-booking has emerged as a convenient, affordable, and eco-friendly solution to these challenges.</p><p>Ride-booking services offer flexibility, allowing users to book rides on demand, with real-time updates on driver locations and estimated arrival times. This on-demand service eliminates the need for car ownership, reducing personal transportation costs and helping to decrease the number of vehicles on the road.</p><p>Furthermore, ride-booking services contribute to reducing pollution. With fewer people owning cars, emissions decrease, leading to cleaner air in cities. Ride-sharing options further help by consolidating multiple trips into a single vehicle, minimizing the carbon footprint.</p><p>As technology advances, ride-booking services integrate smart features like AI-powered route optimization, automated payments, and even electric vehicles, making urban mobility more sustainable and efficient.</p><p>Ride-booking is not just a trend but the future of transportation in urban areas, offering unparalleled convenience, affordability, and environmental benefits.</p>\",\n\n  \"fr\": \"<p>L’avenir de la mobilité urbaine est là, porté par les services de réservation de trajets. À mesure que les villes grandissent et que le trafic devient plus dense, les méthodes traditionnelles de transport peinent à répondre aux besoins. La réservation de trajets s’impose comme une solution pratique, abordable et écologique à ces défis.</p><p>Les services de réservation de trajets offrent une flexibilité en permettant aux utilisateurs de réserver des trajets à tout moment, avec des mises à jour en temps réel sur la localisation du conducteur et les heures d’arrivée estimées. Ce service à la demande élimine la nécessité de posséder une voiture, réduisant les coûts de transport personnel et aidant à limiter le nombre de véhicules sur les routes.</p><p>En outre, ces services contribuent à réduire la pollution. Avec moins de personnes possédant une voiture, les émissions diminuent, contribuant à un air plus pur dans les villes. Les options de covoiturage permettent également de regrouper plusieurs trajets dans un seul véhicule, réduisant ainsi l’empreinte carbone.</p><p>Avec l’évolution technologique, ces services intègrent des fonctionnalités intelligentes comme l’optimisation des itinéraires basée sur l’IA, les paiements automatisés et même les véhicules électriques, rendant la mobilité urbaine plus durable et efficace.</p><p>La réservation de trajets n’est pas seulement une tendance, mais l’avenir des déplacements dans les environnements urbains, offrant une commodité, une accessibilité et des avantages environnementaux incomparables.</p>\",\n\n  \"de\": \"<p>Die Zukunft der urbanen Mobilität ist da, und sie wird von Fahrtenbuchungsdiensten angetrieben. Mit dem Wachstum der Städte und zunehmendem Verkehrsaufkommen stoßen traditionelle Verkehrsmittel an ihre Grenzen. Fahrtenbuchung hat sich als bequeme, erschwingliche und umweltfreundliche Lösung für diese Herausforderungen etabliert.</p><p>Fahrtenbuchungsdienste bieten Flexibilität, indem sie es Nutzern ermöglichen, Fahrten bei Bedarf zu buchen, mit Echtzeit-Updates zu Fahrerstandorten und voraussichtlichen Ankunftszeiten. Dieser On-Demand-Service macht den Besitz eines Autos überflüssig, senkt die persönlichen Transportkosten und trägt dazu bei, die Anzahl der Fahrzeuge auf den Straßen zu reduzieren.</p><p>Darüber hinaus tragen Fahrtenbuchungsdienste zur Verringerung der Umweltverschmutzung bei. Mit weniger Autobesitz sinken die Emissionen, was zu saubererer Luft in den Städten führt. Fahrgemeinschaftsoptionen helfen zusätzlich, indem mehrere Fahrten in einem einzigen Fahrzeug zusammengelegt werden, wodurch der CO₂-Fußabdruck minimiert wird.</p><p>Mit der Weiterentwicklung der Technologie integrieren Fahrtenbuchungsdienste intelligente Funktionen wie KI-basierte Routenoptimierung, automatisierte Zahlungen und sogar Elektrofahrzeuge, was die urbane Mobilität nachhaltiger und effizienter macht.</p><p>Fahrtenbuchung ist nicht nur ein Trend, sondern die Zukunft unserer Fortbewegung in städtischen Gebieten, mit beispielloser Bequemlichkeit, Erschwinglichkeit und ökologischen Vorteilen.</p>\",\n\n  \"ar\": \"<p>مستقبل التنقل الحضري هنا، وهو يقوده خدمات حجز الرحلات. مع توسع المدن وازدياد الازدحام المروري، تواجه وسائل النقل التقليدية تحديات كبيرة. وقد برزت خدمات حجز الرحلات كحل عملي، اقتصادي، وصديق للبيئة لهذه التحديات.</p><p>توفر خدمات حجز الرحلات مرونة تتيح للمستخدمين حجز رحلاتهم عند الحاجة، مع تحديثات فورية حول موقع السائق وأوقات الوصول المتوقعة. تلغي هذه الخدمة عند الطلب الحاجة لامتلاك سيارة، مما يقلل من تكاليف النقل الشخصية ويساعد في تقليل عدد المركبات على الطرق.</p><p>علاوة على ذلك، تُسهم هذه الخدمات في تقليل التلوث. مع انخفاض ملكية السيارات، تقل الانبعاثات، مما يساهم في تحسين جودة الهواء في المدن. كما أن خيارات مشاركة الركوب تُسهم في دمج عدة رحلات في مركبة واحدة، مما يُقلل من البصمة الكربونية.</p><p>ومع تطور التكنولوجيا، تُدمج خدمات حجز الرحلات ميزات ذكية مثل تحسين المسارات باستخدام الذكاء الاصطناعي، الدفع التلقائي، وحتى السيارات الكهربائية، مما يجعل التنقل الحضري أكثر استدامة وكفاءة.</p><p>حجز الرحلات ليس مجرد اتجاه، بل هو مستقبل التنقل في البيئات الحضرية، حيث يوفر راحة، تكاليف مناسبة، وفوائد بيئية لا مثيل لها.</p>\"\n}\n', 'Why Ride Booking is the Future of Urban Mobility', 'Discover how ride booking services are reshaping urban mobility, offering more convenience and flexibility while reducing traffic congestion and pollution.', 92, 92, 1, 1, 0, 1, 1, '2025-01-23 03:29:16', '2025-01-23 23:50:30', NULL),
(2, '{\n  \"en\": \"Top 5 Benefits of Using Ride Services for Your Daily Commute\",\n  \"de\": \"Die 5 größten Vorteile der Nutzung von Fahrdiensten für Ihren täglichen Arbeitsweg\",\n  \"fr\": \"Top 5 des avantages à utiliser les services de transport pour vos trajets quotidiens\",\n  \"ar\": \"أفضل 5 فوائد لاستخدام خدمات النقل لرحلتك اليومية\"\n}\n', 'top-5-benefits-of-using-ride-services-for-your-daily-commute', '{\n  \"en\": \"Learn the top 5 benefits of using ride services for your daily commute, from saving time to ensuring comfort and reliability.\",\n  \"de\": \"Erfahren Sie die 5 größten Vorteile der Nutzung von Fahrdiensten für Ihren täglichen Arbeitsweg – von Zeitersparnis bis hin zu Komfort und Zuverlässigkeit.\",\n  \"fr\": \"Découvrez les 5 principaux avantages à utiliser les services de transport pour vos trajets quotidiens, de l\'économie de temps au confort et à la fiabilité.\",\n  \"ar\": \"تعرّف على أهم 5 فوائد لاستخدام خدمات النقل لرحلتك اليومية، من توفير الوقت إلى ضمان الراحة والموثوقية.\"\n}\n', '{\n  \"en\": \"<h2>Top 5 Benefits of Using Ride Services for Your Daily Commute</h2>\\r\\n<p>Commuting can be stressful, but using ride services can make it a more pleasant experience. Here are five key benefits of choosing ride services for your daily commute:</p>\\r\\n<ol>\\r\\n<li><strong>Convenience:</strong> Ride services allow you to book a ride from anywhere, at any time. Forget about waiting for buses or trains; with just a few taps, your ride will be on its way.</li>\\r\\n<li><strong>Time-Saving:</strong> With real-time tracking and optimized routes, ride services help you avoid traffic and get to your destination faster than traditional transportation options.</li>\\r\\n<li><strong>Comfort:</strong> Enjoy a private, comfortable ride with climate control and plenty of space to relax or catch up on work during your commute.</li>\\r\\n<li><strong>Cost-Effective:</strong> Ride services often come with competitive pricing, making them more affordable than owning a car, especially when factoring in fuel, maintenance, and parking.</li>\\r\\n<li><strong>Sustainability:</strong> Many ride services are now offering eco-friendly vehicles, helping reduce emissions and contributing to a greener environment.</li>\\r\\n</ol>\\r\\n<p>Choosing ride services for your daily commute can make your journey smoother, faster, and more comfortable. With these benefits, it\'s no wonder that more and more people are turning to ride services each day.</p>\",\n\n  \"de\": \"<h2>Die 5 größten Vorteile der Nutzung von Fahrdiensten für Ihren täglichen Arbeitsweg</h2>\\r\\n<p>Pendeln kann stressig sein, aber die Nutzung von Fahrdiensten kann die Erfahrung angenehmer machen. Hier sind fünf Hauptvorteile der Nutzung von Fahrdiensten für Ihren täglichen Arbeitsweg:</p>\\r\\n<ol>\\r\\n<li><strong>Bequemlichkeit:</strong> Fahrdienste ermöglichen es Ihnen, jederzeit und überall eine Fahrt zu buchen. Vergessen Sie das Warten auf Busse oder Züge – mit nur wenigen Klicks ist Ihre Fahrt unterwegs.</li>\\r\\n<li><strong>Zeitersparnis:</strong> Mit Echtzeit-Tracking und optimierten Routen helfen Fahrdienste Ihnen, den Verkehr zu vermeiden und schneller als mit herkömmlichen Verkehrsmitteln ans Ziel zu gelangen.</li>\\r\\n<li><strong>Komfort:</strong> Genießen Sie eine private, komfortable Fahrt mit Klimaanlage und genügend Platz, um sich zu entspannen oder während der Fahrt zu arbeiten.</li>\\r\\n<li><strong>Kosteneffizienz:</strong> Fahrdienste bieten oft wettbewerbsfähige Preise und sind günstiger als ein eigenes Auto, insbesondere wenn man Kraftstoff-, Wartungs- und Parkkosten berücksichtigt.</li>\\r\\n<li><strong>Nachhaltigkeit:</strong> Viele Fahrdienste bieten jetzt umweltfreundliche Fahrzeuge an, was zur Reduzierung von Emissionen und einer grüneren Umwelt beiträgt.</li>\\r\\n</ol>\\r\\n<p>Die Wahl von Fahrdiensten für Ihren täglichen Arbeitsweg kann Ihre Reise reibungsloser, schneller und komfortabler machen. Mit diesen Vorteilen ist es kein Wunder, dass immer mehr Menschen täglich Fahrdienste nutzen.</p>\",\n\n  \"fr\": \"<h2>Top 5 des avantages à utiliser les services de transport pour vos trajets quotidiens</h2>\\r\\n<p>Les trajets quotidiens peuvent être stressants, mais les services de transport peuvent rendre l\'expérience plus agréable. Voici cinq avantages clés à utiliser ces services pour vos déplacements quotidiens :</p>\\r\\n<ol>\\r\\n<li><strong>Commodité :</strong> Réservez un trajet n\'importe où, à tout moment. Plus besoin d\'attendre les bus ou les trains : quelques clics suffisent pour commander votre course.</li>\\r\\n<li><strong>Gain de temps :</strong> Grâce au suivi en temps réel et aux itinéraires optimisés, vous évitez les embouteillages et arrivez plus vite à destination qu\'avec les transports classiques.</li>\\r\\n<li><strong>Confort :</strong> Profitez d\'un trajet privé, confortable, climatisé et avec suffisamment d\'espace pour vous détendre ou travailler en route.</li>\\r\\n<li><strong>Économie :</strong> Les services de transport sont souvent compétitifs et moins chers qu’un véhicule personnel une fois les coûts de carburant, d\'entretien et de stationnement inclus.</li>\\r\\n<li><strong>Durabilité :</strong> De nombreux services proposent aujourd’hui des véhicules écologiques, contribuant à réduire les émissions et à protéger l’environnement.</li>\\r\\n</ol>\\r\\n<p>Choisir un service de transport pour vos trajets quotidiens rend le voyage plus fluide, plus rapide et plus confortable. Avec autant d\'avantages, il n\'est pas étonnant que ces services gagnent en popularité chaque jour.</p>\",\n\n  \"ar\": \"<h2>أفضل 5 فوائد لاستخدام خدمات النقل في تنقلاتك اليومية</h2>\\r\\n<p>قد يكون التنقل اليومي مرهقًا، لكن خدمات النقل تجعل الأمر أكثر سهولة وراحة. إليك خمسة من أهم الفوائد لاستخدام خدمات النقل:</p>\\r\\n<ol>\\r\\n<li><strong>الراحة:</strong> يمكنك حجز رحلتك من أي مكان وفي أي وقت. لا حاجة لانتظار الحافلات أو القطارات، فبضع نقرات كافية ليصل السائق إليك.</li>\\r\\n<li><strong>توفير الوقت:</strong> بفضل التتبع الفوري والمسارات المحسنة، تساعدك هذه الخدمات على تجنب الازدحام والوصول بشكل أسرع.</li>\\r\\n<li><strong>الراحة والهدوء:</strong> استمتع برحلة خاصة ومريحة مزودة بتكييف ومساحة كافية للاسترخاء أو إنجاز المهام.</li>\\r\\n<li><strong>التكلفة المعقولة:</strong> غالبًا ما تكون الأسعار تنافسية وأرخص من امتلاك سيارة بعد حساب الوقود والصيانة ومواقف السيارات.</li>\\r\\n<li><strong>الاستدامة:</strong> توفر العديد من الخدمات الآن مركبات صديقة للبيئة، مما يساعد في تقليل الانبعاثات والحفاظ على البيئة.</li>\\r\\n</ol>\\r\\n<p>اختيار خدمات النقل لرحلتك اليومية يجعل تنقلك أسهل وأسرع وأكثر راحة. ومع هذه الفوائد، من الطبيعي أن يتزايد عدد المستخدمين يومًا بعد يوم.</p>\"\n}\n', 'Top 5 Benefits of Using Ride Services for Your Daily Commute', 'Learn the top 5 benefits of using ride services for your daily commute, from saving time to ensuring comfort and reliability.', 94, 94, 1, 1, 0, 1, 1, '2025-01-23 03:54:07', '2025-01-23 23:48:08', NULL),
(3, '{\"en\":\"How to Choose the Right Ride Service for Your Needs\",\"de\":\"Die 5 größten Vorteile der Nutzung von Fahrdiensten für Ihren täglichen Arbeitsweg\",\"fr\":\"Les 5 principaux avantages d’utiliser des services de transport pour vos trajets quotidiens\",\"ar\":\"أهم 5 فوائد لاستخدام خدمات الركوب في تنقلاتك اليومية\"}', 'how-to-choose-the-right-ride-service-for-your-needs', '{\"en\":\"Learn how to select the best ride service based on your travel preferences, budget, and safety requirements.\",\"de\":\"Erfahren Sie die 5 größten Vorteile der Nutzung von Fahrdiensten für Ihren täglichen Arbeitsweg – von Zeitersparnis bis hin zu Komfort und Zuverlässigkeit.\",\"fr\":\"Découvrez les 5 principaux avantages d’utiliser des services de transport pour vos trajets quotidiens, allant de l’économie de temps au confort et à la fiabilité.\",\"ar\":\"اكتشف أهم 5 فوائد لاستخدام خدمات الركوب في تنقلاتك اليومية، من توفير الوقت إلى ضمان الراحة والموثوقية\"}', '{\"en\":\"<h2>How to Choose the Right Ride Service for Your Needs</h2>\\r\\n<p>With so many ride services available, selecting the right one can be overwhelming. Here&rsquo;s a guide to help you choose the best ride service for your needs:</p>\\r\\n<ol>\\r\\n<li><strong>Identify Your Needs:</strong> Determine whether you need a budget-friendly option, a luxury ride, or a service with specific features like child seats or eco-friendly vehicles.</li>\\r\\n<li><strong>Compare Pricing:</strong> Check the pricing structure of different services, including base fares, distance rates, and surge pricing during peak hours.</li>\\r\\n<li><strong>Read Reviews:</strong> Look at customer reviews and ratings to gauge the reliability, safety, and quality of the service.</li>\\r\\n<li><strong>Check Safety Features:</strong> Ensure the service offers safety features like real-time tracking, emergency buttons, and verified drivers.</li>\\r\\n<li><strong>Test Multiple Services:</strong> Try out a few services to see which one aligns best with your preferences and expectations.</li>\\r\\n</ol>\\r\\n<p>By following these steps, you can find a ride service that meets your needs and ensures a comfortable and safe travel experience.</p>\",\"de\":\"<p>Pendeln kann stressig sein, aber die Nutzung von Fahrdiensten kann die Erfahrung angenehmer machen. Hier sind f&uuml;nf Hauptvorteile der Nutzung von Fahrdiensten f&uuml;r Ihren t&auml;glichen Arbeitsweg:</p>\\r\\n<ol>\\r\\n<li><strong>Bequemlichkeit:</strong> Fahrdienste erm&ouml;glichen es Ihnen, jederzeit und &uuml;berall eine Fahrt zu buchen. Vergessen Sie das Warten auf Busse oder Z&uuml;ge &ndash; mit nur wenigen Klicks ist Ihre Fahrt unterwegs.</li>\\r\\n<li><strong>Zeitersparnis:</strong> Mit Echtzeit-Tracking und optimierten Routen helfen Fahrdienste Ihnen, den Verkehr zu vermeiden und schneller als mit herk&ouml;mmlichen Verkehrsmitteln ans Ziel zu gelangen.</li>\\r\\n<li><strong>Komfort:</strong> Genie&szlig;en Sie eine private, komfortable Fahrt mit Klimaanlage und gen&uuml;gend Platz, um sich zu entspannen oder w&auml;hrend der Fahrt zu arbeiten.</li>\\r\\n<li><strong>Kosteneffizienz:</strong> Fahrdienste bieten oft wettbewerbsf&auml;hige Preise und sind g&uuml;nstiger als ein eigenes Auto, insbesondere wenn man Kraftstoff-, Wartungs- und Parkkosten ber&uuml;cksichtigt.</li>\\r\\n<li><strong>Nachhaltigkeit:</strong> Viele Fahrdienste bieten jetzt umweltfreundliche Fahrzeuge an, was zur Reduzierung von Emissionen und einer gr&uuml;neren Umwelt beitr&auml;gt.</li>\\r\\n</ol>\\r\\n<p>Die Wahl von Fahrdiensten f&uuml;r Ihren t&auml;glichen Arbeitsweg kann Ihre Reise reibungsloser, schneller und komfortabler machen. Mit diesen Vorteilen ist es kein Wunder, dass immer mehr Menschen t&auml;glich Fahrdienste nutzen.</p>\",\"fr\":\"<p>Se d&eacute;placer peut &ecirc;tre stressant, mais utiliser des services de transport rend cette exp&eacute;rience plus agr&eacute;able. Voici cinq avantages majeurs :</p>\\r\\n<ol>\\r\\n<li><strong>Commodit&eacute; :</strong> Les services de transport vous permettent de r&eacute;server un trajet &agrave; tout moment et de n&rsquo;importe o&ugrave;. Oubliez les attentes interminables pour le bus ou le train &ndash; en quelques clics, votre trajet est en route.</li>\\r\\n<li><strong>Gain de temps :</strong> Gr&acirc;ce au suivi en temps r&eacute;el et aux itin&eacute;raires optimis&eacute;s, ces services vous permettent d&rsquo;&eacute;viter les embouteillages et d&rsquo;arriver plus rapidement &agrave; destination.</li>\\r\\n<li><strong>Confort :</strong> Profitez d&rsquo;un trajet priv&eacute; et confortable avec climatisation et suffisamment d&rsquo;espace pour vous d&eacute;tendre ou travailler.</li>\\r\\n<li><strong>&Eacute;conomique :</strong> Ces services proposent souvent des tarifs comp&eacute;titifs, moins co&ucirc;teux que poss&eacute;der une voiture, surtout en prenant en compte le carburant, l&rsquo;entretien et le stationnement.</li>\\r\\n<li><strong>Durabilit&eacute; :</strong> De nombreux services adoptent des v&eacute;hicules &eacute;cologiques, contribuant &agrave; r&eacute;duire les &eacute;missions et &agrave; pr&eacute;server l&rsquo;environnement.</li>\\r\\n</ol>\\r\\n<p>Choisir ces services pour vos trajets quotidiens rend vos d&eacute;placements plus fluides, rapides et agr&eacute;ables. Pas &eacute;tonnant que de plus en plus de personnes les adoptent chaque jour.</p>\",\"ar\":\"<p>قد تكون التنقلات اليومية مرهقة، ولكن استخدام خدمات الركوب يجعلها تجربة أكثر متعة. إليك خمسة فوائد رئيسية لاختيار هذه الخدمات:</p>\\r\\n<ol>\\r\\n<li><strong>الراحة:</strong> تتيح لك خدمات الركوب حجز رحلة في أي وقت ومن أي مكان. لا داعي لانتظار الحافلات أو القطارات؛ بضع نقرات فقط، وستكون رحلتك في الطريق.</li>\\r\\n<li><strong>توفير الوقت:</strong> مع التتبع في الوقت الفعلي والمسارات المحسّنة، تساعدك خدمات الركوب على تجنب الازدحام والوصول إلى وجهتك بسرعة أكبر مقارنة بوسائل النقل التقليدية.</li>\\r\\n<li><strong>الراحة:</strong> استمتع برحلة خاصة ومريحة مع التحكم في المناخ ومساحة كافية للاسترخاء أو متابعة العمل أثناء التنقل.</li>\\r\\n<li><strong>التكلفة الفعالة:</strong> غالبًا ما توفر خدمات الركوب أسعارًا تنافسية، مما يجعلها أقل تكلفة من امتلاك سيارة، خاصة عند احتساب تكاليف الوقود والصيانة ومواقف السيارات.</li>\\r\\n<li><strong>الاستدامة:</strong> العديد من خدمات الركوب تقدم الآن مركبات صديقة للبيئة، مما يساعد في تقليل الانبعاثات والمساهمة في بيئة أكثر خضرة.</li>\\r\\n</ol>\\r\\n<p>اختيار خدمات الركوب لتنقلاتك اليومية يمكن أن يجعل رحلتك أكثر سلاسة وسرعة وراحة. مع هذه الفوائد، لا عجب أن المزيد من الناس يتجهون لاستخدامها يوميًا.</p>\"}', 'How to Choose the Right Ride Service for Your Needs', 'Learn how to select the best ride service based on your travel preferences, budget, and safety requirements.', 96, 96, 1, 1, 0, 1, 1, '2025-01-23 04:56:16', '2025-01-23 23:53:24', NULL),
(4, '{\"en\":\"How to Make Your Ride More Comfortable and Enjoyable\",\"de\":\"Wie Fahrdienste die Sicherheit auf den Straßen verbessern\",\"fr\":\"Comment les services de transport améliorent la sécurité sur les routes\",\"ar\":\"كيف تُحسن خدمات الركوب السلامة على الطرق\"}', 'how-to-make-your-ride-more-comfortable-and-enjoyable', '{\"en\":\"Discover tips and tricks to enhance your ride experience and make every journey more comfortable and enjoyable.\",\"de\":\"Erfahren Sie, wie Fahrdienste die Sicherheit mit Funktionen wie Echtzeit-Tracking, Hintergrundüberprüfungen für Fahrer und Notfalloptionen priorisieren.\",\"fr\":\"Découvrez comment les services de transport privilégient la sécurité grâce à des fonctionnalités telles que le suivi en temps réel, la vérification des antécédents des chauffeurs et les options d’assistance d’urgence.\",\"ar\":\"تعرّف على كيفية إعطاء خدمات الركوب الأولوية للسلامة من خلال ميزات مثل التتبع في الوقت الفعلي، والتحقق من خلفيات السائقين، وخيارات الطوارئ\"}', '{\"en\":\"<h2>How to Make Your Ride More Comfortable and Enjoyable</h2>\\r\\n<p>Whether you&rsquo;re commuting to work or heading out for a fun day, here are some tips to make your ride more comfortable and enjoyable:</p>\\r\\n<ol>\\r\\n<li><strong>Choose the Right Vehicle:</strong> Select a vehicle that suits your needs, whether it&rsquo;s a spacious SUV for a group or a luxury sedan for a solo trip.</li>\\r\\n<li><strong>Adjust the Temperature:</strong> Use the climate control settings to create a comfortable environment during your ride.</li>\\r\\n<li><strong>Bring Entertainment:</strong> Carry headphones, a book, or a playlist to keep yourself entertained during the journey.</li>\\r\\n<li><strong>Use Comfort Accessories:</strong> Bring a neck pillow or blanket for added comfort, especially on longer rides.</li>\\r\\n<li><strong>Stay Connected:</strong> Use the ride time to catch up on emails, messages, or podcasts.</li>\\r\\n</ol>\\r\\n<p>By following these tips, you can transform your ride into a relaxing and enjoyable experience.</p>\",\"de\":\"<h2>Wie Fahrdienste die Sicherheit auf den Stra&szlig;en verbessern</h2>\\r\\n<p>Sicherheit ist f&uuml;r Fahrdienste oberste Priorit&auml;t, und das ist einer der Hauptgr&uuml;nde, warum so viele Menschen diesen Diensten f&uuml;r ihre Transportbed&uuml;rfnisse vertrauen. Von Hintergrund&uuml;berpr&uuml;fungen der Fahrer bis hin zu Sicherheitsfunktionen in der App &ndash; Fahrdienste unternehmen zahlreiche Schritte, um sicherzustellen, dass sich die Fahrg&auml;ste bei jeder Fahrt sicher f&uuml;hlen.</p>\\r\\n<p>Ein wichtiges Sicherheitsmerkmal ist das Echtzeit-Tracking. Fahrg&auml;ste k&ouml;nnen den Standort ihres Fahrers w&auml;hrend der gesamten Fahrt verfolgen, sicherstellen, dass sie in die richtige Richtung fahren, und ihre Fahrt mit einem vertrauensw&uuml;rdigen Kontakt teilen.</p>\\r\\n<p>Fahrdienste f&uuml;hren auch gr&uuml;ndliche Hintergrund&uuml;berpr&uuml;fungen der Fahrer durch, einschlie&szlig;lich der &Uuml;berpr&uuml;fung der kriminellen Vorgeschichte und der Fahrhistorie, um sicherzustellen, dass nur qualifizierte und vertrauensw&uuml;rdige Personen am Steuer sitzen.</p>\\r\\n<p>Dar&uuml;ber hinaus verf&uuml;gen die meisten Fahr-Apps &uuml;ber integrierte Notfallfunktionen, mit denen Fahrg&auml;ste die &ouml;rtlichen Beh&ouml;rden auf Knopfdruck kontaktieren k&ouml;nnen, wenn sie sich unsicher f&uuml;hlen.</p>\\r\\n<p>Mit diesen Sicherheitsma&szlig;nahmen tragen Fahrdienste dazu bei, die Stra&szlig;en f&uuml;r alle sicherer zu machen, und geben den Fahrg&auml;sten jedes Mal ein beruhigendes Gef&uuml;hl, wenn sie eine Fahrt buchen.</p>\",\"fr\":\"<h2>&nbsp;</h2>\\r\\n<p>La s&eacute;curit&eacute; est une priorit&eacute; absolue pour les services de transport, et c&rsquo;est l&rsquo;une des principales raisons pour lesquelles tant de personnes leur font confiance pour leurs besoins de transport. Des v&eacute;rifications des ant&eacute;c&eacute;dents des chauffeurs aux fonctionnalit&eacute;s de s&eacute;curit&eacute; int&eacute;gr&eacute;es &agrave; l&rsquo;application, ces services prennent de nombreuses mesures pour garantir la s&eacute;curit&eacute; des passagers &agrave; chaque trajet.</p>\\r\\n<p>Un &eacute;l&eacute;ment cl&eacute; de la s&eacute;curit&eacute; est le suivi en temps r&eacute;el. Les passagers peuvent suivre la position de leur chauffeur tout au long du trajet, s&rsquo;assurer qu&rsquo;ils se dirigent dans la bonne direction et partager leur trajet avec une personne de confiance.</p>\\r\\n<p>Les services de transport effectuent &eacute;galement des v&eacute;rifications approfondies des ant&eacute;c&eacute;dents des chauffeurs, y compris leur casier judiciaire et leur historique de conduite, pour s&rsquo;assurer que seules des personnes qualifi&eacute;es et fiables sont au volant.</p>\\r\\n<p>De plus, la plupart des applications de transport disposent de fonctionnalit&eacute;s d&rsquo;urgence int&eacute;gr&eacute;es, permettant aux passagers de contacter les autorit&eacute;s locales en un seul clic s&rsquo;ils se sentent en danger.</p>\\r\\n<p>Avec ces mesures de s&eacute;curit&eacute;, les services de transport contribuent &agrave; rendre les routes plus s&ucirc;res pour tout le monde, apportant une tranquillit&eacute; d&rsquo;esprit aux passagers &agrave; chaque r&eacute;servation.</p>\",\"ar\":\"<h2>&nbsp;</h2>\\r\\n<p>تُعد السلامة أولوية قصوى لخدمات الركوب، وهي من الأسباب الرئيسية التي تجعل الكثير من الأشخاص يثقون بهذه الخدمات لتلبية احتياجاتهم في التنقل. بدءًا من فحص خلفيات السائقين وصولًا إلى ميزات الأمان داخل التطبيق، تتخذ خدمات الركوب خطوات عديدة لضمان شعور الركاب بالأمان أثناء كل رحلة.</p>\\r\\n<p>إحدى ميزات السلامة الرئيسية هي التتبع في الوقت الفعلي. يمكن للركاب تتبع موقع السائق أثناء الرحلة بأكملها، والتأكد من الاتجاه الصحيح، ومشاركة رحلتهم مع جهة اتصال موثوقة.</p>\\r\\n<p>كما تقوم خدمات الركوب بإجراء فحوصات خلفية دقيقة للسائقين، بما في ذلك السجل الجنائي وسجل القيادة، للتأكد من أن الأشخاص المؤهلين والموثوقين فقط هم من يقودون المركبات.</p>\\r\\n<p>بالإضافة إلى ذلك، تحتوي معظم تطبيقات الركوب على ميزات طوارئ مدمجة، تتيح للركاب الاتصال بالسلطات المحلية بضغطة زر واحدة إذا شعروا بعدم الأمان.</p>\\r\\n<p>مع وجود هذه التدابير الأمنية، تساهم خدمات الركوب في جعل الطرق أكثر أمانًا للجميع، مما يمنح الركاب راحة البال في كل مرة يحجزون فيها رحلة.</p>\"}', 'How to Make Your Ride More Comfortable and Enjoyable', 'Discover tips and tricks to enhance your ride experience and make every journey more comfortable and enjoyable.', 102, 102, 1, 1, 0, 1, 1, '2025-01-23 04:59:33', '2025-01-23 23:55:50', NULL),
(5, '{\"en\":\"How Ride Booking Helps You Save Money and Time\",\"de\":\"Wie Fahrtbuchung Ihnen hilft, Geld und Zeit zu sparen\",\"fr\":\"Comment la réservation de trajets vous aide à économiser de l\'argent et du temps\",\"ar\":\"كيف يساعدك حجز الرحلات في توفير المال والوقت\"}', 'how-ride-booking-helps-you-save-money-and-time', '{\"en\":\"Discover how ride booking services can help you save both money and time while making your daily commute or travel more efficient.\",\"de\":\"Erfahren Sie, wie Fahrtbuchungsdienste Ihnen helfen, sowohl Zeit als auch Geld zu sparen, während Sie gleichzeitig eine reibungslose Reiseerfahrung genießen.\",\"fr\":\"Découvrez comment les services de réservation de trajets vous aident à économiser à la fois du temps et de l’argent tout en garantissant une expérience de voyage fluide.\",\"ar\":\"اكتشف كيف تساعدك خدمات حجز الرحلات على توفير الوقت والمال بينما تضمن لك تجربة سفر سلسة.\"}', '{\"en\":\"<h2>How Ride Booking Helps You Save Money and Time</h2>\\r\\n<p>In today&rsquo;s fast-paced world, time and money are two of the most valuable resources. Ride booking services have revolutionized the way we travel, offering a convenient and cost-effective alternative to traditional transportation methods. Here&rsquo;s how ride booking can help you save both money and time:</p>\\r\\n<h3>1. Eliminate the Hassle of Parking</h3>\\r\\n<p>Finding parking in busy urban areas can be time-consuming and expensive. With ride booking services, you don&rsquo;t need to worry about parking fees or circling the block to find a spot. Your driver drops you off at your destination, saving you both time and money.</p>\\r\\n<h3>2. Avoid Public Transportation Delays</h3>\\r\\n<p>Public transportation can be unpredictable, with delays and crowded vehicles causing stress and wasting time. Ride booking services provide a reliable and direct route to your destination, ensuring you arrive on time without the hassle of transfers or waiting for buses or trains.</p>\\r\\n<h3>3. Optimized Routes for Faster Travel</h3>\\r\\n<p>Ride booking apps use advanced GPS technology to calculate the fastest and most efficient routes. This helps you avoid traffic congestion and reduces travel time, making your journey smoother and more predictable.</p>\\r\\n<h3>4. Cost-Effective Compared to Owning a Car</h3>\\r\\n<p>Owning a car comes with significant expenses, including fuel, maintenance, insurance, and depreciation. Ride booking services allow you to pay only for the rides you need, eliminating the ongoing costs of car ownership. This can lead to substantial savings over time.</p>\\r\\n<h3>5. Shared Rides for Additional Savings</h3>\\r\\n<p>Many ride booking services offer shared ride options, where you can split the cost with other passengers heading in the same direction. This not only reduces your fare but also contributes to a more sustainable and eco-friendly travel option.</p>\\r\\n<h3>6. No Hidden Costs</h3>\\r\\n<p>With transparent pricing, ride booking services provide upfront cost estimates before you confirm your ride. This eliminates surprises and helps you budget your travel expenses more effectively.</p>\\r\\n<h3>7. Time for Productivity or Relaxation</h3>\\r\\n<p>Instead of focusing on driving, you can use your ride time to catch up on work, read, or simply relax. This makes your travel time more productive and enjoyable, adding value to your day.</p>\\r\\n<p>By leveraging the convenience and efficiency of ride booking services, you can save both money and time while enjoying a stress-free travel experience. Whether you&rsquo;re commuting to work, running errands, or heading to the airport, ride booking is a smart choice for modern travelers.</p>\",\"de\":\"<h2>Wie Fahrtbuchung Ihnen hilft, Geld und Zeit zu sparen</h2>\\r\\n<p>Fahrtbuchungsdienste bieten eine gro&szlig;artige M&ouml;glichkeit, sowohl Zeit als auch Geld zu sparen. In der heutigen schnelllebigen Welt suchen die Menschen st&auml;ndig nach M&ouml;glichkeiten, ihre t&auml;glichen Routinen zu optimieren. Fahrtbuchung bietet eine L&ouml;sung, die Effizienz, Kosteneinsparungen und Komfort liefert.</p>\\r\\n<p><strong>Zeitersparnis:</strong> Fahrtservices helfen Ihnen, lange Wartezeiten an Bushaltestellen oder Bahnh&ouml;fen zu vermeiden. Mit der M&ouml;glichkeit, Ihre Fahrt in Echtzeit zu verfolgen, k&ouml;nnen Sie Ihren Tag effektiver planen und Zeitverschwendung vermeiden.</p>\\r\\n<p><strong>Kostensenkung:</strong> Durch die Vermeidung eines eigenen Autos sparen Fahrtservices Geld f&uuml;r Kraftstoff, Wartung, Versicherung und Parkgeb&uuml;hren. Viele Fahrtservices bieten wettbewerbsf&auml;hige Preise und verschiedene Zahlungsmethoden, die in Ihr Budget passen.</p>\\r\\n<p>Zus&auml;tzlich bieten viele Fahrtbuchungs-Apps Rabatte, Sonderaktionen oder Treueprogramme an, um die Reisekosten weiter zu senken.</p>\\r\\n<p>Ob Sie nun zur Arbeit pendeln oder Besorgungen machen, die Nutzung von Fahrtbuchungsdiensten ist eine erschwingliche und zeitsparende Alternative zum traditionellen Transport.</p>\",\"fr\":\"<p>Les services de r&eacute;servation de trajets offrent un excellent moyen d&rsquo;&eacute;conomiser &agrave; la fois du temps et de l&rsquo;argent. Dans le monde rapide d&rsquo;aujourd&rsquo;hui, les gens cherchent constamment des moyens de rationaliser leur routine quotidienne. La r&eacute;servation de trajets offre une solution qui allie efficacit&eacute;, &eacute;conomies et commodit&eacute;.</p>\\r\\n<p><strong>Efficacit&eacute; temporelle :</strong> Les services de trajets vous aident &agrave; &eacute;viter les longues attentes aux arr&ecirc;ts de bus ou aux gares. Avec la possibilit&eacute; de suivre votre trajet en temps r&eacute;el, vous pouvez planifier votre journ&eacute;e plus efficacement et &eacute;viter de perdre du temps.</p>\\r\\n<p><strong>&Eacute;conomies :</strong> En &eacute;liminant le besoin d&rsquo;une voiture, les services de trajets vous permettent d&rsquo;&eacute;conomiser de l&rsquo;argent sur le carburant, l&rsquo;entretien, l&rsquo;assurance et les frais de stationnement. De nombreux services de trajets proposent des prix comp&eacute;titifs et plusieurs options de paiement adapt&eacute;es &agrave; votre budget.</p>\\r\\n<p>De plus, les applications de r&eacute;servation de trajets offrent souvent des r&eacute;ductions, des promotions ou des programmes de fid&eacute;lit&eacute; pour r&eacute;duire encore les co&ucirc;ts de transport.</p>\\r\\n<p>Que vous soyez en train de vous rendre au travail ou de faire des courses, l&rsquo;utilisation des services de r&eacute;servation de trajets est une alternative abordable et qui permet de gagner du temps par rapport aux transports traditionnels.</p>\",\"ar\":\"<h2>كيف يساعدك حجز الرحلات في توفير المال والوقت</h2>\\r\\n<p>تعد خدمات حجز الرحلات وسيلة رائعة لتوفير الوقت والمال. في عالمنا سريع الوتيرة اليوم، يبحث الناس دائمًا عن طرق لتبسيط روتينهم اليومي. يوفر حجز الرحلات حلاً يجمع بين الكفاءة، وتوفير التكاليف، والراحة.</p>\\r\\n<p><strong>كفاءة الوقت:</strong> تساعدك خدمات الرحلات في تجنب الانتظار الطويل في محطات الحافلات أو القطارات. مع إمكانية تتبع رحلتك في الوقت الفعلي، يمكنك تخطيط يومك بشكل أكثر فعالية وتجنب هدر الوقت.</p>\\r\\n<p><strong>توفير التكاليف:</strong> من خلال الاستغناء عن الحاجة لامتلاك سيارة، توفر لك خدمات الرحلات المال على الوقود، والصيانة، والتأمين، ورسوم المواقف. العديد من خدمات الرحلات تقدم أسعارًا تنافسية وخيارات دفع متنوعة تتناسب مع ميزانيتك.</p>\\r\\n<p>بالإضافة إلى ذلك، غالبًا ما تقدم تطبيقات حجز الرحلات خصومات، وعروض ترويجية، أو برامج ولاء للمساعدة في تقليل تكاليف السفر أكثر.</p>\\r\\n<p>سواء كنت تتنقل إلى العمل أو تقوم بالمهام اليومية، فإن استخدام خدمات حجز الرحلات هو بديل ميسور التكلفة ويوفر الوقت مقارنةً بوسائل النقل التقليدية.</p>\"}', 'How Ride Booking Helps You Save Money and Time', 'Discover how ride booking services can help you save both money and time while making your daily commute or travel more efficient.', 98, 98, 1, 1, 0, 1, 1, '2025-01-23 05:04:39', '2025-01-24 00:04:25', NULL),
(6, '{\n  \"en\": \"How Ride Services are Adapting to the Changing Travel Landscape\",\n  \"fr\": \"Comment les services de transport s\'adaptent à l\'évolution du paysage des voyages\",\n  \"ar\": \"كيف تتكيف خدمات الركوب مع مشهد السفر المتغير\",\n  \"de\": \"Wie Fahrdienste sich an die veränderte Reisewelt anpassen\"\n}\n', 'how-ride-services-are-adapting-to-the-changing-travel-landscape', '{\n  \"en\": \"Explore how ride services are evolving to meet the demands of modern travelers and adapt to the dynamic travel landscape.\",\n  \"fr\": \"Découvrez comment les services de transport évoluent pour répondre aux exigences des voyageurs modernes et s\'adapter au paysage du voyage en constante évolution.\",\n  \"ar\": \"استكشف كيف تتطور خدمات الركوب لتلبية متطلبات المسافرين العصريين والتكيف مع مشهد السفر الديناميكي.\",\n  \"de\": \"Erkunden Sie, wie Fahrdienste sich weiterentwickeln, um den Anforderungen moderner Reisender gerecht zu werden und sich an die dynamische Reisewelt anzupassen.\"\n}\n', '{\"en\":\"<h2>How Ride Services are Adapting to the Changing Travel Landscape</h2>\\r\\n<p>The travel landscape is constantly evolving, driven by technological advancements, changing consumer preferences, and global trends. Ride services are at the forefront of this transformation, adapting to meet the needs of modern travelers. Here&rsquo;s how ride services are staying ahead of the curve:</p>\\r\\n<h3>1. Embracing Technology</h3>\\r\\n<p>Ride services are leveraging cutting-edge technologies like artificial intelligence (AI), machine learning, and real-time data analytics to enhance the user experience. Features like predictive demand modeling, dynamic pricing, and route optimization ensure efficient and reliable service.</p>\\r\\n<h3>2. Expanding Eco-Friendly Options</h3>\\r\\n<p>With growing concerns about climate change, ride services are introducing more eco-friendly options, such as electric and hybrid vehicles. Many companies are also committing to carbon-neutral operations, appealing to environmentally conscious travelers.</p>\\r\\n<h3>3. Offering Flexible Ride Options</h3>\\r\\n<p>To cater to diverse traveler needs, ride services now offer a variety of options, including shared rides, luxury rides, and specialized services like wheelchair-accessible vehicles or rides with child seats. This flexibility ensures that every traveler can find a suitable option.</p>\\r\\n<h3>4. Enhancing Safety Measures</h3>\\r\\n<p>Safety remains a top priority for ride services. Companies are implementing advanced safety features like real-time driver monitoring, in-app emergency buttons, and vehicle tracking. These measures provide peace of mind to passengers and build trust in the service.</p>\\r\\n<h3>5. Integrating Multimodal Transportation</h3>\\r\\n<p>Ride services are increasingly integrating with other modes of transportation, such as public transit, bike-sharing, and scooter rentals. This creates a seamless travel experience, allowing users to combine different transport options for a more efficient journey.</p>\\r\\n<h3>6. Adapting to Post-Pandemic Needs</h3>\\r\\n<p>The COVID-19 pandemic has reshaped travel behavior, with a greater emphasis on hygiene and safety. Ride services have responded by introducing contactless payments, enhanced cleaning protocols, and health screening for drivers.</p>\\r\\n<h3>7. Focusing on Urban Mobility Solutions</h3>\\r\\n<p>As cities grow and traffic congestion worsens, ride services are partnering with local governments to develop urban mobility solutions. This includes initiatives like carpooling incentives, dedicated ride lanes, and smart city integrations.</p>\\r\\n<h3>8. Personalizing the Travel Experience</h3>\\r\\n<p>Ride services are using data analytics to offer personalized experiences, such as tailored ride recommendations, loyalty programs, and customized pricing. This level of personalization enhances customer satisfaction and loyalty.</p>\\r\\n<p>By continuously innovating and adapting to the changing travel landscape, ride services are redefining the way we move. Whether it&rsquo;s through eco-friendly initiatives, advanced safety measures, or seamless integrations, ride services are shaping the future of transportation.</p>\"}', 'How Ride Services are Adapting to the Changing Travel Landscape', 'Explore how ride services are evolving to meet the demands of modern travelers and adapt to the dynamic travel landscape.', 100, 100, 1, 1, 0, 1, 1, '2025-01-23 05:06:51', '2025-01-23 05:06:51', NULL),
(7, '{\n  \"en\": \"From Shipments to Rides: The Versatility of Parcel Freight and Cab Services\",\n  \"fr\": \"Des expéditions aux trajets : la polyvalence du fret de colis et des services de taxi\",\n  \"ar\": \"من الشحنات إلى الرحلات: تعددية استخدام خدمات شحن الطرود وسيارات الأجرة\",\n  \"de\": \"Von Sendungen bis zu Fahrten: Die Vielseitigkeit von Paketfracht- und Taxidiensten\"\n}\n', 'from-shipments-to-rides-the-versatility-of-parcel-freight-and-cab-services', '{\n  \"en\": \"Discover how parcel freight and cab services are expanding their offerings to meet diverse transportation needs, from delivering goods to transporting people.\",\n  \"fr\": \"Découvrez comment les services de fret de colis et de taxis élargissent leurs offres pour répondre à divers besoins de transport, de la livraison de marchandises au transport de personnes.\",\n  \"ar\": \"اكتشف كيف توسع خدمات شحن الطرود وسيارات الأجرة عروضها لتلبية احتياجات النقل المتنوعة، من توصيل البضائع إلى نقل الأشخاص.\",\n  \"de\": \"Erfahren Sie, wie Paketfracht- und Taxidienste ihr Angebot erweitern, um vielfältige Transportbedürfnisse zu erfüllen – von der Lieferung von Waren bis zum Transport von Personen.\"\n}\n', '{\"en\":\"<h2>From Shipments to Rides: The Versatility of Parcel Freight and Cab Services</h2>\\r\\n<p>In today&rsquo;s fast-paced world, transportation services are no longer limited to a single purpose. Parcel freight and cab services are evolving to meet a wide range of needs, from delivering goods to transporting people. Here&rsquo;s how these services are demonstrating their versatility:</p>\\r\\n<h3>1. Delivering Goods with Precision</h3>\\r\\n<p>Parcel freight services specialize in the efficient delivery of goods, from small packages to large shipments. With advanced tracking systems and optimized logistics, these services ensure that items reach their destinations on time and in perfect condition.</p>\\r\\n<h3>2. Transporting People Safely and Comfortably</h3>\\r\\n<p>Cab services have long been a reliable option for personal transportation. With features like real-time tracking, in-app payments, and professional drivers, cab services provide a safe and comfortable travel experience for passengers.</p>\\r\\n<h3>3. Combining Services for Greater Efficiency</h3>\\r\\n<p>Some companies are now offering integrated services that combine parcel delivery and passenger transport. For example, a cab service might deliver packages during off-peak hours, maximizing resource utilization and reducing costs.</p>\\r\\n<h3>4. Adapting to Urban and Rural Needs</h3>\\r\\n<p>Parcel freight and cab services are designed to operate in both urban and rural areas. Whether it&rsquo;s navigating busy city streets or reaching remote locations, these services ensure that no area is left underserved.</p>\\r\\n<h3>5. Leveraging Technology for Seamless Operations</h3>\\r\\n<p>Both parcel freight and cab services rely heavily on technology to streamline operations. GPS tracking, route optimization, and automated dispatch systems ensure that deliveries and rides are efficient and reliable.</p>\\r\\n<h3>6. Offering Eco-Friendly Solutions</h3>\\r\\n<p>Many parcel freight and cab services are adopting eco-friendly practices, such as using electric or hybrid vehicles. This not only reduces their environmental impact but also appeals to environmentally conscious customers.</p>\\r\\n<h3>7. Providing Specialized Services</h3>\\r\\n<p>From temperature-controlled deliveries for perishable goods to luxury cab services for VIP clients, these industries are expanding their offerings to cater to specialized needs.</p>\\r\\n<h3>8. Enhancing Customer Experience</h3>\\r\\n<p>With features like real-time updates, flexible scheduling, and 24/7 customer support, parcel freight and cab services are prioritizing customer satisfaction and convenience.</p>\\r\\n<p>By diversifying their services and leveraging technology, parcel freight and cab services are proving their versatility in meeting the evolving needs of modern transportation. Whether it&rsquo;s delivering a package or providing a ride, these services are essential to keeping the world moving.</p>\"}', 'From Shipments to Rides: The Versatility of Parcel Freight and Cab Services', 'Discover how parcel freight and cab services are expanding their offerings to meet diverse transportation needs, from delivering goods to transporting people.', 106, 106, 1, 1, 0, 1, 1, '2025-01-23 05:10:49', '2025-01-23 05:10:49', NULL),
(8, '{\n  \"en\": \"Choosing the Right Vehicle Type for Your Service Needs\",\n  \"fr\": \"Choisir le bon type de véhicule pour vos besoins de service\",\n  \"ar\": \"اختيار النوع المناسب من المركبات لتلبية احتياجات خدمتك\",\n  \"de\": \"Die richtige Fahrzeugart für Ihre Serviceanforderungen wählen\"\n}\n', 'choosing-the-right-vehicle-type-for-your-service-needs', '{\n  \"en\": \"Learn how to select the perfect vehicle type for your specific service requirements, whether for personal use, business, or specialized transportation.\",\n  \"fr\": \"Apprenez à choisir le type de véhicule parfait pour vos besoins spécifiques, que ce soit pour un usage personnel, professionnel ou un transport spécialisé.\",\n  \"ar\": \"تعلم كيفية اختيار النوع المثالي من المركبات لتلبية متطلبات خدمتك المحددة، سواء للاستخدام الشخصي، للأعمال، أو للنقل المتخصص.\",\n  \"de\": \"Erfahren Sie, wie Sie den perfekten Fahrzeugtyp für Ihre spezifischen Serviceanforderungen auswählen, sei es für den persönlichen Gebrauch, geschäftliche Zwecke oder spezialisierte Transporte.\"\n}\n', '{\"en\":\"<h2>Choosing the Right Vehicle Type for Your Service Needs</h2>\\r\\n<p>Selecting the right vehicle type is crucial for meeting your transportation needs efficiently and cost-effectively. Whether you&rsquo;re running a business, managing logistics, or planning personal travel, here&rsquo;s a guide to help you choose the perfect vehicle:</p>\\r\\n<h3>1. Sedans for Everyday Commuting</h3>\\r\\n<p>Sedans are ideal for daily commuting and short trips. They offer comfort, fuel efficiency, and ease of parking, making them a popular choice for individuals and small families.</p>\\r\\n<h3>2. SUVs for Versatility and Space</h3>\\r\\n<p>If you need more space for passengers or cargo, SUVs are a great option. They are versatile, suitable for both urban and off-road travel, and provide additional safety features.</p>\\r\\n<h3>3. Vans for Group Travel and Deliveries</h3>\\r\\n<p>Vans are perfect for transporting larger groups or handling bulk deliveries. They offer ample seating and storage space, making them a go-to choice for businesses and event organizers.</p>\\r\\n<h3>4. Trucks for Heavy-Duty Needs</h3>\\r\\n<p>For heavy-duty tasks like construction or large-scale deliveries, trucks are the best option. They are designed to handle heavy loads and tough terrains with ease.</p>\\r\\n<h3>5. Electric Vehicles for Sustainability</h3>\\r\\n<p>Electric vehicles (EVs) are becoming increasingly popular due to their eco-friendly nature and lower operating costs. They are ideal for urban travel and short-distance deliveries.</p>\\r\\n<h3>6. Luxury Vehicles for Premium Services</h3>\\r\\n<p>If you&rsquo;re offering premium transportation services, luxury vehicles like high-end sedans or SUVs can enhance the customer experience and reflect your brand&rsquo;s quality.</p>\\r\\n<h3>7. Specialized Vehicles for Unique Needs</h3>\\r\\n<p>For specialized requirements, such as wheelchair-accessible vehicles or refrigerated trucks for perishable goods, choose vehicles designed to meet those specific needs.</p>\\r\\n<h3>8. Consider Fuel Efficiency and Maintenance</h3>\\r\\n<p>When choosing a vehicle, consider factors like fuel efficiency, maintenance costs, and insurance. These can significantly impact your overall expenses and operational efficiency.</p>\\r\\n<p>By carefully evaluating your needs and understanding the strengths of each vehicle type, you can make an informed decision that ensures efficiency, cost-effectiveness, and customer satisfaction.</p>\"}', 'Choosing the Right Vehicle Type for Your Service Needs', 'Learn how to select the perfect vehicle type for your specific service requirements, whether for personal use, business, or specialized transportation.', 112, 112, 1, 1, 0, 1, 1, '2025-01-23 05:14:28', '2025-01-23 05:14:28', NULL);
INSERT INTO `blogs` (`id`, `title`, `slug`, `description`, `content`, `meta_title`, `meta_description`, `blog_thumbnail_id`, `blog_meta_image_id`, `is_featured`, `is_sticky`, `is_draft`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, '{\n  \"en\": \"Exploring Different Ride Categories: Which One is Right for You?\",\n  \"fr\": \"Explorer les différentes catégories de trajets : laquelle est faite pour vous ?\",\n  \"ar\": \"استكشاف فئات الركوب المختلفة: أيها يناسبك؟\",\n  \"de\": \"Erkundung verschiedener Fahrtkategorien: Welche ist die richtige für Sie?\"\n}\n', 'exploring-different-ride-categories-which-one-is-right-for-you', '{\n  \"en\": \"Discover the five main ride categories—Intercity, Cab, Package, Schedule, and Rental—and learn how to choose the one that best suits your travel needs.\",\n  \"fr\": \"Découvrez les cinq principales catégories de trajets—Intercité, Taxi, Colis, Planifié et Location—et apprenez à choisir celle qui convient le mieux à vos besoins de voyage.\",\n  \"ar\": \"اكتشف الفئات الخمس الرئيسية للرحلات—بين المدن، الأجرة، الطرود، المجدولة، والتأجير—وتعلم كيفية اختيار الفئة التي تناسب احتياجات سفرك بشكل أفضل.\",\n  \"de\": \"Entdecken Sie die fünf Hauptkategorien von Fahrdiensten—Intercity, Taxi, Paket, Geplant und Miete—und erfahren Sie, wie Sie die beste Wahl für Ihre Reisebedürfnisse treffen.\"\n}\n', '{\n  \"en\": \"<h2>Exploring Different Ride Categories: Which One is Right for You?</h2>\\r\\n<p>Choosing the right ride category can make your travel experience smoother, more efficient, and cost-effective. Here’s a detailed look at the five main ride categories—Intercity, Cab, Package, Schedule, and Rental—and how to decide which one is perfect for your needs:</p>\\r\\n<h3>1. Intercity Rides</h3>\\r\\n<p>Intercity rides are designed for long-distance travel between cities. They are ideal for travelers who need a comfortable and reliable way to cover large distances without the hassle of driving. These rides often include amenities like spacious seating, Wi-Fi, and refreshments.</p>\\r\\n<h3>2. Cab Rides</h3>\\r\\n<p>Cab rides are perfect for short-distance travel within a city. Whether you’re commuting to work, running errands, or heading to a social event, cabs offer convenience, affordability, and quick pickups. They are a great option for solo travelers or small groups.</p>\\r\\n<h3>3. Package Rides</h3>\\r\\n<p>Package rides are tailored for delivering goods or parcels. If you need to send or receive items quickly and securely, this category ensures your packages are handled with care. It’s a reliable choice for businesses and individuals alike.</p>\\r\\n<h3>4. Scheduled Rides</h3>\\r\\n<p>Scheduled rides allow you to book a ride in advance, ensuring you have a vehicle ready at a specific time. This is ideal for travelers with tight schedules, such as catching a flight or attending a meeting. It eliminates last-minute stress and guarantees punctuality.</p>\\r\\n<h3>5. Rental Rides</h3>\\r\\n<p>Rental rides give you the flexibility to drive yourself. Whether you need a car for a day, a week, or longer, rentals are perfect for travelers who prefer independence and want to explore at their own pace. They are also great for road trips or family vacations.</p>\\r\\n<p>By understanding the unique features of each ride category, you can choose the one that aligns with your travel goals, budget, and preferences. Whether you’re traveling across cities, sending a package, or renting a car for a weekend getaway, there’s a ride category tailored just for you.</p>\",\n\n  \"fr\": \"<h2>Explorer les différentes catégories de trajets : laquelle est faite pour vous ?</h2>\\r\\n<p>Choisir la bonne catégorie de trajet peut rendre votre expérience de voyage plus fluide, plus efficace et plus économique. Voici un aperçu détaillé des cinq principales catégories de trajets—Intercité, Taxi, Colis, Planifié et Location—et comment choisir celle qui convient le mieux à vos besoins :</p>\\r\\n<h3>1. Trajets Intercités</h3>\\r\\n<p>Les trajets intercités sont conçus pour les déplacements longue distance entre les villes. Ils sont idéaux pour les voyageurs qui recherchent un moyen confortable et fiable de parcourir de grandes distances sans avoir à conduire. Ces trajets offrent souvent des commodités comme des sièges spacieux, le Wi-Fi et des rafraîchissements.</p>\\r\\n<h3>2. Trajets en Taxi</h3>\\r\\n<p>Les trajets en taxi sont parfaits pour les déplacements courts en ville. Que vous alliez au travail, fassiez des courses ou assistiez à un événement social, les taxis offrent commodité, accessibilité et rapidité. C’est une excellente option pour les voyageurs seuls ou en petits groupes.</p>\\r\\n<h3>3. Trajets pour Colis</h3>\\r\\n<p>Les trajets pour colis sont destinés à la livraison de marchandises ou de colis. Si vous devez envoyer ou recevoir des articles rapidement et en toute sécurité, cette catégorie garantit que vos colis sont manipulés avec soin. C’est un choix fiable pour les entreprises et les particuliers.</p>\\r\\n<h3>4. Trajets Planifiés</h3>\\r\\n<p>Les trajets planifiés vous permettent de réserver un trajet à l’avance, garantissant ainsi qu’un véhicule soit prêt à une heure précise. Ceci est idéal pour les voyageurs avec un emploi du temps serré, comme prendre un vol ou assister à une réunion. Cela élimine le stress de dernière minute et assure la ponctualité.</p>\\r\\n<h3>5. Trajets en Location</h3>\\r\\n<p>Les trajets en location vous offrent la flexibilité de conduire vous-même. Que vous ayez besoin d’une voiture pour une journée, une semaine ou plus, les locations sont parfaites pour les voyageurs qui préfèrent l’indépendance et souhaitent explorer à leur propre rythme. Elles sont également idéales pour les road trips ou les vacances en famille.</p>\\r\\n<p>En comprenant les caractéristiques uniques de chaque catégorie de trajet, vous pouvez choisir celle qui correspond à vos objectifs de voyage, votre budget et vos préférences. Que vous voyagiez entre les villes, envoyiez un colis ou louiez une voiture pour une escapade, il y a une catégorie de trajet faite pour vous.</p>\",\n\n  \"ar\": \"<h2>استكشاف فئات الركوب المختلفة: أيها يناسبك؟</h2>\\r\\n<p>يمكن أن يساعدك اختيار فئة الركوب المناسبة في جعل تجربة سفرك أكثر سلاسة وكفاءة وتكلفة أقل. إليك نظرة تفصيلية على الفئات الخمس الرئيسية للركوب—بين المدن، الأجرة، الطرود، المجدولة، والتأجير—وكيفية اختيار الفئة المثالية لاحتياجاتك:</p>\\r\\n<h3>1. رحلات بين المدن</h3>\\r\\n<p>تم تصميم رحلات بين المدن للسفر لمسافات طويلة بين المدن. وهي مثالية للمسافرين الذين يحتاجون إلى وسيلة مريحة وموثوقة للتنقل دون عناء القيادة. غالبًا ما تشمل هذه الرحلات ميزات مثل المقاعد الواسعة، والواي فاي، والمرطبات.</p>\\r\\n<h3>2. رحلات الأجرة</h3>\\r\\n<p>رحلات الأجرة مثالية للتنقل لمسافات قصيرة داخل المدينة. سواء كنت ذاهبًا إلى العمل أو تقوم بمشاوير أو تحضر حدثًا اجتماعيًا، توفر سيارات الأجرة الراحة والتكلفة المعقولة والتوصيل السريع. إنها خيار رائع للمسافرين الفرديين أو المجموعات الصغيرة.</p>\\r\\n<h3>3. رحلات الطرود</h3>\\r\\n<p>تم تصميم رحلات الطرود لنقل البضائع أو الطرود. إذا كنت بحاجة إلى إرسال أو استلام عناصر بسرعة وأمان، فإن هذه الفئة تضمن التعامل مع الطرود بعناية. إنها خيار موثوق به للأفراد والشركات على حد سواء.</p>\\r\\n<h3>4. الرحلات المجدولة</h3>\\r\\n<p>تتيح لك الرحلات المجدولة حجز رحلة مسبقًا لضمان توفر مركبة في الوقت المحدد. هذا مثالي للمسافرين الذين لديهم جداول زمنية ضيقة، مثل اللحاق برحلة طيران أو حضور اجتماع. يساعد ذلك في تجنب التوتر في اللحظة الأخيرة ويضمن الالتزام بالمواعيد.</p>\\r\\n<h3>5. رحلات التأجير</h3>\\r\\n<p>تمنحك رحلات التأجير المرونة في القيادة بنفسك. سواء كنت بحاجة إلى سيارة ليوم واحد أو أسبوع أو لفترة أطول، فإن التأجير مثالي للمسافرين الذين يفضلون الاستقلالية واستكشاف الأماكن بوتيرتهم الخاصة. كما أنها رائعة للرحلات البرية أو العطلات العائلية.</p>\\r\\n<p>من خلال فهم الميزات الفريدة لكل فئة من فئات الركوب، يمكنك اختيار الفئة التي تتماشى مع أهدافك وميزانيتك وتفضيلاتك. سواء كنت تسافر بين المدن أو ترسل طردًا أو تستأجر سيارة لرحلة نهاية الأسبوع، هناك فئة ركوب مصممة خصيصًا لك.</p>\"\n}\n', 'Exploring Different Ride Categories: Which One is Right for You?', 'Discover the five main ride categories—Intercity, Cab, Package, Schedule, and Rental—and learn how to choose the one that best suits your travel needs.', 110, 110, 1, 1, 0, 1, 1, '2025-01-23 05:19:30', '2025-01-23 05:19:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `blog_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `blog_id`, `category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 2, 26, NULL, NULL, NULL),
(7, 2, 28, NULL, NULL, NULL),
(8, 3, 26, NULL, NULL, NULL),
(9, 3, 30, NULL, NULL, NULL),
(10, 3, 41, NULL, NULL, NULL),
(11, 3, 42, NULL, NULL, NULL),
(12, 3, 48, NULL, NULL, NULL),
(13, 4, 26, NULL, NULL, NULL),
(14, 4, 32, NULL, NULL, NULL),
(15, 4, 29, NULL, NULL, NULL),
(16, 4, 41, NULL, NULL, NULL),
(17, 4, 48, NULL, NULL, NULL),
(18, 1, 26, NULL, NULL, NULL),
(19, 1, 38, NULL, NULL, NULL),
(20, 5, 26, NULL, NULL, NULL),
(21, 5, 35, NULL, NULL, NULL),
(22, 5, 34, NULL, NULL, NULL),
(23, 5, 29, NULL, NULL, NULL),
(24, 5, 41, NULL, NULL, NULL),
(25, 5, 44, NULL, NULL, NULL),
(26, 6, 26, NULL, NULL, NULL),
(27, 6, 34, NULL, NULL, NULL),
(28, 6, 33, NULL, NULL, NULL),
(29, 6, 32, NULL, NULL, NULL),
(30, 7, 26, NULL, NULL, NULL),
(31, 7, 31, NULL, NULL, NULL),
(32, 7, 30, NULL, NULL, NULL),
(33, 8, 26, NULL, NULL, NULL),
(34, 8, 38, NULL, NULL, NULL),
(35, 8, 27, NULL, NULL, NULL),
(36, 8, 36, NULL, NULL, NULL),
(37, 9, 26, NULL, NULL, NULL),
(38, 9, 39, NULL, NULL, NULL),
(39, 9, 36, NULL, NULL, NULL),
(40, 9, 31, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `blog_id` bigint UNSIGNED NOT NULL,
  `tag_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_tags`
--

INSERT INTO `blog_tags` (`id`, `blog_id`, `tag_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 1, 2, NULL, NULL, NULL),
(3, 1, 3, NULL, NULL, NULL),
(4, 1, 4, NULL, NULL, NULL),
(5, 2, 4, NULL, NULL, NULL),
(6, 2, 5, NULL, NULL, NULL),
(7, 2, 6, NULL, NULL, NULL),
(8, 2, 7, NULL, NULL, NULL),
(9, 3, 11, NULL, NULL, NULL),
(10, 3, 13, NULL, NULL, NULL),
(11, 3, 20, NULL, NULL, NULL),
(12, 3, 22, NULL, NULL, NULL),
(13, 4, 7, NULL, NULL, NULL),
(14, 4, 14, NULL, NULL, NULL),
(15, 4, 15, NULL, NULL, NULL),
(16, 5, 8, NULL, NULL, NULL),
(17, 5, 9, NULL, NULL, NULL),
(18, 5, 10, NULL, NULL, NULL),
(19, 5, 23, NULL, NULL, NULL),
(20, 5, 24, NULL, NULL, NULL),
(21, 6, 7, NULL, NULL, NULL),
(22, 6, 18, NULL, NULL, NULL),
(23, 6, 19, NULL, NULL, NULL),
(24, 7, 4, NULL, NULL, NULL),
(25, 7, 20, NULL, NULL, NULL),
(26, 7, 26, NULL, NULL, NULL),
(27, 7, 27, NULL, NULL, NULL),
(28, 8, 20, NULL, NULL, NULL),
(29, 8, 21, NULL, NULL, NULL),
(30, 8, 22, NULL, NULL, NULL),
(31, 9, 12, NULL, NULL, NULL),
(32, 9, 13, NULL, NULL, NULL),
(33, 9, 14, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cab_commission_histories`
--

CREATE TABLE `cab_commission_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_commission` decimal(8,2) DEFAULT '0.00',
  `driver_commission` decimal(8,2) DEFAULT '0.00',
  `fleet_commission` decimal(8,2) NOT NULL DEFAULT '0.00',
  `commission_rate` decimal(8,2) DEFAULT '0.00',
  `commission_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ride_id` bigint UNSIGNED DEFAULT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cab_commission_histories`
--

INSERT INTO `cab_commission_histories` (`id`, `admin_commission`, `driver_commission`, `fleet_commission`, `commission_rate`, `commission_type`, `ride_id`, `driver_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 20.00, 795.00, 15.00, 35.00, 'fixed', 9, 27, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(5, 3.45, 109.25, 2.30, 5.00, 'percentage', 19, 31, '2025-04-12 10:31:40', '2025-04-14 10:31:40', NULL),
(6, 6.30, 199.50, 4.20, 5.00, 'percentage', 25, 25, '2025-04-12 10:31:40', '2025-04-14 10:31:40', NULL),
(7, 3.45, 109.25, 2.30, 5.00, 'percentage', 26, 25, '2025-04-12 10:31:40', '2025-04-14 10:31:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('taxido_cache_fire_store_access_token', 's:1024:\"ya29.c.c0ASRK0GbjE0qXzr09B2bSzJNM0rBC6vjw52Vi64OqnBTi8U6uFxuPflYKRFmkPEt2S0mWOevTYa0F4bFEr3yQvAc0Imr2lHEd2avAP7tqivip0_ZLc_KhBu4hEQL5rmyllLgkUS3MXcGYvy8raVSbGFTtk0jUU1P28q-fAx5lIJsu23md7x3QH0oHcF8mAERU7OlVV28Cvb03pKa37rVuHDMBxbF4IoAbGP96WUlnnET48vPDPjii3hwE9PEt5dKzwHNiQz8rIYGD9G9CwYBTOuohDt2kY_4khQJeafFrdPC6wuKf_BJTN_8rnWjliswvO5uB9oLDBgmK8-RFWZ5ZwNQobGxbQlAh3Tz_vpwDwJ_2sJc9WF_6I308OwE387AjbtBUnz5hk8M3kMSapYxn93-d_jq9q7WBQ0FYmvtX_iYo0zWibkmvFmsZ8-YnYy9qM0sWmx29yibvlrl54fMb4iJ0046ssq5WbyFq8SoozUZ2QcSgaexIIcxJYsOkgYxjln_ZkXOvgwJfogeY1aBXvim4M6Mc3upsjhgM8I3a2IdiYnIlvZUZBzgcvhcpOR0jrw-_orx-VdOVkBsdIJ3uoJM9xfBgx8W95B8724QSzep9eR0ZkYvJrrYaetbFlSWx96nQSumr12ZkR6d82bFo_2XO7w47cJUvi67t2Vttkqa_pR8rcdSvIgM-tagvBi3JIatmBZqsxOz1JbfvhcSBmIO2rj7pRgd2Slnf6SXF2a2Z6j9t8Or6o71J4pF4zZSiUOSbM_91-w28Fph-BabepUntoph0yMqoyz3tB6XyqfzB1lolznyzIVyS0pXy4g1Xf4WWOfWUJZc-aizcexOb2IIjFBxQZ--plQb1Ov1Sezxr2m0Jpe2ceuQ8fg0VXknrScjc6sIZ8qjVXdcetkzZwX4gU53-8bu2Oum5XJJq0Zhlrt1eje4nyS2YtBfXY2mfwdhigX9z8MY22MZicY8IhuVhYVqwllymxurw52o6Fr79UyZcuzaxqmS\";', 1753204422),
('taxido_cache_monthly_commissions', 'a:2:{s:16:\"admin_commission\";a:12:{i:1;i:0;i:2;i:0;i:3;i:0;i:4;s:5:\"57.00\";i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;i:10;i:0;i:11;i:0;i:12;i:0;}s:17:\"driver_commission\";a:12:{i:1;i:0;i:2;i:0;i:3;i:0;i:4;s:7:\"1213.00\";i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;i:10;i:0;i:11;i:0;i:12;i:0;}}', 1744670359),
('taxido_cache_spatie.permission.cache', 'a:3:{s:5:\"alias\";a:7:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";s:1:\"j\";s:14:\"system_reserve\";s:1:\"k\";s:6:\"module\";s:1:\"l\";s:6:\"status\";}s:11:\"permissions\";a:379:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:11:\"media.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:12:\"media.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:10:\"media.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:13:\"media.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:13:\"media.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:17:\"media.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:10:\"user.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:11:\"user.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:9:\"user.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:12:\"user.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:12:\"user.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:16:\"user.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:10:\"role.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:11:\"role.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:9:\"role.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:12:\"role.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:16:\"attachment.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:17:\"attachment.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:18:\"attachment.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:15:\"attachment.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:14:\"category.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:15:\"category.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:13:\"category.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:16:\"category.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:9:\"tag.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:10:\"tag.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:8:\"tag.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:11:\"tag.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:11:\"tag.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:15:\"tag.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:10:\"blog.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:11:\"blog.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:9:\"blog.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:12:\"blog.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:12:\"blog.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:16:\"blog.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:10:\"page.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:11:\"page.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:9:\"page.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:12:\"page.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:12:\"page.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:16:\"page.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:17:\"testimonial.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:18:\"testimonial.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:16:\"testimonial.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:19:\"testimonial.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:19:\"testimonial.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:23:\"testimonial.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:9:\"tax.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:10:\"tax.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:8:\"tax.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:11:\"tax.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:11:\"tax.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:15:\"tax.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:14:\"currency.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:15:\"currency.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:13:\"currency.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:16:\"currency.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:16:\"currency.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:20:\"currency.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:14:\"language.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:15:\"language.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:13:\"language.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:16:\"language.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:16:\"language.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:20:\"language.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:66;a:4:{s:1:\"a\";i:67;s:1:\"b\";s:13:\"setting.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:67;a:4:{s:1:\"a\";i:68;s:1:\"b\";s:12:\"setting.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:68;a:4:{s:1:\"a\";i:69;s:1:\"b\";s:17:\"system-tool.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:69;a:4:{s:1:\"a\";i:70;s:1:\"b\";s:18:\"system-tool.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:70;a:4:{s:1:\"a\";i:71;s:1:\"b\";s:16:\"system-tool.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:71;a:4:{s:1:\"a\";i:72;s:1:\"b\";s:19:\"system-tool.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:72;a:4:{s:1:\"a\";i:73;s:1:\"b\";s:19:\"system-tool.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:73;a:4:{s:1:\"a\";i:74;s:1:\"b\";s:23:\"system-tool.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:74;a:4:{s:1:\"a\";i:75;s:1:\"b\";s:12:\"plugin.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:75;a:4:{s:1:\"a\";i:76;s:1:\"b\";s:13:\"plugin.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:76;a:4:{s:1:\"a\";i:77;s:1:\"b\";s:11:\"plugin.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:77;a:4:{s:1:\"a\";i:78;s:1:\"b\";s:14:\"plugin.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:78;a:4:{s:1:\"a\";i:79;s:1:\"b\";s:14:\"plugin.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:79;a:4:{s:1:\"a\";i:80;s:1:\"b\";s:18:\"plugin.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:80;a:4:{s:1:\"a\";i:81;s:1:\"b\";s:18:\"about-system.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:81;a:4:{s:1:\"a\";i:82;s:1:\"b\";s:20:\"payment-method.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:82;a:4:{s:1:\"a\";i:83;s:1:\"b\";s:19:\"payment-method.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:83;a:4:{s:1:\"a\";i:84;s:1:\"b\";s:17:\"sms-gateway.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:84;a:4:{s:1:\"a\";i:85;s:1:\"b\";s:16:\"sms-gateway.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:85;a:4:{s:1:\"a\";i:86;s:1:\"b\";s:18:\"sms_template.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:86;a:4:{s:1:\"a\";i:87;s:1:\"b\";s:19:\"sms_template.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:87;a:4:{s:1:\"a\";i:88;s:1:\"b\";s:17:\"sms_template.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:88;a:4:{s:1:\"a\";i:89;s:1:\"b\";s:20:\"sms_template.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:89;a:4:{s:1:\"a\";i:90;s:1:\"b\";s:24:\"sms_template.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:90;a:4:{s:1:\"a\";i:91;s:1:\"b\";s:20:\"email_template.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:91;a:4:{s:1:\"a\";i:92;s:1:\"b\";s:21:\"email_template.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:92;a:4:{s:1:\"a\";i:93;s:1:\"b\";s:22:\"email_template.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:93;a:4:{s:1:\"a\";i:94;s:1:\"b\";s:19:\"email_template.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:94;a:4:{s:1:\"a\";i:95;s:1:\"b\";s:26:\"email_template.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:95;a:4:{s:1:\"a\";i:96;s:1:\"b\";s:32:\"push_notification_template.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:96;a:4:{s:1:\"a\";i:97;s:1:\"b\";s:33:\"push_notification_template.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:97;a:4:{s:1:\"a\";i:98;s:1:\"b\";s:34:\"push_notification_template.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:98;a:4:{s:1:\"a\";i:99;s:1:\"b\";s:31:\"push_notification_template.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:99;a:4:{s:1:\"a\";i:100;s:1:\"b\";s:38:\"push_notification_template.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:100;a:4:{s:1:\"a\";i:101;s:1:\"b\";s:18:\"landing_page.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:101;a:4:{s:1:\"a\";i:102;s:1:\"b\";s:17:\"landing_page.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:102;a:4:{s:1:\"a\";i:103;s:1:\"b\";s:16:\"appearance.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:103;a:4:{s:1:\"a\";i:104;s:1:\"b\";s:15:\"appearance.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:104;a:4:{s:1:\"a\";i:105;s:1:\"b\";s:17:\"appearance.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:105;a:4:{s:1:\"a\";i:106;s:1:\"b\";s:12:\"backup.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:106;a:4:{s:1:\"a\";i:107;s:1:\"b\";s:13:\"backup.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:107;a:4:{s:1:\"a\";i:108;s:1:\"b\";s:11:\"backup.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:108;a:4:{s:1:\"a\";i:109;s:1:\"b\";s:14:\"backup.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:109;a:4:{s:1:\"a\";i:110;s:1:\"b\";s:14:\"backup.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:110;a:4:{s:1:\"a\";i:111;s:1:\"b\";s:18:\"backup.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:111;a:4:{s:1:\"a\";i:112;s:1:\"b\";s:11:\"rider.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:112;a:3:{s:1:\"a\";i:113;s:1:\"b\";s:12:\"rider.create\";s:1:\"c\";s:3:\"web\";}i:113;a:3:{s:1:\"a\";i:114;s:1:\"b\";s:10:\"rider.edit\";s:1:\"c\";s:3:\"web\";}i:114;a:3:{s:1:\"a\";i:115;s:1:\"b\";s:13:\"rider.destroy\";s:1:\"c\";s:3:\"web\";}i:115;a:3:{s:1:\"a\";i:116;s:1:\"b\";s:13:\"rider.restore\";s:1:\"c\";s:3:\"web\";}i:116;a:3:{s:1:\"a\";i:117;s:1:\"b\";s:17:\"rider.forceDelete\";s:1:\"c\";s:3:\"web\";}i:117;a:4:{s:1:\"a\";i:118;s:1:\"b\";s:12:\"driver.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:4;i:1;i:6;i:2;i:7;}}i:118;a:3:{s:1:\"a\";i:119;s:1:\"b\";s:13:\"driver.create\";s:1:\"c\";s:3:\"web\";}i:119;a:4:{s:1:\"a\";i:120;s:1:\"b\";s:11:\"driver.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:4;i:1;i:6;}}i:120;a:3:{s:1:\"a\";i:121;s:1:\"b\";s:14:\"driver.destroy\";s:1:\"c\";s:3:\"web\";}i:121;a:3:{s:1:\"a\";i:122;s:1:\"b\";s:14:\"driver.restore\";s:1:\"c\";s:3:\"web\";}i:122;a:3:{s:1:\"a\";i:123;s:1:\"b\";s:18:\"driver.forceDelete\";s:1:\"c\";s:3:\"web\";}i:123;a:4:{s:1:\"a\";i:124;s:1:\"b\";s:16:\"dispatcher.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:6;}}i:124;a:3:{s:1:\"a\";i:125;s:1:\"b\";s:17:\"dispatcher.create\";s:1:\"c\";s:3:\"web\";}i:125;a:4:{s:1:\"a\";i:126;s:1:\"b\";s:15:\"dispatcher.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:6;}}i:126;a:3:{s:1:\"a\";i:127;s:1:\"b\";s:18:\"dispatcher.destroy\";s:1:\"c\";s:3:\"web\";}i:127;a:3:{s:1:\"a\";i:128;s:1:\"b\";s:18:\"dispatcher.restore\";s:1:\"c\";s:3:\"web\";}i:128;a:3:{s:1:\"a\";i:129;s:1:\"b\";s:22:\"dispatcher.forceDelete\";s:1:\"c\";s:3:\"web\";}i:129;a:4:{s:1:\"a\";i:130;s:1:\"b\";s:23:\"unverified_driver.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:6;}}i:130;a:3:{s:1:\"a\";i:131;s:1:\"b\";s:24:\"unverified_driver.create\";s:1:\"c\";s:3:\"web\";}i:131;a:3:{s:1:\"a\";i:132;s:1:\"b\";s:22:\"unverified_driver.edit\";s:1:\"c\";s:3:\"web\";}i:132;a:3:{s:1:\"a\";i:133;s:1:\"b\";s:25:\"unverified_driver.destroy\";s:1:\"c\";s:3:\"web\";}i:133;a:3:{s:1:\"a\";i:134;s:1:\"b\";s:25:\"unverified_driver.restore\";s:1:\"c\";s:3:\"web\";}i:134;a:3:{s:1:\"a\";i:135;s:1:\"b\";s:29:\"unverified_driver.forceDelete\";s:1:\"c\";s:3:\"web\";}i:135;a:4:{s:1:\"a\";i:136;s:1:\"b\";s:12:\"banner.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:136;a:3:{s:1:\"a\";i:137;s:1:\"b\";s:13:\"banner.create\";s:1:\"c\";s:3:\"web\";}i:137;a:3:{s:1:\"a\";i:138;s:1:\"b\";s:11:\"banner.edit\";s:1:\"c\";s:3:\"web\";}i:138;a:3:{s:1:\"a\";i:139;s:1:\"b\";s:14:\"banner.destroy\";s:1:\"c\";s:3:\"web\";}i:139;a:3:{s:1:\"a\";i:140;s:1:\"b\";s:14:\"banner.restore\";s:1:\"c\";s:3:\"web\";}i:140;a:3:{s:1:\"a\";i:141;s:1:\"b\";s:18:\"banner.forceDelete\";s:1:\"c\";s:3:\"web\";}i:141;a:4:{s:1:\"a\";i:142;s:1:\"b\";s:14:\"document.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:4;}}i:142;a:3:{s:1:\"a\";i:143;s:1:\"b\";s:15:\"document.create\";s:1:\"c\";s:3:\"web\";}i:143;a:3:{s:1:\"a\";i:144;s:1:\"b\";s:13:\"document.edit\";s:1:\"c\";s:3:\"web\";}i:144;a:3:{s:1:\"a\";i:145;s:1:\"b\";s:16:\"document.destroy\";s:1:\"c\";s:3:\"web\";}i:145;a:3:{s:1:\"a\";i:146;s:1:\"b\";s:16:\"document.restore\";s:1:\"c\";s:3:\"web\";}i:146;a:3:{s:1:\"a\";i:147;s:1:\"b\";s:20:\"document.forceDelete\";s:1:\"c\";s:3:\"web\";}i:147;a:4:{s:1:\"a\";i:148;s:1:\"b\";s:18:\"vehicle_type.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:3;i:1;i:4;i:2;i:6;i:3;i:7;}}i:148;a:3:{s:1:\"a\";i:149;s:1:\"b\";s:19:\"vehicle_type.create\";s:1:\"c\";s:3:\"web\";}i:149;a:3:{s:1:\"a\";i:150;s:1:\"b\";s:17:\"vehicle_type.edit\";s:1:\"c\";s:3:\"web\";}i:150;a:3:{s:1:\"a\";i:151;s:1:\"b\";s:20:\"vehicle_type.destroy\";s:1:\"c\";s:3:\"web\";}i:151;a:3:{s:1:\"a\";i:152;s:1:\"b\";s:20:\"vehicle_type.restore\";s:1:\"c\";s:3:\"web\";}i:152;a:3:{s:1:\"a\";i:153;s:1:\"b\";s:24:\"vehicle_type.forceDelete\";s:1:\"c\";s:3:\"web\";}i:153;a:4:{s:1:\"a\";i:154;s:1:\"b\";s:12:\"coupon.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:154;a:3:{s:1:\"a\";i:155;s:1:\"b\";s:13:\"coupon.create\";s:1:\"c\";s:3:\"web\";}i:155;a:3:{s:1:\"a\";i:156;s:1:\"b\";s:11:\"coupon.edit\";s:1:\"c\";s:3:\"web\";}i:156;a:3:{s:1:\"a\";i:157;s:1:\"b\";s:14:\"coupon.destroy\";s:1:\"c\";s:3:\"web\";}i:157;a:3:{s:1:\"a\";i:158;s:1:\"b\";s:14:\"coupon.restore\";s:1:\"c\";s:3:\"web\";}i:158;a:3:{s:1:\"a\";i:159;s:1:\"b\";s:18:\"coupon.forceDelete\";s:1:\"c\";s:3:\"web\";}i:159;a:4:{s:1:\"a\";i:160;s:1:\"b\";s:10:\"zone.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:6;i:1;i:7;}}i:160;a:3:{s:1:\"a\";i:161;s:1:\"b\";s:11:\"zone.create\";s:1:\"c\";s:3:\"web\";}i:161;a:3:{s:1:\"a\";i:162;s:1:\"b\";s:9:\"zone.edit\";s:1:\"c\";s:3:\"web\";}i:162;a:3:{s:1:\"a\";i:163;s:1:\"b\";s:12:\"zone.destroy\";s:1:\"c\";s:3:\"web\";}i:163;a:3:{s:1:\"a\";i:164;s:1:\"b\";s:12:\"zone.restore\";s:1:\"c\";s:3:\"web\";}i:164;a:3:{s:1:\"a\";i:165;s:1:\"b\";s:16:\"zone.forceDelete\";s:1:\"c\";s:3:\"web\";}i:165;a:3:{s:1:\"a\";i:166;s:1:\"b\";s:9:\"faq.index\";s:1:\"c\";s:3:\"web\";}i:166;a:3:{s:1:\"a\";i:167;s:1:\"b\";s:10:\"faq.create\";s:1:\"c\";s:3:\"web\";}i:167;a:3:{s:1:\"a\";i:168;s:1:\"b\";s:8:\"faq.edit\";s:1:\"c\";s:3:\"web\";}i:168;a:3:{s:1:\"a\";i:169;s:1:\"b\";s:11:\"faq.destroy\";s:1:\"c\";s:3:\"web\";}i:169;a:3:{s:1:\"a\";i:170;s:1:\"b\";s:11:\"faq.restore\";s:1:\"c\";s:3:\"web\";}i:170;a:3:{s:1:\"a\";i:171;s:1:\"b\";s:15:\"faq.forceDelete\";s:1:\"c\";s:3:\"web\";}i:171;a:4:{s:1:\"a\";i:172;s:1:\"b\";s:14:\"heat_map.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:4;i:1;i:6;i:2;i:7;}}i:172;a:3:{s:1:\"a\";i:173;s:1:\"b\";s:15:\"heat_map.create\";s:1:\"c\";s:3:\"web\";}i:173;a:3:{s:1:\"a\";i:174;s:1:\"b\";s:13:\"heat_map.edit\";s:1:\"c\";s:3:\"web\";}i:174;a:3:{s:1:\"a\";i:175;s:1:\"b\";s:16:\"heat_map.destroy\";s:1:\"c\";s:3:\"web\";}i:175;a:3:{s:1:\"a\";i:176;s:1:\"b\";s:16:\"heat_map.restore\";s:1:\"c\";s:3:\"web\";}i:176;a:3:{s:1:\"a\";i:177;s:1:\"b\";s:20:\"heat_map.forceDelete\";s:1:\"c\";s:3:\"web\";}i:177;a:4:{s:1:\"a\";i:178;s:1:\"b\";s:9:\"sos.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:4;}}i:178;a:3:{s:1:\"a\";i:179;s:1:\"b\";s:10:\"sos.create\";s:1:\"c\";s:3:\"web\";}i:179;a:3:{s:1:\"a\";i:180;s:1:\"b\";s:8:\"sos.edit\";s:1:\"c\";s:3:\"web\";}i:180;a:3:{s:1:\"a\";i:181;s:1:\"b\";s:11:\"sos.destroy\";s:1:\"c\";s:3:\"web\";}i:181;a:3:{s:1:\"a\";i:182;s:1:\"b\";s:11:\"sos.restore\";s:1:\"c\";s:3:\"web\";}i:182;a:3:{s:1:\"a\";i:183;s:1:\"b\";s:15:\"sos.forceDelete\";s:1:\"c\";s:3:\"web\";}i:183;a:4:{s:1:\"a\";i:184;s:1:\"b\";s:21:\"driver_document.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:4;i:1;i:7;}}i:184;a:4:{s:1:\"a\";i:185;s:1:\"b\";s:22:\"driver_document.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:4;}}i:185;a:3:{s:1:\"a\";i:186;s:1:\"b\";s:20:\"driver_document.edit\";s:1:\"c\";s:3:\"web\";}i:186;a:3:{s:1:\"a\";i:187;s:1:\"b\";s:23:\"driver_document.destroy\";s:1:\"c\";s:3:\"web\";}i:187;a:3:{s:1:\"a\";i:188;s:1:\"b\";s:23:\"driver_document.restore\";s:1:\"c\";s:3:\"web\";}i:188;a:3:{s:1:\"a\";i:189;s:1:\"b\";s:27:\"driver_document.forceDelete\";s:1:\"c\";s:3:\"web\";}i:189;a:4:{s:1:\"a\";i:190;s:1:\"b\";s:17:\"driver_rule.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:4;i:1;i:7;}}i:190;a:3:{s:1:\"a\";i:191;s:1:\"b\";s:18:\"driver_rule.create\";s:1:\"c\";s:3:\"web\";}i:191;a:3:{s:1:\"a\";i:192;s:1:\"b\";s:16:\"driver_rule.edit\";s:1:\"c\";s:3:\"web\";}i:192;a:3:{s:1:\"a\";i:193;s:1:\"b\";s:19:\"driver_rule.destroy\";s:1:\"c\";s:3:\"web\";}i:193;a:3:{s:1:\"a\";i:194;s:1:\"b\";s:19:\"driver_rule.restore\";s:1:\"c\";s:3:\"web\";}i:194;a:3:{s:1:\"a\";i:195;s:1:\"b\";s:23:\"driver_rule.forceDelete\";s:1:\"c\";s:3:\"web\";}i:195;a:4:{s:1:\"a\";i:196;s:1:\"b\";s:18:\"extra_charge.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:4;i:1;i:7;}}i:196;a:3:{s:1:\"a\";i:197;s:1:\"b\";s:19:\"extra_charge.create\";s:1:\"c\";s:3:\"web\";}i:197;a:3:{s:1:\"a\";i:198;s:1:\"b\";s:17:\"extra_charge.edit\";s:1:\"c\";s:3:\"web\";}i:198;a:3:{s:1:\"a\";i:199;s:1:\"b\";s:20:\"extra_charge.destroy\";s:1:\"c\";s:3:\"web\";}i:199;a:3:{s:1:\"a\";i:200;s:1:\"b\";s:20:\"extra_charge.restore\";s:1:\"c\";s:3:\"web\";}i:200;a:3:{s:1:\"a\";i:201;s:1:\"b\";s:24:\"extra_charge.forceDelete\";s:1:\"c\";s:3:\"web\";}i:201;a:4:{s:1:\"a\";i:202;s:1:\"b\";s:28:\"cab_commission_history.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:4;i:1;i:7;}}i:202;a:3:{s:1:\"a\";i:203;s:1:\"b\";s:12:\"notice.index\";s:1:\"c\";s:3:\"web\";}i:203;a:3:{s:1:\"a\";i:204;s:1:\"b\";s:13:\"notice.create\";s:1:\"c\";s:3:\"web\";}i:204;a:3:{s:1:\"a\";i:205;s:1:\"b\";s:11:\"notice.edit\";s:1:\"c\";s:3:\"web\";}i:205;a:3:{s:1:\"a\";i:206;s:1:\"b\";s:14:\"notice.destroy\";s:1:\"c\";s:3:\"web\";}i:206;a:3:{s:1:\"a\";i:207;s:1:\"b\";s:14:\"notice.restore\";s:1:\"c\";s:3:\"web\";}i:207;a:3:{s:1:\"a\";i:208;s:1:\"b\";s:18:\"notice.forceDelete\";s:1:\"c\";s:3:\"web\";}i:208;a:4:{s:1:\"a\";i:209;s:1:\"b\";s:19:\"driver_wallet.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:4;}}i:209;a:3:{s:1:\"a\";i:210;s:1:\"b\";s:20:\"driver_wallet.credit\";s:1:\"c\";s:3:\"web\";}i:210;a:3:{s:1:\"a\";i:211;s:1:\"b\";s:19:\"driver_wallet.debit\";s:1:\"c\";s:3:\"web\";}i:211;a:4:{s:1:\"a\";i:212;s:1:\"b\";s:13:\"service.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:3;i:1;i:4;i:2;i:6;i:3;i:7;}}i:212;a:3:{s:1:\"a\";i:213;s:1:\"b\";s:12:\"service.edit\";s:1:\"c\";s:3:\"web\";}i:213;a:3:{s:1:\"a\";i:214;s:1:\"b\";s:16:\"onboarding.index\";s:1:\"c\";s:3:\"web\";}i:214;a:3:{s:1:\"a\";i:215;s:1:\"b\";s:15:\"onboarding.edit\";s:1:\"c\";s:3:\"web\";}i:215;a:4:{s:1:\"a\";i:216;s:1:\"b\";s:22:\"service_category.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:3;i:1;i:4;i:2;i:6;i:3;i:7;}}i:216;a:3:{s:1:\"a\";i:217;s:1:\"b\";s:21:\"service_category.edit\";s:1:\"c\";s:3:\"web\";}i:217;a:3:{s:1:\"a\";i:218;s:1:\"b\";s:20:\"taxido_setting.index\";s:1:\"c\";s:3:\"web\";}i:218;a:3:{s:1:\"a\";i:219;s:1:\"b\";s:19:\"taxido_setting.edit\";s:1:\"c\";s:3:\"web\";}i:219;a:4:{s:1:\"a\";i:220;s:1:\"b\";s:18:\"ride_request.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:3;i:1;i:4;i:2;i:6;i:3;i:7;}}i:220;a:4:{s:1:\"a\";i:221;s:1:\"b\";s:19:\"ride_request.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:221;a:4:{s:1:\"a\";i:222;s:1:\"b\";s:17:\"ride_request.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:3;i:1;i:4;i:2;i:6;}}i:222;a:4:{s:1:\"a\";i:223;s:1:\"b\";s:20:\"ride_request.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:6;}}i:223;a:4:{s:1:\"a\";i:224;s:1:\"b\";s:20:\"ride_request.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:6;}}i:224;a:3:{s:1:\"a\";i:225;s:1:\"b\";s:24:\"ride_request.forceDelete\";s:1:\"c\";s:3:\"web\";}i:225;a:4:{s:1:\"a\";i:226;s:1:\"b\";s:10:\"ride.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:3;i:1;i:4;i:2;i:6;i:3;i:7;}}i:226;a:4:{s:1:\"a\";i:227;s:1:\"b\";s:11:\"ride.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:227;a:4:{s:1:\"a\";i:228;s:1:\"b\";s:9:\"ride.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:3;i:1;i:4;i:2;i:6;}}i:228;a:4:{s:1:\"a\";i:229;s:1:\"b\";s:10:\"plan.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:4;}}i:229;a:3:{s:1:\"a\";i:230;s:1:\"b\";s:11:\"plan.create\";s:1:\"c\";s:3:\"web\";}i:230;a:3:{s:1:\"a\";i:231;s:1:\"b\";s:9:\"plan.edit\";s:1:\"c\";s:3:\"web\";}i:231;a:3:{s:1:\"a\";i:232;s:1:\"b\";s:12:\"plan.destroy\";s:1:\"c\";s:3:\"web\";}i:232;a:3:{s:1:\"a\";i:233;s:1:\"b\";s:12:\"plan.restore\";s:1:\"c\";s:3:\"web\";}i:233;a:3:{s:1:\"a\";i:234;s:1:\"b\";s:16:\"plan.forceDelete\";s:1:\"c\";s:3:\"web\";}i:234;a:4:{s:1:\"a\";i:235;s:1:\"b\";s:13:\"airport.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:4;}}i:235;a:3:{s:1:\"a\";i:236;s:1:\"b\";s:14:\"airport.create\";s:1:\"c\";s:3:\"web\";}i:236;a:3:{s:1:\"a\";i:237;s:1:\"b\";s:12:\"airport.edit\";s:1:\"c\";s:3:\"web\";}i:237;a:3:{s:1:\"a\";i:238;s:1:\"b\";s:15:\"airport.destroy\";s:1:\"c\";s:3:\"web\";}i:238;a:3:{s:1:\"a\";i:239;s:1:\"b\";s:15:\"airport.restore\";s:1:\"c\";s:3:\"web\";}i:239;a:3:{s:1:\"a\";i:240;s:1:\"b\";s:19:\"airport.forceDelete\";s:1:\"c\";s:3:\"web\";}i:240;a:4:{s:1:\"a\";i:241;s:1:\"b\";s:17:\"surge_price.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:4;}}i:241;a:3:{s:1:\"a\";i:242;s:1:\"b\";s:18:\"surge_price.create\";s:1:\"c\";s:3:\"web\";}i:242;a:3:{s:1:\"a\";i:243;s:1:\"b\";s:16:\"surge_price.edit\";s:1:\"c\";s:3:\"web\";}i:243;a:3:{s:1:\"a\";i:244;s:1:\"b\";s:19:\"surge_price.destroy\";s:1:\"c\";s:3:\"web\";}i:244;a:3:{s:1:\"a\";i:245;s:1:\"b\";s:19:\"surge_price.restore\";s:1:\"c\";s:3:\"web\";}i:245;a:3:{s:1:\"a\";i:246;s:1:\"b\";s:23:\"surge_price.forceDelete\";s:1:\"c\";s:3:\"web\";}i:246;a:4:{s:1:\"a\";i:247;s:1:\"b\";s:18:\"subscription.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:4;}}i:247;a:3:{s:1:\"a\";i:248;s:1:\"b\";s:19:\"subscription.create\";s:1:\"c\";s:3:\"web\";}i:248;a:3:{s:1:\"a\";i:249;s:1:\"b\";s:17:\"subscription.edit\";s:1:\"c\";s:3:\"web\";}i:249;a:3:{s:1:\"a\";i:250;s:1:\"b\";s:20:\"subscription.destroy\";s:1:\"c\";s:3:\"web\";}i:250;a:4:{s:1:\"a\";i:251;s:1:\"b\";s:21:\"subscription.purchase\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:4;}}i:251;a:4:{s:1:\"a\";i:252;s:1:\"b\";s:19:\"subscription.cancel\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:4;}}i:252;a:4:{s:1:\"a\";i:253;s:1:\"b\";s:9:\"bid.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:4;}}i:253;a:4:{s:1:\"a\";i:254;s:1:\"b\";s:10:\"bid.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:4;}}i:254;a:4:{s:1:\"a\";i:255;s:1:\"b\";s:8:\"bid.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:255;a:3:{s:1:\"a\";i:256;s:1:\"b\";s:23:\"push_notification.index\";s:1:\"c\";s:3:\"web\";}i:256;a:3:{s:1:\"a\";i:257;s:1:\"b\";s:24:\"push_notification.create\";s:1:\"c\";s:3:\"web\";}i:257;a:3:{s:1:\"a\";i:258;s:1:\"b\";s:25:\"push_notification.destroy\";s:1:\"c\";s:3:\"web\";}i:258;a:3:{s:1:\"a\";i:259;s:1:\"b\";s:29:\"push_notification.forceDelete\";s:1:\"c\";s:3:\"web\";}i:259;a:4:{s:1:\"a\";i:260;s:1:\"b\";s:18:\"rider_wallet.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:260;a:3:{s:1:\"a\";i:261;s:1:\"b\";s:19:\"rider_wallet.credit\";s:1:\"c\";s:3:\"web\";}i:261;a:3:{s:1:\"a\";i:262;s:1:\"b\";s:18:\"rider_wallet.debit\";s:1:\"c\";s:3:\"web\";}i:262;a:4:{s:1:\"a\";i:263;s:1:\"b\";s:22:\"withdraw_request.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:4;i:1;i:7;}}i:263;a:4:{s:1:\"a\";i:264;s:1:\"b\";s:23:\"withdraw_request.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:4;i:1;i:7;}}i:264;a:3:{s:1:\"a\";i:265;s:1:\"b\";s:21:\"withdraw_request.edit\";s:1:\"c\";s:3:\"web\";}i:265;a:4:{s:1:\"a\";i:266;s:1:\"b\";s:28:\"fleet_withdraw_request.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:266;a:4:{s:1:\"a\";i:267;s:1:\"b\";s:29:\"fleet_withdraw_request.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:267;a:3:{s:1:\"a\";i:268;s:1:\"b\";s:27:\"fleet_withdraw_request.edit\";s:1:\"c\";s:3:\"web\";}i:268;a:3:{s:1:\"a\";i:269;s:1:\"b\";s:12:\"report.index\";s:1:\"c\";s:3:\"web\";}i:269;a:3:{s:1:\"a\";i:270;s:1:\"b\";s:13:\"report.create\";s:1:\"c\";s:3:\"web\";}i:270;a:4:{s:1:\"a\";i:271;s:1:\"b\";s:21:\"driver_location.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:6;i:1;i:7;}}i:271;a:3:{s:1:\"a\";i:272;s:1:\"b\";s:22:\"driver_location.create\";s:1:\"c\";s:3:\"web\";}i:272;a:4:{s:1:\"a\";i:273;s:1:\"b\";s:25:\"cancellation_reason.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:6;}}i:273;a:3:{s:1:\"a\";i:274;s:1:\"b\";s:26:\"cancellation_reason.create\";s:1:\"c\";s:3:\"web\";}i:274;a:3:{s:1:\"a\";i:275;s:1:\"b\";s:24:\"cancellation_reason.edit\";s:1:\"c\";s:3:\"web\";}i:275;a:3:{s:1:\"a\";i:276;s:1:\"b\";s:27:\"cancellation_reason.destroy\";s:1:\"c\";s:3:\"web\";}i:276;a:3:{s:1:\"a\";i:277;s:1:\"b\";s:27:\"cancellation_reason.restore\";s:1:\"c\";s:3:\"web\";}i:277;a:3:{s:1:\"a\";i:278;s:1:\"b\";s:31:\"cancellation_reason.forceDelete\";s:1:\"c\";s:3:\"web\";}i:278;a:4:{s:1:\"a\";i:279;s:1:\"b\";s:19:\"driver_review.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:4;}}i:279;a:4:{s:1:\"a\";i:280;s:1:\"b\";s:20:\"driver_review.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:280;a:3:{s:1:\"a\";i:281;s:1:\"b\";s:21:\"driver_review.destroy\";s:1:\"c\";s:3:\"web\";}i:281;a:3:{s:1:\"a\";i:282;s:1:\"b\";s:21:\"driver_review.restore\";s:1:\"c\";s:3:\"web\";}i:282;a:3:{s:1:\"a\";i:283;s:1:\"b\";s:25:\"driver_review.forceDelete\";s:1:\"c\";s:3:\"web\";}i:283;a:4:{s:1:\"a\";i:284;s:1:\"b\";s:18:\"rider_review.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:4;}}i:284;a:4:{s:1:\"a\";i:285;s:1:\"b\";s:19:\"rider_review.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:4;}}i:285;a:3:{s:1:\"a\";i:286;s:1:\"b\";s:20:\"rider_review.destroy\";s:1:\"c\";s:3:\"web\";}i:286;a:3:{s:1:\"a\";i:287;s:1:\"b\";s:20:\"rider_review.restore\";s:1:\"c\";s:3:\"web\";}i:287;a:3:{s:1:\"a\";i:288;s:1:\"b\";s:24:\"rider_review.forceDelete\";s:1:\"c\";s:3:\"web\";}i:288;a:4:{s:1:\"a\";i:289;s:1:\"b\";s:20:\"hourly_package.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:4;}}i:289;a:3:{s:1:\"a\";i:290;s:1:\"b\";s:21:\"hourly_package.create\";s:1:\"c\";s:3:\"web\";}i:290;a:3:{s:1:\"a\";i:291;s:1:\"b\";s:19:\"hourly_package.edit\";s:1:\"c\";s:3:\"web\";}i:291;a:3:{s:1:\"a\";i:292;s:1:\"b\";s:22:\"hourly_package.destroy\";s:1:\"c\";s:3:\"web\";}i:292;a:3:{s:1:\"a\";i:293;s:1:\"b\";s:22:\"hourly_package.restore\";s:1:\"c\";s:3:\"web\";}i:293;a:3:{s:1:\"a\";i:294;s:1:\"b\";s:26:\"hourly_package.forceDelete\";s:1:\"c\";s:3:\"web\";}i:294;a:4:{s:1:\"a\";i:295;s:1:\"b\";s:15:\"sos_alert.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:4;}}i:295;a:3:{s:1:\"a\";i:296;s:1:\"b\";s:16:\"sos_alert.create\";s:1:\"c\";s:3:\"web\";}i:296;a:3:{s:1:\"a\";i:297;s:1:\"b\";s:14:\"sos_alert.edit\";s:1:\"c\";s:3:\"web\";}i:297;a:3:{s:1:\"a\";i:298;s:1:\"b\";s:17:\"sos_alert.destroy\";s:1:\"c\";s:3:\"web\";}i:298;a:3:{s:1:\"a\";i:299;s:1:\"b\";s:17:\"sos_alert.restore\";s:1:\"c\";s:3:\"web\";}i:299;a:3:{s:1:\"a\";i:300;s:1:\"b\";s:21:\"sos_alert.forceDelete\";s:1:\"c\";s:3:\"web\";}i:300;a:4:{s:1:\"a\";i:301;s:1:\"b\";s:20:\"rental_vehicle.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:4;}}i:301;a:4:{s:1:\"a\";i:302;s:1:\"b\";s:21:\"rental_vehicle.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:4;}}i:302;a:4:{s:1:\"a\";i:303;s:1:\"b\";s:19:\"rental_vehicle.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:4;}}i:303;a:4:{s:1:\"a\";i:304;s:1:\"b\";s:22:\"rental_vehicle.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:4;}}i:304;a:4:{s:1:\"a\";i:305;s:1:\"b\";s:22:\"rental_vehicle.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:4;}}i:305;a:3:{s:1:\"a\";i:306;s:1:\"b\";s:26:\"rental_vehicle.forceDelete\";s:1:\"c\";s:3:\"web\";}i:306;a:4:{s:1:\"a\";i:307;s:1:\"b\";s:19:\"fleet_manager.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:4;i:1;i:7;}}i:307;a:4:{s:1:\"a\";i:308;s:1:\"b\";s:20:\"fleet_manager.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:308;a:4:{s:1:\"a\";i:309;s:1:\"b\";s:18:\"fleet_manager.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:309;a:4:{s:1:\"a\";i:310;s:1:\"b\";s:21:\"fleet_manager.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:310;a:4:{s:1:\"a\";i:311;s:1:\"b\";s:21:\"fleet_manager.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:311;a:3:{s:1:\"a\";i:312;s:1:\"b\";s:25:\"fleet_manager.forceDelete\";s:1:\"c\";s:3:\"web\";}i:312;a:4:{s:1:\"a\";i:313;s:1:\"b\";s:18:\"fleet_wallet.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:7;}}i:313;a:3:{s:1:\"a\";i:314;s:1:\"b\";s:19:\"fleet_wallet.credit\";s:1:\"c\";s:3:\"web\";}i:314;a:3:{s:1:\"a\";i:315;s:1:\"b\";s:18:\"fleet_wallet.debit\";s:1:\"c\";s:3:\"web\";}i:315;a:4:{s:1:\"a\";i:316;s:1:\"b\";s:10:\"chat.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:4;}}i:316;a:4:{s:1:\"a\";i:317;s:1:\"b\";s:9:\"chat.send\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:4;}}i:317;a:4:{s:1:\"a\";i:318;s:1:\"b\";s:11:\"chat.replay\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:4;}}i:318;a:4:{s:1:\"a\";i:319;s:1:\"b\";s:11:\"chat.delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:4;}}i:319;a:4:{s:1:\"a\";i:320;s:1:\"b\";s:15:\"ambulance.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:3;i:1;i:4;i:2;i:6;i:3;i:7;}}i:320;a:4:{s:1:\"a\";i:321;s:1:\"b\";s:19:\"ticket.ticket.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:321;a:4:{s:1:\"a\";i:322;s:1:\"b\";s:20:\"ticket.ticket.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:322;a:4:{s:1:\"a\";i:323;s:1:\"b\";s:19:\"ticket.ticket.reply\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:5;}}i:323;a:4:{s:1:\"a\";i:324;s:1:\"b\";s:21:\"ticket.ticket.destroy\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:324;a:4:{s:1:\"a\";i:325;s:1:\"b\";s:21:\"ticket.ticket.restore\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:325;a:4:{s:1:\"a\";i:326;s:1:\"b\";s:25:\"ticket.ticket.forceDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:326;a:3:{s:1:\"a\";i:327;s:1:\"b\";s:21:\"ticket.priority.index\";s:1:\"c\";s:3:\"web\";}i:327;a:3:{s:1:\"a\";i:328;s:1:\"b\";s:22:\"ticket.priority.create\";s:1:\"c\";s:3:\"web\";}i:328;a:3:{s:1:\"a\";i:329;s:1:\"b\";s:20:\"ticket.priority.edit\";s:1:\"c\";s:3:\"web\";}i:329;a:3:{s:1:\"a\";i:330;s:1:\"b\";s:23:\"ticket.priority.destroy\";s:1:\"c\";s:3:\"web\";}i:330;a:3:{s:1:\"a\";i:331;s:1:\"b\";s:23:\"ticket.priority.restore\";s:1:\"c\";s:3:\"web\";}i:331;a:3:{s:1:\"a\";i:332;s:1:\"b\";s:27:\"ticket.priority.forceDelete\";s:1:\"c\";s:3:\"web\";}i:332;a:3:{s:1:\"a\";i:333;s:1:\"b\";s:22:\"ticket.executive.index\";s:1:\"c\";s:3:\"web\";}i:333;a:3:{s:1:\"a\";i:334;s:1:\"b\";s:23:\"ticket.executive.create\";s:1:\"c\";s:3:\"web\";}i:334;a:3:{s:1:\"a\";i:335;s:1:\"b\";s:21:\"ticket.executive.edit\";s:1:\"c\";s:3:\"web\";}i:335;a:3:{s:1:\"a\";i:336;s:1:\"b\";s:24:\"ticket.executive.destroy\";s:1:\"c\";s:3:\"web\";}i:336;a:3:{s:1:\"a\";i:337;s:1:\"b\";s:24:\"ticket.executive.restore\";s:1:\"c\";s:3:\"web\";}i:337;a:3:{s:1:\"a\";i:338;s:1:\"b\";s:28:\"ticket.executive.forceDelete\";s:1:\"c\";s:3:\"web\";}i:338;a:3:{s:1:\"a\";i:339;s:1:\"b\";s:23:\"ticket.department.index\";s:1:\"c\";s:3:\"web\";}i:339;a:3:{s:1:\"a\";i:340;s:1:\"b\";s:24:\"ticket.department.create\";s:1:\"c\";s:3:\"web\";}i:340;a:3:{s:1:\"a\";i:341;s:1:\"b\";s:22:\"ticket.department.edit\";s:1:\"c\";s:3:\"web\";}i:341;a:3:{s:1:\"a\";i:342;s:1:\"b\";s:22:\"ticket.department.show\";s:1:\"c\";s:3:\"web\";}i:342;a:3:{s:1:\"a\";i:343;s:1:\"b\";s:25:\"ticket.department.destroy\";s:1:\"c\";s:3:\"web\";}i:343;a:3:{s:1:\"a\";i:344;s:1:\"b\";s:25:\"ticket.department.restore\";s:1:\"c\";s:3:\"web\";}i:344;a:3:{s:1:\"a\";i:345;s:1:\"b\";s:29:\"ticket.department.forceDelete\";s:1:\"c\";s:3:\"web\";}i:345;a:3:{s:1:\"a\";i:346;s:1:\"b\";s:22:\"ticket.formfield.index\";s:1:\"c\";s:3:\"web\";}i:346;a:3:{s:1:\"a\";i:347;s:1:\"b\";s:23:\"ticket.formfield.create\";s:1:\"c\";s:3:\"web\";}i:347;a:3:{s:1:\"a\";i:348;s:1:\"b\";s:21:\"ticket.formfield.edit\";s:1:\"c\";s:3:\"web\";}i:348;a:3:{s:1:\"a\";i:349;s:1:\"b\";s:24:\"ticket.formfield.destroy\";s:1:\"c\";s:3:\"web\";}i:349;a:3:{s:1:\"a\";i:350;s:1:\"b\";s:24:\"ticket.formfield.restore\";s:1:\"c\";s:3:\"web\";}i:350;a:3:{s:1:\"a\";i:351;s:1:\"b\";s:28:\"ticket.formfield.forceDelete\";s:1:\"c\";s:3:\"web\";}i:351;a:3:{s:1:\"a\";i:352;s:1:\"b\";s:19:\"ticket.status.index\";s:1:\"c\";s:3:\"web\";}i:352;a:3:{s:1:\"a\";i:353;s:1:\"b\";s:20:\"ticket.status.create\";s:1:\"c\";s:3:\"web\";}i:353;a:3:{s:1:\"a\";i:354;s:1:\"b\";s:18:\"ticket.status.edit\";s:1:\"c\";s:3:\"web\";}i:354;a:3:{s:1:\"a\";i:355;s:1:\"b\";s:21:\"ticket.status.destroy\";s:1:\"c\";s:3:\"web\";}i:355;a:3:{s:1:\"a\";i:356;s:1:\"b\";s:21:\"ticket.status.restore\";s:1:\"c\";s:3:\"web\";}i:356;a:3:{s:1:\"a\";i:357;s:1:\"b\";s:25:\"ticket.status.forceDelete\";s:1:\"c\";s:3:\"web\";}i:357;a:4:{s:1:\"a\";i:358;s:1:\"b\";s:22:\"ticket.knowledge.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:358;a:3:{s:1:\"a\";i:359;s:1:\"b\";s:23:\"ticket.knowledge.create\";s:1:\"c\";s:3:\"web\";}i:359;a:3:{s:1:\"a\";i:360;s:1:\"b\";s:21:\"ticket.knowledge.edit\";s:1:\"c\";s:3:\"web\";}i:360;a:3:{s:1:\"a\";i:361;s:1:\"b\";s:24:\"ticket.knowledge.destroy\";s:1:\"c\";s:3:\"web\";}i:361;a:3:{s:1:\"a\";i:362;s:1:\"b\";s:24:\"ticket.knowledge.restore\";s:1:\"c\";s:3:\"web\";}i:362;a:3:{s:1:\"a\";i:363;s:1:\"b\";s:28:\"ticket.knowledge.forceDelete\";s:1:\"c\";s:3:\"web\";}i:363;a:4:{s:1:\"a\";i:364;s:1:\"b\";s:21:\"ticket.category.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:364;a:3:{s:1:\"a\";i:365;s:1:\"b\";s:22:\"ticket.category.create\";s:1:\"c\";s:3:\"web\";}i:365;a:3:{s:1:\"a\";i:366;s:1:\"b\";s:20:\"ticket.category.edit\";s:1:\"c\";s:3:\"web\";}i:366;a:3:{s:1:\"a\";i:367;s:1:\"b\";s:23:\"ticket.category.destroy\";s:1:\"c\";s:3:\"web\";}i:367;a:4:{s:1:\"a\";i:368;s:1:\"b\";s:16:\"ticket.tag.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:368;a:3:{s:1:\"a\";i:369;s:1:\"b\";s:17:\"ticket.tag.create\";s:1:\"c\";s:3:\"web\";}i:369;a:3:{s:1:\"a\";i:370;s:1:\"b\";s:15:\"ticket.tag.edit\";s:1:\"c\";s:3:\"web\";}i:370;a:3:{s:1:\"a\";i:371;s:1:\"b\";s:18:\"ticket.tag.destroy\";s:1:\"c\";s:3:\"web\";}i:371;a:3:{s:1:\"a\";i:372;s:1:\"b\";s:18:\"ticket.tag.restore\";s:1:\"c\";s:3:\"web\";}i:372;a:3:{s:1:\"a\";i:373;s:1:\"b\";s:22:\"ticket.tag.forceDelete\";s:1:\"c\";s:3:\"web\";}i:373;a:3:{s:1:\"a\";i:374;s:1:\"b\";s:20:\"ticket.setting.index\";s:1:\"c\";s:3:\"web\";}i:374;a:3:{s:1:\"a\";i:375;s:1:\"b\";s:21:\"ticket.setting.create\";s:1:\"c\";s:3:\"web\";}i:375;a:3:{s:1:\"a\";i:376;s:1:\"b\";s:19:\"ticket.setting.edit\";s:1:\"c\";s:3:\"web\";}i:376;a:3:{s:1:\"a\";i:377;s:1:\"b\";s:22:\"ticket.setting.destroy\";s:1:\"c\";s:3:\"web\";}i:377;a:3:{s:1:\"a\";i:378;s:1:\"b\";s:22:\"ticket.setting.restore\";s:1:\"c\";s:3:\"web\";}i:378;a:3:{s:1:\"a\";i:379;s:1:\"b\";s:26:\"ticket.setting.forceDelete\";s:1:\"c\";s:3:\"web\";}}s:5:\"roles\";a:7:{i:0;a:6:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";s:1:\"j\";i:1;s:1:\"k\";N;s:1:\"l\";i:1;}i:1;a:6:{s:1:\"a\";i:2;s:1:\"b\";s:4:\"user\";s:1:\"c\";s:3:\"web\";s:1:\"j\";i:1;s:1:\"k\";N;s:1:\"l\";i:1;}i:2;a:6:{s:1:\"a\";i:3;s:1:\"b\";s:5:\"rider\";s:1:\"c\";s:3:\"web\";s:1:\"j\";i:1;s:1:\"k\";i:18;s:1:\"l\";i:1;}i:3;a:6:{s:1:\"a\";i:4;s:1:\"b\";s:6:\"driver\";s:1:\"c\";s:3:\"web\";s:1:\"j\";i:1;s:1:\"k\";i:18;s:1:\"l\";i:1;}i:4;a:6:{s:1:\"a\";i:6;s:1:\"b\";s:10:\"dispatcher\";s:1:\"c\";s:3:\"web\";s:1:\"j\";i:1;s:1:\"k\";i:18;s:1:\"l\";i:1;}i:5;a:6:{s:1:\"a\";i:7;s:1:\"b\";s:13:\"fleet_manager\";s:1:\"c\";s:3:\"web\";s:1:\"j\";i:1;s:1:\"k\";i:18;s:1:\"l\";i:1;}i:6;a:6:{s:1:\"a\";i:5;s:1:\"b\";s:9:\"executive\";s:1:\"c\";s:3:\"web\";s:1:\"j\";i:1;s:1:\"k\";i:19;s:1:\"l\";i:1;}}}', 1753287899);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cancellation_reasons`
--

CREATE TABLE `cancellation_reasons` (
  `id` bigint UNSIGNED NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `for` enum('rider','driver') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'rider',
  `ride_start` enum('before','after') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'before',
  `status` int NOT NULL DEFAULT '1',
  `icon_image_id` bigint UNSIGNED DEFAULT NULL,
  `created_by_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cancellation_reasons`
--

INSERT INTO `cancellation_reasons` (`id`, `title`, `slug`, `for`, `ride_start`, `status`, `icon_image_id`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"Wrong Pickup Location\",\"fr\":\"Mauvais lieu de prise en charge\",\"de\":\"Falscher Abholort\",\"ar\":\"الموقع غير الصحيح للاستلام\"}', 'wrong-pickup-location', 'rider', 'before', 1, 813, 1, '2025-01-23 05:37:15', '2025-07-16 22:13:26', NULL),
(3, '{\"en\":\"Change of Plans\",\"fr\":\"Changement de plans\",\"ar\":\"تغيير الخطط\",\"de\":\"Planänderung\"}', 'change-of-plans', 'rider', 'before', 1, 811, 1, '2025-01-23 05:37:37', '2025-07-16 22:13:42', NULL),
(4, '{\"en\":\"Found Another Ride\",\"fr\":\"Trouvé un autre trajet\",\"de\":\"Eine andere Fahrt gefunden\",\"ar\":\"تم العثور على رحلة أخرى\"}', 'found-another-ride', 'rider', 'before', 1, 807, 1, '2025-01-23 05:37:46', '2025-07-16 22:13:50', NULL),
(5, '{\"en\":\"Driver Too Late\",\"fr\":\"Conducteur trop tard\",\"de\":\"Fahrer zu spät\",\"ar\":\"السائق متأخر جدًا\"}', 'driver-too-late', 'rider', 'before', 1, 809, 1, '2025-01-23 05:38:09', '2025-07-16 22:18:44', NULL),
(7, '{\"en\":\"Increased Wait Time\",\"fr\":\"Temps d\'attente prolongé\",\"de\":\"Verlängerte Wartezeit\",\"ar\":\"زيادة وقت الانتظار\"}', 'increased-wait-time', 'rider', 'before', 1, 815, 1, '2025-01-23 05:41:02', '2025-07-16 22:14:11', NULL),
(8, '{\"en\":\"Not Comfortable with Driver\",\"ar\":\"غير مرتاح مع السائق\",\"de\":\"Nicht wohl mit dem Fahrer\",\"fr\":\"Inconfortable avec le conducteur\"}', 'not-comfortable-with-driver', 'rider', 'before', 1, 805, 1, '2025-01-23 05:41:15', '2025-07-16 22:14:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category_image_id` bigint UNSIGNED DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `commission_rate` decimal(8,2) DEFAULT '0.00',
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category_meta_image_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `category_image_id`, `status`, `type`, `commission_rate`, `parent_id`, `sort_order`, `created_by_id`, `meta_title`, `meta_description`, `category_meta_image_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"Services\",\"fr\":\"Dienstleistungen\"}', 'dienstleistungen', '{\"en\":null}', NULL, 1, 'post', 0.00, NULL, 0, 1, 'Dienstleistungen', NULL, NULL, '2025-01-23 02:37:10', '2025-01-23 03:31:50', '2025-01-23 03:31:50'),
(2, '{\"en\":\"Transportation Trends\"}', 'transportation-trends', '{\"en\":null}', NULL, 1, 'post', 0.00, 1, 0, 1, 'Transportation Trends', NULL, NULL, '2025-01-23 02:37:32', '2025-01-23 03:31:50', '2025-01-23 03:31:50'),
(3, '{\"en\":\"Commute Solutions\",\"de\":\"Pendellösungen\"}', 'pendelloesungen', '{\"en\":null}', NULL, 1, 'post', 0.00, 1, 0, 1, 'Commute Solutions', NULL, NULL, '2025-01-23 02:37:49', '2025-01-23 03:31:50', '2025-01-23 03:31:50'),
(4, '{\"en\":\"Safety\",\"de\":\"Sicherheit\"}', 'sicherheit', '{\"en\":null}', NULL, 1, 'post', 0.00, 1, 0, 1, 'Safety', NULL, NULL, '2025-01-23 02:38:07', '2025-01-23 03:31:50', '2025-01-23 03:31:50'),
(5, '{\"en\":\"Ride Options\",\"de\":\"Fahrtoptionen\"}', 'fahrtoptionen', '{\"en\":null}', NULL, 1, 'post', 0.00, 1, 0, 1, 'Ride Options', NULL, NULL, '2025-01-23 02:38:27', '2025-01-23 03:31:50', '2025-01-23 03:31:50'),
(6, '{\"en\":\"Travel Categories\",\"de\":\"Reisekategorien\"}', 'reisekategorien', '{\"en\":null}', NULL, 1, 'post', 0.00, 1, 0, 1, 'Travel Categories', NULL, NULL, '2025-01-23 02:38:42', '2025-01-23 03:31:50', '2025-01-23 03:31:50'),
(7, '{\"en\":\"Sustainability\",\"de\":\"Nachhaltigkeit\"}', 'nachhaltigkeit', '{\"en\":null}', NULL, 1, 'post', 0.00, 1, 0, 1, 'Sustainability', NULL, NULL, '2025-01-23 02:38:57', '2025-01-23 03:31:50', '2025-01-23 03:31:50'),
(8, '{\"en\":\"Eco-Friendly Travel\",\"de\":\"Umweltfreundliches Reisen\"}', 'umweltfreundliches-reisen', '{\"en\":null}', NULL, 1, 'post', 0.00, 1, 0, 1, 'Eco-Friendly Travel', NULL, NULL, '2025-01-23 02:39:15', '2025-01-23 03:31:50', '2025-01-23 03:31:50'),
(9, '{\"en\":\"Travel Savings\",\"de\":\"Reisekosteneinsparungen\"}', 'reisekosteneinsparungen', '{\"en\":null}', NULL, 1, 'post', 0.00, 1, 0, 1, 'Travel Savings', NULL, NULL, '2025-01-23 02:39:30', '2025-01-23 03:31:50', '2025-01-23 03:31:50'),
(10, '{\"en\":\"Time Efficiency\",\"de\":\"Zeiteffizienz\"}', 'zeiteffizienz', '{\"en\":null}', NULL, 1, 'post', 0.00, 1, 0, 1, 'Time Efficiency', NULL, NULL, '2025-01-23 02:39:46', '2025-01-23 03:31:50', '2025-01-23 03:31:50'),
(11, '{\"en\":\"Transportation Options\",\"de\":\"Transportmöglichkeiten\"}', 'transportmoeglichkeiten', '{\"en\":null}', NULL, 1, 'post', 0.00, 1, 0, 1, 'Transportation Options', NULL, NULL, '2025-01-23 02:40:01', '2025-01-23 03:31:50', '2025-01-23 03:31:50'),
(12, '{\"en\":\"Delivery Solutions\",\"de\":\"Lieferservices\"}', 'lieferservices', '{\"en\":null}', NULL, 1, 'post', 0.00, 1, 0, 1, 'Delivery Solutions', NULL, NULL, '2025-01-23 02:40:14', '2025-01-23 03:31:50', '2025-01-23 03:31:50'),
(13, '{\"en\":\"Vehicle Types\",\"de\":\"Fahrzeugtypen\"}', 'vehicle-types-2', '{\"en\":null}', NULL, 1, 'post', 0.00, 1, 0, 1, 'Vehicle Types', NULL, NULL, '2025-01-23 02:40:32', '2025-01-23 03:31:50', '2025-01-23 03:31:50'),
(14, '{\"en\":\"Transportation Solutions\",\"de\":\"Transportlösungen\"}', 'transportloesungen', '{\"en\":null}', NULL, 1, 'post', 0.00, 1, 0, 1, 'Transportation Solutions', NULL, NULL, '2025-01-23 02:40:51', '2025-01-23 03:31:50', '2025-01-23 03:31:50'),
(15, '{\"en\":\"Tips & Tricks\"}', 'tips-tricks', '{\"en\":null}', NULL, 1, 'post', 0.00, NULL, 0, 1, 'Tips & Tricks', NULL, NULL, '2025-01-23 02:41:03', '2025-01-23 03:32:01', '2025-01-23 03:32:01'),
(16, '{\"en\":\"Choosing the Right Ride Service\"}', 'choosing-the-right-ride-service', '{\"en\":null}', NULL, 1, 'post', 0.00, 15, 0, 1, 'Choosing the Right Ride Service', NULL, NULL, '2025-01-23 02:41:18', '2025-01-23 03:31:54', '2025-01-23 03:31:54'),
(17, '{\"en\":\"Ride Comfort\"}', 'ride-comfort', '{\"en\":null}', NULL, 1, 'post', 0.00, 15, 0, 1, 'Ride Comfort', NULL, NULL, '2025-01-23 02:41:34', '2025-01-23 03:31:58', '2025-01-23 03:31:58'),
(18, '{\"en\":\"Saving Money and Time\"}', 'saving-money-and-time', '{\"en\":null}', NULL, 1, 'post', 0.00, 15, 0, 1, 'Saving Money and Time', NULL, NULL, '2025-01-23 02:41:53', '2025-01-23 03:32:01', '2025-01-23 03:32:01'),
(19, '{\"en\":\"Urban Mobility\"}', 'urban-mobility', '{\"en\":null}', NULL, 1, 'post', 0.00, NULL, 0, 1, 'Urban Mobility', NULL, NULL, '2025-01-23 02:42:08', '2025-01-23 03:32:07', '2025-01-23 03:32:07'),
(20, '{\"en\":\"The Future of Urban Mobility\"}', 'the-future-of-urban-mobility', '{\"en\":null}', NULL, 1, 'post', 0.00, 19, 0, 1, 'The Future of Urban Mobility', NULL, NULL, '2025-01-23 02:42:31', '2025-01-23 03:32:07', '2025-01-23 03:32:07'),
(21, '{\"en\":\"Changing Travel Landscape\"}', 'changing-travel-landscape', '{\"en\":null}', NULL, 1, 'post', 0.00, 19, 0, 1, 'Changing Travel Landscape', NULL, NULL, '2025-01-23 02:42:54', '2025-01-23 03:32:07', '2025-01-23 03:32:07'),
(22, '{\"en\":\"Ride Features\"}', 'ride-features', '{\"en\":null}', NULL, 1, 'post', 0.00, NULL, 0, 1, 'Ride Features', NULL, NULL, '2025-01-23 02:43:09', '2025-01-23 03:32:12', '2025-01-23 03:32:12'),
(23, '{\"en\":\"Improving Safety on the Roads\"}', 'improving-safety-on-the-roads', '{\"en\":null}', NULL, 1, 'post', 0.00, 22, 0, 1, 'Improving Safety on the Roads', NULL, NULL, '2025-01-23 02:43:27', '2025-01-23 03:32:12', '2025-01-23 03:32:12'),
(24, '{\"en\":\"Travel Innovation\"}', 'travel-innovation', '{\"en\":null}', NULL, 1, 'post', 0.00, NULL, 0, 1, 'Travel Innovation', NULL, NULL, '2025-01-23 02:43:51', '2025-01-23 03:32:16', '2025-01-23 03:32:16'),
(25, '{\"en\":\"Adapting to Travel Trends\"}', 'adapting-to-travel-trends', '{\"en\":null}', NULL, 1, 'post', 0.00, 24, 0, 1, 'Adapting to Travel Trends', NULL, NULL, '2025-01-23 02:44:15', '2025-01-23 03:32:16', '2025-01-23 03:32:16'),
(26, '{\"en\":\"Services\",\"ar\":\"الخدمات\"}', 'services', '{\"en\":null}', NULL, 1, 'post', 0.00, NULL, 0, 1, 'Services', NULL, NULL, '2025-01-23 03:32:52', '2025-01-23 04:35:05', NULL),
(27, '{\"en\":\"Transportation Trend\",\"de\":\"Transporttrends\",\"fr\":\"Tendances du transport\",\"ar\":\"اتجاهات النقل\"}', 'transportation-trends', '{\"en\":null}', NULL, 1, 'post', 0.00, 26, 4, 1, 'Transportation Trends', NULL, NULL, '2025-01-23 03:33:07', '2025-01-23 04:36:11', NULL),
(28, '{\"en\":\"Commute Solutions\",\"de\":\"Pendlertlösungen\",\"fr\":\"Solutions de trajet quotidien\",\"ar\":\"حلول التنقل اليومي\"}', 'commute-solutions', '{\"en\":null}', NULL, 1, 'post', 0.00, 26, 13, 1, 'Commute Solutions', NULL, NULL, '2025-01-23 03:33:20', '2025-01-23 04:38:37', NULL),
(29, '{\"en\":\"Safety\",\"de\":\"Sicherheit\",\"fr\":\"Sécurité\",\"ar\":\"السلامة\"}', 'safety', '{\"en\":null}', NULL, 1, 'post', 0.00, 26, 12, 1, 'Safety', NULL, NULL, '2025-01-23 03:33:36', '2025-01-23 04:38:25', NULL),
(30, '{\"en\":\"Ride Options\",\"de\":\"Fahrtoptionen\",\"fr\":\"Options de trajet\",\"ar\":\"خيارات الركوب\"}', 'ride-options', '{\"en\":null}', NULL, 1, 'post', 0.00, 26, 11, 1, 'Ride Options', NULL, NULL, '2025-01-23 03:33:50', '2025-01-23 04:37:44', NULL),
(31, '{\"en\":\"Travel Categories\",\"de\":\"Reisekategorien\",\"fr\":\"Catégories de voyage\",\"ar\":\"فئات السفر\"}', 'travel-categories', '{\"en\":null}', NULL, 1, 'post', 0.00, 26, 10, 1, 'Travel Categories', NULL, NULL, '2025-01-23 03:34:06', '2025-01-23 04:37:22', NULL),
(32, '{\"en\":\"Sustainability\",\"de\":\"Nachhaltigkeit\",\"fr\":\"Durabilité\",\"ar\":\"الاستدامة\"}', 'sustainability', '{\"en\":null}', NULL, 1, 'post', 0.00, 26, 9, 1, 'Sustainability', NULL, NULL, '2025-01-23 03:34:21', '2025-01-23 04:37:08', NULL),
(33, '{\"en\":\"Eco-Friendly Travel\",\"de\":\"Umweltfreundliches Reisen\",\"fr\":\"Voyage écologique\",\"ar\":\"السفر الصديق للبيئة\"}', 'eco-friendly-travel', '{\"en\":null}', NULL, 1, 'post', 0.00, 26, 8, 1, 'Eco-Friendly Travel', NULL, NULL, '2025-01-23 03:34:35', '2025-01-23 04:36:56', NULL),
(34, '{\"en\":\"Travel Savings\",\"de\":\"Reiseeinsparungen\",\"fr\":\"Économies de voyage\",\"ar\":\"توفير في السفر\"}', 'travel-savings', '{\"en\":null}', NULL, 1, 'post', 0.00, 26, 7, 1, 'Travel Savings', NULL, NULL, '2025-01-23 03:35:04', '2025-01-23 04:36:44', NULL),
(35, '{\"en\":\"Time Efficiency\",\"de\":\"Zeiteffizienz\",\"fr\":\"Efficacité temporelle\",\"ar\":\"كفاءة الوقت\"}', 'time-efficiency', '{\"en\":null}', NULL, 1, 'post', 0.00, 26, 6, 1, 'Time Efficiency', NULL, NULL, '2025-01-23 03:35:13', '2025-01-23 04:36:33', NULL),
(36, '{\"en\":\"Transportation Options\",\"de\":\"Transportoptionen\",\"fr\":\"Options de transport\",\"ar\":\"خيارات النقل\"}', 'transportation-options', '{\"en\":null}', NULL, 1, 'post', 0.00, 26, 5, 1, 'Transportation Options', NULL, NULL, '2025-01-23 03:35:24', '2025-01-23 04:36:21', NULL),
(37, '{\"en\":\"Delivery Solutions\",\"de\":\"Lieferlösungen\",\"fr\":\"Solutions de livraison\",\"ar\":\"حلول التوصيل\"}', 'delivery-solutions', '{\"en\":null}', NULL, 1, 'post', 0.00, 26, 1, 1, 'Delivery Solutions', NULL, NULL, '2025-01-23 03:35:36', '2025-01-23 04:35:24', NULL),
(38, '{\"en\":\"Vehicle Types\",\"de\":\"Fahrzeugtypen\",\"fr\":\"Types de véhicules\",\"ar\":\"أنواع المركبات\"}', 'vehicle-types', '{\"en\":null}', NULL, 1, 'post', 0.00, 26, 3, 1, 'Vehicle Types', NULL, NULL, '2025-01-23 03:35:45', '2025-01-23 04:35:59', NULL),
(39, '{\"en\":\"Transportation Solutions\",\"ar\":\"حلول النقل\",\"de\":\"Transportlösungen\",\"fr\":\"Solutions de transport\"}', 'transportation-solutions', '{\"en\":null}', NULL, 1, 'post', 0.00, 26, 2, 1, 'Transportation Solutions', NULL, NULL, '2025-01-23 03:35:55', '2025-01-23 04:28:28', NULL),
(40, '{\"en\":\"Vehicle Transfter\",\"ar\":\"Vehicle Transfterdsfs\"}', 'vehicle-transfter', '{\"en\":null}', NULL, 1, 'post', 0.00, NULL, 0, 1, 'Vehicle Transfter', 'Vehicle Transfter', NULL, '2025-01-23 03:49:30', '2025-01-23 03:59:49', '2025-01-23 03:59:49'),
(41, '{\"en\":\"Tips & Tricks\",\"de\":\"Tipps & Tricks\",\"fr\":\"Astuces et conseils\",\"ar\":\"نصائح وحيل\"}', 'tips-tricks', '{\"en\":null}', NULL, 1, 'post', 0.00, NULL, 15, 1, 'Tips & Tricks', NULL, NULL, '2025-01-23 03:56:54', '2025-01-23 04:38:49', NULL),
(42, '{\"en\":\"Choosing the Right Ride Service\",\"de\":\"Die richtige Fahrtdienstleistung wählen\",\"fr\":\"Choisir le bon service de trajet\",\"ar\":\"اختيار خدمة الركوب المناسبة\"}', 'choosing-the-right-ride-service', '{\"en\":null}', NULL, 1, 'post', 0.00, 41, 18, 1, 'Choosing the Right Ride Service', NULL, NULL, '2025-01-23 03:57:10', '2025-01-23 04:39:33', NULL),
(43, '{\"en\":\"Ride Comfort\",\"de\":\"Fahrkomfort\",\"fr\":\"Confort du trajet\",\"ar\":\"راحة الركوب\"}', 'ride-comfort', '{\"en\":null}', NULL, 1, 'post', 0.00, 41, 17, 1, 'Ride Comfort', NULL, NULL, '2025-01-23 03:57:23', '2025-01-23 04:39:14', NULL),
(44, '{\"en\":\"Saving Money and Time\",\"de\":\"Geld und Zeit sparen\",\"fr\":\"Économiser de l\'argent et du temps\",\"ar\":\"توفير المال والوقت\"}', 'saving-money-and-time', '{\"en\":null}', NULL, 1, 'post', 0.00, 41, 16, 1, 'Saving Money and Time', NULL, NULL, '2025-01-23 03:57:33', '2025-01-23 04:39:01', NULL),
(45, '{\"en\":\"Urban Mobility\",\"de\":\"Urbane Mobilität\",\"fr\":\"Mobilité urbaine\",\"ar\":\"الحركة الحضرية\"}', 'urban-mobility', '{\"en\":null}', NULL, 1, 'post', 0.00, NULL, 19, 1, 'Urban Mobility', NULL, NULL, '2025-01-23 03:57:48', '2025-01-23 04:39:44', NULL),
(46, '{\"en\":\"The Future of Urban Mobility\",\"de\":\"Die Zukunft der urbanen Mobilität\",\"fr\":\"L\'avenir de la mobilité urbaine\",\"ar\":\"مستقبل الحركة الحضرية\"}', 'the-future-of-urban-mobility', '{\"en\":null}', NULL, 1, 'post', 0.00, 45, 21, 1, 'The Future of Urban Mobility', NULL, NULL, '2025-01-23 03:58:00', '2025-01-23 04:40:10', NULL),
(47, '{\"en\":\"Changing Travel Landscape\",\"de\":\"Sich verändernde Reiselandschaft\",\"fr\":\"Changement du paysage des voyages\",\"ar\":\"تغير مشهد السفر\"}', 'changing-travel-landscape', '{\"en\":null}', NULL, 1, 'post', 0.00, 45, 20, 1, 'Changing Travel Landscape', NULL, NULL, '2025-01-23 03:58:13', '2025-01-23 04:39:57', NULL),
(48, '{\"en\":\"Ride Features\",\"de\":\"Fahrtmerkmale\",\"fr\":\"Caractéristiques du trajet\",\"ar\":\"ميزات الركوب\"}', 'ride-features', '{\"en\":null}', NULL, 1, 'post', 0.00, NULL, 22, 1, 'Ride Features', NULL, NULL, '2025-01-23 04:00:02', '2025-01-23 04:40:22', NULL),
(49, '{\"en\":\"Improving Safety\",\"de\":\"Sicherheit verbessern\",\"fr\":\"Améliorer la sécurité\",\"ar\":\"تحسين السلامة\"}', 'improving-safety', '{\"en\":null}', NULL, 1, 'post', 0.00, 48, 23, 1, 'Improving Safety', NULL, NULL, '2025-01-23 04:00:22', '2025-01-23 04:40:39', NULL),
(50, '{\"en\":\"Travel Innovation\",\"de\":\"Reiseinnovation\",\"fr\":\"Innovation dans les voyages\",\"ar\":\"الابتكار في السفر\"}', 'travel-innovation', '{\"en\":null}', NULL, 1, 'post', 0.00, NULL, 24, 1, 'Travel Innovation', NULL, NULL, '2025-01-23 04:00:40', '2025-01-23 04:40:45', NULL),
(51, '{\"en\":\"Adapting to Travel Trends\",\"de\":\"An Reisetrends anpassen\",\"fr\":\"S\'adapter aux tendances de voyage\",\"ar\":\"التكيف مع اتجاهات السفر\"}', 'adapting-to-travel-trends', '{\"en\":null}', NULL, 1, 'post', 0.00, 50, 25, 1, 'Adapting to Travel Trends', NULL, NULL, '2025-01-23 04:01:01', '2025-01-23 04:40:57', NULL),
(52, '{\"en\":\"Sicherheit\"}', 'sicherheit', '{\"en\":null}', NULL, 1, 'post', 0.00, NULL, 14, 1, NULL, NULL, NULL, '2025-01-23 04:19:37', '2025-01-23 04:24:57', '2025-01-23 04:24:57');

-- --------------------------------------------------------

--
-- Table structure for table `categories_services`
--

CREATE TABLE `categories_services` (
  `id` bigint UNSIGNED NOT NULL,
  `service_category_id` bigint UNSIGNED NOT NULL,
  `service_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories_services`
--

INSERT INTO `categories_services` (`id`, `service_category_id`, `service_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 1, 2, NULL, NULL, NULL),
(3, 2, 1, NULL, NULL, NULL),
(4, 2, 3, NULL, NULL, NULL),
(5, 3, 1, NULL, NULL, NULL),
(6, 4, 1, NULL, NULL, NULL),
(7, 4, 3, NULL, NULL, NULL),
(8, 5, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_3166_2` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_3166_3` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calling_code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `currency`, `currency_symbol`, `iso_3166_2`, `iso_3166_3`, `calling_code`, `flag`, `currency_code`) VALUES
(4, 'Afghanistan', 'afghani', '؋', 'AF', 'AFG', '93', 'AF.png', 'AFN'),
(8, 'Albania', 'lek', 'Lek', 'AL', 'ALB', '355', 'AL.png', 'ALL'),
(10, 'Antarctica', '', '', 'AQ', 'ATA', '672', 'AQ.png', ''),
(12, 'Algeria', 'Algerian dinar', 'DZD', 'DZ', 'DZA', '213', 'DZ.png', 'DZD'),
(16, 'American Samoa', 'US dollar', '$', 'AS', 'ASM', '1', 'AS.png', 'USD'),
(20, 'Andorra', 'euro', '€', 'AD', 'AND', '376', 'AD.png', 'EUR'),
(24, 'Angola', 'kwanza', 'Kz', 'AO', 'AGO', '244', 'AO.png', 'AOA'),
(28, 'Antigua and Barbuda', 'East Caribbean dollar', '$', 'AG', 'ATG', '1', 'AG.png', 'XCD'),
(31, 'Azerbaijan', 'Azerbaijani manat', 'ман', 'AZ', 'AZE', '994', 'AZ.png', 'AZN'),
(32, 'Argentina', 'Argentine peso', '$', 'AR', 'ARG', '54', 'AR.png', 'ARS'),
(36, 'Australia', 'Australian dollar', '$', 'AU', 'AUS', '61', 'AU.png', 'AUD'),
(40, 'Austria', 'euro', '€', 'AT', 'AUT', '43', 'AT.png', 'EUR'),
(44, 'Bahamas', 'Bahamian dollar', '$', 'BS', 'BHS', '1', 'BS.png', 'BSD'),
(48, 'Bahrain', 'Bahraini dinar', 'BHD', 'BH', 'BHR', '973', 'BH.png', 'BHD'),
(50, 'Bangladesh', 'taka (inv.)', 'BDT', 'BD', 'BGD', '880', 'BD.png', 'BDT'),
(51, 'Armenia', 'dram (inv.)', 'AMD', 'AM', 'ARM', '374', 'AM.png', 'AMD'),
(52, 'Barbados', 'Barbados dollar', '$', 'BB', 'BRB', '1', 'BB.png', 'BBD'),
(56, 'Belgium', 'euro', '€', 'BE', 'BEL', '32', 'BE.png', 'EUR'),
(60, 'Bermuda', 'Bermuda dollar', '$', 'BM', 'BMU', '1', 'BM.png', 'BMD'),
(64, 'Bhutan', 'ngultrum (inv.)', 'BTN', 'BT', 'BTN', '975', 'BT.png', 'BTN'),
(68, 'Bolivia, Plurinational State of', 'boliviano', '$b', 'BO', 'BOL', '591', 'BO.png', 'BOB'),
(70, 'Bosnia and Herzegovina', 'convertible mark', 'KM', 'BA', 'BIH', '387', 'BA.png', 'BAM'),
(72, 'Botswana', 'pula (inv.)', 'P', 'BW', 'BWA', '267', 'BW.png', 'BWP'),
(74, 'Bouvet Island', '', 'kr', 'BV', 'BVT', '47', 'BV.png', ''),
(76, 'Brazil', 'real (pl. reais)', 'R$', 'BR', 'BRA', '55', 'BR.png', 'BRL'),
(84, 'Belize', 'Belize dollar', 'BZ$', 'BZ', 'BLZ', '501', 'BZ.png', 'BZD'),
(86, 'British Indian Ocean Territory', 'US dollar', '$', 'IO', 'IOT', '246', 'IO.png', 'USD'),
(90, 'Solomon Islands', 'Solomon Islands dollar', '$', 'SB', 'SLB', '677', 'SB.png', 'SBD'),
(92, 'Virgin Islands, British', 'US dollar', '$', 'VG', 'VGB', '1', 'VG.png', 'USD'),
(96, 'Brunei Darussalam', 'Brunei dollar', '$', 'BN', 'BRN', '673', 'BN.png', 'BND'),
(100, 'Bulgaria', 'lev (pl. leva)', 'лв', 'BG', 'BGR', '359', 'BG.png', 'BGN'),
(104, 'Myanmar', 'kyat', 'K', 'MM', 'MMR', '95', 'MM.png', 'MMK'),
(108, 'Burundi', 'Burundi franc', 'BIF', 'BI', 'BDI', '257', 'BI.png', 'BIF'),
(112, 'Belarus', 'Belarusian rouble', 'p.', 'BY', 'BLR', '375', 'BY.png', 'BYR'),
(116, 'Cambodia', 'riel', '៛', 'KH', 'KHM', '855', 'KH.png', 'KHR'),
(120, 'Cameroon', 'CFA franc (BEAC)', 'FCF', 'CM', 'CMR', '237', 'CM.png', 'XAF'),
(124, 'Canada', 'Canadian dollar', '$', 'CA', 'CAN', '1', 'CA.png', 'CAD'),
(132, 'Cape Verde', 'Cape Verde escudo', 'CVE', 'CV', 'CPV', '238', 'CV.png', 'CVE'),
(136, 'Cayman Islands', 'Cayman Islands dollar', '$', 'KY', 'CYM', '1', 'KY.png', 'KYD'),
(140, 'Central African Republic', 'CFA franc (BEAC)', 'CFA', 'CF', 'CAF', '236', 'CF.png', 'XAF'),
(144, 'Sri Lanka', 'Sri Lankan rupee', '₨', 'LK', 'LKA', '94', 'LK.png', 'LKR'),
(148, 'Chad', 'CFA franc (BEAC)', 'XAF', 'TD', 'TCD', '235', 'TD.png', 'XAF'),
(152, 'Chile', 'Chilean peso', 'CLP', 'CL', 'CHL', '56', 'CL.png', 'CLP'),
(156, 'China', 'renminbi-yuan (inv.)', '¥', 'CN', 'CHN', '86', 'CN.png', 'CNY'),
(158, 'Taiwan, Province of China', 'new Taiwan dollar', 'NT$', 'TW', 'TWN', '886', 'TW.png', 'TWD'),
(162, 'Christmas Island', 'Australian dollar', '$', 'CX', 'CXR', '61', 'CX.png', 'AUD'),
(166, 'Cocos (Keeling) Islands', 'Australian dollar', '$', 'CC', 'CCK', '61', 'CC.png', 'AUD'),
(170, 'Colombia', 'Colombian peso', '$', 'CO', 'COL', '57', 'CO.png', 'COP'),
(174, 'Comoros', 'Comorian franc', 'KMF', 'KM', 'COM', '269', 'KM.png', 'KMF'),
(175, 'Mayotte', 'euro', '€', 'YT', 'MYT', '262', 'YT.png', 'EUR'),
(178, 'Congo', 'CFA franc (BEAC)', 'FCF', 'CG', 'COG', '242', 'CG.png', 'XAF'),
(180, 'Congo, the Democratic Republic of the', 'Congolese franc', 'CDF', 'CD', 'COD', '243', 'CD.png', 'CDF'),
(184, 'Cook Islands', 'New Zealand dollar', '$', 'CK', 'COK', '682', 'CK.png', 'NZD'),
(188, 'Costa Rica', 'Costa Rican colón (pl. colones)', '₡', 'CR', 'CRI', '506', 'CR.png', 'CRC'),
(191, 'Croatia', 'kuna (inv.)', 'kn', 'HR', 'HRV', '385', 'HR.png', 'HRK'),
(192, 'Cuba', 'Cuban peso', '₱', 'CU', 'CUB', '53', 'CU.png', 'CUP'),
(196, 'Cyprus', 'euro', 'CYP', 'CY', 'CYP', '357', 'CY.png', 'EUR'),
(203, 'Czechia', 'Czech koruna (pl. koruny)', 'Kč', 'CZ', 'CZE', '420', 'CZ.png', 'CZK'),
(204, 'Benin', 'CFA franc (BCEAO)', 'XOF', 'BJ', 'BEN', '229', 'BJ.png', 'XOF'),
(208, 'Denmark', 'Danish krone', 'kr', 'DK', 'DNK', '45', 'DK.png', 'DKK'),
(212, 'Dominica', 'East Caribbean dollar', '$', 'DM', 'DMA', '1', 'DM.png', 'XCD'),
(214, 'Dominican Republic', 'Dominican peso', 'RD$', 'DO', 'DOM', '1', 'DO.png', 'DOP'),
(218, 'Ecuador', 'US dollar', '$', 'EC', 'ECU', '593', 'EC.png', 'USD'),
(222, 'El Salvador', 'Salvadorian colón (pl. colones)', '$', 'SV', 'SLV', '503', 'SV.png', 'SVC'),
(226, 'Equatorial Guinea', 'CFA franc (BEAC)', 'FCF', 'GQ', 'GNQ', '240', 'GQ.png', 'XAF'),
(231, 'Ethiopia', 'birr (inv.)', 'ETB', 'ET', 'ETH', '251', 'ET.png', 'ETB'),
(232, 'Eritrea', 'nakfa', 'Nfk', 'ER', 'ERI', '291', 'ER.png', 'ERN'),
(233, 'Estonia', 'euro', 'kr', 'EE', 'EST', '372', 'EE.png', 'EUR'),
(234, 'Faroe Islands', 'Danish krone', 'kr', 'FO', 'FRO', '298', 'FO.png', 'DKK'),
(238, 'Falkland Islands (Malvinas)', 'Falkland Islands pound', '£', 'FK', 'FLK', '500', 'FK.png', 'FKP'),
(239, 'South Georgia and the South Sandwich Islands', '', '£', 'GS', 'SGS', '44', 'GS.png', ''),
(242, 'Fiji', 'Fiji dollar', '$', 'FJ', 'FJI', '679', 'FJ.png', 'FJD'),
(246, 'Finland', 'euro', '€', 'FI', 'FIN', '358', 'FI.png', 'EUR'),
(248, 'Åland Islands', 'euro', '€', 'AX', 'ALA', '358', 'default.png', 'EUR'),
(250, 'France', 'euro', '€', 'FR', 'FRA', '33', 'FR.png', 'EUR'),
(254, 'French Guiana', 'euro', '€', 'GF', 'GUF', '594', 'GF.png', 'EUR'),
(258, 'French Polynesia', 'CFP franc', 'XPF', 'PF', 'PYF', '689', 'PF.png', 'XPF'),
(260, 'French Southern Territories', 'euro', '€', 'TF', 'ATF', '33', 'TF.png', 'EUR'),
(262, 'Djibouti', 'Djibouti franc', 'DJF', 'DJ', 'DJI', '253', 'DJ.png', 'DJF'),
(266, 'Gabon', 'CFA franc (BEAC)', 'FCF', 'GA', 'GAB', '241', 'GA.png', 'XAF'),
(268, 'Georgia', 'lari', 'GEL', 'GE', 'GEO', '995', 'GE.png', 'GEL'),
(270, 'Gambia', 'dalasi (inv.)', 'D', 'GM', 'GMB', '220', 'GM.png', 'GMD'),
(275, 'Palestine', NULL, '₪', 'PS', 'PSE', '970', 'PS.png', NULL),
(276, 'Germany', 'euro', '€', 'DE', 'DEU', '49', 'DE.png', 'EUR'),
(288, 'Ghana', 'Ghana cedi', '¢', 'GH', 'GHA', '233', 'GH.png', 'GHS'),
(292, 'Gibraltar', 'Gibraltar pound', '£', 'GI', 'GIB', '350', 'GI.png', 'GIP'),
(296, 'Kiribati', 'Australian dollar', '$', 'KI', 'KIR', '686', 'KI.png', 'AUD'),
(300, 'Greece', 'euro', '€', 'GR', 'GRC', '30', 'GR.png', 'EUR'),
(304, 'Greenland', 'Danish krone', 'kr', 'GL', 'GRL', '299', 'GL.png', 'DKK'),
(308, 'Grenada', 'East Caribbean dollar', '$', 'GD', 'GRD', '1', 'GD.png', 'XCD'),
(312, 'Guadeloupe', 'euro', '€', 'GP', 'GLP', '590', 'GP.png', 'EUR '),
(316, 'Guam', 'US dollar', '$', 'GU', 'GUM', '1', 'GU.png', 'USD'),
(320, 'Guatemala', 'quetzal (pl. quetzales)', 'Q', 'GT', 'GTM', '502', 'GT.png', 'GTQ'),
(324, 'Guinea', 'Guinean franc', 'GNF', 'GN', 'GIN', '224', 'GN.png', 'GNF'),
(328, 'Guyana', 'Guyana dollar', '$', 'GY', 'GUY', '592', 'GY.png', 'GYD'),
(332, 'Haiti', 'gourde', 'G', 'HT', 'HTI', '509', 'HT.png', 'HTG'),
(334, 'Heard Island and McDonald Islands', '', '$', 'HM', 'HMD', '61', 'HM.png', ''),
(336, 'Holy See (Vatican City State)', 'euro', '€', 'VA', 'VAT', '39', 'VA.png', 'EUR'),
(340, 'Honduras', 'lempira', 'L', 'HN', 'HND', '504', 'HN.png', 'HNL'),
(344, 'Hong Kong', 'Hong Kong dollar', '$', 'HK', 'HKG', '852', 'HK.png', 'HKD'),
(348, 'Hungary', 'forint (inv.)', 'Ft', 'HU', 'HUN', '36', 'HU.png', 'HUF'),
(352, 'Iceland', 'króna (pl. krónur)', 'kr', 'IS', 'ISL', '354', 'IS.png', 'ISK'),
(356, 'India', 'Indian rupee', '₹', 'IN', 'IND', '91', 'IN.png', 'INR'),
(360, 'Indonesia', 'Indonesian rupiah (inv.)', 'Rp', 'ID', 'IDN', '62', 'ID.png', 'IDR'),
(364, 'Iran, Islamic Republic of', 'Iranian rial', '﷼', 'IR', 'IRN', '98', 'IR.png', 'IRR'),
(368, 'Iraq', 'Iraqi dinar', 'IQD', 'IQ', 'IRQ', '964', 'IQ.png', 'IQD'),
(372, 'Ireland', 'euro', '€', 'IE', 'IRL', '353', 'IE.png', 'EUR'),
(376, 'Israel', 'shekel', '₪', 'IL', 'ISR', '972', 'IL.png', 'ILS'),
(380, 'Italy', 'euro', '€', 'IT', 'ITA', '39', 'IT.png', 'EUR'),
(384, 'Côte d\'Ivoire', 'CFA franc (BCEAO)', 'XOF', 'CI', 'CIV', '225', 'CI.png', 'XOF'),
(388, 'Jamaica', 'Jamaica dollar', '$', 'JM', 'JAM', '1', 'JM.png', 'JMD'),
(392, 'Japan', 'yen (inv.)', '¥', 'JP', 'JPN', '81', 'JP.png', 'JPY'),
(398, 'Kazakhstan', 'tenge (inv.)', 'лв', 'KZ', 'KAZ', '7', 'KZ.png', 'KZT'),
(400, 'Jordan', 'Jordanian dinar', 'JOD', 'JO', 'JOR', '962', 'JO.png', 'JOD'),
(404, 'Kenya', 'Kenyan shilling', 'KES', 'KE', 'KEN', '254', 'KE.png', 'KES'),
(408, 'Korea, Democratic People\'s Republic of', 'North Korean won (inv.)', '₩', 'KP', 'PRK', '850', 'KP.png', 'KPW'),
(410, 'Korea, Republic of', 'South Korean won (inv.)', '₩', 'KR', 'KOR', '82', 'KR.png', 'KRW'),
(414, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KW', 'KWT', '965', 'KW.png', 'KWD'),
(417, 'Kyrgyzstan', 'som', 'лв', 'KG', 'KGZ', '996', 'KG.png', 'KGS'),
(418, 'Lao People\'s Democratic Republic', 'kip (inv.)', '₭', 'LA', 'LAO', '856', 'LA.png', 'LAK'),
(422, 'Lebanon', 'Lebanese pound', '£', 'LB', 'LBN', '961', 'LB.png', 'LBP'),
(426, 'Lesotho', 'loti (pl. maloti)', 'L', 'LS', 'LSO', '266', 'LS.png', 'LSL'),
(428, 'Latvia', 'euro', 'Ls', 'LV', 'LVA', '371', 'LV.png', 'EUR'),
(430, 'Liberia', 'Liberian dollar', '$', 'LR', 'LBR', '231', 'LR.png', 'LRD'),
(434, 'Libya', 'Libyan dinar', 'LYD', 'LY', 'LBY', '218', 'LY.png', 'LYD'),
(438, 'Liechtenstein', 'Swiss franc', 'CHF', 'LI', 'LIE', '423', 'LI.png', 'CHF'),
(440, 'Lithuania', 'euro', 'Lt', 'LT', 'LTU', '370', 'LT.png', 'EUR'),
(442, 'Luxembourg', 'euro', '€', 'LU', 'LUX', '352', 'LU.png', 'EUR'),
(446, 'Macao', 'pataca', 'MOP', 'MO', 'MAC', '853', 'MO.png', 'MOP'),
(450, 'Madagascar', 'ariary', 'MGA', 'MG', 'MDG', '261', 'MG.png', 'MGA'),
(454, 'Malawi', 'Malawian kwacha (inv.)', 'MK', 'MW', 'MWI', '265', 'MW.png', 'MWK'),
(458, 'Malaysia', 'ringgit (inv.)', 'RM', 'MY', 'MYS', '60', 'MY.png', 'MYR'),
(462, 'Maldives', 'rufiyaa', 'Rf', 'MV', 'MDV', '960', 'MV.png', 'MVR'),
(466, 'Mali', 'CFA franc (BCEAO)', 'XOF', 'ML', 'MLI', '223', 'ML.png', 'XOF'),
(470, 'Malta', 'euro', 'MTL', 'MT', 'MLT', '356', 'MT.png', 'EUR'),
(474, 'Martinique', 'euro', '€', 'MQ', 'MTQ', '596', 'MQ.png', 'EUR'),
(478, 'Mauritania', 'ouguiya', 'UM', 'MR', 'MRT', '222', 'MR.png', 'MRO'),
(480, 'Mauritius', 'Mauritian rupee', '₨', 'MU', 'MUS', '230', 'MU.png', 'MUR'),
(484, 'Mexico', 'Mexican peso', '$', 'MX', 'MEX', '52', 'MX.png', 'MXN'),
(492, 'Monaco', 'euro', '€', 'MC', 'MCO', '377', 'MC.png', 'EUR'),
(496, 'Mongolia', 'tugrik', '₮', 'MN', 'MNG', '976', 'MN.png', 'MNT'),
(498, 'Moldova, Republic of', 'Moldovan leu (pl. lei)', 'MDL', 'MD', 'MDA', '373', 'MD.png', 'MDL'),
(499, 'Montenegro', 'euro', '€', 'ME', 'MNE', '382', 'ME.png', 'EUR'),
(500, 'Montserrat', 'East Caribbean dollar', '$', 'MS', 'MSR', '1', 'MS.png', 'XCD'),
(504, 'Morocco', 'Moroccan dirham', 'MAD', 'MA', 'MAR', '212', 'MA.png', 'MAD'),
(508, 'Mozambique', 'metical', 'MT', 'MZ', 'MOZ', '258', 'MZ.png', 'MZN'),
(512, 'Oman', 'Omani rial', '﷼', 'OM', 'OMN', '968', 'OM.png', 'OMR'),
(516, 'Namibia', 'Namibian dollar', '$', 'NA', 'NAM', '264', 'NA.png', 'NAD'),
(520, 'Nauru', 'Australian dollar', '$', 'NR', 'NRU', '674', 'NR.png', 'AUD'),
(524, 'Nepal', 'Nepalese rupee', '₨', 'NP', 'NPL', '977', 'NP.png', 'NPR'),
(528, 'Netherlands', 'euro', '€', 'NL', 'NLD', '31', 'NL.png', 'EUR'),
(531, 'Curaçao', 'Netherlands Antillean guilder (CW1)', 'ƒ', 'CW', 'CUW', '599', 'default.png', 'ANG'),
(533, 'Aruba', 'Aruban guilder', 'ƒ', 'AW', 'ABW', '297', 'AW.png', 'AWG'),
(534, 'Sint Maarten (Dutch part)', 'Netherlands Antillean guilder (SX1)', 'ƒ', 'SX', 'SXM', '721', 'default.png', 'ANG'),
(535, 'Bonaire, Sint Eustatius and Saba', 'US dollar', NULL, 'BQ', 'BES', '599', 'default.png', 'USD'),
(540, 'New Caledonia', 'CFP franc', 'XPF', 'NC', 'NCL', '687', 'NC.png', 'XPF'),
(548, 'Vanuatu', 'vatu (inv.)', 'Vt', 'VU', 'VUT', '678', 'VU.png', 'VUV'),
(554, 'New Zealand', 'New Zealand dollar', '$', 'NZ', 'NZL', '64', 'NZ.png', 'NZD'),
(558, 'Nicaragua', 'córdoba oro', 'C$', 'NI', 'NIC', '505', 'NI.png', 'NIO'),
(562, 'Niger', 'CFA franc (BCEAO)', 'XOF', 'NE', 'NER', '227', 'NE.png', 'XOF'),
(566, 'Nigeria', 'naira (inv.)', '₦', 'NG', 'NGA', '234', 'NG.png', 'NGN'),
(570, 'Niue', 'New Zealand dollar', '$', 'NU', 'NIU', '683', 'NU.png', 'NZD'),
(574, 'Norfolk Island', 'Australian dollar', '$', 'NF', 'NFK', '672', 'NF.png', 'AUD'),
(578, 'Norway', 'Norwegian krone (pl. kroner)', 'kr', 'NO', 'NOR', '47', 'NO.png', 'NOK'),
(580, 'Northern Mariana Islands', 'US dollar', '$', 'MP', 'MNP', '1', 'MP.png', 'USD'),
(581, 'United States Minor Outlying Islands', 'US dollar', '$', 'UM', 'UMI', '1', 'UM.png', 'USD'),
(583, 'Micronesia, Federated States of', 'US dollar', '$', 'FM', 'FSM', '691', 'FM.png', 'USD'),
(584, 'Marshall Islands', 'US dollar', '$', 'MH', 'MHL', '692', 'MH.png', 'USD'),
(585, 'Palau', 'US dollar', '$', 'PW', 'PLW', '680', 'PW.png', 'USD'),
(586, 'Pakistan', 'Pakistani rupee', '₨', 'PK', 'PAK', '92', 'PK.png', 'PKR'),
(591, 'Panama', 'balboa', 'B/.', 'PA', 'PAN', '507', 'PA.png', 'PAB'),
(598, 'Papua New Guinea', 'kina (inv.)', 'PGK', 'PG', 'PNG', '675', 'PG.png', 'PGK'),
(600, 'Paraguay', 'guaraní', 'Gs', 'PY', 'PRY', '595', 'PY.png', 'PYG'),
(604, 'Peru', 'new sol', 'S/.', 'PE', 'PER', '51', 'PE.png', 'PEN'),
(608, 'Philippines', 'Philippine peso', 'Php', 'PH', 'PHL', '63', 'PH.png', 'PHP'),
(612, 'Pitcairn', 'New Zealand dollar', '$', 'PN', 'PCN', '649', 'PN.png', 'NZD'),
(616, 'Poland', 'zloty', 'zł', 'PL', 'POL', '48', 'PL.png', 'PLN'),
(620, 'Portugal', 'euro', '€', 'PT', 'PRT', '351', 'PT.png', 'EUR'),
(624, 'Guinea-Bissau', 'CFA franc (BCEAO)', 'XOF', 'GW', 'GNB', '245', 'GW.png', 'XOF'),
(626, 'Timor-Leste', 'US dollar', '$', 'TL', 'TLS', '670', 'TL.png', 'USD'),
(630, 'Puerto Rico', 'US dollar', '$', 'PR', 'PRI', '1', 'PR.png', 'USD'),
(634, 'Qatar', 'Qatari riyal', '﷼', 'QA', 'QAT', '974', 'QA.png', 'QAR'),
(638, 'Réunion', 'euro', '€', 'RE', 'REU', '262', 'RE.png', 'EUR'),
(642, 'Romania', 'Romanian leu (pl. lei)', 'lei', 'RO', 'ROU', '40', 'RO.png', 'RON'),
(643, 'Russian Federation', 'Russian rouble', 'руб', 'RU', 'RUS', '7', 'RU.png', 'RUB'),
(646, 'Rwanda', 'Rwandese franc', 'RWF', 'RW', 'RWA', '250', 'RW.png', 'RWF'),
(652, 'Saint Barthélemy', 'euro', '€', 'BL', 'BLM', '590', 'default.png', 'EUR'),
(654, 'Saint Helena, Ascension and Tristan da Cunha', 'Saint Helena pound', '£', 'SH', 'SHN', '290', 'SH.png', 'SHP'),
(659, 'Saint Kitts and Nevis', 'East Caribbean dollar', '$', 'KN', 'KNA', '1', 'KN.png', 'XCD'),
(660, 'Anguilla', 'East Caribbean dollar', '$', 'AI', 'AIA', '1', 'AI.png', 'XCD'),
(662, 'Saint Lucia', 'East Caribbean dollar', '$', 'LC', 'LCA', '1', 'LC.png', 'XCD'),
(663, 'Saint Martin (French part)', 'euro', '€', 'MF', 'MAF', '590', 'default.png', 'EUR'),
(666, 'Saint Pierre and Miquelon', 'euro', '€', 'PM', 'SPM', '508', 'PM.png', 'EUR'),
(670, 'Saint Vincent and the Grenadines', 'East Caribbean dollar', '$', 'VC', 'VCT', '1', 'VC.png', 'XCD'),
(674, 'San Marino', 'euro', '€', 'SM', 'SMR', '378', 'SM.png', 'EUR '),
(678, 'Sao Tome and Principe', 'dobra', 'Db', 'ST', 'STP', '239', 'ST.png', 'STD'),
(682, 'Saudi Arabia', 'riyal', '﷼', 'SA', 'SAU', '966', 'SA.png', 'SAR'),
(686, 'Senegal', 'CFA franc (BCEAO)', 'XOF', 'SN', 'SEN', '221', 'SN.png', 'XOF'),
(688, 'Serbia', 'Serbian dinar', 'дин', 'RS', 'SRB', '381', 'default.png', 'RSD'),
(690, 'Seychelles', 'Seychelles rupee', '₨', 'SC', 'SYC', '248', 'SC.png', 'SCR'),
(694, 'Sierra Leone', 'leone', 'Le', 'SL', 'SLE', '232', 'SL.png', 'SLL'),
(702, 'Singapore', 'Singapore dollar', '$', 'SG', 'SGP', '65', 'SG.png', 'SGD'),
(703, 'Slovakia', 'euro', 'Sk', 'SK', 'SVK', '421', 'SK.png', 'EUR'),
(704, 'Viet Nam', 'dong', '₫', 'VN', 'VNM', '84', 'VN.png', 'VND'),
(705, 'Slovenia', 'euro', '€', 'SI', 'SVN', '386', 'SI.png', 'EUR'),
(706, 'Somalia', 'Somali shilling', 'S', 'SO', 'SOM', '252', 'SO.png', 'SOS'),
(710, 'South Africa', 'rand', 'R', 'ZA', 'ZAF', '27', 'ZA.png', 'ZAR'),
(716, 'Zimbabwe', 'Zimbabwe dollar (ZW1)', 'Z$', 'ZW', 'ZWE', '263', 'ZW.png', 'ZWL'),
(724, 'Spain', 'euro', '€', 'ES', 'ESP', '34', 'ES.png', 'EUR'),
(728, 'South Sudan', 'South Sudanese pound', '£', 'SS', 'SSD', '211', 'default.png', 'SSP'),
(729, 'Sudan', 'Sudanese pound', '£', 'SD', 'SDN', '249', 'default.png', 'SDG'),
(732, 'Western Sahara', 'Moroccan dirham', 'MAD', 'EH', 'ESH', '212', 'EH.png', 'MAD'),
(740, 'Suriname', 'Surinamese dollar', '$', 'SR', 'SUR', '597', 'SR.png', 'SRD'),
(744, 'Svalbard and Jan Mayen', 'Norwegian krone (pl. kroner)', 'kr', 'SJ', 'SJM', '47', 'SJ.png', 'NOK'),
(748, 'Eswatini', 'lilangeni', 'SZL', 'SZ', 'SWZ', '268', 'SZ.png', 'SZL'),
(752, 'Sweden', 'krona (pl. kronor)', 'kr', 'SE', 'SWE', '46', 'SE.png', 'SEK'),
(756, 'Switzerland', 'Swiss franc', 'CHF', 'CH', 'CHE', '41', 'CH.png', 'CHF'),
(760, 'Syrian Arab Republic', 'Syrian pound', '£', 'SY', 'SYR', '963', 'SY.png', 'SYP'),
(762, 'Tajikistan', 'somoni', 'TJS', 'TJ', 'TJK', '992', 'TJ.png', 'TJS'),
(764, 'Thailand', 'baht (inv.)', '฿', 'TH', 'THA', '66', 'TH.png', 'THB'),
(768, 'Togo', 'CFA franc (BCEAO)', 'XOF', 'TG', 'TGO', '228', 'TG.png', 'XOF'),
(772, 'Tokelau', 'New Zealand dollar', '$', 'TK', 'TKL', '690', 'TK.png', 'NZD'),
(776, 'Tonga', 'pa’anga (inv.)', 'T$', 'TO', 'TON', '676', 'TO.png', 'TOP'),
(780, 'Trinidad and Tobago', 'Trinidad and Tobago dollar', 'TT$', 'TT', 'TTO', '1', 'TT.png', 'TTD'),
(784, 'United Arab Emirates', 'UAE dirham', 'AED', 'AE', 'ARE', '971', 'AE.png', 'AED'),
(788, 'Tunisia', 'Tunisian dinar', 'TND', 'TN', 'TUN', '216', 'TN.png', 'TND'),
(792, 'Turkey', 'Turkish lira (inv.)', '₺', 'TR', 'TUR', '90', 'TR.png', 'TRY'),
(795, 'Turkmenistan', 'Turkmen manat (inv.)', 'm', 'TM', 'TKM', '993', 'TM.png', 'TMT'),
(796, 'Turks and Caicos Islands', 'US dollar', '$', 'TC', 'TCA', '1', 'TC.png', 'USD'),
(798, 'Tuvalu', 'Australian dollar', '$', 'TV', 'TUV', '688', 'TV.png', 'AUD'),
(800, 'Uganda', 'Uganda shilling', 'UGX', 'UG', 'UGA', '256', 'UG.png', 'UGX'),
(804, 'Ukraine', 'hryvnia', '₴', 'UA', 'UKR', '380', 'UA.png', 'UAH'),
(807, 'North Macedonia', 'denar (pl. denars)', 'ден', 'MK', 'MKD', '389', 'MK.png', 'MKD'),
(818, 'Egypt', 'Egyptian pound', '£', 'EG', 'EGY', '20', 'EG.png', 'EGP'),
(826, 'United Kingdom', 'pound sterling', '£', 'GB', 'GBR', '44', 'GB.png', 'GBP'),
(831, 'Guernsey', 'Guernsey pound (GG2)', '£', 'GG', 'GGY', '44', 'default.png', 'GGP (GG2)'),
(832, 'Jersey', 'Jersey pound (JE2)', '£', 'JE', 'JEY', '44', 'default.png', 'JEP (JE2)'),
(833, 'Isle of Man', 'Manx pound (IM2)', '£', 'IM', 'IMN', '44', 'default.png', 'IMP (IM2)'),
(834, 'Tanzania, United Republic of', 'Tanzanian shilling', 'TZS', 'TZ', 'TZA', '255', 'TZ.png', 'TZS'),
(840, 'United States', 'US dollar', '$', 'US', 'USA', '1', 'US.png', 'USD'),
(850, 'Virgin Islands, U.S.', 'US dollar', '$', 'VI', 'VIR', '1', 'VI.png', 'USD'),
(854, 'Burkina Faso', 'CFA franc (BCEAO)', 'XOF', 'BF', 'BFA', '226', 'BF.png', 'XOF'),
(858, 'Uruguay', 'Uruguayan peso', '$U', 'UY', 'URY', '598', 'UY.png', 'UYU'),
(860, 'Uzbekistan', 'sum (inv.)', 'лв', 'UZ', 'UZB', '998', 'UZ.png', 'UZS'),
(862, 'Venezuela, Bolivarian Republic of', 'bolívar fuerte (pl. bolívares fuertes)', 'Bs', 'VE', 'VEN', '58', 'VE.png', 'VEF'),
(876, 'Wallis and Futuna', 'CFP franc', 'XPF', 'WF', 'WLF', '681', 'WF.png', 'XPF'),
(882, 'Samoa', 'tala (inv.)', 'WS$', 'WS', 'WSM', '685', 'WS.png', 'WST'),
(887, 'Yemen', 'Yemeni rial', '﷼', 'YE', 'YEM', '967', 'YE.png', 'YER'),
(894, 'Zambia', 'Zambian kwacha (inv.)', 'ZK', 'ZM', 'ZMB', '260', 'ZM.png', 'ZMW');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('fixed','percentage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'fixed',
  `amount` decimal(15,2) DEFAULT '0.00',
  `min_ride_fare` decimal(15,2) DEFAULT '0.00',
  `is_unlimited` int DEFAULT '1',
  `usage_per_coupon` int DEFAULT '0',
  `usage_per_rider` int DEFAULT '0',
  `used` int DEFAULT '0',
  `status` int DEFAULT '1',
  `is_expired` int DEFAULT '0',
  `is_apply_all` int DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `description`, `code`, `type`, `amount`, `min_ride_fare`, `is_unlimited`, `usage_per_coupon`, `usage_per_rider`, `used`, `status`, `is_expired`, `is_apply_all`, `start_date`, `end_date`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"RIDE & SAVE\",\"de\":\"RIDE & SAVE\",\"ar\":\"ركوب ووفّر\",\"fr\":\"RIDE & SAVE\"}', '{\n  \"en\": \"Save 15% on your upcoming ride.\",\n  \"fr\": \"Économisez 15% sur votre prochaine course.\",\n  \"ar\": \"وفر 15% في رحلتك القادمة.\",\n  \"de\": \"Sparen Sie 15% bei Ihrer nächsten Fahrt.\"\n}\n', 'SAVE15', 'fixed', 15.00, 100.00, 0, 700, 3, 0, 1, 0, 1, NULL, NULL, 1, '2025-01-23 03:46:29', '2025-01-23 06:00:57', NULL),
(2, '{\n  \"en\": \"BIKE RIDE DISCOUNT\",\n  \"fr\": \"RÉDUCTION SUR LES BALADES À VÉLO\",\n  \"ar\": \"خصم على رحلات الدراجة\",\n  \"de\": \"FAHRRADFAHRT-RABATT\"\n}\n', '{\n  \"en\": \"Get 10% off on your next bike ride.\",\n  \"fr\": \"Obtenez 10% de réduction sur votre prochaine balade à vélo.\",\n  \"ar\": \"احصل على خصم 10% على رحلتك القادمة بالدراجة.\",\n  \"de\": \"Erhalten Sie 10% Rabatt auf Ihre nächste Fahrradfahrt.\"\n}\n', 'BIKERIDE10', 'percentage', 10.00, 10.00, 0, 2, 5, 0, 1, 0, 0, NULL, NULL, 1, '2025-01-23 03:47:58', '2025-01-23 03:47:58', NULL),
(3, '{\n  \"en\": \"RIDE SERVICE DISCOUNT\",\n  \"fr\": \"RÉDUCTION SUR LE SERVICE DE TRANSPORT\",\n  \"ar\": \"خصم على خدمة الركوب\",\n  \"de\": \"FAHRSERVICE-RABATT\"\n}\n', '{\n  \"en\": \"Enjoy 15% off on any ride service.\",\n  \"fr\": \"Profitez de 15% de réduction sur tout service de transport.\",\n  \"ar\": \"استمتع بخصم 15% على أي خدمة توصيل.\",\n  \"de\": \"Genießen Sie 15% Rabatt auf jeden Fahrservice.\"\n}\n', 'RIDE15', 'percentage', 15.00, 20.00, 0, 1000, 3, 0, 1, 1, 0, '2026-11-01', '2026-03-05', 1, '2025-01-23 03:52:59', '2025-01-23 03:52:59', NULL),
(4, '{\n  \"en\": \"GENERAL SAVINGS\",\n  \"fr\": \"ÉCONOMIES GÉNÉRALES\",\n  \"ar\": \"توفير عام\",\n  \"de\": \"ALLGEMEINE ERSPARNISSE\"\n}\n', '{\n  \"en\": \"Flat 8% off on your next ride.\",\n  \"fr\": \"8% de réduction forfaitaire sur votre prochaine course.\",\n  \"ar\": \"خصم ثابت 8% على رحلتك القادمة.\",\n  \"de\": \"Pauschal 8% Rabatt auf Ihre nächste Fahrt.\"\n}\n', 'SAVE8', 'percentage', 8.00, 80.00, 0, 1, 100, 0, 0, 1, 1, '2025-01-02', '2025-09-04', 1, '2025-01-23 03:54:23', '2025-01-23 04:07:59', NULL),
(5, '{\n  \"en\": \"VAN RIDE SPECIAL\",\n  \"fr\": \"OFFRE SPÉCIALE VAN\",\n  \"ar\": \"عرض خاص لرحلات الفان\",\n  \"de\": \"VAN-FAHRT SPEZIAL\"\n}\n', '{\n  \"en\": \"Save 8% on rides with Van vehicles.\",\n  \"fr\": \"Économisez 8% sur les trajets en véhicules Van.\",\n  \"ar\": \"وفر 8% على الرحلات بمركبات الفان.\",\n  \"de\": \"Sparen Sie 8% auf Fahrten mit Van-Fahrzeugen.\"\n}\n', 'VAN8OFF', 'fixed', 350.00, 40.00, 0, 150, 3, 0, 1, 1, 0, '2025-12-01', '2026-07-01', 1, '2025-01-23 03:55:59', '2025-01-23 04:07:15', NULL),
(6, '{\n  \"en\": \"PREMIUM RIDE DISCOUNT\",\n  \"fr\": \"RÉDUCTION SUR LES COURSES PREMIUM\",\n  \"ar\": \"خصم على الرحلات المميزة\",\n  \"de\": \"PREMIUM-FAHRT RABATT\"\n}\n', '{\n  \"en\": \"Save 20% on Prime Car rides.\",\n  \"fr\": \"Économisez 20% sur les trajets en Prime Car.\",\n  \"ar\": \"وفر 20% على رحلات برايم كار.\",\n  \"de\": \"Sparen Sie 20% auf Prime Car-Fahrten.\"\n}\n', 'PRIME20', 'fixed', 520.00, 100.00, 0, 50, 1, 0, 1, 1, 0, '2025-11-01', '2025-12-12', 1, '2025-01-23 03:57:33', '2025-01-23 04:07:37', NULL),
(7, '{\n  \"en\": \"WELCOME OFFER\",\n  \"fr\": \"OFFRE DE BIENVENUE\",\n  \"ar\": \"عرض ترحيبي\",\n  \"de\": \"WILLKOMMENSANGEBOT\"\n}\n', '{\n  \"en\": \"Get 10% off on your first ride!\",\n  \"fr\": \"Obtenez 10% de réduction sur votre première course !\",\n  \"ar\": \"احصل على خصم 10% على رحلتك الأولى!\",\n  \"de\": \"Erhalten Sie 10% Rabatt auf Ihre erste Fahrt!\"\n}\n', 'WELCOME10', 'percentage', 5.00, 70.00, 0, 100, 1, 0, 1, 1, 0, '2025-01-02', '2025-03-09', 1, '2025-01-23 03:59:57', '2025-01-23 03:59:57', NULL),
(8, '{\n  \"en\": \"DISCOUNT OFFER\",\n  \"fr\": \"OFFRE DE RÉDUCTION\",\n  \"ar\": \"عرض خصم\",\n  \"de\": \"RABATTANGEBOT\"\n}\n', '{\n  \"en\": \"Flat 10% off on your next ride.\",\n  \"fr\": \"10% de réduction forfaitaire sur votre prochaine course.\",\n  \"ar\": \"خصم ثابت 10% على رحلتك القادمة.\",\n  \"de\": \"Pauschal 10% Rabatt auf Ihre nächste Fahrt.\"\n}\n', 'SAVE10', 'percentage', 10.00, 100.00, 0, 1000, 10, 0, 1, 0, 0, '2025-10-01', '2026-03-05', 1, '2025-01-23 04:01:22', '2025-07-18 00:28:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_riders`
--

CREATE TABLE `coupon_riders` (
  `id` bigint UNSIGNED NOT NULL,
  `coupon_id` bigint UNSIGNED NOT NULL,
  `rider_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_service`
--

CREATE TABLE `coupon_service` (
  `id` bigint UNSIGNED NOT NULL,
  `coupon_id` bigint UNSIGNED NOT NULL,
  `service_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_service`
--

INSERT INTO `coupon_service` (`id`, `coupon_id`, `service_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, NULL, NULL, NULL),
(2, 3, 1, NULL, NULL, NULL),
(3, 5, 2, NULL, NULL, NULL),
(4, 5, 3, NULL, NULL, NULL),
(5, 6, 1, NULL, NULL, NULL),
(6, 6, 2, NULL, NULL, NULL),
(7, 6, 3, NULL, NULL, NULL),
(8, 7, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_vehicle_types`
--

CREATE TABLE `coupon_vehicle_types` (
  `id` bigint UNSIGNED NOT NULL,
  `coupon_id` bigint UNSIGNED NOT NULL,
  `vehicle_type_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_vehicle_types`
--

INSERT INTO `coupon_vehicle_types` (`id`, `coupon_id`, `vehicle_type_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, NULL, NULL, NULL),
(2, 3, 1, NULL, NULL, NULL),
(3, 3, 2, NULL, NULL, NULL),
(4, 3, 3, NULL, NULL, NULL),
(5, 3, 4, NULL, NULL, NULL),
(6, 3, 5, NULL, NULL, NULL),
(7, 3, 6, NULL, NULL, NULL),
(8, 3, 7, NULL, NULL, NULL),
(9, 3, 8, NULL, NULL, NULL),
(10, 3, 9, NULL, NULL, NULL),
(11, 3, 10, NULL, NULL, NULL),
(12, 5, 5, NULL, NULL, NULL),
(13, 6, 4, NULL, NULL, NULL),
(14, 7, 1, NULL, NULL, NULL),
(15, 7, 2, NULL, NULL, NULL),
(16, 7, 7, NULL, NULL, NULL),
(17, 7, 8, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_of_decimal` decimal(8,2) DEFAULT '2.00',
  `exchange_rate` double DEFAULT '1',
  `symbol_position` enum('before_price','after_price') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'before_price',
  `thousands_separator` enum('comma','period','space') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'comma',
  `decimal_separator` enum('comma','period','space') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'comma',
  `system_reserve` int NOT NULL DEFAULT '0',
  `status` int DEFAULT '1',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `flag`, `symbol`, `no_of_decimal`, `exchange_rate`, `symbol_position`, `thousands_separator`, `decimal_separator`, `system_reserve`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'USD', 'US.png', '$', 2.00, 1, 'before_price', 'comma', 'comma', 0, 1, 1, '2025-04-21 17:22:27', '2025-07-17 03:51:05', NULL),
(2, 'INR', 'IN.png', '₹', 2.00, 83, 'before_price', 'comma', 'comma', 0, 1, 1, '2025-04-21 17:22:27', '2025-04-21 17:22:27', NULL),
(3, 'GBP', 'GB.png', '£', 2.00, 100, 'before_price', 'comma', 'comma', 0, 1, 1, '2025-04-21 17:22:27', '2025-04-21 17:22:27', NULL),
(4, 'EUR', 'AU.png', '€', 2.00, 56, 'before_price', 'comma', 'comma', 0, 1, 1, '2025-04-21 17:22:27', '2025-04-21 17:22:27', NULL),
(5, 'BDT', 'BD.png', 'Tk', 2.00, 110.01, 'before_price', 'comma', 'comma', 0, 1, 1, '2025-04-21 17:22:27', '2025-04-21 17:22:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customizations`
--

CREATE TABLE `customizations` (
  `id` bigint UNSIGNED NOT NULL,
  `html` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `css` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `js` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `imap_credentials` json NOT NULL,
  `department_image_id` bigint UNSIGNED DEFAULT NULL,
  `system_reserve` int NOT NULL DEFAULT '0',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `slug`, `description`, `status`, `imap_credentials`, `department_image_id`, `system_reserve`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"General Inquiry\"}', 'general-inquiry', '{\"en\":\"Providing a space for general questions and inquiries not covered by specific departments.\"}', 1, '{\"imap_host\": \"ENTER_IMAP_HOST\", \"imap_port\": \"ENTER_IMAP_PORT\", \"imap_password\": \"ENTER_IMAP_PASSWORD\", \"imap_protocol\": \"imap\", \"imap_username\": \"ENTER_IMAP_USERNAME\", \"imap_encryption\": \"tls\", \"imap_default_account\": \"default\"}', NULL, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(2, '{\"en\":\"Technical Support\"}', 'technical-support', '{\"en\":\"Get swift solutions for software and hardware challenges in our \\\"Technical Support\\\" department. Our experts are here to empower you, offering quick fixes and guidance on optimization. Trust us for a seamless tech journey.\"}', 1, '{\"imap_host\": \"ENTER_IMAP_HOST\", \"imap_port\": \"ENTER_IMAP_PORT\", \"imap_password\": \"ENTER_IMAP_PASSWORD\", \"imap_protocol\": \"imap\", \"imap_username\": \"ENTER_IMAP_USERNAME\", \"imap_encryption\": \"tls\", \"imap_default_account\": \"default\"}', NULL, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(3, '{\"en\":\"Installation Assistance\"}', 'installation-assistance', '{\"en\":\"For users seeking help with the installation of scripts, plugins, or other code snippets on the Pixel Desk platform.\"}', 1, '{\"imap_host\": \"ENTER_IMAP_HOST\", \"imap_port\": \"ENTER_IMAP_PORT\", \"imap_password\": \"ENTER_IMAP_PASSWORD\", \"imap_protocol\": \"imap\", \"imap_username\": \"ENTER_IMAP_USERNAME\", \"imap_encryption\": \"tls\", \"imap_default_account\": \"default\"}', NULL, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(4, '{\"en\":\"Billing and Payments\"}', 'billing-and-payments', '{\"en\":\"Assistance with billing inquiries, payment issues, and account balance questions.\"}', 1, '{\"imap_host\": \"ENTER_IMAP_HOST\", \"imap_port\": \"ENTER_IMAP_PORT\", \"imap_password\": \"ENTER_IMAP_PASSWORD\", \"imap_protocol\": \"imap\", \"imap_username\": \"ENTER_IMAP_USERNAME\", \"imap_encryption\": \"tls\", \"imap_default_account\": \"default\"}', NULL, 0, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(5, '{\"en\":\"Account Management\"}', 'account-management', '{\"en\":\"Support for managing user accounts, including registration, password resets, and account settings.\"}', 1, '{\"imap_host\": \"ENTER_IMAP_HOST\", \"imap_port\": \"ENTER_IMAP_PORT\", \"imap_password\": \"ENTER_IMAP_PASSWORD\", \"imap_protocol\": \"imap\", \"imap_username\": \"ENTER_IMAP_USERNAME\", \"imap_encryption\": \"tls\", \"imap_default_account\": \"default\"}', NULL, 0, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(6, '{\"en\":\"Quality Assurance\"}', 'quality-assurance', '{\"en\":\"Support for quality assurance testing and feedback.\"}', 1, '{\"imap_host\": \"ENTER_IMAP_HOST\", \"imap_port\": \"ENTER_IMAP_PORT\", \"imap_password\": \"ENTER_IMAP_PASSWORD\", \"imap_protocol\": \"imap\", \"imap_username\": \"ENTER_IMAP_USERNAME\", \"imap_encryption\": \"tls\", \"imap_default_account\": \"default\"}', NULL, 0, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(7, '{\"en\":\"Customer Success\"}', 'customer-success', '{\"en\":\"Support focused on ensuring customer satisfaction and success with our services.\"}', 1, '{\"imap_host\": \"ENTER_IMAP_HOST\", \"imap_port\": \"ENTER_IMAP_PORT\", \"imap_password\": \"ENTER_IMAP_PASSWORD\", \"imap_protocol\": \"imap\", \"imap_username\": \"ENTER_IMAP_USERNAME\", \"imap_encryption\": \"tls\", \"imap_default_account\": \"default\"}', NULL, 0, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(8, '{\"en\":\"Maintenance Requests\"}', 'maintenance-requests', '{\"en\":\"Submit requests for scheduled or emergency maintenance.\"}', 1, '{\"imap_host\": \"ENTER_IMAP_HOST\", \"imap_port\": \"ENTER_IMAP_PORT\", \"imap_password\": \"ENTER_IMAP_PASSWORD\", \"imap_protocol\": \"imap\", \"imap_username\": \"ENTER_IMAP_USERNAME\", \"imap_encryption\": \"tls\", \"imap_default_account\": \"default\"}', NULL, 0, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department_users`
--

CREATE TABLE `department_users` (
  `id` bigint UNSIGNED NOT NULL,
  `department_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department_users`
--

INSERT INTO `department_users` (`id`, `department_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 5, NULL, NULL, NULL),
(2, 2, 5, NULL, NULL, NULL),
(3, 3, 5, NULL, NULL, NULL),
(4, 4, 5, NULL, NULL, NULL),
(5, 5, 5, NULL, NULL, NULL),
(6, 6, 5, NULL, NULL, NULL),
(7, 7, 5, NULL, NULL, NULL),
(8, 8, 5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dispatcher_zones`
--

CREATE TABLE `dispatcher_zones` (
  `id` bigint UNSIGNED NOT NULL,
  `dispatcher_id` bigint UNSIGNED NOT NULL,
  `zone_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dispatcher_zones`
--

INSERT INTO `dispatcher_zones` (`id`, `dispatcher_id`, `zone_id`) VALUES
(1, 57, 1);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` int NOT NULL DEFAULT '0',
  `need_expired_date` int DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `created_by_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type` enum('vehicle','driver') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'driver'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `slug`, `is_required`, `need_expired_date`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`, `type`) VALUES
(1, '{\"en\":\"Driver License\",\"fr\":\"Permis de conduire\",\"de\":\"Führerschein\",\"ar\":\"رخصة القيادة\"}', 'driver-license', 1, 1, 1, 1, '2025-01-23 03:23:57', '2025-06-14 01:10:54', NULL, 'driver');

-- --------------------------------------------------------

--
-- Table structure for table `driver_documents`
--

CREATE TABLE `driver_documents` (
  `id` bigint UNSIGNED NOT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `document_id` bigint UNSIGNED DEFAULT NULL,
  `document_no` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `document_image_id` bigint UNSIGNED DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `note` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_documents`
--

INSERT INTO `driver_documents` (`id`, `driver_id`, `document_id`, `document_no`, `document_image_id`, `expired_at`, `created_by_id`, `note`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 34, 1, 'D123456789', 320, NULL, 1, NULL, 'pending', '2025-01-23 22:14:53', '2025-01-23 22:14:53', NULL),
(2, 33, 1, 'A87654321', 322, NULL, 1, NULL, 'approved', '2025-01-23 22:16:39', '2025-01-23 22:25:34', NULL),
(3, 32, 1, 'B23456789', 324, NULL, 1, NULL, 'approved', '2025-01-23 22:18:02', '2025-01-28 00:49:26', NULL),
(4, 26, 1, 'C34567890', 298, NULL, 1, NULL, 'pending', '2025-01-23 22:20:05', '2025-01-23 22:20:05', NULL),
(5, 24, 1, '8904H2763', 306, NULL, 1, NULL, 'approved', '2025-01-23 22:39:46', '2025-01-23 22:39:46', NULL),
(6, 23, 1, '463Y72901', 302, NULL, 1, NULL, 'pending', '2025-01-23 22:40:57', '2025-01-23 22:40:57', NULL),
(7, 20, 1, '182H6509D', 308, NULL, 1, NULL, 'approved', '2025-01-23 22:42:02', '2025-01-23 22:42:02', NULL),
(8, 27, 1, '673XZ8091', 326, NULL, 1, NULL, 'rejected', '2025-01-23 22:43:45', '2025-01-23 22:43:45', NULL),
(9, 30, 1, '527AG1843', 316, NULL, 1, NULL, 'approved', '2025-01-23 22:44:28', '2025-01-23 22:44:28', NULL),
(10, 21, 1, '385726901', 305, NULL, 1, NULL, 'pending', '2025-01-23 22:46:32', '2025-01-23 22:46:32', NULL),
(11, 28, 1, '92G450872', 310, NULL, 1, NULL, 'approved', '2025-01-23 22:49:10', '2025-01-23 22:49:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `driver_reviews`
--

CREATE TABLE `driver_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `ride_id` bigint UNSIGNED DEFAULT NULL,
  `service_id` bigint UNSIGNED DEFAULT NULL,
  `service_category_id` bigint UNSIGNED DEFAULT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `rider_id` bigint UNSIGNED DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rating` decimal(8,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_reviews`
--

INSERT INTO `driver_reviews` (`id`, `ride_id`, `service_id`, `service_category_id`, `driver_id`, `rider_id`, `message`, `rating`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 8, 2, 2, 28, 10, 'Excellent! The parcel was well-packed and ready for pickup. Communication was clear and prompt. A pleasure to handle the delivery!', 4.00, '2025-01-29 23:28:29', '2025-01-29 23:28:29', NULL),
(4, 12, 1, 5, 18, 11, 'Great renter! Took excellent care of the car and returned it on time. Easy communication and very responsible. Highly recommend!', 5.00, '2025-01-30 01:08:13', '2025-01-30 01:08:13', NULL),
(5, 13, 1, 1, 21, 37, 'Great rider! Was on time, polite, and easy to communicate with. A smooth and pleasant experience!', 5.00, '2025-01-30 02:01:13', '2025-01-30 02:01:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `driver_rules`
--

CREATE TABLE `driver_rules` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rule_image_id` bigint UNSIGNED DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_by_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_rules`
--

INSERT INTO `driver_rules` (`id`, `title`, `slug`, `rule_image_id`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"No Eating Inside the Vehicle\",\"ar\":\"لا يُسمح بالأكل داخل المركبة\",\"de\":\"Kein Essen im Fahrzeug erlaubt\",\"fr\":\"Il est interdit de manger à l\'intérieur du véhicule\"}', NULL, NULL, 1, 1, '2025-01-23 04:16:55', '2025-01-23 04:51:24', NULL),
(2, '{\"en\":\"No Alcohol Allowed\",\"ar\":\"غير مسموح بالكحول\",\"de\":\"Kein Alkohol erlaubt\",\"fr\":\"L\'alcool n\'est pas autorisé\"}', NULL, NULL, 1, 1, '2025-01-23 04:17:29', '2025-01-23 04:50:20', NULL),
(3, '{\"en\":\"Seatbelts Must Be Worn at All Times\",\"ar\":\"يجب ارتداء حزام الأمان في جميع الأوقات\",\"de\":\"Sicherheitsgurte müssen jederzeit getragen werden\",\"fr\":\"Les ceintures de sécurité doivent être portées en tout temps\"}', NULL, NULL, 1, 1, '2025-01-23 04:18:35', '2025-01-23 04:49:08', NULL),
(4, '{\"en\":\"Additional Passenger Fee: $5\",\"fr\":\"Frais supplémentaires pour passagers : 5 $\",\"de\":\"Zusätzliche Passagiergebühr: 5 $\",\"ar\":\"رسوم إضافية للركاب: 5 دولارات\"}', NULL, NULL, 1, 1, '2025-01-23 04:20:02', '2025-01-23 04:46:51', NULL),
(5, '{\"en\":\"No Loud Music or Disruptive Behavior\",\"ar\":\"لا موسيقى صاخبة أو سلوك مزعج\",\"fr\":\"Pas de musique forte ou de comportement perturbateur\",\"de\":\"Keine laute Musik oder störendes Verhalten\"}', NULL, NULL, 1, 1, '2025-01-23 04:27:08', '2025-01-23 04:45:03', NULL),
(6, '{\"en\":\"Max. 7 People in the Vehicle\",\"fr\":\"Max. 7 personnes dans le véhicule\",\"ar\":\"الحد الأقصى 7 أشخاص في المركبة\",\"de\":\"Max. 7 Personen im Fahrzeug\"}', NULL, NULL, 1, 1, '2025-01-23 04:27:45', '2025-01-23 04:43:32', NULL),
(7, '{\"en\":\"Respect Driver’s Comfort and Space\",\"ar\":\"احترام راحة السائق ومساحته\",\"de\":\"Respektiere den Komfort und den Raum des Fahrers\",\"fr\":\"Respectez le confort et l\'espace du conducteur\"}', NULL, NULL, 1, 1, '2025-01-23 04:28:50', '2025-01-23 04:40:39', NULL),
(8, '{\"en\":\"No Pets Allowed\",\"fr\":\"Animaux non autorisés\",\"ar\":\"غير مسموح بالحيوانات\",\"de\":\"Keine Haustiere erlaubt\"}', NULL, NULL, 1, 1, '2025-01-23 04:30:04', '2025-01-23 04:38:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `driver_subscriptions`
--

CREATE TABLE `driver_subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED DEFAULT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `duration` enum('daily','weekly','monthly','yearly') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'monthly',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `total` double NOT NULL DEFAULT '0',
  `is_included_free_trial` int DEFAULT '0',
  `is_active` int DEFAULT '0',
  `payment_method` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_vehicle_types`
--

CREATE TABLE `driver_vehicle_types` (
  `id` bigint UNSIGNED NOT NULL,
  `driver_rule_id` bigint UNSIGNED DEFAULT NULL,
  `vehicle_type_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_vehicle_types`
--

INSERT INTO `driver_vehicle_types` (`id`, `driver_rule_id`, `vehicle_type_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, NULL, NULL, NULL),
(2, 1, 4, NULL, NULL, NULL),
(3, 1, 5, NULL, NULL, NULL),
(4, 2, 4, NULL, NULL, NULL),
(5, 2, 6, NULL, NULL, NULL),
(6, 2, 7, NULL, NULL, NULL),
(7, 2, 9, NULL, NULL, NULL),
(8, 2, 10, NULL, NULL, NULL),
(9, 3, 3, NULL, NULL, NULL),
(10, 3, 4, NULL, NULL, NULL),
(11, 3, 5, NULL, NULL, NULL),
(12, 3, 6, NULL, NULL, NULL),
(13, 3, 7, NULL, NULL, NULL),
(14, 3, 8, NULL, NULL, NULL),
(15, 3, 9, NULL, NULL, NULL),
(16, 3, 10, NULL, NULL, NULL),
(17, 4, 3, NULL, NULL, NULL),
(18, 4, 4, NULL, NULL, NULL),
(19, 4, 5, NULL, NULL, NULL),
(20, 5, 2, NULL, NULL, NULL),
(21, 5, 3, NULL, NULL, NULL),
(22, 5, 4, NULL, NULL, NULL),
(23, 5, 5, NULL, NULL, NULL),
(24, 5, 6, NULL, NULL, NULL),
(25, 5, 7, NULL, NULL, NULL),
(26, 5, 8, NULL, NULL, NULL),
(27, 6, 6, NULL, NULL, NULL),
(28, 7, 2, NULL, NULL, NULL),
(29, 7, 3, NULL, NULL, NULL),
(30, 7, 4, NULL, NULL, NULL),
(31, 7, 5, NULL, NULL, NULL),
(32, 7, 6, NULL, NULL, NULL),
(33, 7, 7, NULL, NULL, NULL),
(34, 7, 8, NULL, NULL, NULL),
(35, 8, 2, NULL, NULL, NULL),
(36, 8, 3, NULL, NULL, NULL),
(37, 8, 4, NULL, NULL, NULL),
(38, 8, 5, NULL, NULL, NULL),
(39, 8, 7, NULL, NULL, NULL),
(40, 8, 8, NULL, NULL, NULL),
(41, 8, 10, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `driver_wallets`
--

CREATE TABLE `driver_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_wallets`
--

INSERT INTO `driver_wallets` (`id`, `driver_id`, `balance`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 17, 150.00, '2025-01-23 21:11:01', '2025-01-23 21:15:14', NULL),
(2, 23, 0.00, '2025-01-23 21:15:21', '2025-01-23 21:15:21', NULL),
(3, 31, 317.00, '2025-01-24 20:05:43', '2025-03-20 02:45:35', NULL),
(4, 34, 0.00, '2025-01-27 20:56:23', '2025-01-27 20:56:23', NULL),
(5, 28, 0.00, '2025-01-28 04:37:19', '2025-01-28 04:37:19', NULL),
(6, 36, 0.00, '2025-01-28 04:37:47', '2025-01-28 04:37:47', NULL),
(7, 27, 795.00, '2025-01-29 23:59:52', '2025-01-29 23:59:52', NULL),
(8, 4, 0.00, '2025-03-20 02:23:21', '2025-03-20 02:23:21', NULL),
(9, 25, 940.75, '2025-03-20 02:26:51', '2025-04-29 01:30:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `driver_wallet_histories`
--

CREATE TABLE `driver_wallet_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `driver_wallet_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `type` enum('credit','debit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_wallet_histories`
--

INSERT INTO `driver_wallet_histories` (`id`, `driver_wallet_id`, `order_id`, `amount`, `type`, `detail`, `from_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, 200.00, 'credit', 'Admin has credited the balance.', NULL, '2025-01-23 21:11:08', '2025-01-23 21:11:08', NULL),
(2, 1, NULL, 50.00, 'debit', 'Admin debited amount for driver\'s late arrival on ride.', NULL, '2025-01-23 21:15:14', '2025-01-23 21:15:14', NULL),
(3, 3, NULL, 109.25, 'credit', 'Admin has sended a commission', NULL, '2025-01-25 01:30:12', '2025-01-25 01:30:12', NULL),
(4, 3, NULL, 361.00, 'credit', 'Admin has sended a commission', NULL, '2025-01-25 01:44:59', '2025-01-25 01:44:59', NULL),
(5, 3, NULL, 237.50, 'credit', 'Admin has sended a commission', NULL, '2025-01-25 01:50:19', '2025-01-25 01:50:19', NULL),
(7, 3, NULL, 500.00, 'debit', 'Balance Withdrawn Requested', NULL, '2025-01-25 01:56:14', '2025-01-25 01:56:14', NULL),
(8, 7, NULL, 795.00, 'credit', 'Admin has sended a commission', NULL, '2025-01-29 23:59:52', '2025-01-29 23:59:52', NULL),
(9, 3, NULL, 109.25, 'credit', 'Admin has sended a commission', NULL, '2025-03-20 02:45:35', '2025-03-20 02:45:35', NULL),
(10, 9, NULL, 199.50, 'credit', 'Admin has sended a commission', NULL, '2025-03-20 04:13:43', '2025-03-20 04:13:43', NULL),
(11, 9, NULL, 109.25, 'credit', 'Admin has sended a commission', NULL, '2025-03-20 04:16:55', '2025-03-20 04:16:55', NULL),
(12, 9, NULL, 500.00, 'credit', 'Admin has credited the balance.', NULL, '2025-04-29 01:29:42', '2025-04-29 01:29:42', NULL),
(13, 9, NULL, 180.00, 'credit', 'Admin has credited the balance.', NULL, '2025-04-29 01:29:52', '2025-04-29 01:29:52', NULL),
(14, 9, NULL, 60.00, 'debit', 'Admin has debited the balance.', NULL, '2025-04-29 01:29:59', '2025-04-29 01:29:59', NULL),
(15, 9, NULL, 12.00, 'credit', 'Admin has credited the balance.', NULL, '2025-04-29 01:30:11', '2025-04-29 01:30:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `driver_zones`
--

CREATE TABLE `driver_zones` (
  `id` bigint UNSIGNED NOT NULL,
  `driver_id` bigint UNSIGNED NOT NULL,
  `zone_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_zones`
--

INSERT INTO `driver_zones` (`id`, `driver_id`, `zone_id`) VALUES
(1, 32, 1),
(3, 36, 1),
(4, 35, 1),
(5, 34, 1),
(6, 33, 1),
(8, 30, 1),
(10, 28, 1),
(11, 27, 1),
(12, 24, 1),
(14, 22, 1),
(15, 23, 1),
(16, 21, 1),
(17, 20, 1),
(19, 19, 1),
(20, 18, 1),
(21, 17, 1),
(22, 54, 1),
(23, 55, 1),
(24, 29, 1),
(25, 26, 1),
(26, 4, 1),
(27, 25, 1),
(28, 65, 1),
(29, 66, 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `button_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `button_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `title`, `slug`, `content`, `button_text`, `button_url`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"New Ride Request Assigned\",\"ar\":null,\"de\":null,\"fr\":null}', 'ride-request-driver', '{\"en\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">New Ride Request Assigned<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">Hello <strong>{{driver_name}}<\\/strong>,<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">You have been assigned a new ride request from <strong>{{rider_name}}<\\/strong>.<\\/p>\\r\\n<table style=\\\"width: 100%; border-collapse: collapse; margin: 20px 0;\\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Service:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{services}} ({{service_category}})<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Vehicle Type:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{vehicle_type}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Fare Amount:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{fare_amount}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Distance:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{distance}} {{distance_unit}}<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p style=\\\"font-size: 16px;\\\"><strong>Pickup &amp; Destinations:<\\/strong><\\/p>\\r\\n<p style=\\\"font-size: 16px; background-color: #fff; border: 1px solid #ddd; padding: 10px; border-radius: 4px;\\\">{{locations}}<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Please review and accept the request promptly.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">Thank you, <br \\/><strong>{{Your Company Name}}<\\/strong><\\/p>\\r\\n<\\/div>\",\"ar\":null,\"de\":null,\"fr\":null}', NULL, NULL, NULL, '2025-01-24 04:18:01', '2025-01-24 04:18:01'),
(2, '{\"en\":\"New Ride Assigned\",\"ar\":\"\\u0631\\u062d\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0645\\u062e\\u0635\\u0635\\u0629 \\u0644\\u0643\",\"de\":\"Neue Fahrt Zugewiesen\",\"fr\":\"Nouvelle Course Assign\\u00e9e\"}', 'create-ride-admin', '{\"en\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">New Ride Created<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">Hello,<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">A new ride has been created. Below are the details:<\\/p>\\r\\n<table style=\\\"width: 100%; border-collapse: collapse; margin: 20px 0;\\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Ride Number:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{ride_number}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Rider Name:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{rider_name}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Rider Phone:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{rider_phone}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Vehicle Type:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{vehicle_type}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Service:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{services}} ({{service_category}})<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Fare Amount:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{fare_amount}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Distance:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{distance}} {{distance_unit}}<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p style=\\\"font-size: 16px;\\\">Please review the ride details for further processing.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">Thank you, <br \\/><strong>{{Your Company Name}}<\\/strong><\\/p>\\r\\n<\\/div>\",\"ar\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">\\u062a\\u0645 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0631\\u062d\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">\\u0645\\u0631\\u062d\\u0628\\u064b\\u0627\\u060c<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">\\u062a\\u0645 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0631\\u062d\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629. \\u0641\\u064a\\u0645\\u0627 \\u064a\\u0644\\u064a \\u0627\\u0644\\u062a\\u0641\\u0627\\u0635\\u064a\\u0644:<\\/p>\\r\\n<table style=\\\"width: 100%; border-collapse: collapse; margin: 20px 0;\\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">\\u0631\\u0642\\u0645 \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{ride_number}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0631\\u0627\\u0643\\u0628:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{rider_name}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">\\u0647\\u0627\\u062a\\u0641 \\u0627\\u0644\\u0631\\u0627\\u0643\\u0628:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{rider_phone}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">\\u0646\\u0648\\u0639 \\u0627\\u0644\\u0645\\u0631\\u0643\\u0628\\u0629:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{vehicle_type}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">\\u0627\\u0644\\u062e\\u062f\\u0645\\u0629:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{services}} ({{service_category}})<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">\\u0633\\u0639\\u0631 \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{fare_amount}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">\\u0627\\u0644\\u0645\\u0633\\u0627\\u0641\\u0629:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{distance}} {{distance_unit}}<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p style=\\\"font-size: 16px;\\\">\\u064a\\u0631\\u062c\\u0649 \\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629 \\u0644\\u0645\\u0632\\u064a\\u062f \\u0645\\u0646 \\u0627\\u0644\\u0645\\u0639\\u0627\\u0644\\u062c\\u0629.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">\\u0634\\u0643\\u0631\\u064b\\u0627 \\u0644\\u0643\\u060c <br \\/><strong>{{\\u0627\\u0633\\u0645 \\u0634\\u0631\\u0643\\u062a\\u0643}}<\\/strong><\\/p>\\r\\n<\\/div>\",\"de\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">Neue Fahrt Erstellt<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">Hallo,<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Eine neue Fahrt wurde erstellt. Hier sind die Details:<\\/p>\\r\\n<table style=\\\"width: 100%; border-collapse: collapse; margin: 20px 0;\\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Fahrtnummer:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{ride_number}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Name des Fahrgasts:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{rider_name}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Telefon des Fahrgasts:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{rider_phone}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Fahrzeugtyp:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{vehicle_type}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Service:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{services}} ({{service_category}})<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Betrag:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{fare_amount}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Entfernung:<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{distance}} {{distance_unit}}<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p style=\\\"font-size: 16px;\\\">Bitte &uuml;berpr&uuml;fen Sie die Fahrtdetails f&uuml;r die weitere Bearbeitung.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">Vielen Dank, <br \\/><strong>{{Ihr Firmenname}}<\\/strong><\\/p>\\r\\n<\\/div>\",\"fr\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">Nouvelle Course Cr&eacute;&eacute;e<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">Bonjour,<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Une nouvelle course a &eacute;t&eacute; cr&eacute;&eacute;e. Voici les d&eacute;tails :<\\/p>\\r\\n<table style=\\\"width: 100%; border-collapse: collapse; margin: 20px 0;\\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Num&eacute;ro de Course :<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{ride_number}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Nom du Passager :<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{rider_name}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">T&eacute;l&eacute;phone du Passager :<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{rider_phone}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Type de V&eacute;hicule :<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{vehicle_type}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Service :<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{services}} ({{service_category}})<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Montant de la Course :<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{fare_amount}}<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd; font-weight: bold;\\\">Distance :<\\/td>\\r\\n<td style=\\\"padding: 8px; border: 1px solid #ddd;\\\">{{distance}} {{distance_unit}}<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p style=\\\"font-size: 16px;\\\">Veuillez examiner les d&eacute;tails de la course pour continuer.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">Merci, <br \\/><strong>{{Votre Nom d\'Entreprise}}<\\/strong><\\/p>\\r\\n<\\/div>\"}', NULL, NULL, NULL, '2025-01-24 04:24:31', '2025-01-24 04:30:43'),
(3, '{\"en\":\"Bid Status Updated\",\"ar\":\"\\u062a\\u0645 \\u062a\\u062d\\u062f\\u064a\\u062b \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u0639\\u0631\\u0636\",\"de\":\"Gebotsstatus aktualisiert\",\"fr\":\"Statut de l\'offre mis \\u00e0 jour\"}', 'bid-status-driver', '{\"en\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">Bid Status Updated<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">Hello {{driver_name}},<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">The status of your bid for a ride request from {{rider_name}} has been updated to: <strong style=\\\"color: #199675;\\\">{{bid_status}}<\\/strong>.<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Please log in to your account for more details.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">Thank you, <br \\/><strong>{{Your Company Name}}<\\/strong><\\/p>\\r\\n<\\/div>\",\"ar\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">\\u062a\\u0645 \\u062a\\u062d\\u062f\\u064a\\u062b \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u0639\\u0631\\u0636<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">\\u0645\\u0631\\u062d\\u0628\\u064b\\u0627 {{driver_name}}\\u060c<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">\\u062a\\u0645 \\u062a\\u062d\\u062f\\u064a\\u062b \\u062d\\u0627\\u0644\\u0629 \\u0639\\u0631\\u0636\\u0643 \\u0644\\u0637\\u0644\\u0628 \\u0631\\u062d\\u0644\\u0629 \\u0645\\u0646 {{rider_name}} \\u0625\\u0644\\u0649: <strong style=\\\"color: #199675;\\\">{{bid_status}}<\\/strong>.<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">\\u064a\\u0631\\u062c\\u0649 \\u062a\\u0633\\u062c\\u064a\\u0644 \\u0627\\u0644\\u062f\\u062e\\u0648\\u0644 \\u0625\\u0644\\u0649 \\u062d\\u0633\\u0627\\u0628\\u0643 \\u0644\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0645\\u0632\\u064a\\u062f \\u0645\\u0646 \\u0627\\u0644\\u062a\\u0641\\u0627\\u0635\\u064a\\u0644.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">\\u0634\\u0643\\u0631\\u064b\\u0627 \\u0644\\u0643\\u060c <br \\/><strong>{{\\u0627\\u0633\\u0645 \\u0634\\u0631\\u0643\\u062a\\u0643}}<\\/strong><\\/p>\\r\\n<\\/div>\",\"de\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">Gebotsstatus aktualisiert<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">Hallo {{driver_name}},<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Der Status Ihres Gebots f&uuml;r eine Fahrtanfrage von {{rider_name}} wurde aktualisiert zu: <strong style=\\\"color: #199675;\\\">{{bid_status}}<\\/strong>.<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Bitte melden Sie sich in Ihrem Konto an, um weitere Details zu erhalten.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">Vielen Dank, <br \\/><strong>{{Ihr Firmenname}}<\\/strong><\\/p>\\r\\n<\\/div>\",\"fr\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">Statut de l\'offre mis &agrave; jour<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">Bonjour {{driver_name}},<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Le statut de votre offre pour une demande de course de {{rider_name}} a &eacute;t&eacute; mis &agrave; jour &agrave; : <strong style=\\\"color: #199675;\\\">{{bid_status}}<\\/strong>.<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Veuillez vous connecter &agrave; votre compte pour plus de d&eacute;tails.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">Merci, <br \\/><strong>{{Nom de votre entreprise}}<\\/strong><\\/p>\\r\\n<\\/div>\"}', NULL, NULL, NULL, '2025-01-24 04:35:35', '2025-01-24 04:35:35'),
(4, '{\"en\":\"New Withdraw Request\",\"ar\":\"\\u0637\\u0644\\u0628 \\u0633\\u062d\\u0628 \\u062c\\u062f\\u064a\\u062f\",\"de\":\"Neue Auszahlungsanfrage\",\"fr\":\"Nouvelle Demande de Retrait\"}', 'create-withdraw-request-admin', '{\"en\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">New Withdraw Request<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">Hello Admin,<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">A new withdraw request has been created by {{driver_name}} for the amount of <strong style=\\\"color: #199675;\\\">{{amount}}<\\/strong>.<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Please log in to your dashboard to review and process this request.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">Thank you, <br \\/><strong>{{Your Company Name}}<\\/strong><\\/p>\\r\\n<\\/div>\",\"ar\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">\\u0637\\u0644\\u0628 \\u0633\\u062d\\u0628 \\u062c\\u062f\\u064a\\u062f<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">\\u0645\\u0631\\u062d\\u0628\\u064b\\u0627 \\u0645\\u0633\\u0624\\u0648\\u0644\\u060c<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">\\u062a\\u0645 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0637\\u0644\\u0628 \\u0633\\u062d\\u0628 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 {{driver_name}} \\u0628\\u0645\\u0628\\u0644\\u063a <strong style=\\\"color: #199675;\\\">{{amount}}<\\/strong>.<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">\\u064a\\u0631\\u062c\\u0649 \\u062a\\u0633\\u062c\\u064a\\u0644 \\u0627\\u0644\\u062f\\u062e\\u0648\\u0644 \\u0625\\u0644\\u0649 \\u0644\\u0648\\u062d\\u0629 \\u0627\\u0644\\u062a\\u062d\\u0643\\u0645 \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0628\\u0643 \\u0644\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0647\\u0630\\u0627 \\u0627\\u0644\\u0637\\u0644\\u0628 \\u0648\\u0645\\u0639\\u0627\\u0644\\u062c\\u062a\\u0647.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">\\u0634\\u0643\\u0631\\u064b\\u0627 \\u0644\\u0643\\u060c <br \\/><strong>{{\\u0627\\u0633\\u0645 \\u0634\\u0631\\u0643\\u062a\\u0643}}<\\/strong><\\/p>\\r\\n<\\/div>\",\"de\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">Neue Auszahlungsanfrage<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">Hallo Admin,<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Eine neue Auszahlungsanfrage wurde von {{driver_name}} f&uuml;r den Betrag von <strong style=\\\"color: #199675;\\\">{{amount}}<\\/strong> erstellt.<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Bitte melden Sie sich in Ihrem Dashboard an, um diese Anfrage zu &uuml;berpr&uuml;fen und zu bearbeiten.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">Vielen Dank, <br \\/><strong>{{Ihr Firmenname}}<\\/strong><\\/p>\\r\\n<\\/div>\",\"fr\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">Nouvelle Demande de Retrait<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">Bonjour Admin,<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Une nouvelle demande de retrait a &eacute;t&eacute; cr&eacute;&eacute;e par {{driver_name}} pour un montant de <strong style=\\\"color: #199675;\\\">{{amount}}<\\/strong>.<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Veuillez vous connecter &agrave; votre tableau de bord pour examiner et traiter cette demande.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">Merci, <br \\/><strong>{{Nom de votre entreprise}}<\\/strong><\\/p>\\r\\n<\\/div>\"}', NULL, NULL, NULL, '2025-01-24 04:40:23', '2025-01-24 04:40:23'),
(5, '{\"en\":\"Withdraw Request Status Updated\",\"ar\":\"\\u062a\\u0645 \\u062a\\u062d\\u062f\\u064a\\u062b \\u062d\\u0627\\u0644\\u0629 \\u0637\\u0644\\u0628 \\u0627\\u0644\\u0633\\u062d\\u0628\",\"de\":\"Status der Auszahlungsanfrage aktualisiert\",\"fr\":\"Statut de la Demande de Retrait Mis \\u00e0 Jour\"}', 'update-withdraw-request-driver', '{\"en\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">Withdraw Request Status Updated<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">Hello {{driver_name}},<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">The status of your withdraw request for the amount of <strong style=\\\"color: #199675;\\\">{{amount}}<\\/strong> has been updated to: <strong style=\\\"color: #199675;\\\">{{status}}<\\/strong>.<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Please log in to your account for more details.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">Thank you, <br \\/><strong>{{Your Company Name}}<\\/strong><\\/p>\\r\\n<\\/div>\",\"ar\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">\\u062a\\u0645 \\u062a\\u062d\\u062f\\u064a\\u062b \\u062d\\u0627\\u0644\\u0629 \\u0637\\u0644\\u0628 \\u0627\\u0644\\u0633\\u062d\\u0628<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">\\u0645\\u0631\\u062d\\u0628\\u064b\\u0627 {{driver_name}},<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">\\u062a\\u0645 \\u062a\\u062d\\u062f\\u064a\\u062b \\u062d\\u0627\\u0644\\u0629 \\u0637\\u0644\\u0628 \\u0627\\u0644\\u0633\\u062d\\u0628 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0643 \\u0628\\u0645\\u0628\\u0644\\u063a <strong style=\\\"color: #199675;\\\">{{amount}}<\\/strong> \\u0625\\u0644\\u0649: <strong style=\\\"color: #199675;\\\">{{status}}<\\/strong>.<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">\\u064a\\u0631\\u062c\\u0649 \\u062a\\u0633\\u062c\\u064a\\u0644 \\u0627\\u0644\\u062f\\u062e\\u0648\\u0644 \\u0625\\u0644\\u0649 \\u062d\\u0633\\u0627\\u0628\\u0643 \\u0644\\u0645\\u0632\\u064a\\u062f \\u0645\\u0646 \\u0627\\u0644\\u062a\\u0641\\u0627\\u0635\\u064a\\u0644.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">\\u0634\\u0643\\u0631\\u064b\\u0627 \\u0644\\u0643\\u060c <br \\/><strong>{{\\u0627\\u0633\\u0645 \\u0634\\u0631\\u0643\\u062a\\u0643}}<\\/strong><\\/p>\\r\\n<\\/div>\",\"de\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">Status der Auszahlungsanfrage aktualisiert<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">Hallo {{driver_name}},<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Der Status Ihrer Auszahlungsanfrage &uuml;ber <strong style=\\\"color: #199675;\\\">{{amount}}<\\/strong> wurde aktualisiert zu: <strong style=\\\"color: #199675;\\\">{{status}}<\\/strong>.<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Bitte melden Sie sich in Ihrem Konto an, um weitere Details zu erhalten.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">Vielen Dank, <br \\/><strong>{{Ihr Firmenname}}<\\/strong><\\/p>\\r\\n<\\/div>\",\"fr\":\"<div style=\\\"max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9;\\\">\\r\\n<h2 style=\\\"color: #199675; text-align: center;\\\">Statut de la Demande de Retrait Mis &agrave; Jour<\\/h2>\\r\\n<p style=\\\"font-size: 16px;\\\">Bonjour {{driver_name}},<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Le statut de votre demande de retrait pour un montant de <strong style=\\\"color: #199675;\\\">{{amount}}<\\/strong> a &eacute;t&eacute; mis &agrave; jour &agrave; : <strong style=\\\"color: #199675;\\\">{{status}}<\\/strong>.<\\/p>\\r\\n<p style=\\\"font-size: 16px;\\\">Veuillez vous connecter &agrave; votre compte pour plus de d&eacute;tails.<\\/p>\\r\\n<p style=\\\"font-size: 16px; text-align: center; margin-top: 30px;\\\">Merci, <br \\/><strong>{{Nom de votre entreprise}}<\\/strong><\\/p>\\r\\n<\\/div>\"}', NULL, NULL, NULL, '2025-01-24 04:45:26', '2025-01-24 04:45:26');

-- --------------------------------------------------------

--
-- Table structure for table `extra_charges`
--

CREATE TABLE `extra_charges` (
  `id` bigint UNSIGNED NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '1',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '1',
  `created_by_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `description`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"What is the best way to book a ride?\",\"ar\":\"ما هي أفضل طريقة لحجز رحلة؟\",\"fr\":\"Quelle est la meilleure façon de réserver un trajet ?\",\"de\":\"Was ist der beste Weg, eine Fahrt zu buchen?\"}', '{\"en\":\"You can book a ride easily using our app or website. Simply enter your pickup location, select your vehicle type, and confirm the ride.\",\"ar\":\"يمكنك حجز رحلة بسهولة باستخدام تطبيقنا أو موقعنا الإلكتروني. أدخل موقع الالتقاط، اختر نوع السيارة، وقم بتأكيد الرحلة\",\"fr\":\"Vous pouvez facilement réserver un trajet via notre application ou notre site web. Entrez simplement votre lieu de prise en charge, sélectionnez votre type de véhicule et confirmez le trajet.\",\"de\":\"Sie können ganz einfach über unsere App oder Website eine Fahrt buchen. Geben Sie einfach Ihren Abholort ein, wählen Sie die Fahrzeugart aus und bestätigen Sie die Fahrt.\"}', 1, 1, '2025-01-23 00:17:57', '2025-01-23 00:33:25', NULL),
(2, '{\"en\":\"What payment options are available?\",\"fr\":\"Quelles options de paiement sont disponibles ?\",\"ar\":\"ما هي خيارات الدفع المتاحة؟\",\"de\":\"Welche Zahlungsmöglichkeiten gibt es?\"}', '{\"en\":\"We support multiple payment methods, including credit/debit cards, mobile wallets, and cash, to ensure a convenient experience for you.\",\"fr\":\"Nous prenons en charge plusieurs méthodes de paiement, y compris les cartes de crédit/débit, les portefeuilles mobiles et les espèces, pour une expérience pratique.\",\"ar\":\"نحن ندعم عدة طرق دفع بما في ذلك بطاقات الائتمان/الخصم، المحافظ الإلكترونية، والنقد لتوفير تجربة مريحة لك.\",\"de\":\"Wir unterstützen verschiedene Zahlungsmethoden, darunter Kredit-/Debitkarten, mobile Wallets und Bargeld, um Ihnen eine bequeme Erfahrung zu bieten.\"}', 1, 1, '2025-01-23 00:17:57', '2025-01-23 00:36:09', NULL),
(3, '{\"en\":\"How can I track my ride?\",\"fr\":\"Comment puis-je suivre mon trajet ?\",\"de\":\"Wie kann ich meine Fahrt verfolgen?\",\"ar\":\"كيف يمكنني تتبع رحلتي؟\"}', '{\"en\":\"Once your ride is confirmed, you can track your driver’s real-time location through the app to know when they’ll arrive.\",\"fr\":\"Une fois votre trajet confirmé, vous pouvez suivre la position en temps réel de votre chauffeur via l\'application pour savoir quand il arrivera.\",\"de\":\"Sobald Ihre Fahrt bestätigt ist, können Sie den Echtzeitstandort Ihres Fahrers über die App verfolgen, um zu wissen, wann er ankommt.\",\"ar\":\"بمجرد تأكيد رحلتك، يمكنك تتبع الموقع الفعلي للسائق من خلال التطبيق لمعرفة موعد وصوله.\"}', 1, 1, '2025-01-23 00:17:57', '2025-01-23 00:38:31', NULL),
(4, '{\"en\":\"Can I cancel a ride after booking?\",\"de\":\"Kann ich eine Fahrt nach der Buchung stornieren?\",\"fr\":\"Puis-je annuler un trajet après la réservation ?\",\"ar\":\"هل يمكنني إلغاء الرحلة بعد الحجز؟\"}', '{\"en\":\"Yes, you can cancel your ride through the app before it starts. Cancellation fees may apply depending on the timing.\",\"de\":\"Ja, Sie können Ihre Fahrt vor Beginn über die App stornieren. Je nach Zeitpunkt können Stornierungsgebühren anfallen.\",\"fr\":\"Oui, vous pouvez annuler votre trajet via l\'application avant qu\'il ne commence. Des frais d\'annulation peuvent s\'appliquer en fonction du moment.\",\"ar\":\"نعم، يمكنك إلغاء رحلتك من خلال التطبيق قبل أن تبدأ. قد يتم تطبيق رسوم إلغاء اعتمادًا على التوقيت.\"}', 1, 1, '2025-01-23 00:17:57', '2025-01-23 00:40:38', NULL),
(5, '{\"en\":\"What is the Rental service?\",\"de\":\"Was ist der Mietservice?\",\"fr\":\"Qu\'est-ce que le service de location ?\",\"ar\":\"ما هو خدمة التأجير؟\"}', '{\"en\":\"Our rental service allows you to book a vehicle for a set number of hours, ideal for flexible and multiple stops during your trip.\",\"de\":\"Unser Mietservice ermöglicht es Ihnen, ein Fahrzeug für eine bestimmte Anzahl von Stunden zu buchen – ideal für flexible und mehrere Stopps während Ihrer Reise.\",\"fr\":\"Notre service de location vous permet de réserver un véhicule pour un nombre d\'heures déterminé, idéal pour des arrêts flexibles et multiples pendant votre voyage.\",\"ar\":\"تتيح لك خدمة التأجير لدينا حجز مركبة لعدد محدد من الساعات، وهي مثالية للتوقفات المرنة والمتعددة أثناء رحلتك\"}', 1, 1, '2025-01-23 00:17:57', '2025-01-23 00:42:34', NULL),
(6, '{\"en\":\"Can I schedule a ride in advance?\",\"de\":\"Kann ich eine Fahrt im Voraus planen?\",\"fr\":\"Puis-je planifier un trajet à l\'avance ?\",\"ar\":\"هل يمكنني جدولة رحلة مسبقًا؟\"}', '{\"en\":\"Yes, you can schedule a ride for a future date and time directly through our app or website.\",\"de\":\"Ja, Sie können eine Fahrt für ein zukünftiges Datum und eine zukünftige Uhrzeit direkt über unsere App oder Website planen.\",\"fr\":\"Oui, vous pouvez programmer un trajet pour une date et une heure futures directement via notre application ou notre site web.\",\"ar\":\"نعم، يمكنك جدولة رحلة لتاريخ ووقت مستقبلي مباشرة عبر تطبيقنا أو موقعنا الإلكتروني.\"}', 1, 1, '2025-01-23 00:17:57', '2025-01-23 00:45:45', NULL),
(7, '{\"en\":\"What should I do if I face an issue during my ride?\",\"de\":\"Was soll ich tun, wenn ich während meiner Fahrt ein Problem habe?\",\"fr\":\"Que dois-je faire si je rencontre un problème pendant mon trajet ?\",\"ar\":\"ماذا أفعل إذا واجهت مشكلة أثناء رحلتي؟\"}', '{\"en\":\"If you encounter any issues, contact our support team through the app or helpline. We’re here to assist you at every step.\",\"de\":\"Wenn Sie auf Probleme stoßen, kontaktieren Sie unser Support-Team über die App oder die Hotline. Wir sind hier, um Ihnen in jeder Phase zu helfen.\",\"fr\":\"En cas de problème, contactez notre équipe de support via l\'application ou la hotline. Nous sommes là pour vous aider à chaque étape.\",\"ar\":\"إذا واجهت أي مشكلة، اتصل بفريق الدعم الخاص بنا من خلال التطبيق أو خط المساعدة. نحن هنا لمساعدتك في كل خطوة.\"}', 1, 1, '2025-01-23 00:17:57', '2025-01-23 00:47:56', NULL),
(8, '{\"en\":\"What services do we offer?\",\"de\":\"Welche Dienstleistungen bieten wir an?\",\"fr\":\"Quels services proposons-nous ?\",\"ar\":\"ما هي الخدمات التي نقدمها؟\"}', '{\"en\":\"We offer a variety of services including ride-hailing, rental vehicles, and scheduled rides to suit your needs.\",\"de\":\"Wir bieten eine Vielzahl von Dienstleistungen an, darunter Fahrtenvermittlung, Mietfahrzeuge und geplante Fahrten, die Ihren Bedürfnissen entsprechen.\",\"fr\":\"Nous proposons une gamme de services, notamment le transport à la demande, la location de véhicules et les trajets planifiés pour répondre à vos besoins\",\"ar\":\"نحن نقدم مجموعة متنوعة من الخدمات بما في ذلك حجز الرحلات، وتأجير المركبات، والرحلات المجدولة لتلبية احتياجاتك.\"}', 1, 1, '2025-01-23 00:49:51', '2025-01-23 00:52:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fleet_manager_wallets`
--

CREATE TABLE `fleet_manager_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `fleet_manager_id` bigint UNSIGNED DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fleet_manager_wallets`
--

INSERT INTO `fleet_manager_wallets` (`id`, `fleet_manager_id`, `balance`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 64, 2730.00, '2025-04-29 01:28:55', '2025-04-29 01:31:37', NULL),
(4, 63, 150.00, '2025-04-29 01:30:36', '2025-04-29 01:30:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fleet_wallet_histories`
--

CREATE TABLE `fleet_wallet_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `fleet_wallet_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `type` enum('credit','debit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fleet_wallet_histories`
--

INSERT INTO `fleet_wallet_histories` (`id`, `fleet_wallet_id`, `order_id`, `amount`, `type`, `detail`, `transaction_id`, `from_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 3, NULL, 500.00, 'credit', 'Admin has credited the balance.', NULL, NULL, '2025-04-29 01:29:05', '2025-04-29 01:29:05', NULL),
(3, 3, NULL, 230.00, 'credit', 'Admin has credited the balance.', NULL, NULL, '2025-04-29 01:29:14', '2025-04-29 01:29:14', NULL),
(4, 4, NULL, 150.00, 'credit', 'Admin has credited the balance.', NULL, NULL, '2025-04-29 01:30:47', '2025-04-29 01:30:47', NULL),
(5, 3, NULL, 2000.00, 'credit', 'Admin has credited the balance.', NULL, NULL, '2025-04-29 01:31:37', '2025-04-29 01:31:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fleet_withdraw_requests`
--

CREATE TABLE `fleet_withdraw_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `amount` decimal(8,2) DEFAULT '0.00',
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `fleet_wallet_id` bigint UNSIGNED DEFAULT NULL,
  `fleet_manager_id` bigint UNSIGNED DEFAULT NULL,
  `payment_type` enum('paypal','bank') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'bank',
  `is_used_by_admin` int NOT NULL DEFAULT '0',
  `is_used` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_fields`
--

CREATE TABLE `form_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` int DEFAULT '1',
  `select_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `system_reserve` int NOT NULL DEFAULT '0',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_fields`
--

INSERT INTO `form_fields` (`id`, `label`, `name`, `type`, `placeholder`, `is_required`, `select_type`, `options`, `status`, `system_reserve`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Name', 'name', 'text', 'Enter Name', 1, NULL, NULL, 1, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(2, 'Email', 'email', 'email', 'Enter Email', 1, NULL, NULL, 1, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(3, 'Subject', 'subject', 'text', 'Enter Subject', 1, NULL, NULL, 1, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(4, 'Description', 'description', 'textarea', 'Enter Description', 1, NULL, NULL, 1, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hourly_packages`
--

CREATE TABLE `hourly_packages` (
  `id` bigint UNSIGNED NOT NULL,
  `distance_type` enum('mile','km') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'km',
  `distance` decimal(8,2) DEFAULT NULL,
  `hour` decimal(8,2) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hourly_packages`
--

INSERT INTO `hourly_packages` (`id`, `distance_type`, `distance`, `hour`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'km', 10.00, 1.00, 1, 1, '2025-01-23 04:57:33', '2025-01-23 04:57:33', NULL),
(2, 'km', 20.00, 2.00, 1, 1, '2025-01-23 04:57:57', '2025-01-23 04:57:57', NULL),
(3, 'km', 30.00, 4.00, 1, 1, '2025-01-23 04:58:19', '2025-01-23 04:58:19', NULL),
(4, 'mile', 25.00, 2.00, 1, 1, '2025-01-23 04:58:39', '2025-01-23 04:58:39', NULL),
(5, 'mile', 100.00, 8.00, 1, 1, '2025-01-23 04:59:09', '2025-01-23 04:59:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_bases`
--

CREATE TABLE `knowledge_bases` (
  `id` bigint UNSIGNED NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `knowledge_thumbnail_id` bigint UNSIGNED DEFAULT NULL,
  `knowledge_meta_image_id` bigint UNSIGNED DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_base_categories`
--

CREATE TABLE `knowledge_base_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category_image_id` bigint UNSIGNED DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category_meta_image_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_base_tags`
--

CREATE TABLE `knowledge_base_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by_id` bigint UNSIGNED NOT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_categories`
--

CREATE TABLE `knowledge_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `knowledge_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_tags`
--

CREATE TABLE `knowledge_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `knowledge_id` bigint UNSIGNED NOT NULL,
  `tag_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landing_pages`
--

CREATE TABLE `landing_pages` (
  `id` bigint UNSIGNED NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `landing_pages`
--

INSERT INTO `landing_pages` (`id`, `content`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":{\"_token\":\"CbJj8V4Lo52mTaT0gXnKJaaGPytjS05I1y83fi36\",\"_method\":\"PUT\",\"header\":{\"menus\":[\"Home\",\"Why Taxido?\",\"How It Works\",\"FAQs\",\"Blogs\",\"Testimonials\",\"Raise Ticket\"],\"btn_text\":\"Book Now\",\"status\":\"1\",\"logo\":\"/storage/754/dark.svg\"},\"home\":{\"title\":\"Ride with Comfort, Drive with Confidence\",\"description\":\"Where comfort meets confidence—ride with ease, drive with pride, and let us handle the rest, ensuring every journey is safe, reliable, and truly unforgettable.\",\"status\":\"1\",\"button\":[{\"text\":\"User App\",\"type\":\"gradient\",\"url\":null},{\"text\":\"Driver App\",\"type\":\"outline\",\"url\":null}],\"left_phone_image\":\"/storage/862/phone-2.png\",\"right_phone_image\":\"/storage/864/phone-1.png\",\"bg_image\":\"\"},\"statistics\":{\"title\":\"Driving Success Together\",\"description\":\"From countless completed rides to a thriving network of users and drivers, our journey is defined by excellence and customer satisfaction.\",\"status\":\"1\",\"counters\":[{\"text\":\"Completed Rides\",\"description\":\"Delivering trusted rides for countless happy Riders daily.\",\"count\":\"100000\",\"icon\":\"/storage/144/ride.svg\"},{\"text\":\"Active Users\",\"description\":\"Connecting with thousands who trust us for reliable rides.\",\"count\":\"50000\",\"icon\":\"/storage/146/user.svg\"},{\"text\":\"Active Drivers\",\"description\":\"Dedicated drivers ensuring safe, timely, and comfortable rides.\",\"count\":\"30000\",\"icon\":\"/storage/148/driver.svg\"},{\"text\":\"Customer Rating\",\"description\":\"Positive ratings that reflect trust and service excellence.\",\"count\":\"4.9\",\"icon\":\"/storage/150/rating.svg\"}]},\"feature\":{\"title\":\"Why Taxido Stands Out as Your Go-To Ride Option\",\"description\":\"With Taxido, enjoy affordable rates, safe journeys, and a user-friendly platform that makes travel easier and more enjoyable than ever before.\",\"status\":\"1\",\"images\":[{\"title\":\"Track Your Driver Live\",\"description\":\"Stay updated on your driver’s location every moment.\",\"image\":\"/storage/152/map.gif\"},{\"title\":\"Flexible Vehicle Rentals\",\"description\":\"Choose and rent vehicles tailored to your specific needs.\",\"image\":\"/storage/154/rent-vehicles.gif\"},{\"title\":\"Bidding Simplified\",\"description\":\"Accept or reject bids effortlessly for complete booking control.\",\"image\":\"/storage/156/booking-request.gif\"},{\"title\":\"Convenient Hourly Packages\",\"description\":\"Access services in your preferred language without barriers.\",\"image\":\"/storage/847/Package--1.gif\"},{\"title\":\"Language Options for Everyone\",\"description\":\"Access services in your preferred language without barriers.\",\"image\":\"/storage/160/language.gif\"},{\"title\":\"Secure Payment Choices\",\"description\":\"Multiple secure payment options to fit your preference.\",\"image\":\"/storage/162/payment.gif\"}]},\"ride\":{\"title\":\"How Taxido Makes Your Ride Easy\",\"description\":\"Get started in just a few simple steps. Choose your ride, track your driver, and enjoy a smooth, hassle-free journey with Taxido..\",\"status\":\"1\",\"step\":[{\"title\":\"Choose Your Ride\",\"description\":\"Select the perfect vehicle for your journey based on your needs and preferences.\",\"image\":\"/storage/849/home.png\"},{\"title\":\"Set Your Pickup Location\",\"description\":\"Enter your pickup location and let us know where you’d like to be picked up.\",\"image\":\"/storage/851/location.png\"},{\"title\":\"Find Your Driver\",\"description\":\"Get paired with a nearby driver and track their location in real-time..\",\"image\":\"/storage/853/ride.png\"},{\"title\":\"Complete Your Payment\",\"description\":\"Pay securely using your preferred payment option through our multi-gateway support.\",\"image\":\"/storage/855/payout.png\"},{\"title\":\"Rate Your Experience\",\"description\":\"Share your feedback to help us improve and enhance your future rides.\",\"image\":\"/storage/857/rating.png\"}]},\"blog\":{\"title\":\"Stay Updated with Taxido\",\"sub_title\":\"Be the first to know about exciting offers, latest updates, and helpful travel tips from Taxido. Stay informed and make the most out of your rides with insights and announcements tailored just for you.\",\"blogs\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],\"status\":\"1\"},\"testimonial\":{\"title\":\"What Our Users Say\",\"sub_title\":\"Real stories from our satisfied users. Taxido is transforming the way people commute, providing safe, reliable, and convenient rides.\",\"testimonials\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"],\"status\":\"1\"},\"faq\":{\"title\":\"Frequently Asked Questions\",\"sub_title\":\"Got questions? Explore our FAQs for quick answers about Taxido\'s features, services, and app usage. Booking a ride, scheduling, or exploring services? Find all the answers here.\",\"faqs\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\"],\"status\":\"1\"},\"footer\":{\"description\":\"Get started in minutes—choose your ride, track your driver, and enjoy a hassle-free journey with Taxido!\",\"newsletter\":{\"label\":\"Subscribe our Newsletter\",\"button_text\":\"Subscribe\",\"placeholder\":\"Enter email address\"},\"app_store_url\":\"https://play.google.com/store/games?hl=en\",\"play_store_url\":\"https://www.apple.com/in/app-store/\",\"copyright\":\"© Taxido All Rights & Reserves -\",\"social\":{\"facebook\":null,\"google\":null,\"instagram\":null,\"twitter\":null,\"whatsapp\":null,\"linkedin\":null},\"status\":\"1\",\"footer_logo\":\"/storage/647/dark.svg\",\"right_image\":\"/storage/859/footer.png\"},\"seo\":{\"meta_title\":\"Taxido - Your Reliable Ride-Hailing Partner\",\"meta_description\":\"Experience seamless and convenient transportation with Taxido. Book your ride easily and get to your destination safely with our reliable and efficient ride-hailing service.\",\"meta_tags\":\"taxido, ride-hailing, taxi service, transportation, car service, book a ride, city transport, ride sharing, reliable taxi, on-demand rides.\",\"og_title\":\"Taxido - The Future of Convenient Transportation\",\"og_description\":\"Discover Taxido, your ultimate ride-hailing solution. Enjoy fast, safe, and reliable transportation at your fingertips. Download our app today for a seamless travel experience.\",\"meta_image\":\"/front/images/logo.svg\"},\"analytics\":{\"pixel_id\":\"XXXXXXXXXXXXX\",\"measurement_id\":\"UA-XXXXXX-XX\",\"pixel_status\":\"1\",\"tag_id\":\"XXXXXXXXXXXXX\",\"tag_id_status\":\"0\",\"tawk_to_property_id\":\"67d8fe867a4f781911920f32\"},\"cookie\":{\"title\":null,\"description\":null,\"content\":null},\"undefined\":\"1\"},\"fr\":{\"_token\":\"S2rJDFVcPGkaMV3Or7vzZomQQn2o44xq9V18kxmv\",\"_method\":\"PUT\",\"header\":{\"menus\":[\"Home\",\"Why Taxido?\",\"How It Works\",\"FAQs\",\"Blogs\",\"Testimonials\",\"Raise Ticket\"],\"btn_text\":\"Ouvrir un ticket\",\"status\":\"1\",\"logo\":\"/storage/754/dark.svg\"},\"home\":{\"title\":\"Voyagez avec confort, conduisez avec confiance\",\"description\":\"Là où le confort rencontre la confiance—voyagez en toute simplicité, conduisez avec fierté, et laissez-nous nous occuper du reste, en veillant à ce que chaque voyage soit sûr, fiable et vraiment inoubliable.\",\"status\":\"1\",\"button\":[{\"text\":\"Application Utilisateur\",\"type\":\"gradient\",\"url\":null},{\"text\":\"Application Conducteur\",\"type\":\"outline\",\"url\":null}],\"bg_image\":\"\",\"left_phone_image\":\"/storage/773/Phone-2.png\",\"right_phone_image\":\"/storage/803/Phone-1.png\"},\"statistics\":{\"title\":\"Conduire le succès ensemble\",\"description\":\"De nombreux trajets effectués à un réseau florissant d\'utilisateurs et de conducteurs, notre voyage est défini par l\'excellence et la satisfaction client.\",\"status\":\"1\",\"counters\":[{\"text\":\"Trajets effectués\",\"description\":\"Offrir des trajets de confiance à d\'innombrables passagers heureux quotidiennement.\",\"count\":\"100000\",\"icon\":\"/storage/144/ride.svg\"},{\"text\":\"Utilisateurs actifs\",\"description\":\"Connecter des milliers de personnes qui nous font confiance pour des trajets fiables.\",\"count\":\"50000\",\"icon\":\"/storage/146/user.svg\"},{\"text\":\"Conducteurs actifs\",\"description\":\"Des conducteurs dévoués assurant des trajets sûrs, ponctuels et confortables.\",\"count\":\"30000\",\"icon\":\"/storage/148/driver.svg\"},{\"text\":\"Évaluation des clients\",\"description\":\"Des évaluations positives qui reflètent la confiance et l\'excellence du service.\",\"count\":\"4.9\",\"icon\":\"/storage/150/rating.svg\"}]},\"feature\":{\"title\":\"Pourquoi Taxido se distingue comme votre option de trajet préférée\",\"description\":\"Avec Taxido, profitez de tarifs abordables, de voyages sûrs et d\'une plateforme conviviale qui rend les déplacements plus faciles et plus agréables que jamais.\",\"status\":\"1\",\"images\":[{\"title\":\"Suivez votre conducteur en direct\",\"description\":\"Restez informé de la localisation de votre conducteur à tout moment.\",\"image\":\"/storage/152/map.gif\"},{\"title\":\"Location de véhicules flexible\",\"description\":\"Choisissez et louez des véhicules adaptés à vos besoins spécifiques.\",\"image\":\"/storage/154/rent-vehicles.gif\"},{\"title\":\"Enchères simplifiées\",\"description\":\"Acceptez ou refusez les offres sans effort pour un contrôle total de votre réservation.\",\"image\":\"/storage/156/booking-request.gif\"},{\"title\":\"Forfaits horaires pratiques\",\"description\":\"Accédez aux services dans votre langue préférée sans barrières.\",\"image\":\"/storage/158/package.gif\"},{\"title\":\"Options de langue pour tous\",\"description\":\"Accédez aux services dans votre langue préférée sans barrières.\",\"image\":\"/storage/160/language.gif\"},{\"title\":\"Choix de paiement sécurisés\",\"description\":\"Plusieurs options de paiement sécurisées pour répondre à vos préférences.\",\"image\":\"/storage/162/payment.gif\"}]},\"ride\":{\"title\":\"Comment Taxido facilite votre trajet\",\"description\":\"Commencez en quelques étapes simples. Choisissez votre trajet, suivez votre conducteur et profitez d\'un voyage fluide et sans tracas avec Taxido.\",\"status\":\"1\",\"step\":[{\"title\":\"Choisissez votre trajet\",\"description\":\"Sélectionnez le véhicule parfait pour votre voyage en fonction de vos besoins et préférences.\",\"image\":\"/storage/801/home-screen.png\"},{\"title\":\"Définissez votre lieu de prise en charge\",\"description\":\"Entrez votre lieu de prise en charge et indiquez-nous où vous souhaitez être pris en charge.\",\"image\":\"/storage/758/locations.png\"},{\"title\":\"Trouvez votre conducteur\",\"description\":\"Soyez jumelé à un conducteur à proximité et suivez sa localisation en temps réel.\",\"image\":\"/storage/760/vehicles.png\"},{\"title\":\"Finalisez votre paiement\",\"description\":\"Payez en toute sécurité en utilisant votre option de paiement préférée grâce à notre support multi-passerelles.\",\"image\":\"/storage/762/payout.png\"},{\"title\":\"Évaluez votre expérience\",\"description\":\"Partagez vos commentaires pour nous aider à améliorer et enrichir vos futurs trajets.\",\"image\":\"/storage/764/rating.png\"}]},\"blog\":{\"title\":\"Restez informé avec Taxido\",\"sub_title\":\"Soyez le premier à connaître les offres passionnantes, les dernières mises à jour et les conseils de voyage utiles de Taxido. Restez informé et profitez au maximum de vos trajets avec des informations et des annonces adaptées spécialement pour vous.\",\"blogs\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],\"status\":\"1\"},\"testimonial\":{\"title\":\"Ce que disent nos utilisateurs\",\"sub_title\":\"Des histoires réelles de nos utilisateurs satisfaits. Taxido transforme la façon dont les gens se déplacent, en offrant des trajets sûrs, fiables et pratiques.\",\"testimonials\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"],\"status\":\"1\"},\"faq\":{\"title\":\"Foire aux questions\",\"sub_title\":\"Des questions ? Explorez notre FAQ pour des réponses rapides sur les fonctionnalités, services et utilisation de l\'application Taxido. Réserver un trajet, planifier ou explorer des services ? Trouvez toutes les réponses ici.\",\"faqs\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\"],\"status\":\"1\"},\"footer\":{\"description\":\"Commencez en quelques minutes—choisissez votre trajet, suivez votre conducteur et profitez d\'un voyage sans tracas avec Taxido !\",\"newsletter\":{\"label\":\"Abonnez-vous à notre newsletter\",\"button_text\":\"S\'abonner\",\"placeholder\":\"Entrez votre adresse e-mail\"},\"app_store_url\":\"https://play.google.com/store/games?hl=en\",\"play_store_url\":\"https://www.apple.com/in/app-store/\",\"copyright\":\"© Taxido Tous droits réservés -\",\"social\":{\"facebook\":null,\"google\":null,\"instagram\":null,\"twitter\":null,\"whatsapp\":null,\"linkedin\":null},\"status\":\"1\",\"footer_logo\":\"/storage/647/dark.svg\",\"right_image\":\"/storage/142/footer-img.webp\"},\"seo\":{\"meta_title\":\"Taxido - Votre partenaire fiable de transport\",\"meta_description\":\"Vivez une expérience de transport fluide et pratique avec Taxido. Réservez facilement votre trajet et arrivez à destination en toute sécurité avec notre service de transport fiable et efficace.\",\"meta_tags\":\"taxido, ride-hailing, service de taxi, transport, service de voiture, réserver un trajet, transport urbain, covoiturage, taxi fiable, trajets à la demande.\",\"og_title\":\"Taxido - L\'avenir des transports pratiques\",\"og_description\":\"Découvrez Taxido, votre solution ultime de transport. Profitez de transports rapides, sûrs et fiables à portée de main. Téléchargez notre application dès aujourd\'hui pour une expérience de voyage fluide.\",\"meta_image\":\"/front/images/logo.svg\"},\"analytics\":{\"pixel_id\":\"XXXXXXXXXXXXX\",\"measurement_id\":\"UA-XXXXXX-XX\",\"pixel_status\":\"1\",\"tag_id\":\"XXXXXXXXXXXXX\",\"tag_id_status\":\"0\",\"tawk_to_property_id\":\"67d8fe867a4f781911920f32\"},\"cookie\":{\"title\":null,\"description\":null,\"content\":null},\"undefined\":\"1\"},\"de\":{\"_token\":\"lbDJgnXZ3muJ5ZzALfItAtuc6Jh0DdOvxyAW2vWx\",\"_method\":\"PUT\",\"header\":{\"menus\":[\"Home\",\"Warum Taxido?\",\"Wie es funktioniert\",\"FAQs\",\"Blogs\",\"Erfahrungsberichte\"],\"btn_text\":\"Ticket erstellen\",\"status\":\"1\",\"logo\":\"/storage/754/dark.svg\"},\"home\":{\"title\":\"Fahren Sie mit Komfort, fahren Sie mit Selbstvertrauen\",\"description\":\"Wo Komfort auf Selbstvertrauen trifft—fahren Sie mit Leichtigkeit, fahren Sie mit Stolz und überlassen Sie uns den Rest, um sicherzustellen, dass jede Reise sicher, zuverlässig und wirklich unvergesslich ist.\",\"status\":\"1\",\"button\":[{\"text\":\"Benutzer-App\",\"type\":\"gradient\",\"url\":null},{\"text\":\"Fahrer-App\",\"type\":\"outline\",\"url\":null}],\"left_phone_image\":\"/storage/773/Phone-2.png\",\"right_phone_image\":\"/storage/803/Phone-1.png\",\"bg_image\":\"\"},\"statistics\":{\"title\":\"Gemeinsam Erfolg fahren\",\"description\":\"Von unzähligen abgeschlossenen Fahrten zu einem florierenden Netzwerk von Nutzern und Fahrern—unsere Reise ist geprägt von Exzellenz und Kundenzufriedenheit.\",\"status\":\"1\",\"counters\":[{\"text\":\"Abgeschlossene Fahrten\",\"description\":\"Täglich vertrauenswürdige Fahrten für unzählige glückliche Fahrgäste.\",\"count\":\"100000\",\"icon\":\"/storage/144/ride.svg\"},{\"text\":\"Aktive Nutzer\",\"description\":\"Verbinden Sie sich mit Tausenden, die uns für zuverlässige Fahrten vertrauen.\",\"count\":\"50000\",\"icon\":\"/storage/146/user.svg\"},{\"text\":\"Aktive Fahrer\",\"description\":\"Engagierte Fahrer, die sichere, pünktliche und komfortable Fahrten gewährleisten.\",\"count\":\"30000\",\"icon\":\"/storage/148/driver.svg\"},{\"text\":\"Kundenbewertung\",\"description\":\"Positive Bewertungen, die Vertrauen und Servicequalität widerspiegeln.\",\"count\":\"4.9\",\"icon\":\"/storage/150/rating.svg\"}]},\"feature\":{\"title\":\"Warum Taxido Ihre bevorzugte Fahrtoption ist\",\"description\":\"Mit Taxido genießen Sie günstige Preise, sichere Fahrten und eine benutzerfreundliche Plattform, die das Reisen einfacher und angenehmer macht als je zuvor.\",\"status\":\"1\",\"images\":[{\"title\":\"Verfolgen Sie Ihren Fahrer live\",\"description\":\"Bleiben Sie über den Standort Ihres Fahrers auf dem Laufenden.\",\"image\":\"/storage/152/map.gif\"},{\"title\":\"Flexible Fahrzeugvermietung\",\"description\":\"Wählen und mieten Sie Fahrzeuge, die auf Ihre spezifischen Bedürfnisse zugeschnitten sind.\",\"image\":\"/storage/154/rent-vehicles.gif\"},{\"title\":\"Bietverfahren vereinfacht\",\"description\":\"Akzeptieren oder lehnen Sie Gebote mühelos ab, um die vollständige Kontrolle über Ihre Buchung zu haben.\",\"image\":\"/storage/156/booking-request.gif\"},{\"title\":\"Praktische Stundenpakete\",\"description\":\"Greifen Sie auf Dienstleistungen in Ihrer bevorzugten Sprache ohne Barrieren zu.\",\"image\":\"/storage/158/package.gif\"},{\"title\":\"Sprachoptionen für jeden\",\"description\":\"Greifen Sie auf Dienstleistungen in Ihrer bevorzugten Sprache ohne Barrieren zu.\",\"image\":\"/storage/160/language.gif\"},{\"title\":\"Sichere Zahlungsmöglichkeiten\",\"description\":\"Mehrere sichere Zahlungsoptionen, die Ihren Vorlieben entsprechen.\",\"image\":\"/storage/162/payment.gif\"}]},\"ride\":{\"title\":\"Wie Taxido Ihre Fahrt erleichtert\",\"description\":\"Starten Sie in wenigen einfachen Schritten. Wählen Sie Ihre Fahrt, verfolgen Sie Ihren Fahrer und genießen Sie eine reibungslose, stressfreie Fahrt mit Taxido.\",\"status\":\"1\",\"step\":[{\"title\":\"Wählen Sie Ihre Fahrt\",\"description\":\"Wählen Sie das perfekte Fahrzeug für Ihre Reise basierend auf Ihren Bedürfnissen und Vorlieben.\",\"image\":\"/storage/756/home-screen.png\"},{\"title\":\"Legen Sie Ihren Abholort fest\",\"description\":\"Geben Sie Ihren Abholort ein und teilen Sie uns mit, wo Sie abgeholt werden möchten.\",\"image\":\"/storage/758/locations.png\"},{\"title\":\"Finden Sie Ihren Fahrer\",\"description\":\"Werden Sie mit einem Fahrer in Ihrer Nähe verbunden und verfolgen Sie dessen Standort in Echtzeit.\",\"image\":\"/storage/760/vehicles.png\"},{\"title\":\"Schließen Sie Ihre Zahlung ab\",\"description\":\"Bezahlen Sie sicher mit Ihrer bevorzugten Zahlungsmethode über unsere Multi-Gateway-Unterstützung.\",\"image\":\"/storage/762/payout.png\"},{\"title\":\"Bewerten Sie Ihre Erfahrung\",\"description\":\"Teilen Sie Ihr Feedback, um uns zu helfen, Ihre zukünftigen Fahrten zu verbessern und zu bereichern.\",\"image\":\"/storage/764/rating.png\"}]},\"blog\":{\"title\":\"Bleiben Sie mit Taxido auf dem Laufenden\",\"sub_title\":\"Seien Sie der Erste, der spannende Angebote, die neuesten Updates und hilfreiche Reisetipps von Taxido erfährt. Bleiben Sie informiert und machen Sie das Beste aus Ihren Fahrten mit maßgeschneiderten Einblicken und Ankündigungen.\",\"blogs\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],\"status\":\"1\"},\"testimonial\":{\"title\":\"Was unsere Nutzer sagen\",\"sub_title\":\"Echte Geschichten von unseren zufriedenen Nutzern. Taxido verändert die Art und Weise, wie Menschen pendeln, und bietet sichere, zuverlässige und bequeme Fahrten.\",\"testimonials\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"],\"status\":\"1\"},\"faq\":{\"title\":\"Häufig gestellte Fragen\",\"sub_title\":\"Haben Sie Fragen? Durchsuchen Sie unsere FAQs für schnelle Antworten zu den Funktionen, Dienstleistungen und der Nutzung der Taxido-App. Eine Fahrt buchen, planen oder Dienstleistungen erkunden? Hier finden Sie alle Antworten.\",\"faqs\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\"],\"status\":\"1\"},\"footer\":{\"description\":\"Starten Sie in wenigen Minuten—wählen Sie Ihre Fahrt, verfolgen Sie Ihren Fahrer und genießen Sie eine stressfreie Fahrt mit Taxido!\",\"newsletter\":{\"label\":\"Abonnieren Sie unseren Newsletter\",\"button_text\":\"Abonnieren\",\"placeholder\":\"Geben Sie Ihre E-Mail-Adresse ein\"},\"quick_links\":[\"Home\",\"Warum Taxido?\",\"Wie es funktioniert\",\"FAQs\",\"Blogs\",\"Erfahrungsberichte\"],\"app_store_url\":\"https://play.google.com/store/games?hl=en\",\"play_store_url\":\"https://www.apple.com/in/app-store/\",\"copyright\":\"© Taxido Alle Rechte vorbehalten -\",\"social\":{\"facebook\":null,\"google\":null,\"instagram\":null,\"twitter\":null,\"whatsapp\":null,\"linkedin\":null},\"status\":\"1\",\"footer_logo\":\"/storage/647/dark.svg\",\"right_image\":\"/storage/142/footer-img.webp\"},\"seo\":{\"meta_title\":\"Taxido - Ihr zuverlässiger Ride-Hailing-Partner\",\"meta_description\":\"Erleben Sie nahtlosen und bequemen Transport mit Taxido. Buchen Sie Ihre Fahrt einfach und kommen Sie sicher an Ihr Ziel mit unserem zuverlässigen und effizienten Ride-Hailing-Service.\",\"meta_tags\":\"taxido, ride-hailing, Taxiservice, Transport, Autoservice, Fahrt buchen, Stadtverkehr, Mitfahrgelegenheit, zuverlässiges Taxi, On-Demand-Fahrten.\",\"og_title\":\"Taxido - Die Zukunft des bequemen Transports\",\"og_description\":\"Entdecken Sie Taxido, Ihre ultimative Ride-Hailing-Lösung. Genießen Sie schnellen, sicheren und zuverlässigen Transport. Laden Sie unsere App noch heute herunter für ein nahtloses Reiseerlebnis.\",\"meta_image\":\"/front/images/logo.svg\"},\"analytics\":{\"pixel_id\":\"XXXXXXXXXXXXX\",\"measurement_id\":\"UA-XXXXXX-XX\",\"pixel_status\":\"1\",\"tag_id\":\"XXXXXXXXXXXXX\",\"tag_id_status\":\"0\",\"tawk_to_property_id\":\"67d8fe867a4f781911920f32\"},\"cookie\":{\"title\":null,\"description\":null,\"content\":null}},\"ar\":{\"_token\":\"S2rJDFVcPGkaMV3Or7vzZomQQn2o44xq9V18kxmv\",\"_method\":\"PUT\",\"header\":{\"menus\":[\"Home\",\"Why Taxido?\",\"How It Works\",\"FAQs\",\"Blogs\",\"Testimonials\",\"Raise Ticket\"],\"btn_text\":\"فتح تذكرة\",\"status\":\"1\",\"logo\":\"/storage/754/dark.svg\"},\"home\":{\"title\":\"اركب براحة، قُد بثقة\",\"description\":\"حيث تلتقي الراحة بالثقة—اركب بسهولة، قُد بفخر، ودعنا نتعامل مع الباقي، لضمان أن تكون كل رحلة آمنة وموثوقة ولا تُنسى حقًا.\",\"status\":\"1\",\"button\":[{\"text\":\"تطبيق المستخدم\",\"type\":\"gradient\",\"url\":null},{\"text\":\"تطبيق السائق\",\"type\":\"outline\",\"url\":null}],\"bg_image\":\"\",\"left_phone_image\":\"/storage/773/Phone-2.png\",\"right_phone_image\":\"/storage/803/Phone-1.png\"},\"statistics\":{\"title\":\"قيادة النجاح معًا\",\"description\":\"من عدد لا يحصى من الرحلات المكتملة إلى شبكة مزدهرة من المستخدمين والسائقين، يتم تعريف رحلتنا بالتميز ورضا العملاء.\",\"status\":\"1\",\"counters\":[{\"text\":\"رحلات مكتملة\",\"description\":\"تقديم رحلات موثوقة لعدد لا يحصى من الركاب السعداء يوميًا.\",\"count\":\"100000\",\"icon\":\"/storage/144/ride.svg\"},{\"text\":\"مستخدمين نشطين\",\"description\":\"التواصل مع الآلاف الذين يثقون بنا لرحلات موثوقة.\",\"count\":\"50000\",\"icon\":\"/storage/146/user.svg\"},{\"text\":\"سائقين نشطين\",\"description\":\"سائقون مخلصون يضمنون رحلات آمنة وفي الوقت المحدد ومريحة.\",\"count\":\"30000\",\"icon\":\"/storage/148/driver.svg\"},{\"text\":\"تقييم العملاء\",\"description\":\"تقييمات إيجابية تعكس الثقة وتميز الخدمة.\",\"count\":\"4.9\",\"icon\":\"/storage/150/rating.svg\"}]},\"feature\":{\"title\":\"لماذا Taxido تبرز كخيارك المفضل للرحلات\",\"description\":\"مع Taxido، استمتع بأسعار معقولة، رحلات آمنة، ومنصة سهلة الاستخدام تجعل السفر أسهل وأكثر متعة من أي وقت مضى.\",\"status\":\"1\",\"images\":[{\"title\":\"تتبع سائقك مباشرة\",\"description\":\"ابق على اطلاع بموقع سائقك في كل لحظة.\",\"image\":\"/storage/152/map.gif\"},{\"title\":\"تأجير مركبات مرن\",\"description\":\"اختر واستأجر مركبات مصممة خصيصًا لاحتياجاتك.\",\"image\":\"/storage/154/rent-vehicles.gif\"},{\"title\":\"تبسيط العطاءات\",\"description\":\"اقبل أو ارفض العطاءات بسهولة للتحكم الكامل في الحجز.\",\"image\":\"/storage/156/booking-request.gif\"},{\"title\":\"باقات ساعة مريحة\",\"description\":\"الوصول إلى الخدمات بلغتك المفضلة دون عوائق.\",\"image\":\"/storage/158/package.gif\"},{\"title\":\"خيارات اللغة للجميع\",\"description\":\"الوصول إلى الخدمات بلغتك المفضلة دون عوائق.\",\"image\":\"/storage/160/language.gif\"},{\"title\":\"خيارات دفع آمنة\",\"description\":\"خيارات دفع متعددة وآمنة تناسب تفضيلاتك.\",\"image\":\"/storage/162/payment.gif\"}]},\"ride\":{\"title\":\"كيف تجعل Taxido رحلتك سهلة\",\"description\":\"ابدأ في بضع خطوات بسيطة. اختر رحلتك، تتبع سائقك، واستمتع برحلة سلسة وخالية من المتاعب مع Taxido.\",\"status\":\"1\",\"step\":[{\"title\":\"اختر رحلتك\",\"description\":\"اختر المركبة المثالية لرحلتك بناءً على احتياجاتك وتفضيلاتك.\",\"image\":\"/storage/801/home-screen.png\"},{\"title\":\"حدد موقع الالتقاط\",\"description\":\"أدخل موقع الالتقاط وأخبرنا أين تريد أن يتم اصطحابك.\",\"image\":\"/storage/758/locations.png\"},{\"title\":\"ابحث عن سائقك\",\"description\":\"تم إقرانك بسائق قريب وتتبع موقعه في الوقت الفعلي.\",\"image\":\"/storage/760/vehicles.png\"},{\"title\":\"أكمل الدفع\",\"description\":\"ادفع بأمان باستخدام خيار الدفع المفضل لديك من خلال دعمنا متعدد البوابات.\",\"image\":\"/storage/762/payout.png\"},{\"title\":\"قيم تجربتك\",\"description\":\"شارك تعليقاتك لمساعدتنا على التحسين وتعزيز رحلاتك المستقبلية.\",\"image\":\"/storage/764/rating.png\"}]},\"blog\":{\"title\":\"ابقَ على اطلاع مع Taxido\",\"sub_title\":\"كن أول من يعرف عن العروض المثيرة، آخر التحديثات، ونصائح السفر المفيدة من Taxido. ابقَ على اطلاع واستفد إلى أقصى حد من رحلاتك مع رؤى وإعلانات مصممة خصيصًا لك.\",\"blogs\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],\"status\":\"1\"},\"testimonial\":{\"title\":\"ما يقوله مستخدمونا\",\"sub_title\":\"قصص حقيقية من مستخدمينا الراضين. Taxido تغير الطريقة التي يتنقل بها الناس، وتوفر رحلات آمنة وموثوقة ومريحة.\",\"testimonials\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"],\"status\":\"1\"},\"faq\":{\"title\":\"الأسئلة الشائعة\",\"sub_title\":\"هل لديك أسئلة؟ استكشف الأسئلة الشائعة للحصول على إجابات سريعة حول ميزات Taxido وخدماتها واستخدام التطبيق. حجز رحلة، جدولة، أو استكشاف الخدمات؟ ستجد جميع الإجابات هنا.\",\"faqs\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\"],\"status\":\"1\"},\"footer\":{\"description\":\"ابدأ في دقائق—اختر رحلتك، تتبع سائقك، واستمتع برحلة خالية من المتاعب مع Taxido!\",\"newsletter\":{\"label\":\"اشترك في نشرتنا الإخبارية\",\"button_text\":\"اشتراك\",\"placeholder\":\"أدخل عنوان البريد الإلكتروني\"},\"app_store_url\":\"https://play.google.com/store/games?hl=en\",\"play_store_url\":\"https://www.apple.com/in/app-store/\",\"copyright\":\"© Taxido جميع الحقوق محفوظة -\",\"social\":{\"facebook\":null,\"google\":null,\"instagram\":null,\"twitter\":null,\"whatsapp\":null,\"linkedin\":null},\"status\":\"1\",\"footer_logo\":\"/storage/647/dark.svg\",\"right_image\":\"/storage/142/footer-img.webp\"},\"seo\":{\"meta_title\":\"Taxido - شريكك الموثوق في النقل\",\"meta_description\":\"جرب النقل السلس والمريح مع Taxido. احجز رحلتك بسهولة ووصل إلى وجهتك بأمان مع خدمة النقل الموثوقة والفعالة لدينا.\",\"meta_tags\":\"taxido, ride-hailing, خدمة سيارات الأجرة, نقل, خدمة سيارات, حجز رحلة, نقل حضري, مشاركة الركوب, سيارات أجرة موثوقة, رحلات عند الطلب.\",\"og_title\":\"Taxido - مستقبل النقل المريح\",\"og_description\":\"اكتشف Taxido، الحل النهائي للنقل. استمتع بنقل سريع وآمن وموثوق في متناول يدك. قم بتنزيل تطبيقنا اليوم لتجربة سفر سلسة.\",\"meta_image\":\"/front/images/logo.svg\"},\"analytics\":{\"pixel_id\":\"XXXXXXXXXXXXX\",\"measurement_id\":\"UA-XXXXXX-XX\",\"pixel_status\":\"1\",\"tag_id\":\"XXXXXXXXXXXXX\",\"tag_id_status\":\"0\",\"tawk_to_property_id\":\"67d8fe867a4f781911920f32\"},\"cookie\":{\"title\":null,\"description\":null,\"content\":null},\"undefined\":\"1\"},\"_token\":\"CbJj8V4Lo52mTaT0gXnKJaaGPytjS05I1y83fi36\",\"_method\":\"PUT\",\"header\":{\"menus\":[\"Home\",\"Why Taxido?\",\"How It Works\",\"FAQs\",\"Blogs\",\"Testimonials\",\"Raise Ticket\"],\"btn_text\":\"Book Now\",\"status\":\"1\",\"logo\":\"/storage/754/dark.svg\"},\"home\":{\"title\":\"Ride with Comfort, Drive with Confidence\",\"description\":\"Where comfort meets confidence—ride with ease, drive with pride, and let us handle the rest, ensuring every journey is safe, reliable, and truly unforgettable.\",\"status\":\"1\",\"button\":[{\"text\":\"User App\",\"type\":\"gradient\",\"url\":null},{\"text\":\"Driver App\",\"type\":\"outline\",\"url\":null}],\"left_phone_image\":\"/storage/862/phone-2.png\",\"right_phone_image\":\"/storage/864/phone-1.png\",\"bg_image\":\"\"},\"statistics\":{\"title\":\"Driving Success Together\",\"description\":\"From countless completed rides to a thriving network of users and drivers, our journey is defined by excellence and customer satisfaction.\",\"status\":\"1\",\"counters\":[{\"text\":\"Completed Rides\",\"description\":\"Delivering trusted rides for countless happy Riders daily.\",\"count\":\"100000\",\"icon\":\"/storage/144/ride.svg\"},{\"text\":\"Active Users\",\"description\":\"Connecting with thousands who trust us for reliable rides.\",\"count\":\"50000\",\"icon\":\"/storage/146/user.svg\"},{\"text\":\"Active Drivers\",\"description\":\"Dedicated drivers ensuring safe, timely, and comfortable rides.\",\"count\":\"30000\",\"icon\":\"/storage/148/driver.svg\"},{\"text\":\"Customer Rating\",\"description\":\"Positive ratings that reflect trust and service excellence.\",\"count\":\"4.9\",\"icon\":\"/storage/150/rating.svg\"}]},\"feature\":{\"title\":\"Why Taxido Stands Out as Your Go-To Ride Option\",\"description\":\"With Taxido, enjoy affordable rates, safe journeys, and a user-friendly platform that makes travel easier and more enjoyable than ever before.\",\"status\":\"1\",\"images\":[{\"title\":\"Track Your Driver Live\",\"description\":\"Stay updated on your driver’s location every moment.\",\"image\":\"/storage/152/map.gif\"},{\"title\":\"Flexible Vehicle Rentals\",\"description\":\"Choose and rent vehicles tailored to your specific needs.\",\"image\":\"/storage/154/rent-vehicles.gif\"},{\"title\":\"Bidding Simplified\",\"description\":\"Accept or reject bids effortlessly for complete booking control.\",\"image\":\"/storage/156/booking-request.gif\"},{\"title\":\"Convenient Hourly Packages\",\"description\":\"Access services in your preferred language without barriers.\",\"image\":\"/storage/847/Package--1.gif\"},{\"title\":\"Language Options for Everyone\",\"description\":\"Access services in your preferred language without barriers.\",\"image\":\"/storage/160/language.gif\"},{\"title\":\"Secure Payment Choices\",\"description\":\"Multiple secure payment options to fit your preference.\",\"image\":\"/storage/162/payment.gif\"}]},\"ride\":{\"title\":\"How Taxido Makes Your Ride Easy\",\"description\":\"Get started in just a few simple steps. Choose your ride, track your driver, and enjoy a smooth, hassle-free journey with Taxido..\",\"status\":\"1\",\"step\":[{\"title\":\"Choose Your Ride\",\"description\":\"Select the perfect vehicle for your journey based on your needs and preferences.\",\"image\":\"/storage/849/home.png\"},{\"title\":\"Set Your Pickup Location\",\"description\":\"Enter your pickup location and let us know where you’d like to be picked up.\",\"image\":\"/storage/851/location.png\"},{\"title\":\"Find Your Driver\",\"description\":\"Get paired with a nearby driver and track their location in real-time..\",\"image\":\"/storage/853/ride.png\"},{\"title\":\"Complete Your Payment\",\"description\":\"Pay securely using your preferred payment option through our multi-gateway support.\",\"image\":\"/storage/855/payout.png\"},{\"title\":\"Rate Your Experience\",\"description\":\"Share your feedback to help us improve and enhance your future rides.\",\"image\":\"/storage/857/rating.png\"}]},\"blog\":{\"title\":\"Stay Updated with Taxido\",\"sub_title\":\"Be the first to know about exciting offers, latest updates, and helpful travel tips from Taxido. Stay informed and make the most out of your rides with insights and announcements tailored just for you.\",\"blogs\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],\"status\":\"1\"},\"testimonial\":{\"title\":\"What Our Users Say\",\"sub_title\":\"Real stories from our satisfied users. Taxido is transforming the way people commute, providing safe, reliable, and convenient rides.\",\"testimonials\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"],\"status\":\"1\"},\"faq\":{\"title\":\"Frequently Asked Questions\",\"sub_title\":\"Got questions? Explore our FAQs for quick answers about Taxido\'s features, services, and app usage. Booking a ride, scheduling, or exploring services? Find all the answers here.\",\"faqs\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\"],\"status\":\"1\"},\"footer\":{\"description\":\"Get started in minutes—choose your ride, track your driver, and enjoy a hassle-free journey with Taxido!\",\"newsletter\":{\"label\":\"Subscribe our Newsletter\",\"button_text\":\"Subscribe\",\"placeholder\":\"Enter email address\"},\"app_store_url\":\"https://play.google.com/store/games?hl=en\",\"play_store_url\":\"https://www.apple.com/in/app-store/\",\"copyright\":\"© Taxido All Rights & Reserves -\",\"social\":{\"facebook\":null,\"google\":null,\"instagram\":null,\"twitter\":null,\"whatsapp\":null,\"linkedin\":null},\"status\":\"1\",\"footer_logo\":\"/storage/647/dark.svg\",\"right_image\":\"/storage/859/footer.png\"},\"seo\":{\"meta_title\":\"Taxido - Your Reliable Ride-Hailing Partner\",\"meta_description\":\"Experience seamless and convenient transportation with Taxido. Book your ride easily and get to your destination safely with our reliable and efficient ride-hailing service.\",\"meta_tags\":\"taxido, ride-hailing, taxi service, transportation, car service, book a ride, city transport, ride sharing, reliable taxi, on-demand rides.\",\"og_title\":\"Taxido - The Future of Convenient Transportation\",\"og_description\":\"Discover Taxido, your ultimate ride-hailing solution. Enjoy fast, safe, and reliable transportation at your fingertips. Download our app today for a seamless travel experience.\",\"meta_image\":\"/front/images/logo.svg\"},\"analytics\":{\"pixel_id\":\"XXXXXXXXXXXXX\",\"measurement_id\":\"UA-XXXXXX-XX\",\"pixel_status\":\"1\",\"tag_id\":\"XXXXXXXXXXXXX\",\"tag_id_status\":\"0\",\"tawk_to_property_id\":\"67d8fe867a4f781911920f32\"},\"cookie\":{\"title\":null,\"description\":null,\"content\":null},\"undefined\":\"1\"}', '2025-06-14 04:57:34', '2025-07-21 01:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_rtl` int DEFAULT '0',
  `status` int DEFAULT '1',
  `system_reserve` int NOT NULL DEFAULT '0',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `locale`, `flag`, `app_locale`, `is_rtl`, `status`, `system_reserve`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'English', 'en', 'US.png', 'en_EN', 0, 1, 1, 1, '2025-01-22 23:43:06', '2025-07-17 03:51:05', NULL),
(2, 'Arabic', 'ar', 'AF.png', 'ar_SA', 1, 1, 0, 1, '2025-01-22 23:43:06', '2025-07-17 03:51:05', NULL),
(3, 'German', 'de', 'BE.png', 'de_DE', 0, 1, 0, 1, '2025-01-22 23:43:06', '2025-03-06 06:05:13', '2025-03-06 11:38:20'),
(4, 'French', 'fr', 'CS.png', 'fr_FR', 0, 1, 0, 1, '2025-01-22 23:43:06', '2025-07-17 03:51:05', NULL),
(5, 'Spanish', 'es', 'ES.png', 'es_ES', 0, 1, 0, 1, '2025-06-09 17:23:31', '2025-07-17 03:51:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint UNSIGNED NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rider_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `title`, `location`, `type`, `rider_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'My home', '2597 Sacramento St, San Francisco, CA 94115, USA', 'home', 43, '2025-01-28 01:28:20', '2025-01-28 01:28:20', NULL),
(2, 'Downtown Toronto', 'Yonge Street, Toronto, ON M5B 1N8, Canada', 'work', 3, '2025-06-09 16:05:11', '2025-06-09 16:05:11', NULL),
(3, 'Midtown Manhattan', '5th Avenue, New York, NY 10001, USA', 'work', 3, '2025-06-09 16:07:07', '2025-06-09 16:07:07', NULL),
(4, 'Central London', 'Oxford Street, London W1D 2DH, United Kingdom', 'work', 3, '2025-06-09 16:07:21', '2025-06-09 16:07:21', NULL),
(5, 'Upper West Side', 'West 75th Street, New York, NY 10023, USA', 'home', 3, '2025-06-09 16:08:04', '2025-06-09 16:08:04', NULL),
(6, 'Bondi', 'Curlewis Street, Bondi Beach NSW 2026, Australia', 'home', 3, '2025-06-09 16:08:21', '2025-06-09 16:08:21', NULL),
(7, 'Back Bay', 'Commonwealth Avenue, Boston, MA 02116, USA', 'home', 3, '2025-06-09 16:08:35', '2025-06-09 16:08:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'public',
  `conversions_disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'public',
  `size` bigint UNSIGNED DEFAULT NULL,
  `manipulations` json DEFAULT NULL,
  `custom_properties` json DEFAULT NULL,
  `generated_conversions` json DEFAULT NULL,
  `responsive_images` json DEFAULT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `alternative_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_id`, `model_type`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`, `alternative_text`) VALUES
(1, NULL, NULL, '261eda7b-f496-4186-b50c-db62a8fe5b3c', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-22 23:43:06', '2025-01-22 23:43:06', '2025-01-22 23:43:06', NULL),
(2, '1', 'App\\Models\\Attachment', '78d1c055-f8a1-4d77-8d3b-d92cb601964d', 'attachment', 'logo', 'logo.svg', 'image/svg+xml', 'public', 'public', 5163, '[]', '[]', '[]', '[]', 1, 1, '2025-01-22 23:43:06', '2025-07-16 23:27:06', '2025-07-16 23:27:06', NULL),
(3, '1', 'App\\Models\\Attachment', '7b4bd037-817a-44fc-acac-f3120c20f065', 'attachment', 'dark-logo', 'dark-logo.svg', 'image/svg+xml', 'public', 'public', 5151, '[]', '[]', '[]', '[]', 2, 1, '2025-01-22 23:43:06', '2025-07-16 23:27:08', '2025-07-16 23:27:08', NULL),
(4, '1', 'App\\Models\\Attachment', '7bed60e8-d5c8-4928-ab6d-e2a25cdbde42', 'attachment', 'favicon', 'favicon.svg', 'image/svg+xml', 'public', 'public', 5720, '[]', '[]', '[]', '[]', 3, 1, '2025-01-22 23:43:06', '2025-07-16 23:26:02', '2025-07-16 23:26:02', NULL),
(5, NULL, NULL, 'bf03f1b6-aaba-47dc-a7b0-be18408c06da', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(6, '5', 'App\\Models\\Attachment', '27f3887f-f900-4634-a36a-e94ae7fdfdf1', 'attachment', 'auto', 'auto.png', 'image/png', 'public', 'public', 751806, '[]', '[]', '[]', '[]', 1, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(7, '5', 'App\\Models\\Attachment', 'bd9479e4-f044-4e88-97a7-fe11576eced2', 'attachment', 'banner-1', 'banner-1.png', 'image/png', 'public', 'public', 100262, '[]', '[]', '[]', '[]', 2, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(8, '5', 'App\\Models\\Attachment', '4100de2c-024b-4a28-95ba-5e4c60bca3d2', 'attachment', 'banner-2', 'banner-2.png', 'image/png', 'public', 'public', 386306, '[]', '[]', '[]', '[]', 3, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(9, '5', 'App\\Models\\Attachment', '98fcfd15-5719-419c-bd7a-f393b4fd929f', 'attachment', 'bike', 'bike.png', 'image/png', 'public', 'public', 1303002, '[]', '[]', '[]', '[]', 4, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(10, '5', 'App\\Models\\Attachment', '16e9bdac-32f7-4668-be59-e173ee813eb7', 'attachment', 'car', 'car.png', 'image/png', 'public', 'public', 1248747, '[]', '[]', '[]', '[]', 5, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(11, '5', 'App\\Models\\Attachment', '7d06e627-9d2c-472f-a7d4-f2414066ff66', 'attachment', 'top-car', 'top-car.png', 'image/png', 'public', 'public', 104313, '[]', '[]', '[]', '[]', 6, 1, '2025-01-22 23:43:07', '2025-07-16 23:02:09', '2025-07-16 23:02:09', NULL),
(12, '5', 'App\\Models\\Attachment', '08f36588-700a-4805-a73c-04a0f9fe9bf5', 'attachment', 'cargo-van', 'cargo-van.png', 'image/png', 'public', 'public', 1236637, '[]', '[]', '[]', '[]', 7, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(13, '5', 'App\\Models\\Attachment', '3c5e0326-d988-463c-866e-e6ae8edd12c6', 'attachment', 'top-bike', 'top-bike.png', 'image/png', 'public', 'public', 336796, '[]', '[]', '[]', '[]', 8, 1, '2025-01-22 23:43:07', '2025-07-16 23:05:52', '2025-07-16 23:05:52', NULL),
(14, '5', 'App\\Models\\Attachment', '24bc8026-f5b9-4d04-8dd9-a14cc068c9fd', 'attachment', 'top-truck', 'top-truck.png', 'image/png', 'public', 'public', 35900, '[]', '[]', '[]', '[]', 9, 1, '2025-01-22 23:43:07', '2025-07-17 00:15:41', '2025-07-17 00:15:41', NULL),
(15, '5', 'App\\Models\\Attachment', 'f4fe8c22-4a50-41d9-b742-f7890ee0bb97', 'attachment', 'top-primecar', 'top-primecar.png', 'image/png', 'public', 'public', 109735, '[]', '[]', '[]', '[]', 10, 1, '2025-01-22 23:43:07', '2025-07-17 00:29:37', '2025-07-17 00:29:37', NULL),
(16, '5', 'App\\Models\\Attachment', 'a53ca5cb-4b50-4fa3-8486-0ee2bfd9bda6', 'attachment', 'top-chhota-hathi', 'top-chhota-hathi.png', 'image/png', 'public', 'public', 96670, '[]', '[]', '[]', '[]', 11, 1, '2025-01-22 23:43:07', '2025-07-17 00:09:33', '2025-07-17 00:09:33', NULL),
(17, '5', 'App\\Models\\Attachment', '98228842-c965-458c-a64f-1dc6d21d1ab8', 'attachment', 'top-cargovan', 'top-cargovan.png', 'image/png', 'public', 'public', 138484, '[]', '[]', '[]', '[]', 12, 1, '2025-01-22 23:43:07', '2025-07-17 00:33:34', '2025-07-17 00:33:34', NULL),
(18, '5', 'App\\Models\\Attachment', '37cc2784-69ba-4c80-ae18-f3db20cfa848', 'attachment', 'bolero', 'bolero.png', 'image/png', 'public', 'public', 1054691, '[]', '[]', '[]', '[]', 13, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(19, '5', 'App\\Models\\Attachment', '926a0f4f-ee94-4085-83e6-b88215dec9b3', 'attachment', 'top-bolero', 'top-bolero.png', 'image/png', 'public', 'public', 69194, '[]', '[]', '[]', '[]', 14, 1, '2025-01-22 23:43:07', '2025-07-16 23:37:38', '2025-07-16 23:37:38', NULL),
(20, '5', 'App\\Models\\Attachment', '21e0dbd0-9ecd-4616-ad9c-d30bbc492d26', 'attachment', 'Chota-hathi', 'Chota-hathi.png', 'image/png', 'public', 'public', 706719, '[]', '[]', '[]', '[]', 15, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(21, '5', 'App\\Models\\Attachment', '2b076b96-420d-4a79-a6b9-1309a8d89945', 'attachment', 'top-auto', 'top-auto.png', 'image/png', 'public', 'public', 74157, '[]', '[]', '[]', '[]', 16, 1, '2025-01-22 23:43:07', '2025-07-16 22:59:04', '2025-07-16 22:59:04', NULL),
(22, '5', 'App\\Models\\Attachment', '1d112290-49ab-4f6a-b77e-882584da28f2', 'attachment', 'freight', 'freight.svg', 'image/svg+xml', 'public', 'public', 58675, '[]', '[]', '[]', '[]', 17, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(23, '5', 'App\\Models\\Attachment', '050bc7f5-908d-45e0-8f21-f210696886d7', 'attachment', 'cab-icon', 'cab-icon.svg', 'image/svg+xml', 'public', 'public', 1238, '[]', '[]', '[]', '[]', 18, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(24, '5', 'App\\Models\\Attachment', 'ecd5dc7d-0661-4f64-906d-1e9b0ea61ead', 'attachment', 'big-truck', 'big-truck.png', 'image/png', 'public', 'public', 464782, '[]', '[]', '[]', '[]', 19, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(25, '5', 'App\\Models\\Attachment', '1e9d6e75-ca89-428e-b7e4-e9c358aac493', 'attachment', 'top-big-truck', 'top-big-truck.png', 'image/png', 'public', 'public', 2117074, '[]', '[]', '[]', '[]', 20, 1, '2025-01-22 23:43:07', '2025-07-17 00:33:48', '2025-07-17 00:33:48', NULL),
(26, '5', 'App\\Models\\Attachment', '43eeed35-67b9-4e06-9bf4-e4db8be491f8', 'attachment', 'tempo', 'tempo.png', 'image/png', 'public', 'public', 473065, '[]', '[]', '[]', '[]', 21, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(27, '5', 'App\\Models\\Attachment', 'deb4dacc-e24b-4ae3-b0b8-0487fca674c3', 'attachment', 'top-tempo', 'top-tempo.png', 'image/png', 'public', 'public', 2288402, '[]', '[]', '[]', '[]', 22, 1, '2025-01-22 23:43:07', '2025-07-17 00:34:24', '2025-07-17 00:34:24', NULL),
(28, '5', 'App\\Models\\Attachment', '02ff1cbf-73fc-42a6-8f1e-67358740c779', 'attachment', 'truck', 'truck.png', 'image/png', 'public', 'public', 911696, '[]', '[]', '[]', '[]', 23, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(29, '5', 'App\\Models\\Attachment', '20a15dd1-0cd2-407f-9971-c2f88062d539', 'attachment', 'prime', 'prime.png', 'image/png', 'public', 'public', 1452605, '[]', '[]', '[]', '[]', 24, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(30, '5', 'App\\Models\\Attachment', 'e2c9ae65-1f40-4a3a-811f-43173fa0b8e7', 'attachment', 'parcel-icon', 'parcel-icon.svg', 'image/svg+xml', 'public', 'public', 1112, '[]', '[]', '[]', '[]', 25, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(31, '5', 'App\\Models\\Attachment', '3be3a4a3-bb01-4ac7-a3c6-d59c1a01dece', 'attachment', 'freight-icon', 'freight-icon.svg', 'image/svg+xml', 'public', 'public', 1950, '[]', '[]', '[]', '[]', 26, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(32, '5', 'App\\Models\\Attachment', '7daf0b75-79c8-4359-8e50-e971c16c79c1', 'attachment', 'outstation-banner', 'outstation-banner.png', 'image/png', 'public', 'public', 44731, '[]', '[]', '[]', '[]', 27, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(33, '5', 'App\\Models\\Attachment', '87d8543e-e8cb-450e-80c3-29f377752932', 'attachment', 'package', 'package.png', 'image/png', 'public', 'public', 13606, '[]', '[]', '[]', '[]', 28, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(34, '5', 'App\\Models\\Attachment', 'a5e8cc6e-40c0-4157-a912-a7648138347f', 'attachment', 'outstation-image', 'outstation-image.png', 'image/png', 'public', 'public', 12873, '[]', '[]', '[]', '[]', 29, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(35, '5', 'App\\Models\\Attachment', 'b647c695-bee7-498b-a823-07e585dd376f', 'attachment', 'parcel', 'parcel.svg', 'image/svg+xml', 'public', 'public', 2006071, '[]', '[]', '[]', '[]', 30, 1, '2025-01-22 23:43:07', '2025-01-22 23:43:07', NULL, NULL),
(36, '5', 'App\\Models\\Attachment', '55e5323d-2021-44e7-bf5c-e1a1b778fcec', 'attachment', 'rental', 'rental.svg', 'image/svg+xml', 'public', 'public', 272799, '[]', '[]', '[]', '[]', 31, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL, NULL),
(37, '5', 'App\\Models\\Attachment', 'b840ed46-ab19-424c-90fb-acb355b89ba0', 'attachment', 'rental-banner', 'rental-banner.png', 'image/png', 'public', 'public', 40347, '[]', '[]', '[]', '[]', 32, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL, NULL),
(38, '5', 'App\\Models\\Attachment', '76363a17-a1d1-4ee8-b860-61c7de490a53', 'attachment', 'rental-image', 'rental-image.png', 'image/png', 'public', 'public', 6131, '[]', '[]', '[]', '[]', 33, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL, NULL),
(39, '5', 'App\\Models\\Attachment', 'c1ea4a2c-7e27-4c7d-8b0c-4da5aa9004ca', 'attachment', 'ride-banner', 'ride-banner.png', 'image/png', 'public', 'public', 30285, '[]', '[]', '[]', '[]', 34, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL, NULL),
(40, '5', 'App\\Models\\Attachment', 'b9e16581-a5b0-4014-9fff-508373f71fad', 'attachment', 'ride-image', 'ride-image.png', 'image/png', 'public', 'public', 9401, '[]', '[]', '[]', '[]', 35, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL, NULL),
(41, '5', 'App\\Models\\Attachment', 'd23c5ae2-da90-47a7-8301-77bd793f220b', 'attachment', 'schedule-banner', 'schedule-banner.png', 'image/png', 'public', 'public', 41301, '[]', '[]', '[]', '[]', 36, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL, NULL),
(42, '5', 'App\\Models\\Attachment', 'e5ff9b6e-0359-4e51-8fe3-362914c4c8ed', 'attachment', 'schedule-image', 'schedule-image.png', 'image/png', 'public', 'public', 8139, '[]', '[]', '[]', '[]', 37, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL, NULL),
(43, NULL, NULL, 'cb18db87-b377-4bd8-8acf-b4e25b42bfb8', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 00:36:59', '2025-01-23 00:36:59', '2025-01-23 00:36:59', NULL),
(44, '43', 'App\\Models\\Attachment', 'af7e7012-f9be-43cb-b3df-073e92aae0f5', 'file', 'image-46', 'image-46.svg', 'image/svg+xml', 'public', 'public', 224871, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 00:36:59', '2025-01-23 00:36:59', NULL, NULL),
(45, NULL, NULL, '742f8053-fc7e-471a-8d4d-57a58fbcfe2a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 00:37:01', '2025-01-23 00:37:01', '2025-01-23 00:37:01', NULL),
(46, '45', 'App\\Models\\Attachment', '349e2b42-3bb8-44f0-8310-c6437940f530', 'file', 'image-37', 'image-37.svg', 'image/svg+xml', 'public', 'public', 244502, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 00:37:01', '2025-01-23 00:37:01', NULL, NULL),
(47, NULL, NULL, '28d424cb-e16c-4dbb-9724-6bfc623684e3', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 00:37:01', '2025-01-23 00:37:01', '2025-01-23 00:37:01', NULL),
(48, NULL, NULL, '6aabd2b6-231f-4172-9eb9-e10e319f8d18', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-23 00:37:01', '2025-01-23 00:37:01', '2025-01-23 00:37:01', NULL),
(49, '47', 'App\\Models\\Attachment', '81908ede-fa6b-4629-9152-816849643ffd', 'file', 'image-42', 'image-42.svg', 'image/svg+xml', 'public', 'public', 254678, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 00:37:01', '2025-01-23 00:37:01', NULL, NULL),
(50, '48', 'App\\Models\\Attachment', '50ba642f-5726-4267-b73d-042eacbd4230', 'file', 'image-40', 'image-40.svg', 'image/svg+xml', 'public', 'public', 245726, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 00:37:01', '2025-01-23 00:37:01', NULL, NULL),
(51, NULL, NULL, '6a7ccb8e-5bf0-427d-9f55-71d0461a0f4d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 00:37:01', '2025-01-23 00:37:01', '2025-01-23 00:37:01', NULL),
(52, NULL, NULL, '4ace98c2-eaa3-431e-8784-f6a269a9435a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-23 00:37:01', '2025-01-23 00:37:01', '2025-01-23 00:37:01', NULL),
(53, NULL, NULL, '02d0f5e7-4bc9-40f5-a504-265c2f9334fb', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 3, 1, '2025-01-23 00:37:01', '2025-01-23 00:37:01', '2025-01-23 00:37:01', NULL),
(54, '51', 'App\\Models\\Attachment', 'a5b998ce-9ab7-452f-a5ef-2a7c1941e209', 'file', 'image-44', 'image-44.svg', 'image/svg+xml', 'public', 'public', 266896, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 00:37:01', '2025-01-23 00:37:01', NULL, NULL),
(55, '52', 'App\\Models\\Attachment', '30116c3d-d153-4c3b-8178-faae2749cc53', 'file', 'image-29', 'image-29.svg', 'image/svg+xml', 'public', 'public', 266901, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 00:37:01', '2025-01-23 00:37:01', NULL, NULL),
(56, '53', 'App\\Models\\Attachment', '4a4aea6a-e6eb-4408-b798-ba3762e730ef', 'file', 'image-45', 'image-45.svg', 'image/svg+xml', 'public', 'public', 262657, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 00:37:01', '2025-01-23 00:37:01', NULL, NULL),
(57, NULL, NULL, '0000879e-db67-485f-a5d8-22dc55dff313', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 00:37:02', '2025-01-23 00:37:02', '2025-01-23 00:37:02', NULL),
(58, NULL, NULL, 'a1049bc2-8ea2-4130-b84d-43b97b68b783', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-23 00:37:02', '2025-01-23 00:37:02', '2025-01-23 00:37:02', NULL),
(59, '57', 'App\\Models\\Attachment', 'a96b2d49-f134-4ae1-a8ae-8d4a02eb8336', 'file', 'image-28', 'image-28.svg', 'image/svg+xml', 'public', 'public', 251339, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 00:37:02', '2025-01-23 00:37:02', NULL, NULL),
(60, '58', 'App\\Models\\Attachment', 'e92d25cb-6a1a-49e5-9010-6cd7cd6bb065', 'file', 'image-35', 'image-35.svg', 'image/svg+xml', 'public', 'public', 249349, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 00:37:02', '2025-01-23 00:37:02', NULL, NULL),
(61, NULL, NULL, 'c940044d-12e0-4c22-90be-6cc89a639dcc', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 00:37:02', '2025-01-23 00:37:02', '2025-01-23 00:37:02', NULL),
(62, '61', 'App\\Models\\Attachment', 'aec5c988-47f4-4ec5-9fea-0dca608b9cd1', 'file', 'image-31', 'image-31.svg', 'image/svg+xml', 'public', 'public', 296807, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 00:37:02', '2025-01-23 00:37:02', NULL, NULL),
(63, NULL, NULL, '1631b830-e499-493c-94bc-b0a40c4675d5', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 01:47:09', '2025-01-23 01:47:09', '2025-01-23 01:47:09', NULL),
(64, '63', 'App\\Models\\Attachment', '352200d3-65e5-4dbc-a05b-31cd029cc260', 'file', 'image-3', 'image-3.svg', 'image/svg+xml', 'public', 'public', 250065, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 01:47:09', '2025-01-23 01:47:09', NULL, NULL),
(65, NULL, NULL, '313d53cb-25c4-442c-9e4f-95871c3edd0e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 01:47:09', '2025-01-23 01:47:09', '2025-01-23 01:47:09', NULL),
(66, '65', 'App\\Models\\Attachment', '3de9dcce-30ec-4db2-abff-fd0ff48f5a9f', 'file', 'image-6', 'image-6.svg', 'image/svg+xml', 'public', 'public', 270481, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 01:47:09', '2025-01-23 01:47:09', NULL, NULL),
(67, NULL, NULL, 'ad1a1d59-87e4-4217-94af-5d3bbeb26474', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 01:47:09', '2025-01-23 01:47:09', '2025-01-23 01:47:09', NULL),
(68, NULL, NULL, '6d54daca-289b-4452-bc94-7f3cde283a97', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-23 01:47:09', '2025-01-23 01:47:09', '2025-01-23 01:47:09', NULL),
(69, NULL, NULL, '23a947a0-0ef3-4429-9acd-f4effb801bb0', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 3, 1, '2025-01-23 01:47:09', '2025-01-23 01:47:09', '2025-01-23 01:47:09', NULL),
(70, '67', 'App\\Models\\Attachment', 'a3dffdee-efba-49bc-b323-31fb907c9a1f', 'file', 'image-10', 'image-10.svg', 'image/svg+xml', 'public', 'public', 269015, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 01:47:09', '2025-01-23 01:47:09', NULL, NULL),
(71, '68', 'App\\Models\\Attachment', '106f4aec-f949-4c34-bb2d-143233f31194', 'file', 'image-4', 'image-4.svg', 'image/svg+xml', 'public', 'public', 288958, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 01:47:09', '2025-01-23 01:47:09', NULL, NULL),
(72, '69', 'App\\Models\\Attachment', '788dc10a-5f39-4046-9c31-a203f5d60ae0', 'file', 'image-2', 'image-2.svg', 'image/svg+xml', 'public', 'public', 241350, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 01:47:09', '2025-01-23 01:47:09', NULL, NULL),
(73, NULL, NULL, '99d9898a-9a3c-4b3c-ad08-1ca554c7c7ab', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 01:47:10', '2025-01-23 01:47:10', '2025-01-23 01:47:10', NULL),
(74, NULL, NULL, 'a24a121f-4c49-4756-adfe-9a96ef9175ff', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-23 01:47:10', '2025-01-23 01:47:10', '2025-01-23 01:47:10', NULL),
(75, '73', 'App\\Models\\Attachment', 'e38348a5-98e7-47b4-a4a5-7c6291d576d6', 'file', 'image-9', 'image-9.svg', 'image/svg+xml', 'public', 'public', 254678, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 01:47:10', '2025-01-23 01:47:10', NULL, NULL),
(76, NULL, NULL, '9a2ca43c-6403-423b-8827-2286396abcc7', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-23 01:47:10', '2025-01-23 01:47:10', '2025-01-23 01:47:10', NULL),
(77, '74', 'App\\Models\\Attachment', 'e68f0618-ca44-4762-b337-32a1cc488aad', 'file', 'image-8', 'image-8.svg', 'image/svg+xml', 'public', 'public', 250474, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 01:47:10', '2025-01-23 01:47:10', NULL, NULL),
(78, '76', 'App\\Models\\Attachment', '77cb870e-f8fc-456c-8958-83181e650b1b', 'file', 'image-47', 'image-47.svg', 'image/svg+xml', 'public', 'public', 351166, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 01:47:10', '2025-01-23 01:47:10', NULL, NULL),
(79, NULL, NULL, '07656f16-ee2f-446f-ad5e-90d25d8aaae2', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 3, 1, '2025-01-23 01:47:10', '2025-01-23 01:47:10', '2025-01-23 01:47:10', NULL),
(80, NULL, NULL, '90fcecfe-7358-49cd-a7c2-fd417a22bc88', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 4, 1, '2025-01-23 01:47:10', '2025-01-23 01:47:10', '2025-01-23 01:47:10', NULL),
(81, '80', 'App\\Models\\Attachment', 'f0282d0f-b01c-48a3-9849-56db0204ad55', 'file', 'image-1', 'image-1.svg', 'image/svg+xml', 'public', 'public', 276071, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 01:47:10', '2025-01-23 01:47:10', NULL, NULL),
(82, '79', 'App\\Models\\Attachment', 'e44f775a-a5d5-49d5-aa7f-9d1adae84084', 'file', 'image-12', 'image-12.svg', 'image/svg+xml', 'public', 'public', 267653, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 01:47:10', '2025-01-23 01:47:10', NULL, NULL),
(83, NULL, NULL, '58a9bf6a-e5e2-43df-9531-dae525d36b34', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 01:47:18', '2025-01-23 01:47:18', '2025-01-23 01:47:18', NULL),
(84, '83', 'App\\Models\\Attachment', 'e9f918d0-5d51-458c-9579-4d19d099e182', 'file', 'image', 'image.svg', 'image/svg+xml', 'public', 'public', 251346, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 01:47:18', '2025-01-23 01:47:18', NULL, NULL),
(85, NULL, NULL, 'c7746e22-c113-4fd7-b4b1-bd2fe7a65459', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 02:21:38', '2025-01-23 02:21:38', '2025-01-23 02:21:38', NULL),
(86, '85', 'App\\Models\\Attachment', '32c26a03-cbfa-44fb-879f-389685f89ba7', 'file', 'image-44', 'image-44.svg', 'image/svg+xml', 'public', 'public', 266896, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 02:21:38', '2025-01-23 02:21:38', NULL, NULL),
(87, NULL, NULL, '07b6715b-0326-497a-a4e0-6cd6bc617d83', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 03:14:06', '2025-01-23 03:14:06', '2025-01-23 03:14:06', NULL),
(88, '87', 'App\\Models\\Attachment', '681cb15d-4043-4f3b-91bc-1f1a270c3a25', 'file', 'image-6', 'image-6.svg', 'image/svg+xml', 'public', 'public', 270481, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 03:14:06', '2025-01-23 03:14:06', NULL, NULL),
(89, NULL, NULL, '39e051ae-6d5a-43c5-9708-1ac1ede3fa0f', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 03:15:08', '2025-01-23 03:15:08', '2025-01-23 03:15:08', NULL),
(90, '89', 'App\\Models\\Attachment', '6e8a40f0-c414-4632-bc0e-719fdf31c07e', 'file', 'image-15', 'image-15.svg', 'image/svg+xml', 'public', 'public', 237955, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 03:15:08', '2025-01-23 03:15:08', NULL, NULL),
(91, NULL, NULL, '6e9622a8-aa95-4571-bdc2-6add58906a2f', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 03:24:58', '2025-01-23 03:24:58', '2025-01-23 03:24:58', NULL),
(92, '91', 'App\\Models\\Attachment', '2cdce27f-8791-4e0b-a476-9ecb312d575b', 'file', '6', '6.png', 'image/png', 'public', 'public', 1042423, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 03:24:58', '2025-01-23 03:24:58', NULL, NULL),
(93, NULL, NULL, 'd999dd4b-2e7a-413c-84bf-3e2436d124fe', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 03:24:58', '2025-01-23 03:24:58', '2025-01-23 03:24:58', NULL),
(94, '93', 'App\\Models\\Attachment', '8442be74-afaf-4486-9b6a-0fbefb00b42e', 'file', '1', '1.png', 'image/png', 'public', 'public', 1256373, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 03:24:58', '2025-01-23 03:24:58', NULL, NULL),
(95, NULL, NULL, '7a4592d0-5217-439d-812f-4f0405e49118', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 03:24:59', '2025-01-23 03:24:59', '2025-01-23 03:24:59', NULL),
(96, '95', 'App\\Models\\Attachment', 'dae1c065-ea40-434d-85ef-be2e07447be5', 'file', '2', '2.png', 'image/png', 'public', 'public', 1225625, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 03:24:59', '2025-01-23 03:24:59', NULL, NULL),
(97, NULL, NULL, '39ce8f45-8d2e-44c2-8a14-7081f7f710c3', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 03:24:59', '2025-01-23 03:24:59', '2025-01-23 03:24:59', NULL),
(98, '97', 'App\\Models\\Attachment', '79ffa7d2-c414-4550-9ba7-e59d99bb7bd7', 'file', '8', '8.png', 'image/png', 'public', 'public', 1143694, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 03:24:59', '2025-01-23 03:24:59', NULL, NULL),
(99, NULL, NULL, '4cc9e2f8-3a92-46dc-b3c2-315b0ff83b14', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 03:25:00', '2025-01-23 03:25:00', '2025-01-23 03:25:00', NULL),
(100, '99', 'App\\Models\\Attachment', '7263eff6-ceeb-4146-9b87-4e0da23e6f61', 'file', '10', '10.png', 'image/png', 'public', 'public', 1573700, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 03:25:00', '2025-01-23 03:25:00', NULL, NULL),
(101, NULL, NULL, 'f82d5cba-a6d7-4caf-9e95-beaf9b6b6446', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 03:25:01', '2025-01-23 03:25:01', '2025-01-23 03:25:01', NULL),
(102, '101', 'App\\Models\\Attachment', 'e39f3d8c-32c3-4fd4-ba56-26726ece91c1', 'file', '7', '7.png', 'image/png', 'public', 'public', 1505859, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 03:25:01', '2025-01-23 03:25:01', NULL, NULL),
(103, NULL, NULL, '0c91cd3a-5bac-4504-818c-5efbdd76de2a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 03:25:01', '2025-01-23 03:25:01', '2025-01-23 03:25:01', NULL),
(104, '103', 'App\\Models\\Attachment', 'b33e2991-8f34-45e1-a2e4-185f4b85b5bc', 'file', '5', '5.png', 'image/png', 'public', 'public', 1327433, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 03:25:01', '2025-01-23 03:25:01', NULL, NULL),
(105, NULL, NULL, '99b056f0-b447-4c19-bd90-19203fcf112a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-23 03:25:01', '2025-01-23 03:25:01', '2025-01-23 03:25:01', NULL),
(106, '105', 'App\\Models\\Attachment', '40e6225a-e3e2-4ad2-a0bd-4e9c36f3fac0', 'file', '9', '9.png', 'image/png', 'public', 'public', 1416686, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 03:25:01', '2025-01-23 03:25:01', NULL, NULL),
(107, NULL, NULL, '41888938-5ccf-4b12-b392-c68ed3f49fcb', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:12:33', '2025-01-23 05:12:33', '2025-01-23 05:12:33', NULL),
(108, '107', 'App\\Models\\Attachment', 'f004f1c2-0940-4646-8b35-499d4301ea62', 'file', '10', '10.png', 'image/png', 'public', 'public', 1573700, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:12:33', '2025-01-23 05:12:33', NULL, NULL),
(109, NULL, NULL, 'd0e54a7d-bd08-4cab-b05d-5b1589d01dda', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:12:50', '2025-01-23 05:12:50', '2025-01-23 05:12:50', NULL),
(110, '109', 'App\\Models\\Attachment', 'cf901bdb-1b1e-47c4-b897-d437db338f61', 'file', '3', '3.png', 'image/png', 'public', 'public', 1994985, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:12:50', '2025-01-23 05:12:50', NULL, NULL),
(111, NULL, NULL, '81282c54-d706-472f-b3a5-075283028663', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:13:22', '2025-01-23 05:13:22', '2025-01-23 05:13:22', NULL),
(112, '111', 'App\\Models\\Attachment', '06b1b522-1477-4ced-8fe2-34c4e174525e', 'file', '4', '4.png', 'image/png', 'public', 'public', 1471047, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:13:22', '2025-01-23 05:13:22', NULL, NULL),
(113, NULL, NULL, '08710ecc-fd71-42d5-842f-5411be99a60f', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:25:13', '2025-01-23 05:25:13', '2025-01-23 05:25:13', NULL),
(114, '113', 'App\\Models\\Attachment', 'a4ab508b-8dcb-4ab4-96f6-6550886b22ab', 'file', 'image-5', 'image-5.png', 'image/png', 'public', 'public', 181180, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:25:13', '2025-01-23 05:25:13', NULL, NULL),
(115, NULL, NULL, '92278f52-c237-4b2d-886b-e5090451a27b', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL),
(116, '115', 'App\\Models\\Attachment', 'fb77e38a-69e5-4d9e-a493-6d676fef8330', 'file', 'image-18', 'image-18.png', 'image/png', 'public', 'public', 210416, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL, NULL),
(117, NULL, NULL, 'b8be5546-7ca5-44a5-9d2e-18c896cca5b8', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL),
(118, '117', 'App\\Models\\Attachment', 'f470d07f-07bb-41e5-8d00-e0deae92491c', 'file', 'image-14', 'image-14.png', 'image/png', 'public', 'public', 190350, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL, NULL),
(119, NULL, NULL, '5c7080e7-a675-42f8-9a1e-b2db4fee3f49', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL),
(120, '119', 'App\\Models\\Attachment', 'a7649ff0-c54a-48bb-b385-3d591f03f1b9', 'file', 'image-23', 'image-23.png', 'image/png', 'public', 'public', 179110, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL, NULL),
(121, NULL, NULL, 'dc25c64e-8127-4336-af5c-7cc9e7609fd3', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL),
(122, NULL, NULL, '9ef9e20f-979d-4384-979b-1a4910c59e7e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL),
(123, NULL, NULL, 'd3c62a8b-643a-4e42-bb79-c288e7db011a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL),
(124, NULL, NULL, '5993d555-0e1c-4e42-a806-b813b1efdc38', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 3, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL),
(125, NULL, NULL, 'd095a679-c46e-4942-b66e-3ceaeedad231', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 4, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL),
(126, '124', 'App\\Models\\Attachment', '32423d69-905c-433b-a620-60e8c90fd88c', 'file', 'image-30', 'image-30.png', 'image/png', 'public', 'public', 186847, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL, NULL),
(127, '123', 'App\\Models\\Attachment', '38934c71-d695-4818-86ba-a0152bc823e1', 'file', 'image-7', 'image-7.png', 'image/png', 'public', 'public', 207956, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL, NULL),
(128, '121', 'App\\Models\\Attachment', 'bf79e6aa-9be4-477d-bcf2-3173e9065833', 'file', 'image-22', 'image-22.png', 'image/png', 'public', 'public', 208069, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL, NULL),
(129, '122', 'App\\Models\\Attachment', '0ca8f97a-df09-410b-8975-4997008c6e87', 'file', 'image-19', 'image-19.png', 'image/png', 'public', 'public', 204528, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL, NULL),
(130, '125', 'App\\Models\\Attachment', 'e0538305-e008-42c5-ba96-2f5df896baac', 'file', 'image-25', 'image-25.png', 'image/png', 'public', 'public', 208137, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL, NULL),
(131, NULL, NULL, 'ddd88db8-5fa4-4c85-94c5-e95a2e9b7341', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL),
(132, '131', 'App\\Models\\Attachment', 'c1f4f011-b4f1-4d17-b9c8-a5331c216bff', 'file', 'image-20', 'image-20.png', 'image/png', 'public', 'public', 191859, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:25:14', '2025-01-23 05:25:14', NULL, NULL),
(133, NULL, NULL, '3cc7e0b4-0535-412d-967a-db8b15e1208a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(135, NULL, NULL, '786548bc-3072-43a8-957f-e3184eb64bcc', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(137, NULL, NULL, '42cc302f-8eb2-40ca-89bf-c50a6fd9b1d6', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(139, NULL, NULL, '5270709c-79ac-407e-b51a-5de8b00ea824', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(141, NULL, NULL, '33f27329-9f8d-480e-8431-ae9e9a2b0db2', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(142, '141', 'App\\Models\\Attachment', '3d29e0de-67b8-493f-b8f0-27e45a91b507', 'attachment', 'footer-img', 'footer-img.webp', 'image/webp', 'public', 'public', 121622, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL, NULL),
(143, NULL, NULL, 'e0c9908a-86cc-41f5-b1c0-ab21e0fe74e1', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(144, '143', 'App\\Models\\Attachment', '411ccaf1-145f-45e7-9105-bbb2e34412bd', 'attachment', 'ride', 'ride.svg', 'image/svg+xml', 'public', 'public', 2235, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL, NULL),
(145, NULL, NULL, '32da4635-6b3c-4bd6-8293-6a731d2dd5ef', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(146, '145', 'App\\Models\\Attachment', '193745f6-9c40-42c5-b7c9-f70095dd8aca', 'attachment', 'user', 'user.svg', 'image/svg+xml', 'public', 'public', 1188, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL, NULL),
(147, NULL, NULL, '7353f108-06cc-4e57-b19e-13876aab57c6', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(148, '147', 'App\\Models\\Attachment', '6935c8c1-df4a-41da-a59d-2a4a9b48b4f1', 'attachment', 'driver', 'driver.svg', 'image/svg+xml', 'public', 'public', 1243, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL, NULL),
(149, NULL, NULL, 'cb333f61-c85c-4ab9-b767-e98fe94180cf', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(150, '149', 'App\\Models\\Attachment', '8b919942-3762-408a-8b2c-a4030fe8ca12', 'attachment', 'rating', 'rating.svg', 'image/svg+xml', 'public', 'public', 6363, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL, NULL),
(151, NULL, NULL, '36999d29-6e3c-4e00-92e1-03ce5aaa0a40', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(152, '151', 'App\\Models\\Attachment', 'a9290139-57df-4ced-b97e-514af9d69933', 'attachment', 'map', 'map.gif', 'image/gif', 'public', 'public', 55498, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL, NULL),
(153, NULL, NULL, 'b56cd3dd-a4e4-4154-ae99-041126cfe77c', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(154, '153', 'App\\Models\\Attachment', '277b5160-3212-4620-b565-201bd28c009b', 'attachment', 'rent-vehicles', 'rent-vehicles.gif', 'image/gif', 'public', 'public', 1031744, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL, NULL),
(155, NULL, NULL, '7a713bf7-e95b-4278-a706-d02ce4090432', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(156, '155', 'App\\Models\\Attachment', '923b7fe9-1515-4971-bb14-547207892e04', 'attachment', 'booking-request', 'booking-request.gif', 'image/gif', 'public', 'public', 33776, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL, NULL),
(157, NULL, NULL, 'e2d4b702-2bd2-4bef-8a2e-4b0f843c5be2', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(159, NULL, NULL, '17906e46-e1f1-4beb-9db5-550460b26414', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(160, '159', 'App\\Models\\Attachment', 'b87c9cf3-d95f-47e7-ae27-fa25f52952fb', 'attachment', 'language', 'language.gif', 'image/gif', 'public', 'public', 38023, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL, NULL),
(161, NULL, NULL, '9340f8c7-9c96-4cc0-af96-a0ca8db16b1f', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(162, '161', 'App\\Models\\Attachment', 'a2071c8e-a975-4d02-b90d-ce1d87500088', 'attachment', 'payment', 'payment.gif', 'image/gif', 'public', 'public', 1491113, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL, NULL),
(163, NULL, NULL, '069a558a-735c-42e6-93c0-5a9f862ea9ee', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(165, NULL, NULL, 'e4235893-b6a9-42c4-993a-ca3bbadd4667', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(167, NULL, NULL, '41c18811-d28a-40b8-ad45-98c42482380e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(169, NULL, NULL, '620eb74d-974a-47cf-abcc-45f0186c4a5e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(171, NULL, NULL, 'f3de3ce0-1ed2-4222-8921-05091212d59a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:52:27', '2025-01-23 05:52:27', '2025-01-23 05:52:27', NULL),
(173, NULL, NULL, '4a065e5e-daa4-4ced-8c25-1839d503cadd', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:53:55', '2025-01-23 05:53:55', '2025-01-23 05:53:55', NULL),
(175, NULL, NULL, '35c2eec9-1ad7-42c4-abd0-6be426f85720', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 05:53:55', '2025-01-23 05:53:55', '2025-01-23 05:53:55', NULL),
(177, NULL, NULL, '6b1ef668-78c4-47e5-a72e-f1cfffc2d96e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(179, NULL, NULL, '7f692b53-c46d-4f04-ac3e-b3fe222cacaf', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(181, NULL, NULL, 'b7ab018d-3bff-4599-a9da-b844bdfe3db8', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(183, NULL, NULL, 'd272aa8b-0870-4c9c-b996-fd14edffe19a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(185, NULL, NULL, '31f1e881-1565-4dd1-bbc1-48f38a38a0a4', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(186, '185', 'App\\Models\\Attachment', '2cc72aea-1669-456a-bfb0-ac22012d3520', 'attachment', 'footer-img', 'footer-img.webp', 'image/webp', 'public', 'public', 121622, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL, NULL),
(187, NULL, NULL, '698ae974-3584-467f-b523-ad5041075a4d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(189, NULL, NULL, '0cb78d1c-0533-4389-b155-7053b5e30cc3', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(191, NULL, NULL, 'ef852755-7069-4a3a-bf1d-3a6d5909fa02', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(193, NULL, NULL, '085b30b8-4d92-482e-9c89-13eb9b73f33e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(195, NULL, NULL, '385eb992-ca50-44c4-91bf-b69d068569fd', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(197, NULL, NULL, 'b0af43a1-d6cd-4a07-8b60-c6b89d8af391', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(198, '197', 'App\\Models\\Attachment', 'd267c0fe-c58d-46cd-9182-95e6a614909f', 'attachment', 'rent-vehicles', 'rent-vehicles.gif', 'image/gif', 'public', 'public', 1031744, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL, NULL),
(199, NULL, NULL, 'ffcd1ba8-b503-4b1b-8398-f92687746610', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(201, NULL, NULL, '3d402fae-e35b-476b-84c8-5bbce6079ff2', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(203, NULL, NULL, '2b14a577-1da2-4468-93d0-d228bc2704dc', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(204, '203', 'App\\Models\\Attachment', 'c805583e-a9be-4a39-a5e3-39c33a0cbf9c', 'attachment', 'language', 'language.gif', 'image/gif', 'public', 'public', 38023, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL, NULL),
(205, NULL, NULL, 'c8d502cf-1529-425b-ad11-6eaeacfb96a7', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(207, NULL, NULL, '12ab2532-e2e5-4d24-987a-1b8db7537d47', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(209, NULL, NULL, 'db5deff1-988a-4981-b162-268daaa2e669', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(210, '209', 'App\\Models\\Attachment', 'a3556b5a-344b-4adb-81f5-00526f75e471', 'attachment', '2', '2.jpg', 'image/jpeg', 'public', 'public', 99207, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL, NULL),
(211, NULL, NULL, '83def378-4c57-4c9a-ba25-1554fd65b81e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(212, '211', 'App\\Models\\Attachment', 'b6e02b8c-8987-432f-9e49-0a96366e06db', 'attachment', '3', '3.jpg', 'image/jpeg', 'public', 'public', 100587, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL, NULL),
(213, NULL, NULL, '862437f8-f1ee-4adb-8317-69bb9912dba4', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(215, NULL, NULL, 'c1af89ee-7c4e-490a-ba14-a6675dc51005', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:42:22', '2025-01-23 06:42:22', '2025-01-23 06:42:22', NULL),
(217, NULL, NULL, '0c460fd5-5997-441b-a0bc-2dff74f46cf6', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(219, NULL, NULL, 'd6e7a0e4-630b-4b82-a9c7-812cc206401d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(221, NULL, NULL, '19f0874e-7212-485e-8dfb-ac380460a330', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(223, NULL, NULL, '1a920e50-be51-4445-bb97-ad87d3993f87', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(225, NULL, NULL, 'b2a610cc-4556-4629-998c-458bba09cbd0', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(226, '225', 'App\\Models\\Attachment', 'd8b40cc4-21de-42b0-883a-adfc19bc7382', 'attachment', 'footer-img', 'footer-img.webp', 'image/webp', 'public', 'public', 121622, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL, NULL),
(227, NULL, NULL, '17d06f8d-12a0-4459-b4f9-69283b057216', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(229, NULL, NULL, 'cc8d11a1-0103-447b-bbeb-595eaff0aab5', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(231, NULL, NULL, 'f8915526-e6db-4ec9-95ac-5ee9454cb300', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(233, NULL, NULL, 'e9b7a20a-31ce-4e25-be2d-6c858dffa017', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(235, NULL, NULL, 'ceb51846-b052-487d-8356-369c6e8911ea', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(237, NULL, NULL, '7e9a72d7-c236-4148-a3da-9588254256af', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(238, '237', 'App\\Models\\Attachment', '9c5967c1-6683-45b7-a9ee-638ffc758cd0', 'attachment', 'rent-vehicles', 'rent-vehicles.gif', 'image/gif', 'public', 'public', 1031744, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL, NULL),
(239, NULL, NULL, '68b940d8-3d6d-41a8-9002-0d2db04a08eb', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(241, NULL, NULL, 'ddff3e45-1612-4187-896d-e90fb392db02', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(243, NULL, NULL, 'd3e22451-48fa-42da-95b7-11f5c4580c30', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(244, '243', 'App\\Models\\Attachment', '32ac4781-36a0-4a1a-97a7-ca2cefc4af1b', 'attachment', 'language', 'language.gif', 'image/gif', 'public', 'public', 38023, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL, NULL),
(245, NULL, NULL, '1653717b-b3c4-4a8f-bc62-f7cac6b5e2ab', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(247, NULL, NULL, '07a9a54c-1573-4a14-bfe7-e334f6bf5251', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(249, NULL, NULL, 'f7805105-c34a-4b27-8c5e-85a35f1a1676', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(251, NULL, NULL, '509663cc-7f1d-41ab-8ddd-17c401bb7aec', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(253, NULL, NULL, 'a56410f5-7b3e-4256-8dcd-5f626491233e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(255, NULL, NULL, '68b17716-dbfa-4b36-a9a0-a2d523704182', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:47:13', '2025-01-23 06:47:13', '2025-01-23 06:47:13', NULL),
(257, NULL, NULL, '4cc9b66d-6648-4121-943a-490c1c27c53f', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:06', '2025-01-23 06:52:06', '2025-01-23 06:52:06', NULL),
(259, NULL, NULL, 'e0894f75-891e-4f24-9536-4636111153fd', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:06', '2025-01-23 06:52:06', '2025-01-23 06:52:06', NULL),
(261, NULL, NULL, '057b7c0a-0038-406e-912f-c533273511d0', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:06', '2025-01-23 06:52:06', '2025-01-23 06:52:06', NULL),
(263, NULL, NULL, 'ae0087f2-5b1f-452b-8e60-68bf2471379d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:06', '2025-01-23 06:52:06', '2025-01-23 06:52:06', NULL);
INSERT INTO `media` (`id`, `model_id`, `model_type`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`, `alternative_text`) VALUES
(265, NULL, NULL, 'cb28d66c-738b-4ad3-be02-0441d69b5305', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:06', '2025-01-23 06:52:06', '2025-01-23 06:52:06', NULL),
(266, '265', 'App\\Models\\Attachment', 'c269b457-4a07-4e38-a847-22d83ac982fd', 'attachment', 'footer-img', 'footer-img.webp', 'image/webp', 'public', 'public', 121622, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 06:52:06', '2025-01-23 06:52:06', NULL, NULL),
(267, NULL, NULL, '3d4f62df-9b54-4c2c-84ba-ae83ac5849e9', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:06', '2025-01-23 06:52:06', '2025-01-23 06:52:06', NULL),
(269, NULL, NULL, 'bdd5ae5a-ca67-4d89-a42f-528a753439e7', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:06', '2025-01-23 06:52:06', '2025-01-23 06:52:06', NULL),
(271, NULL, NULL, '7455ff0c-6d47-4c99-868b-f64de73e2e3e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:06', '2025-01-23 06:52:06', '2025-01-23 06:52:06', NULL),
(273, NULL, NULL, 'eab56664-5da2-46e8-9a06-88bfcfbff470', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:06', '2025-01-23 06:52:07', '2025-01-23 06:52:07', NULL),
(275, NULL, NULL, 'b7ebbaa4-2ff5-4498-8b99-ab65abd3ec7c', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:07', '2025-01-23 06:52:07', '2025-01-23 06:52:07', NULL),
(277, NULL, NULL, '197b9e6a-d9e0-4386-84da-4d31e0448d57', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:07', '2025-01-23 06:52:07', '2025-01-23 06:52:07', NULL),
(278, '277', 'App\\Models\\Attachment', 'de4a041c-3ac5-43b8-aa9d-a54966e5d0fc', 'attachment', 'rent-vehicles', 'rent-vehicles.gif', 'image/gif', 'public', 'public', 1031744, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 06:52:07', '2025-01-23 06:52:07', NULL, NULL),
(279, NULL, NULL, '048db1ed-397b-45a5-aa7f-e24b84dcad80', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:07', '2025-01-23 06:52:07', '2025-01-23 06:52:07', NULL),
(281, NULL, NULL, '5c0646c3-05f7-4702-87df-f48f6ed4441f', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:07', '2025-01-23 06:52:07', '2025-01-23 06:52:07', NULL),
(283, NULL, NULL, '9675b9a1-7de8-46dd-b6b3-77fbc4514eac', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:07', '2025-01-23 06:52:07', '2025-01-23 06:52:07', NULL),
(284, '283', 'App\\Models\\Attachment', '2fb77123-c54c-447b-8ca2-198905c2c376', 'attachment', 'language', 'language.gif', 'image/gif', 'public', 'public', 38023, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 06:52:07', '2025-01-23 06:52:07', NULL, NULL),
(285, NULL, NULL, 'c15d47b9-822b-4d30-b5d8-e930dbe03373', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:07', '2025-01-23 06:52:07', '2025-01-23 06:52:07', NULL),
(287, NULL, NULL, '8365405c-db3b-4022-bf0b-7e7dfb3006ae', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:07', '2025-01-23 06:52:07', '2025-01-23 06:52:07', NULL),
(289, NULL, NULL, '00ef09f2-3222-4014-848f-353a9d8e9f25', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:07', '2025-01-23 06:52:07', '2025-01-23 06:52:07', NULL),
(291, NULL, NULL, '2821c65b-0cce-4fe7-9304-e805b801398a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:07', '2025-01-23 06:52:07', '2025-01-23 06:52:07', NULL),
(293, NULL, NULL, 'e759b31c-7424-4960-b67c-6cbc4d9366b6', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:07', '2025-01-23 06:52:07', '2025-01-23 06:52:07', NULL),
(295, NULL, NULL, 'cfd143ef-9b75-4a6d-a5bd-d3029de61b3d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 06:52:07', '2025-01-23 06:52:07', '2025-01-23 06:52:07', NULL),
(297, NULL, NULL, '9ced86fa-1c85-45fe-bc86-45029f36edf1', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 22:08:50', '2025-01-23 22:08:50', '2025-01-23 22:08:50', NULL),
(298, '297', 'App\\Models\\Attachment', '1b43f0fe-0880-41da-ae2b-8264061c9f2c', 'file', 'img-9', '9.png', 'image/png', 'public', 'public', 106244, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:08:50', '2025-01-23 22:08:50', NULL, NULL),
(299, NULL, NULL, '195aba72-4be7-4a5d-ae52-556c18e30349', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-23 22:08:50', '2025-01-23 22:08:51', '2025-01-23 22:08:51', NULL),
(300, NULL, NULL, 'ded91166-2084-4783-909e-08a572babed2', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 3, 1, '2025-01-23 22:08:50', '2025-01-23 22:08:50', '2025-01-23 22:08:50', NULL),
(301, '300', 'App\\Models\\Attachment', '0bb8c756-ae84-4c83-b044-e5b279b70d89', 'file', 'img-13', '13.png', 'image/png', 'public', 'public', 116546, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:08:50', '2025-01-23 22:08:50', NULL, NULL),
(302, '299', 'App\\Models\\Attachment', 'af6b7aa5-4bdc-450f-b2af-cf6c65a3d74e', 'file', 'img-12', '12.png', 'image/png', 'public', 'public', 94515, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:08:50', '2025-01-23 22:08:50', NULL, NULL),
(303, NULL, NULL, '5e15e644-4762-4c47-8ddc-88d2fc8f28ed', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 3, 1, '2025-01-23 22:08:51', '2025-01-23 22:08:51', '2025-01-23 22:08:51', NULL),
(304, NULL, NULL, '3d2346f5-1ac5-46d2-917b-a3e3cebb93df', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 4, 1, '2025-01-23 22:08:51', '2025-01-23 22:08:51', '2025-01-23 22:08:51', NULL),
(305, '303', 'App\\Models\\Attachment', '806f1ea6-7474-413d-bfde-24f04c838ca8', 'file', 'img-14', '14.png', 'image/png', 'public', 'public', 117686, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:08:51', '2025-01-23 22:08:51', NULL, NULL),
(306, '304', 'App\\Models\\Attachment', '553b7765-a9d4-4500-9214-3b944e776fb4', 'file', 'img-11', '11.png', 'image/png', 'public', 'public', 112519, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:08:51', '2025-01-23 22:08:51', NULL, NULL),
(307, NULL, NULL, '14f4fc45-9d8f-452c-8d50-f275400ae49d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 5, 1, '2025-01-23 22:08:51', '2025-01-23 22:08:51', '2025-01-23 22:08:51', NULL),
(308, '307', 'App\\Models\\Attachment', '066f85ec-b029-4c05-ad32-0d2d6881104e', 'file', 'img-15', '15.png', 'image/png', 'public', 'public', 118877, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:08:51', '2025-01-23 22:08:51', NULL, NULL),
(309, NULL, NULL, '45e1de13-af5c-420a-86dc-9f4009c34d16', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 22:08:51', '2025-01-23 22:08:51', '2025-01-23 22:08:51', NULL),
(310, '309', 'App\\Models\\Attachment', '83bc0f1b-ddce-4def-a2d2-51f8b6a3a14b', 'file', 'img-7', '7.png', 'image/png', 'public', 'public', 124674, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:08:51', '2025-01-23 22:08:51', NULL, NULL),
(311, NULL, NULL, 'aeee084f-2aa7-423c-8efd-d2962eed69cc', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 22:08:51', '2025-01-23 22:08:51', '2025-01-23 22:08:51', NULL),
(312, '311', 'App\\Models\\Attachment', '8e795b8d-acd5-4ef5-a483-6925d3ff7082', 'file', 'img-6', '6.png', 'image/png', 'public', 'public', 116016, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:08:51', '2025-01-23 22:08:51', NULL, NULL),
(313, NULL, NULL, 'c84c0d45-d356-4652-986f-9864440c20d7', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 22:08:51', '2025-01-23 22:08:51', '2025-01-23 22:08:51', NULL),
(314, '313', 'App\\Models\\Attachment', 'c89e876c-d596-4f41-844a-54ed7c8938a2', 'file', 'img-10', '10.png', 'image/png', 'public', 'public', 118551, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:08:51', '2025-01-23 22:08:51', NULL, NULL),
(315, NULL, NULL, 'bee8a538-5168-4db9-a593-cf5a341adab5', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 22:08:51', '2025-01-23 22:08:51', '2025-01-23 22:08:51', NULL),
(316, '315', 'App\\Models\\Attachment', '98ce4638-a9c7-4f44-8eab-f43594a8833d', 'file', 'img-5', '5.png', 'image/png', 'public', 'public', 108499, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:08:51', '2025-01-23 22:08:51', NULL, NULL),
(317, NULL, NULL, '4b6ab21a-2b4b-4281-8e6e-596b2b9a1881', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 22:08:55', '2025-01-23 22:08:55', '2025-01-23 22:08:55', NULL),
(318, '317', 'App\\Models\\Attachment', '8736670f-b2da-44ff-adbc-fe9c6dce4ef8', 'file', 'img-4', '4.png', 'image/png', 'public', 'public', 124171, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:08:55', '2025-01-23 22:08:55', NULL, NULL),
(319, NULL, NULL, 'aa0ef560-1f2e-406f-8b6f-367f31ae8c74', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 22:14:42', '2025-01-23 22:14:42', '2025-01-23 22:14:42', NULL),
(320, '319', 'App\\Models\\Attachment', '9394d4d6-d146-4130-9b3a-f3b42dcff5a5', 'file', 'img-1', '1.png', 'image/png', 'public', 'public', 112916, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:14:42', '2025-01-23 22:14:42', NULL, NULL),
(321, NULL, NULL, 'c4b0c7a3-1de9-4bea-b346-cd71fa936503', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 22:17:02', '2025-01-23 22:17:02', '2025-01-23 22:17:02', NULL),
(322, '321', 'App\\Models\\Attachment', '91899353-7e67-4804-8812-e29ea31e513b', 'file', 'img-2', '2.png', 'image/png', 'public', 'public', 128450, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:17:02', '2025-01-23 22:17:02', NULL, NULL),
(323, NULL, NULL, '8f747304-e58d-4579-86e8-7ac2917b6252', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 22:17:53', '2025-01-23 22:17:53', '2025-01-23 22:17:53', NULL),
(324, '323', 'App\\Models\\Attachment', '4d00526e-695a-4a75-9c68-12b9cb0230dd', 'file', 'img-3', '3.png', 'image/png', 'public', 'public', 114910, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:17:53', '2025-01-23 22:17:53', NULL, NULL),
(325, NULL, NULL, 'c60a3e6f-8750-4de0-b858-99357f9a1c15', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 22:43:38', '2025-01-23 22:43:38', '2025-01-23 22:43:38', NULL),
(326, '325', 'App\\Models\\Attachment', '8337b58d-f2f2-48d5-a85c-84c41784ce23', 'file', 'img-8', '8.png', 'image/png', 'public', 'public', 114539, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:43:38', '2025-01-23 22:43:38', NULL, NULL),
(327, NULL, NULL, 'e0cacecb-e0c6-47ce-bacd-e343c57973e9', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-23 22:52:46', '2025-01-23 22:52:46', '2025-01-23 22:52:46', NULL),
(328, '327', 'App\\Models\\Attachment', 'd0c551a4-48b8-4606-94a8-2a39e4e81e22', 'file', 'img-1', '1.png', 'image/png', 'public', 'public', 411568, '[]', '[]', '[]', '[]', 1, 1, '2025-01-23 22:52:46', '2025-01-23 22:52:46', NULL, NULL),
(329, NULL, NULL, '801fc045-a6c4-4d89-bb11-c548259b3925', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:29:28', '2025-01-24 00:29:28', '2025-01-24 00:29:28', NULL),
(330, NULL, NULL, '6ced871c-e2c1-43e1-b4a1-8cc4a231415a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 00:29:28', '2025-01-24 00:29:28', '2025-01-24 00:29:28', NULL),
(331, '329', 'App\\Models\\Attachment', '86ef78ab-f8db-4552-b23c-092b96877e47', 'file', '4', '4.jpg', 'image/jpeg', 'public', 'public', 272701, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:29:28', '2025-01-24 00:29:28', NULL, NULL),
(332, '330', 'App\\Models\\Attachment', 'e30134c0-92f9-4ec0-8b28-6ec93b8a14d4', 'file', '1', '1.jpg', 'image/jpeg', 'public', 'public', 218913, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:29:28', '2025-01-24 00:29:28', NULL, NULL),
(333, NULL, NULL, '58901706-eadb-482d-9a84-626e4fc597c0', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:29:28', '2025-01-24 00:29:28', '2025-01-24 00:29:28', NULL),
(334, '333', 'App\\Models\\Attachment', '17e6fa2f-00a4-4667-badb-06ad18bbd2c2', 'file', '3', '3.jpg', 'image/jpeg', 'public', 'public', 254060, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:29:28', '2025-01-24 00:29:28', NULL, NULL),
(335, NULL, NULL, 'd01f145f-5160-4712-a231-1afa453a055b', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:29:28', '2025-01-24 00:29:28', '2025-01-24 00:29:28', NULL),
(336, '335', 'App\\Models\\Attachment', 'b8282ac1-7b5e-43fa-ac89-ca7dbbbc9eb1', 'file', '5', '5.jpg', 'image/jpeg', 'public', 'public', 418598, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:29:28', '2025-01-24 00:29:28', NULL, NULL),
(337, NULL, NULL, '93403008-9335-40b6-870c-9d71a3e4fff4', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:29:28', '2025-01-24 00:29:28', '2025-01-24 00:29:28', NULL),
(338, '337', 'App\\Models\\Attachment', '158a7231-0b71-4999-8f88-27284f608223', 'file', '2', '2.jpg', 'image/jpeg', 'public', 'public', 453855, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:29:28', '2025-01-24 00:29:28', NULL, NULL),
(339, NULL, NULL, 'fd2d2809-9fd3-4e5d-8982-3e2fee6496f4', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:29:51', '2025-01-24 00:29:51', '2025-01-24 00:29:51', NULL),
(340, NULL, NULL, '849b6450-55c4-42a9-a433-521db8f38ddb', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 00:29:51', '2025-01-24 00:29:51', '2025-01-24 00:29:51', NULL),
(341, '339', 'App\\Models\\Attachment', 'b58ff91f-74f8-4bfc-9bca-e8dbb3f52178', 'file', '1', '1.jpg', 'image/jpeg', 'public', 'public', 442251, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:29:51', '2025-01-24 00:29:51', NULL, NULL),
(342, '340', 'App\\Models\\Attachment', 'c92277c5-12ba-405e-b3eb-2898c5653642', 'file', '2', '2.jpg', 'image/jpeg', 'public', 'public', 300811, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:29:51', '2025-01-24 00:29:51', NULL, NULL),
(343, NULL, NULL, '2aee1ac2-3f70-4c5a-bbc1-b818f1251ef6', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:29:51', '2025-01-24 00:29:51', '2025-01-24 00:29:51', NULL),
(344, NULL, NULL, '53d24f78-660d-4861-a85c-b8740af20ac7', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 00:29:51', '2025-01-24 00:29:51', '2025-01-24 00:29:51', NULL),
(345, '343', 'App\\Models\\Attachment', '2d1636b1-1bb6-490a-a8a9-4bb351d5d606', 'file', '4', '4.jpg', 'image/jpeg', 'public', 'public', 194480, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:29:51', '2025-01-24 00:29:51', NULL, NULL),
(346, '344', 'App\\Models\\Attachment', '24607c7d-e9fa-4a4b-a7a2-42ec905386b6', 'file', '5', '5.jpg', 'image/jpeg', 'public', 'public', 227385, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:29:51', '2025-01-24 00:29:51', NULL, NULL),
(347, NULL, NULL, 'a0a47106-b93b-4b8f-b5f6-dbcb353c2c76', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:29:51', '2025-01-24 00:29:51', '2025-01-24 00:29:51', NULL),
(348, '347', 'App\\Models\\Attachment', '15e27fb8-6eec-4697-ba35-083a34371a61', 'file', '3', '3.jpg', 'image/jpeg', 'public', 'public', 384751, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:29:51', '2025-01-24 00:29:51', NULL, NULL),
(349, NULL, NULL, 'c393e476-41d4-49f9-be0e-06840c8fe5be', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:30:05', '2025-01-24 00:30:05', '2025-01-24 00:30:05', NULL),
(350, '349', 'App\\Models\\Attachment', '259b9820-5283-4e19-bf85-a7e59cba5670', 'file', '1', '1.jpg', 'image/jpeg', 'public', 'public', 212798, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:30:05', '2025-01-24 00:30:05', NULL, NULL),
(351, NULL, NULL, '3b8b87ee-87cd-43e1-aee4-beed980b5e31', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:30:05', '2025-01-24 00:30:05', '2025-01-24 00:30:05', NULL),
(352, '351', 'App\\Models\\Attachment', 'eb11cf98-4298-4057-b2b7-8a12ecead4fb', 'file', '5', '5.jpg', 'image/jpeg', 'public', 'public', 230323, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:30:05', '2025-01-24 00:30:05', NULL, NULL),
(353, NULL, NULL, '3e3abda0-cfbc-4ec2-a625-9faa6ac7b047', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:30:05', '2025-01-24 00:30:05', '2025-01-24 00:30:05', NULL),
(354, '353', 'App\\Models\\Attachment', '2d66a3b8-005a-4bc4-9177-4e2e9ed9f263', 'file', '4', '4.jpg', 'image/jpeg', 'public', 'public', 248968, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:30:05', '2025-01-24 00:30:05', NULL, NULL),
(355, NULL, NULL, '88096a42-8e53-4321-8d08-890f8d4478e2', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:30:05', '2025-01-24 00:30:05', '2025-01-24 00:30:05', NULL),
(356, NULL, NULL, 'da3ccc06-4a9e-4efb-9975-d37db9d19935', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 00:30:05', '2025-01-24 00:30:05', '2025-01-24 00:30:05', NULL),
(357, '355', 'App\\Models\\Attachment', 'a4ccd401-194d-406b-83d5-bce8b14708c6', 'file', '3', '3.jpg', 'image/jpeg', 'public', 'public', 252266, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:30:05', '2025-01-24 00:30:05', NULL, NULL),
(358, '356', 'App\\Models\\Attachment', 'a07c8da8-a9bc-491f-8298-e16c4dababc4', 'file', '2', '2.jpg', 'image/jpeg', 'public', 'public', 468341, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:30:05', '2025-01-24 00:30:05', NULL, NULL),
(359, NULL, NULL, '3764589d-3339-4b5c-9a84-cfa7b27deaa5', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:30:16', '2025-01-24 00:30:16', '2025-01-24 00:30:16', NULL),
(360, '359', 'App\\Models\\Attachment', 'e0bf134e-0f05-4d18-8e5c-c42953c1f3b5', 'file', '2', '2.jpg', 'image/jpeg', 'public', 'public', 202476, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:30:16', '2025-01-24 00:30:16', NULL, NULL),
(361, NULL, NULL, '90e54969-982c-4796-a5f8-b1d065b70d8e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:30:16', '2025-01-24 00:30:16', '2025-01-24 00:30:16', NULL),
(362, '361', 'App\\Models\\Attachment', '7c652971-3c6f-4725-be69-ae7f1860dfea', 'file', '1', '1.jpg', 'image/jpeg', 'public', 'public', 409620, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:30:16', '2025-01-24 00:30:16', NULL, NULL),
(363, NULL, NULL, '4f5b2ac4-2b9a-48e6-bd25-1245aaf53a4e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:30:16', '2025-01-24 00:30:16', '2025-01-24 00:30:16', NULL),
(364, '363', 'App\\Models\\Attachment', '9d775029-3523-4341-887d-e1448d457f18', 'file', '3', '3.jpg', 'image/jpeg', 'public', 'public', 388451, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:30:16', '2025-01-24 00:30:16', NULL, NULL),
(365, NULL, NULL, '595d1cb7-d3ef-4a2c-9d1e-51bff3414be0', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:30:16', '2025-01-24 00:30:16', '2025-01-24 00:30:16', NULL),
(366, '365', 'App\\Models\\Attachment', '8c18ca13-0b38-41c8-8410-3a5926aba5c1', 'file', '4', '4.jpg', 'image/jpeg', 'public', 'public', 177874, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:30:16', '2025-01-24 00:30:16', NULL, NULL),
(367, NULL, NULL, '6926bbab-54b3-4d04-b1a8-d9555db45cf0', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:30:16', '2025-01-24 00:30:16', '2025-01-24 00:30:16', NULL),
(368, '367', 'App\\Models\\Attachment', '2a771c38-9d32-4d4e-b769-978225d46c2e', 'file', 'image-05', 'image-05.jpg', 'image/jpeg', 'public', 'public', 263781, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:30:16', '2025-01-24 00:47:35', NULL, NULL),
(369, NULL, NULL, '55e4c26b-cea7-4075-9ca8-f8fa68a0f083', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:30:28', '2025-01-24 00:30:29', '2025-01-24 00:30:29', NULL),
(370, '369', 'App\\Models\\Attachment', '74ef67ab-bbd7-4453-bea4-f031e492f346', 'file', '1', '1.jpg', 'image/jpeg', 'public', 'public', 158219, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:30:28', '2025-01-24 00:30:28', NULL, NULL),
(371, NULL, NULL, '89524db1-3d1a-4dad-af83-d4d00ab7318b', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:30:33', '2025-01-24 00:30:33', '2025-01-24 00:30:33', NULL),
(372, NULL, NULL, '08db6025-4768-46f6-a794-1c0e5c05a77d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 00:30:33', '2025-01-24 00:30:33', '2025-01-24 00:30:33', NULL),
(373, NULL, NULL, '7beb79d8-66e5-447d-87fa-799f02a68010', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 3, 1, '2025-01-24 00:30:33', '2025-01-24 00:30:33', '2025-01-24 00:30:33', NULL),
(374, '372', 'App\\Models\\Attachment', 'ebea3cfa-2097-4fc8-852f-db14fd772d0f', 'file', '2', '2.jpg', 'image/jpeg', 'public', 'public', 178513, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:30:33', '2025-01-24 00:30:33', NULL, NULL),
(375, '373', 'App\\Models\\Attachment', 'b9454510-d19f-4871-bcaf-60bed741c139', 'file', '3', '3.jpg', 'image/jpeg', 'public', 'public', 117625, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:30:33', '2025-01-24 00:30:33', NULL, NULL),
(376, '371', 'App\\Models\\Attachment', 'e4114b18-8b6d-4a1b-b0cf-1c130d2af08f', 'file', '5', '5.jpg', 'image/jpeg', 'public', 'public', 191112, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:30:33', '2025-01-24 00:30:33', NULL, NULL),
(377, NULL, NULL, '295bd490-1cfe-4897-a4b8-fa520551b75a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 4, 1, '2025-01-24 00:30:33', '2025-01-24 00:30:33', '2025-01-24 00:30:33', NULL),
(378, '377', 'App\\Models\\Attachment', '8e1b1c60-2bf0-4d97-9765-6c8d33fa2ef8', 'file', '4', '4.jpg', 'image/jpeg', 'public', 'public', 286297, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:30:33', '2025-01-24 00:30:33', NULL, NULL),
(379, NULL, NULL, '63be29f6-f2a7-4b9e-82d1-dce30767343e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:41:18', '2025-01-24 00:41:18', '2025-01-24 00:41:18', NULL),
(380, '379', 'App\\Models\\Attachment', '1ab888af-bad5-4da2-9877-e1282e422cb6', 'file', '5', '5.jpg', 'image/jpeg', 'public', 'public', 168624, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:41:18', '2025-01-24 00:41:18', NULL, NULL),
(381, NULL, NULL, 'd82c665c-6730-4c76-a8e8-98c1b7791451', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:41:18', '2025-01-24 00:41:18', '2025-01-24 00:41:18', NULL),
(382, NULL, NULL, 'ba943bba-fad3-4e2f-882e-3e011de12b2c', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 00:41:18', '2025-01-24 00:41:18', '2025-01-24 00:41:18', NULL),
(383, NULL, NULL, '4d6356cb-125e-4704-8dcd-e26c7b4f7ede', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 00:41:18', '2025-01-24 00:41:18', '2025-01-24 00:41:18', NULL),
(384, '381', 'App\\Models\\Attachment', '2e69c56d-1479-49b9-b096-9c2db5607eb9', 'file', '2', '2.jpg', 'image/jpeg', 'public', 'public', 230517, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:41:18', '2025-01-24 00:41:18', NULL, NULL),
(385, '383', 'App\\Models\\Attachment', '52361ad8-5389-432a-818a-21f499f39cb7', 'file', '3', '3.jpg', 'image/jpeg', 'public', 'public', 194352, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:41:18', '2025-01-24 00:41:18', NULL, NULL),
(386, '382', 'App\\Models\\Attachment', '9fd7ad32-428f-4944-95e8-873595230713', 'file', '4', '4.jpg', 'image/jpeg', 'public', 'public', 213370, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:41:18', '2025-01-24 00:41:18', NULL, NULL),
(387, NULL, NULL, 'cb24149f-5cac-4f6b-98f8-231e8467b263', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:41:19', '2025-01-24 00:41:19', '2025-01-24 00:41:19', NULL),
(388, '387', 'App\\Models\\Attachment', '57f98fda-4a3b-491e-8e96-2335ad282abf', 'file', '1', '1.jpg', 'image/jpeg', 'public', 'public', 299734, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:41:19', '2025-01-24 00:41:19', NULL, NULL),
(389, NULL, NULL, '97c96480-3855-4865-96da-d55df69235ee', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:41:32', '2025-01-24 00:41:32', '2025-01-24 00:41:32', NULL),
(390, '389', 'App\\Models\\Attachment', 'bb5f69b3-1f2e-4639-8018-1f5b7282a826', 'file', '3', '3.jpg', 'image/jpeg', 'public', 'public', 191329, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:41:32', '2025-01-24 00:41:32', NULL, NULL),
(391, NULL, NULL, '0ebbbaf1-b71c-4753-b10a-8999746fae4e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:41:32', '2025-01-24 00:41:32', '2025-01-24 00:41:32', NULL),
(392, '391', 'App\\Models\\Attachment', '02a39733-bbab-4770-a566-afd97743d78d', 'file', '5', '5.jpg', 'image/jpeg', 'public', 'public', 211995, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:41:32', '2025-01-24 00:41:32', NULL, NULL),
(393, NULL, NULL, '2cb22c09-5ff9-434b-80c7-036b8bc86d65', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 00:41:32', '2025-01-24 00:41:32', '2025-01-24 00:41:32', NULL),
(394, '393', 'App\\Models\\Attachment', '7e9e8e61-6615-4ab9-acbd-00c440c68ab9', 'file', '2', '2.jpg', 'image/jpeg', 'public', 'public', 195267, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:41:32', '2025-01-24 00:41:32', NULL, NULL),
(395, NULL, NULL, '65d1109f-9219-464e-8842-8041c5d3bada', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:41:32', '2025-01-24 00:41:32', '2025-01-24 00:41:32', NULL),
(396, '395', 'App\\Models\\Attachment', '1ee405f7-2448-40f5-afa0-358ce882148e', 'file', '1', '1.jpg', 'image/jpeg', 'public', 'public', 240509, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:41:32', '2025-01-24 00:41:32', NULL, NULL),
(397, NULL, NULL, '06b28469-9210-41e3-8d49-4628ec7686b5', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 00:41:32', '2025-01-24 00:41:32', '2025-01-24 00:41:32', NULL),
(398, '397', 'App\\Models\\Attachment', '4dfd5740-4ae7-469b-afb7-ec9d37dd303e', 'file', '4', '4.jpg', 'image/jpeg', 'public', 'public', 214376, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:41:32', '2025-01-24 00:41:32', NULL, NULL),
(399, NULL, NULL, '1d5a9593-0bcc-43a4-b4d2-77fb29c9922d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 00:49:44', '2025-01-24 00:49:44', '2025-01-24 00:49:44', NULL),
(400, '399', 'App\\Models\\Attachment', '1f038956-b1d2-4bbc-978e-112c700e3c14', 'file', 'rent_vehical_registration', 'rent_vehical_registration.svg', 'image/svg+xml', 'public', 'public', 113918, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 00:49:44', '2025-01-24 00:49:44', NULL, NULL),
(401, NULL, NULL, '1040b09e-e9f6-4b3f-8756-a3f7ff3ae88d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 01:13:25', '2025-01-24 01:13:25', '2025-01-24 01:13:25', NULL),
(402, '401', 'App\\Models\\Attachment', 'bb54d95d-df5a-477d-a770-9f5eba88511a', 'file', 'Vehicle_Proof', 'Vehicle_Proof.png', 'image/png', 'public', 'public', 411568, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 01:13:25', '2025-01-24 01:13:25', NULL, NULL),
(403, NULL, NULL, '5886a64a-a28d-424f-90ec-c93255363e0d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 01:13:26', '2025-01-24 01:13:26', '2025-01-24 01:13:26', NULL),
(404, '403', 'App\\Models\\Attachment', 'bad56189-d66f-4952-84ff-7f8f030a40b8', 'file', 'Insurance', 'Insurance.png', 'image/png', 'public', 'public', 413491, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 01:13:26', '2025-01-24 01:13:26', NULL, NULL),
(405, NULL, NULL, '0ee8038c-3aaa-45f2-9790-215849cf6872', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 01:13:29', '2025-01-24 01:13:29', '2025-01-24 01:13:29', NULL),
(406, '405', 'App\\Models\\Attachment', '6f9615be-b93d-4c54-9fc4-f9f28d956040', 'file', 'ID_Proof', 'ID_Proof.png', 'image/png', 'public', 'public', 126439, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 01:13:29', '2025-01-24 01:13:29', NULL, NULL),
(407, NULL, NULL, '9e6c76e2-ccef-49e2-aa8a-570426dfe05e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 01:13:31', '2025-01-24 01:13:31', '2025-01-24 01:13:31', NULL),
(408, '407', 'App\\Models\\Attachment', 'b750fac4-c17d-4ac8-8d6c-502b315b109a', 'file', 'Address_Proof', 'Address_Proof.png', 'image/png', 'public', 'public', 430390, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 01:13:31', '2025-01-24 01:13:31', NULL, NULL),
(409, NULL, NULL, '961303a1-5e82-42a0-a225-790b38df945e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:02:35', '2025-01-24 02:02:35', '2025-01-24 02:02:35', NULL),
(410, '409', 'App\\Models\\Attachment', '2e646cc2-04f6-4b52-820f-1ac5085f73e3', 'file', 'rent_car11', 'rent_car11.jpg', 'image/jpeg', 'public', 'public', 293202, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:02:35', '2025-01-24 02:02:35', NULL, NULL),
(411, NULL, NULL, '6220cf13-1ca1-4b23-9f9d-cd4b5c29c7eb', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:02:37', '2025-01-24 02:02:37', '2025-01-24 02:02:37', NULL),
(412, '411', 'App\\Models\\Attachment', 'e4b2639d-8ca7-4cd6-b113-e99fbe1b5853', 'file', 'rent_car12', 'rent_car12.jpg', 'image/jpeg', 'public', 'public', 268572, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:02:37', '2025-01-24 02:02:37', NULL, NULL),
(413, NULL, NULL, 'ac9da729-8d01-4b37-9dca-404d07d4a80e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:02:39', '2025-01-24 02:02:39', '2025-01-24 02:02:39', NULL),
(414, '413', 'App\\Models\\Attachment', '3ab1aaf6-3c85-4427-93be-d42086f326f1', 'file', 'rent_car13', 'rent_car13.jpg', 'image/jpeg', 'public', 'public', 201432, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:02:39', '2025-01-24 02:02:39', NULL, NULL),
(415, NULL, NULL, '1998194a-194d-4540-ad47-f434438538c1', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:02:41', '2025-01-24 02:02:41', '2025-01-24 02:02:41', NULL),
(416, '415', 'App\\Models\\Attachment', 'd82adc99-d2b3-4595-9dd8-a9649adfbc86', 'file', 'rent_car14', 'rent_car14.jpg', 'image/jpeg', 'public', 'public', 346105, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:02:41', '2025-01-24 02:02:41', NULL, NULL),
(417, NULL, NULL, '7f775348-33ac-4cf5-8704-0935daea3e33', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:02:43', '2025-01-24 02:02:43', '2025-01-24 02:02:43', NULL),
(418, '417', 'App\\Models\\Attachment', '7857a9ca-4baf-4584-8fef-ca8ea3fcd2c4', 'file', 'rent_car15', 'rent_car15.jpg', 'image/jpeg', 'public', 'public', 272018, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:02:43', '2025-01-24 02:02:43', NULL, NULL),
(419, NULL, NULL, '350b13d0-e76a-4df2-9c88-0ab08ac1ed80', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:04:16', '2025-01-24 02:04:16', '2025-01-24 02:04:16', NULL),
(420, '419', 'App\\Models\\Attachment', '3675a5e3-a7a7-46a9-b927-945dd8cdf7db', 'file', 'rent_car25', 'rent_car25.jpg', 'image/jpeg', 'public', 'public', 274747, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:04:16', '2025-01-24 02:04:16', NULL, NULL),
(421, NULL, NULL, '8ecdc67e-2e7e-4492-8ce5-dde33f5ed400', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:04:16', '2025-01-24 02:04:16', '2025-01-24 02:04:16', NULL),
(422, '421', 'App\\Models\\Attachment', '62921297-91df-442a-8dc7-98679946c3a4', 'file', 'rent_car24', 'rent_car24.jpg', 'image/jpeg', 'public', 'public', 242015, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:04:16', '2025-01-24 02:04:16', NULL, NULL),
(423, NULL, NULL, '347b2c8f-48b0-45a4-93e4-f51c3ab65cb1', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 02:04:16', '2025-01-24 02:04:16', '2025-01-24 02:04:16', NULL),
(424, NULL, NULL, 'e833a94c-13da-4110-89f0-52bcbb15f7b0', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 3, 1, '2025-01-24 02:04:16', '2025-01-24 02:04:16', '2025-01-24 02:04:16', NULL),
(425, '424', 'App\\Models\\Attachment', 'd7c345f2-e7c6-44a3-a636-57fb2cdca5b9', 'file', 'rent_car22', 'rent_car22.jpg', 'image/jpeg', 'public', 'public', 269601, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:04:16', '2025-01-24 02:04:16', NULL, NULL),
(426, '423', 'App\\Models\\Attachment', 'a71df78d-55dd-4eb4-8512-3085625cca92', 'file', 'rent_car21', 'rent_car21.jpg', 'image/jpeg', 'public', 'public', 251251, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:04:16', '2025-01-24 02:04:16', NULL, NULL),
(427, NULL, NULL, 'be5024ed-e71b-482f-97e2-97e4d9e6fd7e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:04:16', '2025-01-24 02:04:16', '2025-01-24 02:04:16', NULL),
(428, '427', 'App\\Models\\Attachment', 'f99520ae-865f-4a1b-8664-377c0aa0190c', 'file', 'rent_car23', 'rent_car23.jpg', 'image/jpeg', 'public', 'public', 270672, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:04:16', '2025-01-24 02:04:16', NULL, NULL),
(429, NULL, NULL, 'f9d2bb8d-e49c-467b-9c21-a5a59211968e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:04:37', '2025-01-24 02:04:37', '2025-01-24 02:04:37', NULL),
(430, '429', 'App\\Models\\Attachment', '918b7eff-c5d1-4b83-b277-e0d08d3a5710', 'file', 'rent_car4', 'rent_car4.jpg', 'image/jpeg', 'public', 'public', 239175, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:04:37', '2025-01-24 02:04:37', NULL, NULL),
(431, NULL, NULL, 'e2195ece-0392-41a6-84ba-e73f72f975f8', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:04:37', '2025-01-24 02:04:37', '2025-01-24 02:04:37', NULL),
(432, '431', 'App\\Models\\Attachment', '4ca8b482-f101-4dcd-8873-971b49b1c82d', 'file', 'rent_car5', 'rent_car5.jpg', 'image/jpeg', 'public', 'public', 256029, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:04:37', '2025-01-24 02:04:37', NULL, NULL),
(433, NULL, NULL, 'b8c3d8c5-9738-4c31-9187-be704ef2bba7', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:04:37', '2025-01-24 02:04:37', '2025-01-24 02:04:37', NULL),
(434, NULL, NULL, 'e1d7f4be-7f28-4ec2-a0a1-25b1b8fa6a89', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 02:04:37', '2025-01-24 02:04:37', '2025-01-24 02:04:37', NULL),
(435, '433', 'App\\Models\\Attachment', 'b716384e-0490-4f0c-b921-93df3911c90d', 'file', 'rent_car3', 'rent_car3.jpg', 'image/jpeg', 'public', 'public', 300719, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:04:37', '2025-01-24 02:04:37', NULL, NULL),
(436, '434', 'App\\Models\\Attachment', '985f40a9-39c6-4bdd-b243-d121c22aa8e3', 'file', 'rent_car1', 'rent_car1.jpg', 'image/jpeg', 'public', 'public', 248495, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:04:37', '2025-01-24 02:04:37', NULL, NULL),
(437, NULL, NULL, '343a986f-863a-4121-9bba-60b029809b27', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:04:38', '2025-01-24 02:04:38', '2025-01-24 02:04:38', NULL),
(438, '437', 'App\\Models\\Attachment', '2bf9db47-8709-4005-a892-d3ea09f5c68e', 'file', 'rent_car2', 'rent_car2.jpg', 'image/jpeg', 'public', 'public', 241800, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:04:38', '2025-01-24 02:04:38', NULL, NULL),
(439, NULL, NULL, '0c4cc420-9952-4bed-b044-2185700beba0', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:04:52', '2025-01-24 02:04:53', '2025-01-24 02:04:53', NULL),
(440, '439', 'App\\Models\\Attachment', '60f533cc-0725-4ee9-a107-b24ddfdbf0ab', 'file', 'rent_car44', 'rent_car44.jpg', 'image/jpeg', 'public', 'public', 252748, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:04:52', '2025-01-24 02:04:52', NULL, NULL),
(441, NULL, NULL, '81fa5301-2209-4cb6-ade2-1232d17da6b9', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 02:04:53', '2025-01-24 02:04:53', '2025-01-24 02:04:53', NULL),
(442, '441', 'App\\Models\\Attachment', '43be7c33-2038-44c7-9f9b-3f4b3beec943', 'file', 'rent_car45', 'rent_car45.jpg', 'image/jpeg', 'public', 'public', 218757, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:04:53', '2025-01-24 02:04:53', NULL, NULL),
(443, NULL, NULL, '4b35b9d4-3f9f-459d-a6d6-7fc1a7d0ea4a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:04:53', '2025-01-24 02:04:53', '2025-01-24 02:04:53', NULL),
(444, '443', 'App\\Models\\Attachment', '217f199e-754a-4408-b7bd-4a2ba0c4aeae', 'file', 'rent_car41', 'rent_car41.jpg', 'image/jpeg', 'public', 'public', 266623, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:04:53', '2025-01-24 02:04:53', NULL, NULL),
(445, NULL, NULL, '5967cc06-bfff-4512-8859-6574c44d66e1', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:04:53', '2025-01-24 02:04:53', '2025-01-24 02:04:53', NULL),
(446, '445', 'App\\Models\\Attachment', '63fea26a-36bc-4638-afcd-414cad4a48ec', 'file', 'rent_car42', 'rent_car42.jpg', 'image/jpeg', 'public', 'public', 243307, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:04:53', '2025-01-24 02:04:53', NULL, NULL),
(447, NULL, NULL, '06f19f2b-2a1a-4cdd-9288-2731ab6bc810', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:04:53', '2025-01-24 02:04:53', '2025-01-24 02:04:53', NULL),
(448, '447', 'App\\Models\\Attachment', 'd7f29e14-de86-4830-bb9e-716b9e5eea00', 'file', 'rent_car43', 'rent_car43.jpg', 'image/jpeg', 'public', 'public', 297630, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:04:53', '2025-01-24 02:04:53', NULL, NULL),
(449, NULL, NULL, '1c385b86-88e4-4bc3-af94-b52ac046792b', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:05:07', '2025-01-24 02:05:07', '2025-01-24 02:05:07', NULL),
(450, '449', 'App\\Models\\Attachment', '7938bc70-77d7-486c-bcfe-95e96712812c', 'file', 'rent_car54', 'rent_car54.jpg', 'image/jpeg', 'public', 'public', 186299, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:05:07', '2025-01-24 02:05:07', NULL, NULL),
(451, NULL, NULL, 'c5c59222-a80c-4fd7-a583-b9db3e0117ee', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:05:07', '2025-01-24 02:05:07', '2025-01-24 02:05:07', NULL),
(452, NULL, NULL, '0510cedd-b308-4fb9-aa77-78c5458afb7b', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 02:05:07', '2025-01-24 02:05:07', '2025-01-24 02:05:07', NULL),
(453, '451', 'App\\Models\\Attachment', '52756d52-bbd6-44ad-8fcf-44a02267e0f4', 'file', 'rent_car53', 'rent_car53.jpg', 'image/jpeg', 'public', 'public', 194364, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:05:07', '2025-01-24 02:05:07', NULL, NULL),
(454, '452', 'App\\Models\\Attachment', '04377fe3-3efa-41b0-8348-eb0f892b03a2', 'file', 'rent_car51', 'rent_car51.jpg', 'image/jpeg', 'public', 'public', 243377, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:05:07', '2025-01-24 02:05:07', NULL, NULL),
(455, NULL, NULL, '19558561-2403-475a-94bd-8743d03682ce', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:05:07', '2025-01-24 02:05:07', '2025-01-24 02:05:07', NULL),
(456, NULL, NULL, '0ec976fe-7fec-4333-ab15-83453e292936', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 02:05:07', '2025-01-24 02:05:07', '2025-01-24 02:05:07', NULL),
(457, '455', 'App\\Models\\Attachment', 'a563b4ab-356f-4637-a8e1-c98a47624000', 'file', 'rent_car52', 'rent_car52.jpg', 'image/jpeg', 'public', 'public', 318069, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:05:07', '2025-01-24 02:05:07', NULL, NULL),
(458, '456', 'App\\Models\\Attachment', 'd7368f0e-f924-44c7-8b8b-12fab5ef7457', 'file', 'rent_car55', 'rent_car55.jpg', 'image/jpeg', 'public', 'public', 240166, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:05:07', '2025-01-24 02:05:07', NULL, NULL),
(459, NULL, NULL, 'e0a513d9-b3d6-41e3-b5c9-c2fe10786ed7', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:05:27', '2025-01-24 02:05:27', '2025-01-24 02:05:27', NULL),
(460, '459', 'App\\Models\\Attachment', '6af1e461-9474-4ead-910b-e9c3a770a8ea', 'file', 'rent_car61', 'rent_car61.jpg', 'image/jpeg', 'public', 'public', 211841, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:05:27', '2025-01-24 02:05:27', NULL, NULL),
(461, NULL, NULL, '27dc8c96-6ee2-4758-af01-bc33d8239b6b', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:05:27', '2025-01-24 02:05:27', '2025-01-24 02:05:27', NULL),
(462, '461', 'App\\Models\\Attachment', '7c93f155-77a5-49c4-bef8-4920e98a582b', 'file', 'rent_car65', 'rent_car65.jpg', 'image/jpeg', 'public', 'public', 250562, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:05:27', '2025-01-24 02:05:27', NULL, NULL),
(463, NULL, NULL, '01a19d7c-e98f-4a95-bb3f-10332fa1d37d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:05:27', '2025-01-24 02:05:27', '2025-01-24 02:05:27', NULL),
(464, '463', 'App\\Models\\Attachment', '967d0480-e7a1-440e-8403-4f34b9899bfd', 'file', 'rent_car64', 'rent_car64.jpg', 'image/jpeg', 'public', 'public', 437934, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:05:27', '2025-01-24 02:05:27', NULL, NULL),
(465, NULL, NULL, 'a3e6ae68-2955-4d71-b066-0afe2944c30c', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:05:27', '2025-01-24 02:05:27', '2025-01-24 02:05:27', NULL),
(466, '465', 'App\\Models\\Attachment', 'eaa80144-6859-402b-92fd-22a124d7f59f', 'file', 'rent_car62', 'rent_car62.jpg', 'image/jpeg', 'public', 'public', 324144, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:05:27', '2025-01-24 02:05:27', NULL, NULL),
(467, NULL, NULL, 'a6ac83c4-3e05-495f-9518-d696aa9c1252', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:05:27', '2025-01-24 02:05:27', '2025-01-24 02:05:27', NULL),
(468, '467', 'App\\Models\\Attachment', 'e5458a6e-388f-4258-a3d2-ba27279d77be', 'file', 'rent_car63', 'rent_car63.jpg', 'image/jpeg', 'public', 'public', 300989, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:05:27', '2025-01-24 02:05:27', NULL, NULL),
(469, NULL, NULL, 'c597ba24-604d-4ecc-be70-68d67b44fd3b', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:05:42', '2025-01-24 02:05:42', '2025-01-24 02:05:42', NULL),
(470, '469', 'App\\Models\\Attachment', 'ff09baa7-0af3-4d49-beac-dfe8ea17b046', 'file', 'rent_car75', 'rent_car75.jpg', 'image/jpeg', 'public', 'public', 186547, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:05:42', '2025-01-24 02:05:42', NULL, NULL),
(471, NULL, NULL, 'c7a23d6c-3365-4def-b1ee-d16d39df75e8', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 02:05:42', '2025-01-24 02:05:42', '2025-01-24 02:05:42', NULL),
(472, '471', 'App\\Models\\Attachment', '343cb504-0d7f-4992-9575-b89df16d35d6', 'file', 'rent_car72', 'rent_car72.jpg', 'image/jpeg', 'public', 'public', 233445, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:05:42', '2025-01-24 02:05:42', NULL, NULL),
(473, NULL, NULL, 'a0f73d48-b761-4e0e-82b3-bf41544a8991', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:05:42', '2025-01-24 02:05:42', '2025-01-24 02:05:42', NULL),
(474, '473', 'App\\Models\\Attachment', 'c353110c-34dd-41ae-8305-dd9e7188ce51', 'file', 'rent_car71', 'rent_car71.jpg', 'image/jpeg', 'public', 'public', 294676, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:05:42', '2025-01-24 02:05:42', NULL, NULL),
(475, NULL, NULL, 'aa664d8d-46d6-4a6e-9101-18a172adef04', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:05:42', '2025-01-24 02:05:42', '2025-01-24 02:05:42', NULL),
(476, '475', 'App\\Models\\Attachment', '05186765-43c6-4264-956e-e84afdffc2f5', 'file', 'rent_car74', 'rent_car74.jpg', 'image/jpeg', 'public', 'public', 318681, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:05:42', '2025-01-24 02:05:42', NULL, NULL),
(477, NULL, NULL, '01263827-962c-4bdd-bfbe-e4cb8c52c3a3', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 02:05:42', '2025-01-24 02:05:43', '2025-01-24 02:05:43', NULL),
(478, '477', 'App\\Models\\Attachment', '2cbe314b-6b76-4c28-b859-7f9ca0512e6c', 'file', 'rent_car73', 'rent_car73.jpg', 'image/jpeg', 'public', 'public', 229680, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 02:05:43', '2025-01-24 02:05:43', NULL, NULL),
(479, NULL, NULL, 'cc790f74-3e0a-4a16-9294-e38f1c57117b', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:09:45', '2025-01-24 03:09:45', '2025-01-24 03:09:45', NULL),
(480, NULL, NULL, '6e7949a0-a61a-4c16-baaf-29ffdd76f507', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:09:45', '2025-01-24 03:09:45', '2025-01-24 03:09:45', NULL),
(481, NULL, NULL, '340cb6f8-085e-45a6-9d74-ecc08a514f01', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:09:45', '2025-01-24 03:09:45', '2025-01-24 03:09:45', NULL),
(482, NULL, NULL, '9c483f9d-14b3-4bb3-8dac-14071128d1d3', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 03:09:45', '2025-01-24 03:09:45', '2025-01-24 03:09:45', NULL),
(487, NULL, NULL, 'b9da3d92-c764-4696-b37f-08bd9ad0cf28', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 3, 1, '2025-01-24 03:09:45', '2025-01-24 03:09:45', '2025-01-24 03:09:45', NULL),
(489, NULL, NULL, 'c4617d1c-8bbd-4418-a317-83f2c90cebcd', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:07', '2025-01-24 03:11:07', '2025-01-24 03:11:07', NULL),
(490, '489', 'App\\Models\\Attachment', '9e3a9de0-53b4-49da-aee4-ad256dab057e', 'file', 'rent_bike11', 'rent_bike11.jpg', 'image/jpeg', 'public', 'public', 296406, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:07', '2025-01-24 03:11:07', NULL, NULL),
(491, NULL, NULL, '782a0318-729a-4408-8b43-1184936e773d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:07', '2025-01-24 03:11:07', '2025-01-24 03:11:07', NULL),
(492, '491', 'App\\Models\\Attachment', 'eee2d151-0145-4fd5-bd82-6f0bbe3db357', 'file', 'rent_bike13', 'rent_bike13.jpg', 'image/jpeg', 'public', 'public', 238193, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:07', '2025-01-24 03:11:07', NULL, NULL),
(493, NULL, NULL, 'ed90d800-7d5a-4f21-8f59-39b3a5c4538b', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:07', '2025-01-24 03:11:07', '2025-01-24 03:11:07', NULL),
(494, '493', 'App\\Models\\Attachment', 'ee7b7a05-7027-4948-bee1-6ead5642db50', 'file', 'rent_bike14', 'rent_bike14.jpg', 'image/jpeg', 'public', 'public', 242846, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:07', '2025-01-24 03:11:07', NULL, NULL),
(495, NULL, NULL, 'c553ed31-b525-432e-9038-d02553b8bfc8', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:07', '2025-01-24 03:11:07', '2025-01-24 03:11:07', NULL),
(496, '495', 'App\\Models\\Attachment', 'e2c65422-bf67-4e59-82ad-9318b539b239', 'file', 'rent_bike15', 'rent_bike15.jpg', 'image/jpeg', 'public', 'public', 275457, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:07', '2025-01-24 03:11:07', NULL, NULL),
(497, NULL, NULL, 'f2f51ea1-8dad-4e38-ac0a-5fb7f691629c', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:07', '2025-01-24 03:11:07', '2025-01-24 03:11:07', NULL),
(498, '497', 'App\\Models\\Attachment', '301efd36-f820-468b-81ea-69e5a47e7da2', 'file', 'rent_bike12', 'rent_bike12.jpg', 'image/jpeg', 'public', 'public', 291515, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:07', '2025-01-24 03:11:07', NULL, NULL),
(499, NULL, NULL, 'eff7d9ff-d89e-4ed3-aba1-35a6c899f04b', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:19', '2025-01-24 03:11:19', '2025-01-24 03:11:19', NULL),
(500, '499', 'App\\Models\\Attachment', '4e686e97-485d-4de1-bd42-d7c75a5edb39', 'file', 'rent_bike21', 'rent_bike21.jpg', 'image/jpeg', 'public', 'public', 304678, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:19', '2025-01-24 03:11:19', NULL, NULL),
(501, NULL, NULL, 'd9a3b915-81d2-4987-896c-221ac70a4fca', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:19', '2025-01-24 03:11:20', '2025-01-24 03:11:20', NULL),
(502, '501', 'App\\Models\\Attachment', '60d6547b-0bc9-4f3e-a61e-1072c8080f7c', 'file', 'rent_bike22', 'rent_bike22.jpg', 'image/jpeg', 'public', 'public', 273129, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:19', '2025-01-24 03:11:19', NULL, NULL);
INSERT INTO `media` (`id`, `model_id`, `model_type`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`, `alternative_text`) VALUES
(503, NULL, NULL, '4b770f17-2088-4434-9a77-6a7c8a89c331', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:20', '2025-01-24 03:11:20', '2025-01-24 03:11:20', NULL),
(504, '503', 'App\\Models\\Attachment', 'a8f711bc-37b9-4b70-95ef-63be30700c5e', 'file', 'rent_bike23', 'rent_bike23.jpg', 'image/jpeg', 'public', 'public', 280326, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:20', '2025-01-24 03:11:20', NULL, NULL),
(505, NULL, NULL, '68363657-a6a4-4535-a637-07c62cbeedbc', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:20', '2025-01-24 03:11:20', '2025-01-24 03:11:20', NULL),
(506, '505', 'App\\Models\\Attachment', '0b2c67b3-bd6d-4178-aafb-195b71e89ad0', 'file', 'rent_bike25', 'rent_bike25.jpg', 'image/jpeg', 'public', 'public', 274762, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:20', '2025-01-24 03:11:20', NULL, NULL),
(507, NULL, NULL, 'ef05d0b7-9c80-4317-b47d-b73496504b25', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:20', '2025-01-24 03:11:20', '2025-01-24 03:11:20', NULL),
(508, '507', 'App\\Models\\Attachment', 'b6cb28fc-c845-41cc-91c8-78178ea0c767', 'file', 'rent_bike24', 'rent_bike24.jpg', 'image/jpeg', 'public', 'public', 272086, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:20', '2025-01-24 03:11:20', NULL, NULL),
(509, NULL, NULL, '469a4fda-f446-4ec7-87bf-8e9d81fccaa2', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:30', '2025-01-24 03:11:30', '2025-01-24 03:11:30', NULL),
(510, '509', 'App\\Models\\Attachment', '8a81140d-5cc1-45ae-b3fb-937e6264916a', 'file', 'rent_bik35', 'rent_bik35.jpg', 'image/jpeg', 'public', 'public', 89233, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:30', '2025-01-24 03:11:30', NULL, NULL),
(511, NULL, NULL, 'b2fb82c7-7fdc-4cb3-8639-900c2116e38c', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:30', '2025-01-24 03:11:30', '2025-01-24 03:11:30', NULL),
(512, NULL, NULL, '8c878bf1-caaa-40c3-bd63-ab372159640a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 03:11:30', '2025-01-24 03:11:30', '2025-01-24 03:11:30', NULL),
(513, '511', 'App\\Models\\Attachment', '0b64ccdb-c745-4a8c-92c5-0d5efdbe998f', 'file', 'rent_bik31', 'rent_bik31.jpg', 'image/jpeg', 'public', 'public', 127352, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:30', '2025-01-24 03:11:30', NULL, NULL),
(514, '512', 'App\\Models\\Attachment', '00775122-75b2-43eb-aacf-a80d09574915', 'file', 'rent_bik34', 'rent_bik34.jpg', 'image/jpeg', 'public', 'public', 97834, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:30', '2025-01-24 03:11:30', NULL, NULL),
(515, NULL, NULL, 'a43341be-deac-4208-9bc2-32bb284528a0', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:30', '2025-01-24 03:11:30', '2025-01-24 03:11:30', NULL),
(516, '515', 'App\\Models\\Attachment', 'b74b60b9-cec9-49d0-a3fd-fa955e95c9bc', 'file', 'rent_bik33', 'rent_bik33.jpg', 'image/jpeg', 'public', 'public', 140623, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:30', '2025-01-24 03:11:30', NULL, NULL),
(517, NULL, NULL, 'ab4a0cca-171e-4a7f-8fb2-fcbd56683af3', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:31', '2025-01-24 03:11:31', '2025-01-24 03:11:31', NULL),
(518, '517', 'App\\Models\\Attachment', '3cc78506-e5a7-43c6-ba8b-3fb58449b7bd', 'file', 'rent_bik32', 'rent_bik32.jpg', 'image/jpeg', 'public', 'public', 140639, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:31', '2025-01-24 03:11:31', NULL, NULL),
(519, NULL, NULL, 'd5705e6f-bed3-4d34-a142-993be3e4faef', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:47', '2025-01-24 03:11:47', '2025-01-24 03:11:47', NULL),
(520, '519', 'App\\Models\\Attachment', 'eb58b3ec-5f5b-4c35-b216-a30c960138f1', 'file', 'rent_bik43', 'rent_bik43.jpg', 'image/jpeg', 'public', 'public', 445001, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:47', '2025-01-24 03:11:47', NULL, NULL),
(521, NULL, NULL, 'a6da22a1-abb7-47c1-8529-6d95b6481956', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:47', '2025-01-24 03:11:47', '2025-01-24 03:11:47', NULL),
(522, '521', 'App\\Models\\Attachment', 'e9164d4a-5547-4a06-9bb1-378254bc213e', 'file', 'rent_bik42', 'rent_bik42.jpg', 'image/jpeg', 'public', 'public', 436062, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:47', '2025-01-24 03:11:47', NULL, NULL),
(523, NULL, NULL, 'bb871d4a-059c-4746-82c1-e193fcc3ef1d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:47', '2025-01-24 03:11:47', '2025-01-24 03:11:47', NULL),
(524, '523', 'App\\Models\\Attachment', 'ddfb2dbf-c1e4-4ff3-8352-23191a9a8d78', 'file', 'rent_bik44', 'rent_bik44.jpg', 'image/jpeg', 'public', 'public', 461090, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:47', '2025-01-24 03:11:47', NULL, NULL),
(525, NULL, NULL, '0df9f334-9e09-4e20-9e14-48d20942bd79', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:47', '2025-01-24 03:11:47', '2025-01-24 03:11:47', NULL),
(526, '525', 'App\\Models\\Attachment', '476b9f73-9a59-487b-a8d7-8b5f4e861b18', 'file', 'rent_bik41', 'rent_bik41.jpg', 'image/jpeg', 'public', 'public', 464415, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:47', '2025-01-24 03:11:47', NULL, NULL),
(527, NULL, NULL, '4af051af-a02c-4260-b67a-10905ffd526d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:47', '2025-01-24 03:11:47', '2025-01-24 03:11:47', NULL),
(528, '527', 'App\\Models\\Attachment', '9a69c093-f0b3-4d95-9aba-8c997a9e7350', 'file', 'rent_bik45', 'rent_bik45.jpg', 'image/jpeg', 'public', 'public', 464864, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:47', '2025-01-24 03:11:47', NULL, NULL),
(529, NULL, NULL, 'a17d2d34-1eae-4403-b8c4-e8a19ff24149', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:59', '2025-01-24 03:11:59', '2025-01-24 03:11:59', NULL),
(530, '529', 'App\\Models\\Attachment', '4fe0b6f9-36f1-42d9-8e08-4644342fb041', 'file', 'rent_bik51', 'rent_bik51.jpg', 'image/jpeg', 'public', 'public', 371351, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:59', '2025-01-24 03:11:59', NULL, NULL),
(531, NULL, NULL, 'f7c9a122-bd0b-4ea3-a33a-d76f2e0a8119', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 03:11:59', '2025-01-24 03:11:59', '2025-01-24 03:11:59', NULL),
(532, '531', 'App\\Models\\Attachment', '9285306d-a4dd-47df-a297-57eaf9bc9e07', 'file', 'rent_bik55', 'rent_bik55.jpg', 'image/jpeg', 'public', 'public', 362547, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:59', '2025-01-24 03:11:59', NULL, NULL),
(533, NULL, NULL, '7f7c7c1f-c63f-4b42-8b8e-4ceb97159b60', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:59', '2025-01-24 03:11:59', '2025-01-24 03:11:59', NULL),
(534, '533', 'App\\Models\\Attachment', 'a95e5357-cabf-46d4-b598-1a9dfdb8e294', 'file', 'rent_bik53', 'rent_bik53.jpg', 'image/jpeg', 'public', 'public', 354791, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:59', '2025-01-24 03:11:59', NULL, NULL),
(535, NULL, NULL, 'de13456c-a787-46a0-846c-97d171c20c01', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:11:59', '2025-01-24 03:11:59', '2025-01-24 03:11:59', NULL),
(536, '535', 'App\\Models\\Attachment', '51d6d962-7434-41e6-abc6-761fc911a2b0', 'file', 'rent_bik52', 'rent_bik52.jpg', 'image/jpeg', 'public', 'public', 358410, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:11:59', '2025-01-24 03:11:59', NULL, NULL),
(537, NULL, NULL, '3b7a03a3-346e-4e75-a641-c2eecaf55ee9', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:12:00', '2025-01-24 03:12:00', '2025-01-24 03:12:00', NULL),
(538, '537', 'App\\Models\\Attachment', '83d06e66-6362-4f9f-b061-2bf1a5e3a147', 'file', 'rent_bik54', 'rent_bik54.jpg', 'image/jpeg', 'public', 'public', 339386, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:12:00', '2025-01-24 03:12:00', NULL, NULL),
(539, NULL, NULL, 'afa8931c-a0fb-4846-b206-2723bf9231ac', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:12:13', '2025-01-24 03:12:13', '2025-01-24 03:12:13', NULL),
(540, NULL, NULL, 'dcadf770-3daf-4af1-bfbf-a35858f432e6', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 03:12:13', '2025-01-24 03:12:13', '2025-01-24 03:12:13', NULL),
(541, '539', 'App\\Models\\Attachment', 'e32821ee-7462-4adb-9b40-0868ecedd1ec', 'file', 'rent_bike62', 'rent_bike62.jpg', 'image/jpeg', 'public', 'public', 297130, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:12:13', '2025-01-24 03:12:13', NULL, NULL),
(542, '540', 'App\\Models\\Attachment', '0686e17b-f3e8-4539-9b47-899b3a06afee', 'file', 'rent_bike61', 'rent_bike61.jpg', 'image/jpeg', 'public', 'public', 299015, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:12:13', '2025-01-24 03:12:13', NULL, NULL),
(543, NULL, NULL, 'b46b0dba-50c9-4481-9d02-c3bbfea60feb', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:12:13', '2025-01-24 03:12:13', '2025-01-24 03:12:13', NULL),
(544, '543', 'App\\Models\\Attachment', '4cb23e85-581a-4b37-a5bd-a49218d0dd33', 'file', 'rent_bike64', 'rent_bike64.jpg', 'image/jpeg', 'public', 'public', 305436, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:12:13', '2025-01-24 03:12:13', NULL, NULL),
(545, NULL, NULL, 'ab1e0946-10ec-48a0-857f-bc25d4e8fd0f', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:12:13', '2025-01-24 03:12:13', '2025-01-24 03:12:13', NULL),
(546, '545', 'App\\Models\\Attachment', '2087a508-e8e0-428f-8eb1-e6af2ecb8518', 'file', 'rent_bike63', 'rent_bike63.jpg', 'image/jpeg', 'public', 'public', 282210, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:12:13', '2025-01-24 03:12:13', NULL, NULL),
(547, NULL, NULL, 'dc176466-243f-4c8e-a793-e11692e6a1dd', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:12:13', '2025-01-24 03:12:13', '2025-01-24 03:12:13', NULL),
(548, '547', 'App\\Models\\Attachment', 'e478f82a-50e5-4a31-b7f7-39dc2ed139e0', 'file', 'rent_bike65', 'rent_bike65.jpg', 'image/jpeg', 'public', 'public', 279982, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:12:13', '2025-01-24 03:12:13', NULL, NULL),
(549, NULL, NULL, 'c009241d-3642-4a02-a822-3d5741f80d22', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:12:23', '2025-01-24 03:12:23', '2025-01-24 03:12:23', NULL),
(550, NULL, NULL, '469af704-9c09-456a-b238-d1571d42099c', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-24 03:12:23', '2025-01-24 03:12:23', '2025-01-24 03:12:23', NULL),
(551, '549', 'App\\Models\\Attachment', '8430b66b-2928-4366-a52c-c1e6c7166f70', 'file', 'rent_bike73', 'rent_bike73.jpg', 'image/jpeg', 'public', 'public', 168421, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:12:23', '2025-01-24 03:12:23', NULL, NULL),
(552, '550', 'App\\Models\\Attachment', '0eeb43d2-8dfe-4d8e-bd50-e59cdc568950', 'file', 'rent_bike71', 'rent_bike71.jpg', 'image/jpeg', 'public', 'public', 227936, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:12:23', '2025-01-24 03:12:23', NULL, NULL),
(553, NULL, NULL, '70b70303-652a-4e54-94e0-d3a6230470b3', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:12:23', '2025-01-24 03:12:23', '2025-01-24 03:12:23', NULL),
(554, '553', 'App\\Models\\Attachment', 'd4490262-bbb2-4a84-a9ee-b59292a39d1c', 'file', 'rent_bike74', 'rent_bike74.jpg', 'image/jpeg', 'public', 'public', 167961, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:12:23', '2025-01-24 03:12:23', NULL, NULL),
(555, NULL, NULL, 'd48151e3-2d60-4ee2-956d-2405692bdd85', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:12:23', '2025-01-24 03:12:23', '2025-01-24 03:12:23', NULL),
(556, '555', 'App\\Models\\Attachment', '15561577-8f1e-4188-b996-35a5c2d7d077', 'file', 'rent_bike75', 'rent_bike75.jpg', 'image/jpeg', 'public', 'public', 222946, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:12:23', '2025-01-24 03:12:23', NULL, NULL),
(557, NULL, NULL, '24a86c9e-1dc3-46fe-b3a2-ae3c8fd2981e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-24 03:12:23', '2025-01-24 03:12:23', '2025-01-24 03:12:23', NULL),
(558, '557', 'App\\Models\\Attachment', 'd63efff4-0bdd-4de3-bafa-d4e2d8760576', 'file', 'rent_bike72', 'rent_bike72.jpg', 'image/jpeg', 'public', 'public', 229934, '[]', '[]', '[]', '[]', 1, 1, '2025-01-24 03:12:23', '2025-01-24 03:12:23', NULL, NULL),
(559, NULL, NULL, 'cb1658ea-663f-4764-af33-f1f1af0d530e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:30:58', '2025-01-25 00:30:58', '2025-01-25 00:30:58', NULL),
(560, NULL, NULL, '200c0bda-2ff6-4cb3-a4fa-216bda972033', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-25 00:30:58', '2025-01-25 00:30:58', '2025-01-25 00:30:58', NULL),
(561, '559', 'App\\Models\\Attachment', 'b70e7dbc-5697-4d6e-8458-b7568db17fe4', 'file', 'image-6', 'image-6.png', 'image/png', 'public', 'public', 212559, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:30:58', '2025-01-25 00:30:58', NULL, NULL),
(562, '560', 'App\\Models\\Attachment', 'f0e89623-8dad-4ddc-bd8d-3eac5dbd6c5c', 'file', 'image-8', 'image-8.png', 'image/png', 'public', 'public', 212889, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:30:58', '2025-01-25 00:30:58', NULL, NULL),
(563, NULL, NULL, '9de705bb-2bf2-4dd4-804e-9a27fdec6cb3', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:30:58', '2025-01-25 00:30:58', '2025-01-25 00:30:58', NULL),
(564, NULL, NULL, '5790f478-5301-4a5e-9fbc-8f50f1e7d37d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-25 00:30:58', '2025-01-25 00:30:58', '2025-01-25 00:30:58', NULL),
(565, '563', 'App\\Models\\Attachment', '707b02e6-2745-4841-b77f-31d7bdf74fa5', 'file', 'image-12', 'image-12.png', 'image/png', 'public', 'public', 211639, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:30:58', '2025-01-25 00:30:58', NULL, NULL),
(566, '564', 'App\\Models\\Attachment', '8265cd95-9f6a-4b7f-a712-57cc717a012b', 'file', 'image', 'image.png', 'image/png', 'public', 'public', 202067, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:30:58', '2025-01-25 00:30:58', NULL, NULL),
(567, NULL, NULL, '2c1425ec-052b-4aa0-9cf0-4851ebc83b98', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:30:59', '2025-01-25 00:30:59', '2025-01-25 00:30:59', NULL),
(568, NULL, NULL, 'e7d69795-6e03-467e-bc36-d9edbb4f09de', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-25 00:30:59', '2025-01-25 00:30:59', '2025-01-25 00:30:59', NULL),
(569, '567', 'App\\Models\\Attachment', '12a47bf3-40d6-46a1-807b-a62fce20009c', 'file', 'image-3', 'image-3.png', 'image/png', 'public', 'public', 202708, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:30:59', '2025-01-25 00:30:59', NULL, NULL),
(570, '568', 'App\\Models\\Attachment', '5f7994cc-c8b0-46f4-85e2-ca014c241c7a', 'file', 'image-1', 'image-1.png', 'image/png', 'public', 'public', 207501, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:30:59', '2025-01-25 00:30:59', NULL, NULL),
(571, NULL, NULL, 'a7177d67-0682-4ffe-bc2e-305051b34a82', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:30:59', '2025-01-25 00:30:59', '2025-01-25 00:30:59', NULL),
(572, '571', 'App\\Models\\Attachment', '34a7391d-6a20-41b7-8007-1507e561cfa1', 'file', 'image-2', 'image-2.png', 'image/png', 'public', 'public', 211758, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:30:59', '2025-01-25 00:30:59', NULL, NULL),
(573, NULL, NULL, '3b012af5-66d0-4856-8b88-7a1ef91dc1a0', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:30:59', '2025-01-25 00:31:00', '2025-01-25 00:31:00', NULL),
(574, '573', 'App\\Models\\Attachment', 'dcb597f9-bf3a-4964-8553-a2b6b92cc87c', 'file', 'image-10', 'image-10.png', 'image/png', 'public', 'public', 223258, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:31:00', '2025-01-25 00:31:00', NULL, NULL),
(575, NULL, NULL, '4ca6a5f5-7e40-459c-9246-7b057215cc9a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:31:00', '2025-01-25 00:31:00', '2025-01-25 00:31:00', NULL),
(576, NULL, NULL, '66363f73-adb1-4e4d-b23c-ac670e2f7bce', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-25 00:31:00', '2025-01-25 00:31:00', '2025-01-25 00:31:00', NULL),
(577, '575', 'App\\Models\\Attachment', 'f8c98cb4-f0fd-45d7-acac-8a5847596e7f', 'file', 'image-9', 'image-9.png', 'image/png', 'public', 'public', 214642, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:31:00', '2025-01-25 00:31:00', NULL, NULL),
(578, '576', 'App\\Models\\Attachment', 'b48fbbe0-6662-431d-b008-89ecc30fc8b5', 'file', 'image-4', 'image-4.png', 'image/png', 'public', 'public', 227712, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:31:00', '2025-01-25 00:31:00', NULL, NULL),
(579, NULL, NULL, '719c9131-0d20-4686-8efe-27b8c83801c7', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:31:06', '2025-01-25 00:31:06', '2025-01-25 00:31:06', NULL),
(580, '579', 'App\\Models\\Attachment', 'e1ea5ca5-f3c4-492f-9d51-c3dc20096c34', 'file', 'image-13', 'image-13.png', 'image/png', 'public', 'public', 212908, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:31:06', '2025-01-25 00:31:06', NULL, NULL),
(581, NULL, NULL, 'd562717d-e926-4855-b67f-a3e5bf340cf7', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:34:59', '2025-01-25 00:34:59', '2025-01-25 00:34:59', NULL),
(582, '581', 'App\\Models\\Attachment', 'b6bfe78b-7168-4286-a0d9-0729ce80db29', 'file', 'image-24', 'image-24.png', 'image/png', 'public', 'public', 209373, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:34:59', '2025-01-25 00:34:59', NULL, NULL),
(583, NULL, NULL, 'c14a8144-c512-41f9-b439-4e9efece393c', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:00', '2025-01-25 00:35:00', NULL),
(584, '583', 'App\\Models\\Attachment', '34571287-d6fe-4f9e-9000-2c3da0ab398c', 'file', 'image-26', 'image-26.png', 'image/png', 'public', 'public', 200857, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:00', NULL, NULL),
(585, NULL, NULL, '3336f094-bbf0-4fc5-b3ce-542704fe4ba2', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:00', '2025-01-25 00:35:00', NULL),
(586, '585', 'App\\Models\\Attachment', '70d9b6f3-cf20-4f05-aa63-8d70189bbcb6', 'file', 'image-16', 'image-16.png', 'image/png', 'public', 'public', 220880, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:00', NULL, NULL),
(587, NULL, NULL, 'cf799533-0e9b-4899-becb-eb98217cdaa8', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:00', '2025-01-25 00:35:00', NULL),
(588, '587', 'App\\Models\\Attachment', '12e480b3-6f94-4457-a890-9cb3947573b9', 'file', 'image-27', 'image-27.png', 'image/png', 'public', 'public', 189589, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:00', NULL, NULL),
(589, NULL, NULL, 'e87bd75e-2e3c-4d17-8de4-fd96d178c784', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 3, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:00', '2025-01-25 00:35:00', NULL),
(590, NULL, NULL, '11a40472-1cd9-4a44-9f60-9649c92dce12', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 4, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:00', '2025-01-25 00:35:00', NULL),
(591, '589', 'App\\Models\\Attachment', 'c8b4e6a4-c18b-4671-b538-35dfa448b54c', 'file', 'image-21', 'image-21.png', 'image/png', 'public', 'public', 201312, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:00', NULL, NULL),
(592, '590', 'App\\Models\\Attachment', 'fa373a97-6f5c-4113-8812-6a19715db4f2', 'file', 'image-15', 'image-15.png', 'image/png', 'public', 'public', 195267, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:00', NULL, NULL),
(593, NULL, NULL, '37fc2259-e6e8-4196-98d4-de04a59ef8ad', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:00', '2025-01-25 00:35:00', NULL),
(594, '593', 'App\\Models\\Attachment', '37382785-fb71-418b-a3aa-aa546682dd83', 'file', 'image-31', 'image-31.png', 'image/png', 'public', 'public', 229240, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:00', NULL, NULL),
(595, NULL, NULL, 'fea19466-49c9-4484-8481-ccc92f3d2157', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:00', '2025-01-25 00:35:00', NULL),
(596, '595', 'App\\Models\\Attachment', '9254aa1b-efe1-4989-bbca-2813baebb1ce', 'file', 'image-28', 'image-28.png', 'image/png', 'public', 'public', 203773, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:00', NULL, NULL),
(597, NULL, NULL, '26b939d0-0638-4bcc-8cba-447dce62abc4', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:01', '2025-01-25 00:35:01', NULL),
(598, NULL, NULL, 'abf1f99e-0009-47c4-a92b-8d4db748faab', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-25 00:35:00', '2025-01-25 00:35:01', '2025-01-25 00:35:01', NULL),
(599, '598', 'App\\Models\\Attachment', 'c0844183-0f67-4bd5-9698-97263fdb8e08', 'file', 'image-35', 'image-35.png', 'image/png', 'public', 'public', 202917, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:35:01', '2025-01-25 00:35:01', NULL, NULL),
(600, '597', 'App\\Models\\Attachment', '387ba760-090d-4bf0-9cff-9c8746daf549', 'file', 'image-17', 'image-17.png', 'image/png', 'public', 'public', 204703, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:35:01', '2025-01-25 00:35:01', NULL, NULL),
(601, NULL, NULL, '2dd7a9db-301a-48ab-8b7e-27f787175e75', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:35:05', '2025-01-25 00:35:05', '2025-01-25 00:35:05', NULL),
(602, '601', 'App\\Models\\Attachment', '1f7150c1-76c2-4185-b1a9-df5379b1d34f', 'file', 'image-40', 'image-40.png', 'image/png', 'public', 'public', 194051, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:35:05', '2025-01-25 00:35:05', NULL, NULL),
(603, NULL, NULL, '95f1aa21-190b-40c7-b03a-8c838acc8ddc', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:44:22', '2025-01-25 00:44:22', '2025-01-25 00:44:22', NULL),
(604, '603', 'App\\Models\\Attachment', '8d7c3a07-c900-4602-a497-3edcfe8790d9', 'file', 'image-17', 'image-17.png', 'image/png', 'public', 'public', 204703, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:44:22', '2025-01-25 00:44:22', NULL, NULL),
(605, NULL, NULL, 'f22693eb-584c-4935-8159-5870568cf3ea', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:44:22', '2025-01-25 00:44:22', '2025-01-25 00:44:22', NULL),
(606, '605', 'App\\Models\\Attachment', '7e566cf8-d465-4847-b62b-17d3fc86608e', 'file', 'image-24', 'image-24.png', 'image/png', 'public', 'public', 209373, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:44:22', '2025-01-25 00:44:22', NULL, NULL),
(607, NULL, NULL, '9ba7bce1-3a87-49cf-a8b8-275c384daaf0', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:44:22', '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL),
(608, '607', 'App\\Models\\Attachment', '54416275-f9e4-471f-ad20-22a7849e82ce', 'file', 'image-27', 'image-27.png', 'image/png', 'public', 'public', 189589, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL, NULL),
(609, NULL, NULL, '3c85f157-4936-4f31-bf40-0b5e2e6e5201', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:44:23', '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL),
(610, NULL, NULL, '1d299879-62f6-4d14-a822-520e43d3e25f', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-01-25 00:44:23', '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL),
(611, NULL, NULL, 'f57f1393-c495-4984-82be-42848d6f7f52', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 3, 1, '2025-01-25 00:44:23', '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL),
(612, '609', 'App\\Models\\Attachment', 'a5c76ab2-57e3-4359-a6c9-6325adedde00', 'file', 'image-16', 'image-16.png', 'image/png', 'public', 'public', 220880, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL, NULL),
(613, '611', 'App\\Models\\Attachment', 'a7b487ea-31e2-4f7d-a689-998d4afd8132', 'file', 'image-35', 'image-35.png', 'image/png', 'public', 'public', 202917, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL, NULL),
(614, '610', 'App\\Models\\Attachment', 'fe7f37ce-59a3-46e7-bee5-498ea8b15b2a', 'file', 'image-29', 'image-29.png', 'image/png', 'public', 'public', 215757, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL, NULL),
(615, NULL, NULL, '2aede3d0-0959-4d1f-83ae-02ab28391cd3', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 3, 1, '2025-01-25 00:44:23', '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL),
(616, '615', 'App\\Models\\Attachment', '2a777176-d7a6-48bb-9ae8-de05a9676f85', 'file', 'image-13', 'image-13.png', 'image/png', 'public', 'public', 212908, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL, NULL),
(617, NULL, NULL, '34100c64-7ac7-45c4-b1a2-6bff698c89d9', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 4, 1, '2025-01-25 00:44:23', '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL),
(618, NULL, NULL, '513cfde3-6c19-4cd5-a35b-be3c8654c95b', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 5, 1, '2025-01-25 00:44:23', '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL),
(619, '617', 'App\\Models\\Attachment', 'b7ad2710-00e2-4785-9640-97b08ad6daf1', 'file', 'image-40', 'image-40.png', 'image/png', 'public', 'public', 194051, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL, NULL),
(620, '618', 'App\\Models\\Attachment', '94571e51-d2a9-4001-80be-bd6d6c1670e9', 'file', 'image-37', 'image-37.png', 'image/png', 'public', 'public', 211047, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL, NULL),
(621, NULL, NULL, 'b57a29ff-8cf0-422f-ae7d-8be7fa547f8b', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 6, 1, '2025-01-25 00:44:23', '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL),
(622, '621', 'App\\Models\\Attachment', 'f5104ab0-b450-40a7-8997-399a92673a92', 'file', 'image-31', 'image-31.png', 'image/png', 'public', 'public', 229240, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:44:23', '2025-01-25 00:44:23', NULL, NULL),
(623, NULL, NULL, 'b457f157-fa25-4589-9b0e-abf7ed72af6d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-25 00:44:28', '2025-01-25 00:44:28', '2025-01-25 00:44:28', NULL),
(624, '623', 'App\\Models\\Attachment', 'ac62006d-566a-4a6a-8540-0eb56939d112', 'file', 'image-42', 'image-42.png', 'image/png', 'public', 'public', 216025, '[]', '[]', '[]', '[]', 1, 1, '2025-01-25 00:44:28', '2025-01-25 00:44:28', NULL, NULL),
(628, NULL, NULL, 'c4a57fa5-05f6-4848-90ab-c8f4376e6ae1', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-28 03:55:24', '2025-01-28 03:55:24', '2025-01-28 03:55:24', NULL),
(630, NULL, NULL, '1f4ad4cd-87e2-4816-a31e-bbf48988e40d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-01-28 03:57:57', '2025-01-28 03:57:57', '2025-01-28 03:57:57', NULL),
(632, NULL, NULL, 'f633f21e-b6b8-4b0c-8b8a-e680eaf3bb50', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-02-18 02:16:17', '2025-02-18 02:16:17', '2025-02-18 02:16:17', NULL),
(634, NULL, NULL, '640aa139-dfda-4f58-b9d3-afd82dcfa5ad', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-02-18 02:16:54', '2025-02-18 02:16:54', '2025-02-18 02:16:54', NULL),
(636, NULL, NULL, 'e1d52dd9-b512-48e8-ae9a-d01f141e685d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-02-18 02:19:22', '2025-02-18 02:19:22', '2025-02-18 02:19:22', NULL),
(638, NULL, NULL, 'ffbf51f4-042d-4e8c-8880-6a95f1402a31', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-02-18 02:32:07', '2025-02-18 02:32:07', '2025-02-18 02:32:07', NULL),
(639, '638', 'App\\Models\\Attachment', '0cca4043-ae6a-40dc-a0ba-2a3ba0444278', 'file', 'video-file', 'video-file.png', 'image/png', 'public', 'public', 8647, '[]', '[]', '[]', '[]', 1, 1, '2025-02-18 02:32:07', '2025-02-18 02:32:56', '2025-02-18 02:32:56', NULL),
(640, NULL, NULL, 'cdf2b008-76c8-493a-bcea-d53ed6ec6171', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-02-18 02:32:09', '2025-02-18 02:32:09', '2025-02-18 02:32:09', NULL),
(641, '640', 'App\\Models\\Attachment', 'c396d194-6117-4d5b-bbc8-f1a201d6cfdc', 'file', 'light', 'light.svg', 'image/svg+xml', 'public', 'public', 4196, '[]', '[]', '[]', '[]', 1, 1, '2025-02-18 02:32:09', '2025-02-18 02:32:09', NULL, NULL),
(642, NULL, NULL, '6198297d-1411-4d57-ad24-d497c0e95ac3', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-02-18 02:32:11', '2025-02-18 02:32:11', '2025-02-18 02:32:11', NULL),
(643, '642', 'App\\Models\\Attachment', '2004835d-4081-464a-8fcd-ebc2944b4196', 'file', 'dark', 'dark.svg', 'image/svg+xml', 'public', 'public', 4192, '[]', '[]', '[]', '[]', 1, 1, '2025-02-18 02:32:11', '2025-02-18 02:32:11', NULL, NULL),
(644, NULL, NULL, '225d949b-c211-4e4c-8772-b9cef466384a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-02-18 02:36:24', '2025-02-18 02:36:24', '2025-02-18 02:36:24', NULL),
(645, '644', 'App\\Models\\Attachment', '41a7fdf9-7921-40fd-950a-27d498cc6fcc', 'attachment', 'dark', 'dark.svg', 'image/svg+xml', 'public', 'public', 4192, '[]', '[]', '[]', '[]', 1, 1, '2025-02-18 02:36:24', '2025-02-18 02:36:24', NULL, NULL),
(646, NULL, NULL, 'eade3a84-6653-4951-a598-55c587de104e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-02-18 02:37:32', '2025-02-18 02:37:32', '2025-02-18 02:37:32', NULL),
(647, '646', 'App\\Models\\Attachment', 'a46a2a35-13f5-4c53-8589-d73f0ff829c3', 'attachment', 'dark', 'dark.svg', 'image/svg+xml', 'public', 'public', 4192, '[]', '[]', '[]', '[]', 1, 1, '2025-02-18 02:37:32', '2025-02-18 02:37:32', NULL, NULL),
(648, NULL, NULL, 'c56c1444-5b8d-4b09-9231-5bb2da199344', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-06 05:53:10', '2025-03-06 05:53:10', '2025-03-06 05:53:10', NULL),
(649, '648', 'App\\Models\\Attachment', '58b5da06-ef67-4a0c-bbfd-8522279dec60', 'file', 'banner-9', 'banner-9.png', 'image/png', 'public', 'public', 389250, '[]', '[]', '[]', '[]', 1, 1, '2025-03-06 05:53:10', '2025-03-06 05:53:10', NULL, NULL),
(650, NULL, NULL, '17d4135b-5960-4757-bdf9-4e3a4b63c7b9', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-06 05:53:14', '2025-03-06 05:53:14', '2025-03-06 05:53:14', NULL),
(651, '650', 'App\\Models\\Attachment', '7a9b956a-18a8-4e63-9906-07c07549eb1a', 'file', 'banner-8', 'banner-8.png', 'image/png', 'public', 'public', 39293, '[]', '[]', '[]', '[]', 1, 1, '2025-03-06 05:53:14', '2025-03-06 05:53:14', NULL, NULL),
(652, NULL, NULL, '7ef985bf-671b-479f-91b0-15d95c411d70', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-06 05:53:15', '2025-03-06 05:53:15', '2025-03-06 05:53:15', NULL),
(653, '652', 'App\\Models\\Attachment', 'a47b0522-4987-4088-b8e3-84bf2abc63d0', 'file', 'banner-7', 'banner-7.png', 'image/png', 'public', 'public', 485636, '[]', '[]', '[]', '[]', 1, 1, '2025-03-06 05:53:15', '2025-03-06 05:53:15', NULL, NULL),
(654, NULL, NULL, 'b08671ba-5ef9-4d8c-9740-5366ef13572d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-06 05:53:20', '2025-03-06 05:53:20', '2025-03-06 05:53:20', NULL),
(655, '654', 'App\\Models\\Attachment', '01688f2a-b9d5-4615-b59b-ea1a365d5c37', 'file', 'banner-5', 'banner-5.png', 'image/png', 'public', 'public', 57521, '[]', '[]', '[]', '[]', 1, 1, '2025-03-06 05:53:20', '2025-03-06 05:53:20', NULL, NULL),
(656, NULL, NULL, '8c55a701-1641-4fef-9934-7fa5974247c5', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-06 05:53:22', '2025-03-06 05:53:22', '2025-03-06 05:53:22', NULL),
(657, '656', 'App\\Models\\Attachment', '006509f4-24dc-470d-95df-1d428be4b971', 'file', 'banner-6', 'banner-6.png', 'image/png', 'public', 'public', 425234, '[]', '[]', '[]', '[]', 1, 1, '2025-03-06 05:53:22', '2025-03-06 05:53:22', NULL, NULL),
(658, NULL, NULL, '134462df-12f1-45f6-9e2c-d4968d5d6f84', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-06 05:53:28', '2025-03-06 05:53:28', '2025-03-06 05:53:28', NULL),
(659, '658', 'App\\Models\\Attachment', 'd97d4618-32fe-46f5-b625-706a0a9122ce', 'file', 'banner-4', 'banner-4.png', 'image/png', 'public', 'public', 747425, '[]', '[]', '[]', '[]', 1, 1, '2025-03-06 05:53:28', '2025-03-06 05:53:28', NULL, NULL),
(660, NULL, NULL, 'd9f3f75d-63d0-42d9-97f1-3e177046c71c', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-06 05:53:29', '2025-03-06 05:53:29', '2025-03-06 05:53:29', NULL),
(661, '660', 'App\\Models\\Attachment', 'df302529-3b21-42f0-b683-7e936a7e667c', 'file', 'banner-2', 'banner-2.png', 'image/png', 'public', 'public', 502515, '[]', '[]', '[]', '[]', 1, 1, '2025-03-06 05:53:29', '2025-03-06 05:53:29', NULL, NULL),
(662, NULL, NULL, '1bcd8e42-8f94-4fb2-9da3-72ca0cafb420', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-06 05:53:34', '2025-03-06 05:53:34', '2025-03-06 05:53:34', NULL),
(663, '662', 'App\\Models\\Attachment', 'bd41e6bf-ad55-4dbd-b070-b33592f26b09', 'file', 'banner-3', 'banner-3.png', 'image/png', 'public', 'public', 717811, '[]', '[]', '[]', '[]', 1, 1, '2025-03-06 05:53:34', '2025-03-06 05:53:34', NULL, NULL),
(664, NULL, NULL, '10dbbceb-c731-4915-8bfb-94093f77bfe6', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-06 05:53:35', '2025-03-06 05:53:35', '2025-03-06 05:53:35', NULL),
(665, '664', 'App\\Models\\Attachment', 'd322f2e9-8fc3-4d3b-930d-24a5b07ce56c', 'file', 'banner-1', 'banner-1.png', 'image/png', 'public', 'public', 741948, '[]', '[]', '[]', '[]', 1, 1, '2025-03-06 05:53:35', '2025-03-06 05:53:35', NULL, NULL),
(672, NULL, NULL, 'dd50a4a4-a479-491e-bb43-08627d573a59', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-06 23:15:05', '2025-03-06 23:15:47', '2025-03-06 23:15:47', NULL),
(673, NULL, NULL, 'b49240dc-1479-415f-986b-97e6de6b4265', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-03-06 23:15:09', '2025-03-06 23:15:39', '2025-03-06 23:15:39', NULL),
(674, NULL, NULL, '094fa9be-39c6-4b5a-89cb-d8ea824bc017', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-06 23:16:08', '2025-03-06 23:16:25', '2025-03-06 23:16:25', NULL),
(675, NULL, NULL, 'fa3cea4b-e8fa-4506-8fc4-bb04d5a7079f', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-06 23:24:40', '2025-03-06 23:24:48', '2025-03-06 23:24:48', NULL),
(676, NULL, NULL, '0fbc27f4-51a2-4d6f-b9ff-7423b4e0ea0a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-07 00:10:08', '2025-03-07 00:10:08', '2025-03-07 00:10:08', NULL),
(678, NULL, NULL, '30303a3e-dbea-4c0c-80b9-29a66e66c945', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-07 00:10:08', '2025-03-07 00:10:08', '2025-03-07 00:10:08', NULL),
(680, NULL, NULL, 'c8ed5420-c4b3-48b5-b6b0-69bfaa6d68df', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-17 04:51:46', '2025-03-17 04:51:46', '2025-03-17 04:51:46', NULL),
(681, '680', 'App\\Models\\Attachment', 'f87c8545-1bf8-4a31-ad28-293c92458038', 'file', 'rider-screen-3', 'rider-screen-3.png', 'image/png', 'public', 'public', 82609, '[]', '[]', '[]', '[]', 1, 1, '2025-03-17 04:51:46', '2025-04-30 01:09:28', '2025-04-30 01:09:28', NULL),
(682, NULL, NULL, '6daf9341-c3cf-4ef7-9028-066610616ad9', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-17 04:51:50', '2025-03-17 04:51:50', '2025-03-17 04:51:50', NULL),
(683, '682', 'App\\Models\\Attachment', 'f07ab497-daa3-4f39-8ef6-986ac09fc03d', 'file', 'rider-screen-2', 'rider-screen-2.png', 'image/png', 'public', 'public', 78916, '[]', '[]', '[]', '[]', 1, 1, '2025-03-17 04:51:50', '2025-04-30 01:09:27', '2025-04-30 01:09:27', NULL),
(684, NULL, NULL, 'da3f96ca-7acd-4917-bba7-6be0787cff12', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-17 04:52:06', '2025-03-17 04:52:06', '2025-03-17 04:52:06', NULL),
(685, '684', 'App\\Models\\Attachment', '72a8d768-371f-4201-a776-02386ba1c582', 'file', 'rider-screen-1', 'rider-screen-1.png', 'image/png', 'public', 'public', 152039, '[]', '[]', '[]', '[]', 1, 1, '2025-03-17 04:52:06', '2025-04-30 01:09:25', '2025-04-30 01:09:25', NULL),
(686, NULL, NULL, '71817d66-c59f-46f3-b3c1-204b90c862ef', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-17 04:52:10', '2025-03-17 04:52:10', '2025-03-17 04:52:10', NULL),
(687, '686', 'App\\Models\\Attachment', 'd7677e47-c494-40d6-a525-0ea3a217c87f', 'file', 'driver-screen-3', 'driver-screen-3.png', 'image/png', 'public', 'public', 129827, '[]', '[]', '[]', '[]', 1, 1, '2025-03-17 04:52:10', '2025-04-30 01:09:10', '2025-04-30 01:09:10', NULL),
(688, NULL, NULL, '36e10290-05eb-4047-bcff-53e30e750a43', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-17 04:52:14', '2025-03-17 04:52:14', '2025-03-17 04:52:14', NULL),
(689, '688', 'App\\Models\\Attachment', '270aae99-77d8-4885-8cb6-207a406e7c58', 'file', 'driver-screen-2', 'driver-screen-2.png', 'image/png', 'public', 'public', 144501, '[]', '[]', '[]', '[]', 1, 1, '2025-03-17 04:52:14', '2025-04-30 01:08:50', '2025-04-30 01:08:50', NULL),
(690, NULL, NULL, '86d12bd4-a265-476e-b97e-a77476828ee1', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-17 04:52:23', '2025-03-17 04:52:23', '2025-03-17 04:52:23', NULL),
(691, '690', 'App\\Models\\Attachment', 'f3f32f68-3ef7-4b79-9b07-4a49400592a3', 'file', 'driver-screen-1', 'driver-screen-1.png', 'image/png', 'public', 'public', 128367, '[]', '[]', '[]', '[]', 1, 1, '2025-03-17 04:52:23', '2025-04-30 01:05:36', '2025-04-30 01:05:36', NULL),
(692, NULL, NULL, '7de20546-89c5-4c18-a8ea-d28e235578c4', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-19 04:31:54', '2025-03-19 04:31:54', '2025-03-19 04:31:54', NULL),
(694, NULL, NULL, '4910dba5-4c92-4e44-a17a-3e52669e551d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-20 04:36:33', '2025-03-20 04:36:33', '2025-03-20 04:36:33', NULL),
(695, '694', 'App\\Models\\Attachment', '8df86a93-9403-4362-bdc5-fdf22d1acfac', 'file', 'splashDriver', 'splashDriver.png', 'image/png', 'public', 'public', 197949, '[]', '[]', '[]', '[]', 1, 1, '2025-03-20 04:36:33', '2025-04-26 03:06:46', '2025-04-26 03:06:46', NULL),
(696, NULL, NULL, 'ccca0b6b-25aa-4726-b2e7-2ed8aaca0c05', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-03-20 04:36:49', '2025-03-20 04:36:49', '2025-03-20 04:36:49', NULL),
(697, '696', 'App\\Models\\Attachment', '3517d5e3-4a9d-4a8f-9d95-2e6438f2f30c', 'file', 'splashUser', 'splashUser.png', 'image/png', 'public', 'public', 196782, '[]', '[]', '[]', '[]', 1, 1, '2025-03-20 04:36:49', '2025-04-26 03:06:57', '2025-04-26 03:06:57', NULL),
(698, NULL, NULL, '15b86755-1779-4f78-9285-a5be93514d3b', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 02:55:37', '2025-04-26 02:55:37', '2025-04-26 02:55:37', NULL),
(699, '698', 'App\\Models\\Attachment', '5ccf0e74-85db-48f1-9d44-bfc996a2ca85', 'file', 'schedule-parcel', 'schedule-parcel.png', 'image/png', 'public', 'public', 8024, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 02:55:37', '2025-04-26 02:55:37', NULL, NULL),
(700, NULL, NULL, 'a91545d1-e3e5-487f-bfea-e2a9cc6e31eb', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 02:55:40', '2025-04-26 02:55:40', '2025-04-26 02:55:40', NULL),
(701, '700', 'App\\Models\\Attachment', '6c090c73-57c1-46bc-b411-ec7d371e7214', 'file', 'schedule-image', 'schedule-image.png', 'image/png', 'public', 'public', 1926, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 02:55:40', '2025-04-26 02:55:40', NULL, NULL),
(702, NULL, NULL, '06a0ab98-7782-4e41-b8fd-eb904a4cea55', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 02:55:41', '2025-04-26 02:55:41', '2025-04-26 02:55:41', NULL),
(703, '702', 'App\\Models\\Attachment', 'd46132c5-9916-4d15-b575-c2e270bf92f5', 'file', 'schedule-freight', 'schedule-freight.png', 'image/png', 'public', 'public', 10023, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 02:55:41', '2025-04-26 02:55:41', NULL, NULL),
(704, NULL, NULL, '9e4816ec-a826-42ba-975a-f4d13984bdc0', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 02:55:46', '2025-04-26 02:55:46', '2025-04-26 02:55:46', NULL),
(705, '704', 'App\\Models\\Attachment', '790202a5-c5b9-4bdf-a569-79956907cebf', 'file', 'schedule-cab', 'schedule-cab.png', 'image/png', 'public', 'public', 11822, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 02:55:46', '2025-04-26 02:55:46', NULL, NULL),
(706, NULL, NULL, 'b82bdf37-8f4b-47d2-b6a3-ef9230d84b77', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 02:55:48', '2025-04-26 02:55:48', '2025-04-26 02:55:48', NULL),
(707, '706', 'App\\Models\\Attachment', 'a0ce2792-83fd-49b3-80da-45ff768aa061', 'file', 'ride-parcel', 'ride-parcel.png', 'image/png', 'public', 'public', 8905, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 02:55:48', '2025-04-26 02:55:48', NULL, NULL),
(708, NULL, NULL, '944bceb4-52d9-4dbc-94c0-1e437b8a5644', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 02:55:49', '2025-04-26 02:55:49', '2025-04-26 02:55:49', NULL),
(709, '708', 'App\\Models\\Attachment', 'a050be6d-8919-48cc-a615-f4bff8f66ce8', 'file', 'ride-image', 'ride-image.png', 'image/png', 'public', 'public', 2820, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 02:55:49', '2025-04-26 02:55:49', NULL, NULL),
(710, NULL, NULL, '0eb178ef-99e2-4f01-87f4-2722c46e86f1', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 02:55:52', '2025-04-26 02:55:52', '2025-04-26 02:55:52', NULL),
(711, '710', 'App\\Models\\Attachment', 'c80186fe-bc7f-4e16-8ae0-46a82ababae2', 'file', 'ride-freight', 'ride-freight.png', 'image/png', 'public', 'public', 12885, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 02:55:52', '2025-04-26 02:55:52', NULL, NULL),
(712, NULL, NULL, 'd0877b1e-4961-4c44-b129-7279a51aa3f7', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 02:55:58', '2025-04-26 02:55:58', '2025-04-26 02:55:58', NULL),
(713, '712', 'App\\Models\\Attachment', 'f277b3bc-f353-440b-ba97-ed304fcb30fd', 'file', 'ride-cab', 'ride-cab.png', 'image/png', 'public', 'public', 13417, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 02:55:58', '2025-04-26 02:55:58', NULL, NULL),
(714, NULL, NULL, '0728ca67-e7f1-4932-8785-3ce6105120fe', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 02:55:59', '2025-04-26 02:55:59', '2025-04-26 02:55:59', NULL),
(715, '714', 'App\\Models\\Attachment', '4194883a-dd95-460d-a92e-1adc17dcf41a', 'file', 'rental-cab', 'rental-cab.png', 'image/png', 'public', 'public', 14077, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 02:55:59', '2025-04-26 02:55:59', NULL, NULL),
(716, NULL, NULL, '866ca1b3-4b4e-4c12-a278-ef72204a73be', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 02:56:02', '2025-04-26 02:56:02', '2025-04-26 02:56:02', NULL),
(717, '716', 'App\\Models\\Attachment', '7af89958-d202-4cc5-aae8-78c88f33e8a3', 'file', 'package-cab', 'package-cab.png', 'image/png', 'public', 'public', 12607, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 02:56:02', '2025-04-26 02:56:02', NULL, NULL),
(718, NULL, NULL, 'f72b7501-6759-49c2-9378-daec5e2954af', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 02:56:03', '2025-04-26 02:56:03', '2025-04-26 02:56:03', NULL),
(719, '718', 'App\\Models\\Attachment', 'f043a42d-ec86-4bf7-b073-0d676d34cef3', 'file', 'package', 'package.png', 'image/png', 'public', 'public', 4422, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 02:56:03', '2025-04-26 02:56:03', NULL, NULL),
(720, NULL, NULL, '28231156-5aa9-4b5f-bd1d-e6bc30616a49', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 02:56:07', '2025-04-26 02:56:07', '2025-04-26 02:56:07', NULL),
(721, '720', 'App\\Models\\Attachment', '597ca0be-b0b7-455a-8f8f-7a4f8e03bb05', 'file', 'intercity-parcel', 'intercity-parcel.png', 'image/png', 'public', 'public', 13379, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 02:56:07', '2025-04-26 02:56:07', NULL, NULL),
(722, NULL, NULL, '0cebd2cb-a5ff-45a6-b5af-9824daa2682a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 02:56:10', '2025-04-26 02:56:10', '2025-04-26 02:56:10', NULL),
(723, '722', 'App\\Models\\Attachment', '882ea8b6-2a3d-4612-9b25-ae2bd8e8a124', 'file', 'intercity-freight', 'intercity-freight.png', 'image/png', 'public', 'public', 15894, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 02:56:10', '2025-04-26 02:56:10', NULL, NULL),
(724, NULL, NULL, '03ba767c-ab1a-4a60-96dc-36625f3d8438', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 02:56:11', '2025-04-26 02:56:11', '2025-04-26 02:56:11', NULL),
(725, '724', 'App\\Models\\Attachment', '345fbe07-459e-4799-9742-c35c7b843b63', 'file', 'intercity-cab', 'intercity-cab.png', 'image/png', 'public', 'public', 11098, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 02:56:11', '2025-04-26 02:56:11', NULL, NULL),
(726, NULL, NULL, '8906118c-6188-48d5-abbe-22f5ba457351', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 02:56:17', '2025-04-26 02:56:17', '2025-04-26 02:56:17', NULL),
(727, '726', 'App\\Models\\Attachment', '8cf803a0-6db4-48a1-8222-c9d516836983', 'file', 'ambulance', 'ambulance.png', 'image/png', 'public', 'public', 9113, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 02:56:17', '2025-04-30 01:49:16', '2025-04-30 01:49:16', NULL),
(728, NULL, NULL, '7827b276-7cca-4d7d-b15b-904e509ab18e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 03:12:54', '2025-04-26 03:12:54', '2025-04-26 03:12:54', NULL),
(729, '728', 'App\\Models\\Attachment', '209e90c2-438d-4a60-9b68-4def1f1fee1f', 'file', 'parcel', 'parcel.png', 'image/png', 'public', 'public', 8090, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 03:12:54', '2025-04-30 01:49:11', '2025-04-30 01:49:11', NULL),
(730, NULL, NULL, '39494bc0-8c4a-4a5a-92cc-46cd515feb81', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 03:12:55', '2025-04-26 03:12:55', '2025-04-26 03:12:55', NULL),
(731, '730', 'App\\Models\\Attachment', 'd6082e84-660c-4733-a31f-8c8853ee0550', 'file', 'freight', 'freight.png', 'image/png', 'public', 'public', 10551, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 03:12:55', '2025-04-30 01:49:05', '2025-04-30 01:49:05', NULL),
(732, NULL, NULL, 'be4aa2e2-7026-4429-80c5-ae47d6dd449e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 03:12:56', '2025-04-26 03:12:56', '2025-04-26 03:12:56', NULL),
(733, '732', 'App\\Models\\Attachment', '6deb2871-b1f0-4ec0-b07c-ffc0da1cfb6c', 'file', 'cab', 'cab.png', 'image/png', 'public', 'public', 5973, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 03:12:56', '2025-04-30 01:48:58', '2025-04-30 01:48:58', NULL),
(734, NULL, NULL, '5784a593-dc64-49b3-b65b-e92ff8c52f94', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 03:36:23', '2025-04-26 03:36:23', '2025-04-26 03:36:23', NULL),
(735, '734', 'App\\Models\\Attachment', '1b30281c-e237-4271-a485-607a7dc07d82', 'file', 'amb_banner2', 'amb_banner2.png', 'image/png', 'public', 'public', 81312, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 03:36:23', '2025-04-26 03:36:23', NULL, NULL);
INSERT INTO `media` (`id`, `model_id`, `model_type`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`, `alternative_text`) VALUES
(736, NULL, NULL, '24e60731-11ea-400f-9090-0e7beae96db2', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 03:36:23', '2025-04-26 03:36:23', '2025-04-26 03:36:23', NULL),
(737, '736', 'App\\Models\\Attachment', '7cc563e4-33d6-41b3-b9ad-c2fe3b611afa', 'file', 'amb_banner1', 'amb_banner1.png', 'image/png', 'public', 'public', 414653, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 03:36:23', '2025-04-26 03:36:23', NULL, NULL),
(738, NULL, NULL, '4cc209aa-a2f4-4a56-8179-187fd031d1c6', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 03:36:26', '2025-04-26 03:36:26', '2025-04-26 03:36:26', NULL),
(739, '738', 'App\\Models\\Attachment', '5a80cda3-313d-4aad-882e-a9f775063acb', 'file', 'amb_banner', 'amb_banner.png', 'image/png', 'public', 'public', 435011, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 03:36:26', '2025-04-26 03:36:26', NULL, NULL),
(740, NULL, NULL, '2456371d-25a2-4bf1-919c-39cbece097f7', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 03:36:31', '2025-04-26 03:36:31', '2025-04-26 03:36:31', NULL),
(741, '740', 'App\\Models\\Attachment', '17190cc4-f708-4bf3-8a9f-d6fadf8a0d47', 'file', 'zomo', 'zomo.sql', 'text/plain', 'public', 'public', 1294770, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 03:36:31', '2025-04-26 03:36:56', '2025-04-26 03:36:56', NULL),
(742, NULL, NULL, '747beb7a-c28d-41d2-8287-fe4a74a37c6f', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 04:26:56', '2025-04-26 04:26:56', '2025-04-26 04:26:56', NULL),
(743, '742', 'App\\Models\\Attachment', 'da2e59e0-0938-4ce7-859d-5aec3b973f02', 'file', 'ambulance', 'ambulance.png', 'image/png', 'public', 'public', 3836, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 04:26:56', '2025-04-26 04:26:56', NULL, NULL),
(745, NULL, NULL, '4ae959fe-45c0-410a-b109-38e3745848c7', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 04:39:11', '2025-04-26 04:39:34', '2025-04-26 04:39:34', NULL),
(746, NULL, NULL, '8f4a6772-f249-4cf7-8970-acc102b60df2', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-04-26 04:39:13', '2025-04-26 04:39:29', '2025-04-26 04:39:29', NULL),
(749, NULL, NULL, '8bc552da-1915-448b-bd2b-a6490dca5a19', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 04:42:41', '2025-04-26 04:42:41', '2025-04-26 04:42:41', NULL),
(750, '749', 'App\\Models\\Attachment', '31001c3e-db3f-413f-887a-6779f07111f3', 'attachment', 'schedule-image', 'schedule-image.png', 'image/png', 'public', 'public', 1926, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 04:42:41', '2025-04-26 06:24:41', '2025-04-26 06:24:41', NULL),
(751, NULL, NULL, 'dd2a2bd5-ed42-4888-8e59-9785f43e01c8', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 04:45:20', '2025-04-26 04:45:20', '2025-04-26 04:45:20', NULL),
(752, '751', 'App\\Models\\Attachment', '55eb64c6-4cbf-4f97-9937-d72e867049cd', 'attachment', 'schedule-image', 'schedule-image.png', 'image/png', 'public', 'public', 1926, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 04:45:20', '2025-04-26 06:24:33', '2025-04-26 06:24:33', NULL),
(753, NULL, NULL, '827a34ab-3489-402a-9924-8c7f488e3f21', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 04:46:37', '2025-04-26 04:46:37', '2025-04-26 04:46:37', NULL),
(754, '753', 'App\\Models\\Attachment', 'b08df4c9-00a7-4026-8e23-5aa188f33399', 'attachment', 'dark', 'dark.svg', 'image/svg+xml', 'public', 'public', 4192, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 04:46:37', '2025-04-26 04:46:37', NULL, NULL),
(755, NULL, NULL, '48090bf8-1bc0-4f5f-8e42-a9148063e784', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 04:53:07', '2025-04-26 04:53:07', '2025-04-26 04:53:07', NULL),
(756, '755', 'App\\Models\\Attachment', '4df10fde-5cd3-4736-9cc1-3dc9ad0832ea', 'attachment', 'home-screen', 'home-screen.png', 'image/png', 'public', 'public', 1153672, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 04:53:07', '2025-04-30 03:47:52', '2025-04-30 03:47:52', NULL),
(757, NULL, NULL, '95796967-efce-4c78-928b-334dde0bc92d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 04:53:07', '2025-04-26 04:53:07', '2025-04-26 04:53:07', NULL),
(759, NULL, NULL, 'f5cf2992-d792-49d3-94b9-82f11ca97c11', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 04:53:07', '2025-04-26 04:53:07', '2025-04-26 04:53:07', NULL),
(761, NULL, NULL, 'd809c869-dc29-4d50-8e31-f220bb171e2a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 04:53:07', '2025-04-26 04:53:07', '2025-04-26 04:53:07', NULL),
(763, NULL, NULL, '4cc6ad8b-b64e-404a-8e75-1aebf27c84e0', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 04:53:07', '2025-04-26 04:53:07', '2025-04-26 04:53:07', NULL),
(766, NULL, NULL, '3e2190eb-207e-4f1b-9cfc-ba1b44ed1b98', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 04:57:23', '2025-04-26 04:57:32', '2025-04-26 04:57:32', NULL),
(767, NULL, NULL, 'ecf021f3-7bb9-406a-ab42-b87d89b4c24a', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 2, 1, '2025-04-26 04:57:25', '2025-04-26 04:57:39', '2025-04-26 04:57:39', NULL),
(768, NULL, NULL, '73a1a70b-bc39-492e-84c9-22b29eb4f2dc', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 05:06:32', '2025-04-26 05:06:32', '2025-04-26 05:06:32', NULL),
(770, NULL, NULL, 'b46e40c3-3a14-4f3d-8949-5717b9b31141', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 05:06:34', '2025-04-26 05:06:34', '2025-04-26 05:06:34', NULL),
(772, NULL, NULL, '53c842d8-c874-4134-9598-05f173bc1c10', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 05:07:23', '2025-04-26 05:07:23', '2025-04-26 05:07:23', NULL),
(774, NULL, NULL, '46f56973-feb1-4708-a927-32622f78fdb4', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 05:07:23', '2025-04-26 05:07:23', '2025-04-26 05:07:23', NULL),
(776, NULL, NULL, 'c8d1a5f9-3635-4463-a14c-2924c5762ec9', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 06:28:19', '2025-04-26 06:28:19', '2025-04-26 06:28:19', NULL),
(777, '776', 'App\\Models\\Attachment', '8bd834ae-6d87-4b6e-b66c-17da886d1e85', 'file', 'splash_driver', 'splash_driver.png', 'image/png', 'public', 'public', 40680, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 06:28:19', '2025-04-26 06:28:19', NULL, NULL),
(778, NULL, NULL, '5bef0748-7453-414e-9c69-d8bb2bf97fd1', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-26 06:28:20', '2025-04-26 06:28:20', '2025-04-26 06:28:20', NULL),
(779, '778', 'App\\Models\\Attachment', '6540cddf-2d36-45d7-a1d9-8dd417483fdf', 'file', 'splash', 'splash.png', 'image/png', 'public', 'public', 197479, '[]', '[]', '[]', '[]', 1, 1, '2025-04-26 06:28:20', '2025-04-26 06:28:20', NULL, NULL),
(780, NULL, NULL, '045e6858-5c73-4b66-81ae-73727b29afe6', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-30 01:53:05', '2025-04-30 01:53:05', '2025-04-30 01:53:05', NULL),
(781, '780', 'App\\Models\\Attachment', '4b43ff2d-0f5a-4193-b1cc-bf4c836974f8', 'file', 'Ambulance', 'Ambulance.png', 'image/png', 'public', 'public', 21145, '[]', '[]', '[]', '[]', 1, 1, '2025-04-30 01:53:05', '2025-04-30 01:53:05', NULL, NULL),
(782, NULL, NULL, '34aaac85-1afd-4baf-855e-78f6b7b444a4', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-30 01:53:07', '2025-04-30 01:53:07', '2025-04-30 01:53:07', NULL),
(783, '782', 'App\\Models\\Attachment', 'd23247f5-6a97-409d-a837-47f4016c8e94', 'file', 'Cab', 'Cab.png', 'image/png', 'public', 'public', 19712, '[]', '[]', '[]', '[]', 1, 1, '2025-04-30 01:53:07', '2025-04-30 01:53:07', NULL, NULL),
(784, NULL, NULL, 'bef28afa-d20a-4c22-8771-5aac2137c76c', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-30 01:53:09', '2025-04-30 01:53:09', '2025-04-30 01:53:09', NULL),
(785, '784', 'App\\Models\\Attachment', '46997826-40a3-4773-be5f-9d775272bc82', 'file', 'Driver-screen-1', 'Driver-screen-1.png', 'image/png', 'public', 'public', 128337, '[]', '[]', '[]', '[]', 1, 1, '2025-04-30 01:53:09', '2025-04-30 01:53:09', NULL, NULL),
(786, NULL, NULL, 'a1bb6f19-7c95-442f-8688-0b842b30ed76', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-30 01:53:11', '2025-04-30 01:53:11', '2025-04-30 01:53:11', NULL),
(787, '786', 'App\\Models\\Attachment', '9b8135fe-9e7a-4f16-b986-30efea5ada31', 'file', 'Driver-screen-2', 'Driver-screen-2.png', 'image/png', 'public', 'public', 144437, '[]', '[]', '[]', '[]', 1, 1, '2025-04-30 01:53:11', '2025-04-30 01:53:11', NULL, NULL),
(788, NULL, NULL, '132f0e76-e537-4aa3-aa36-681466188b9d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-30 01:53:12', '2025-04-30 01:53:13', '2025-04-30 01:53:13', NULL),
(789, '788', 'App\\Models\\Attachment', '49e3290b-aa30-48a7-88f1-3e39aa827c83', 'file', 'Driver-screen-3', 'Driver-screen-3.png', 'image/png', 'public', 'public', 129975, '[]', '[]', '[]', '[]', 1, 1, '2025-04-30 01:53:13', '2025-04-30 01:53:13', NULL, NULL),
(790, NULL, NULL, '459fddcd-50ff-46c7-9740-30300a430c42', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-30 01:53:15', '2025-04-30 01:53:15', '2025-04-30 01:53:15', NULL),
(791, '790', 'App\\Models\\Attachment', 'd1300266-666f-4a31-a6ee-4c41cc48624b', 'file', 'Freight', 'Freight.png', 'image/png', 'public', 'public', 38432, '[]', '[]', '[]', '[]', 1, 1, '2025-04-30 01:53:15', '2025-04-30 01:53:15', NULL, NULL),
(792, NULL, NULL, 'eba4bb08-0045-4343-9e2e-3525a29bb9b7', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-30 01:53:17', '2025-04-30 01:53:17', '2025-04-30 01:53:17', NULL),
(793, '792', 'App\\Models\\Attachment', '41b1d6ea-ca63-407d-835e-e88f37d403e2', 'file', 'Parcel', 'Parcel.png', 'image/png', 'public', 'public', 25745, '[]', '[]', '[]', '[]', 1, 1, '2025-04-30 01:53:17', '2025-04-30 01:53:17', NULL, NULL),
(794, NULL, NULL, 'df8a8bf4-3b5c-46ae-9eb1-d42585cc3745', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-30 01:53:19', '2025-04-30 01:53:19', '2025-04-30 01:53:19', NULL),
(795, '794', 'App\\Models\\Attachment', '10ed627f-223c-46af-90eb-efa866b02a59', 'file', 'Rider-screen-1', 'Rider-screen-1.png', 'image/png', 'public', 'public', 151387, '[]', '[]', '[]', '[]', 1, 1, '2025-04-30 01:53:19', '2025-04-30 01:53:19', NULL, NULL),
(796, NULL, NULL, '91e08c8b-be3e-432c-8fb0-a981bc59e68d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-30 01:53:20', '2025-04-30 01:53:21', '2025-04-30 01:53:21', NULL),
(797, '796', 'App\\Models\\Attachment', 'd4a65ccc-45dd-4291-af59-520e7f515caf', 'file', 'Rider-screen-2', 'Rider-screen-2.png', 'image/png', 'public', 'public', 78507, '[]', '[]', '[]', '[]', 1, 1, '2025-04-30 01:53:21', '2025-04-30 01:53:21', NULL, NULL),
(798, NULL, NULL, 'ccc54b4e-ff90-4b1e-bdd9-0f2a1e458b46', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-30 01:53:23', '2025-04-30 01:53:23', '2025-04-30 01:53:23', NULL),
(799, '798', 'App\\Models\\Attachment', 'dc5c42cf-f84e-4a04-a90b-54b51588fcbf', 'file', 'Rider-screen-3', 'Rider-screen-3.png', 'image/png', 'public', 'public', 82119, '[]', '[]', '[]', '[]', 1, 1, '2025-04-30 01:53:23', '2025-04-30 01:53:23', NULL, NULL),
(800, NULL, NULL, '039e9dd5-ff75-4da1-a21d-6260976283ee', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-30 03:54:04', '2025-04-30 03:54:04', '2025-04-30 03:54:04', NULL),
(801, '800', 'App\\Models\\Attachment', '863b29c5-84b2-4b50-b07f-9e6759937a1e', 'attachment', 'home-screen', 'home-screen.png', 'image/png', 'public', 'public', 1154126, '[]', '[]', '[]', '[]', 1, 1, '2025-04-30 03:54:04', '2025-04-30 03:54:04', NULL, NULL),
(802, NULL, NULL, 'f91078d7-a97c-4bb5-8dca-7820b8e749bd', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-04-30 04:04:13', '2025-04-30 04:04:13', '2025-04-30 04:04:13', NULL),
(804, NULL, NULL, 'f78d32c4-8560-4420-86b8-3ab10f76d29e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-16 07:22:29', '2025-07-16 07:22:29', '2025-07-16 07:22:29', NULL),
(805, '804', 'App\\Models\\Attachment', 'c47921fe-29c9-4232-9c32-48fc4a039d74', 'file', 'person', 'person.png', 'image/png', 'public', 'public', 2203, '[]', '[]', '[]', '[]', 1, 1, '2025-07-16 07:22:29', '2025-07-16 07:22:29', NULL, NULL),
(806, NULL, NULL, '4c316f40-559e-4cc4-b3dc-742c2d93ed7e', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-16 07:36:26', '2025-07-16 07:36:26', '2025-07-16 07:36:26', NULL),
(807, '806', 'App\\Models\\Attachment', 'cf4e9bba-712f-4fe1-8d31-fe8092f023ef', 'file', 'another-ride', 'another-ride.png', 'image/png', 'public', 'public', 2631, '[]', '[]', '[]', '[]', 1, 1, '2025-07-16 07:36:26', '2025-07-16 07:36:26', NULL, NULL),
(808, NULL, NULL, '3ccd417e-bd90-4298-a0d3-a10812c95cd7', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-16 07:36:28', '2025-07-16 07:36:28', '2025-07-16 07:36:28', NULL),
(809, '808', 'App\\Models\\Attachment', '372d0ac4-b079-4448-8f4d-d1a2e8d2cf15', 'file', 'driver-late', 'driver-late.png', 'image/png', 'public', 'public', 2414, '[]', '[]', '[]', '[]', 1, 1, '2025-07-16 07:36:28', '2025-07-16 07:36:28', NULL, NULL),
(810, NULL, NULL, '5c69e15f-9be7-49cc-934d-343d9cddd129', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-16 07:36:30', '2025-07-16 07:36:30', '2025-07-16 07:36:30', NULL),
(811, '810', 'App\\Models\\Attachment', 'a6de90a9-c816-4a54-86db-d1acf6cea96c', 'file', 'external-issue', 'external-issue.png', 'image/png', 'public', 'public', 2386, '[]', '[]', '[]', '[]', 1, 1, '2025-07-16 07:36:30', '2025-07-16 07:36:30', NULL, NULL),
(812, NULL, NULL, '852fe576-dc8a-4331-9e67-002bcb19267d', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-16 07:36:32', '2025-07-16 07:36:32', '2025-07-16 07:36:32', NULL),
(813, '812', 'App\\Models\\Attachment', '2f340e67-6a0f-45f4-b3ba-3217e206caf1', 'file', 'pickup-wrong', 'pickup-wrong.png', 'image/png', 'public', 'public', 2270, '[]', '[]', '[]', '[]', 1, 1, '2025-07-16 07:36:32', '2025-07-16 07:36:32', NULL, NULL),
(814, NULL, NULL, '42d0a06d-732d-4ab6-9e1a-097045c17137', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-16 07:36:34', '2025-07-16 07:36:34', '2025-07-16 07:36:34', NULL),
(815, '814', 'App\\Models\\Attachment', '82e4d79b-2898-48aa-a4a8-7b789c7253cb', 'file', 'wait-time', 'wait-time.png', 'image/png', 'public', 'public', 3547, '[]', '[]', '[]', '[]', 1, 1, '2025-07-16 07:36:34', '2025-07-16 07:36:34', NULL, NULL),
(816, NULL, NULL, '4f011fa7-0333-4076-97fa-55acb8393918', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-16 07:39:05', '2025-07-16 07:39:05', '2025-07-16 07:39:05', NULL),
(817, '816', 'App\\Models\\Attachment', '5fd6a935-5f5d-4c4f-92fc-631433b4c2b8', 'file', 'medical-emergency', 'medical-emergency.png', 'image/png', 'public', 'public', 1254, '[]', '[]', '[]', '[]', 1, 1, '2025-07-16 07:39:05', '2025-07-16 07:39:05', NULL, NULL),
(818, NULL, NULL, '208056e3-607b-4aa3-80cf-43ca55f3df93', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-16 07:39:07', '2025-07-16 07:39:07', '2025-07-16 07:39:07', NULL),
(819, '818', 'App\\Models\\Attachment', 'a85d12ec-5763-4ea1-849b-d6b5b07cd283', 'file', 'vehicle-accident', 'vehicle-accident.png', 'image/png', 'public', 'public', 2298, '[]', '[]', '[]', '[]', 1, 1, '2025-07-16 07:39:07', '2025-07-16 07:39:07', NULL, NULL),
(820, NULL, NULL, '6772f86c-c92a-46db-b622-a93ce9cd06b8', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-16 07:39:09', '2025-07-16 07:39:09', '2025-07-16 07:39:09', NULL),
(821, '820', 'App\\Models\\Attachment', 'f66cde23-1e73-463e-8690-56cb9365b7b9', 'file', 'police-assistance', 'police-assistance.png', 'image/png', 'public', 'public', 2312, '[]', '[]', '[]', '[]', 1, 1, '2025-07-16 07:39:09', '2025-07-16 07:39:09', NULL, NULL),
(822, NULL, NULL, '43ed9910-d04d-4891-9f6d-496056b2fcb4', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-16 07:39:11', '2025-07-16 07:39:11', '2025-07-16 07:39:11', NULL),
(823, '822', 'App\\Models\\Attachment', 'a8d44a0b-225f-41ed-8e43-2e15604846d4', 'file', 'fire-emergency.png', 'fire-emergency.png.', 'image/png', 'public', 'public', 2280, '[]', '[]', '[]', '[]', 1, 1, '2025-07-16 07:39:11', '2025-07-16 23:26:41', '2025-07-16 23:26:41', NULL),
(824, NULL, NULL, '78b3490c-82be-492e-a9d7-90cde2f8cf55', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-16 23:00:04', '2025-07-16 23:00:04', '2025-07-16 23:00:04', NULL),
(825, '824', 'App\\Models\\Attachment', '7ddbb4d3-2e7f-45e9-9bf7-3600039f0b68', 'file', 'top-auto', 'top-auto.svg', 'image/svg+xml', 'public', 'public', 5447, '[]', '[]', '[]', '[]', 1, 1, '2025-07-16 23:00:04', '2025-07-16 23:00:04', NULL, NULL),
(826, NULL, NULL, '398806f8-99de-4b1b-92f9-118ffdfdf2fb', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-16 23:03:04', '2025-07-16 23:03:04', '2025-07-16 23:03:04', NULL),
(827, '826', 'App\\Models\\Attachment', 'd7ddacb8-91f2-44c7-a676-54a5ef429b9f', 'file', 'top-car', 'top-car.svg', 'image/svg+xml', 'public', 'public', 3105, '[]', '[]', '[]', '[]', 1, 1, '2025-07-16 23:03:04', '2025-07-16 23:03:04', NULL, NULL),
(828, NULL, NULL, '74ac22ac-c8ae-4133-aa74-57971b2f4f20', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-16 23:07:28', '2025-07-16 23:07:29', '2025-07-16 23:07:29', NULL),
(829, '828', 'App\\Models\\Attachment', '542eb32a-aee2-4fa3-bfd5-ef1be344696b', 'file', 'bike', 'bike.svg', 'image/svg+xml', 'public', 'public', 7119, '[]', '[]', '[]', '[]', 1, 1, '2025-07-16 23:07:29', '2025-07-16 23:07:29', NULL, NULL),
(830, NULL, NULL, 'a2a918b5-d844-43aa-80cb-dc92203026b4', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-16 23:38:29', '2025-07-16 23:38:29', '2025-07-16 23:38:29', NULL),
(831, '830', 'App\\Models\\Attachment', '194d16f3-b36f-4148-bc91-e337cc1aed70', 'file', 'Chota-hathi', 'Chota-hathi.svg', 'image/svg+xml', 'public', 'public', 56979, '[]', '[]', '[]', '[]', 1, 1, '2025-07-16 23:38:29', '2025-07-16 23:38:29', NULL, NULL),
(832, NULL, NULL, 'a3b3471d-ba64-4d62-88c1-fc56ee07a1e3', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-16 23:38:30', '2025-07-16 23:38:30', '2025-07-16 23:38:30', NULL),
(833, '832', 'App\\Models\\Attachment', 'da68acd7-d307-49de-aacc-afd110a897ac', 'file', 'bolero', 'bolero.svg', 'image/svg+xml', 'public', 'public', 15404, '[]', '[]', '[]', '[]', 1, 1, '2025-07-16 23:38:30', '2025-07-16 23:38:30', NULL, NULL),
(834, NULL, NULL, '678bfb84-e567-40fd-b8f0-508f19798c0f', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-17 00:20:15', '2025-07-17 00:20:15', '2025-07-17 00:20:15', NULL),
(835, '834', 'App\\Models\\Attachment', '5d37d711-56cc-44bf-9896-1ffcdead1597', 'file', 'truck', 'truck.svg', 'image/svg+xml', 'public', 'public', 32985, '[]', '[]', '[]', '[]', 1, 1, '2025-07-17 00:20:15', '2025-07-17 00:20:15', NULL, NULL),
(836, NULL, NULL, '2713aace-ce19-48b5-82e2-f766f0c03750', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-17 00:20:17', '2025-07-17 00:20:18', '2025-07-17 00:20:18', NULL),
(837, '836', 'App\\Models\\Attachment', 'e7dbc9a9-157f-4541-9432-2ec51efec3d4', 'file', 'Prime', 'Prime.svg', 'image/svg+xml', 'public', 'public', 50653, '[]', '[]', '[]', '[]', 1, 1, '2025-07-17 00:20:17', '2025-07-17 00:20:17', NULL, NULL),
(838, NULL, NULL, 'c83e48a9-885d-4116-b81d-8b423be84dff', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-17 00:20:20', '2025-07-17 00:20:20', '2025-07-17 00:20:20', NULL),
(839, '838', 'App\\Models\\Attachment', '93f591fa-b175-4da0-8bf5-be06cb2f9abf', 'file', 'big truck', 'big-truck.svg', 'image/svg+xml', 'public', 'public', 1250062, '[]', '[]', '[]', '[]', 1, 1, '2025-07-17 00:20:20', '2025-07-17 00:20:20', NULL, NULL),
(840, NULL, NULL, '33d1efb1-8c86-4f9a-b876-45a4907108ce', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-17 00:42:12', '2025-07-17 00:42:12', '2025-07-17 00:42:12', NULL),
(841, '840', 'App\\Models\\Attachment', '46541377-cced-4d6f-977e-d0d484230faa', 'file', 'cargo-van', 'cargo-van.svg', 'image/svg+xml', 'public', 'public', 110792, '[]', '[]', '[]', '[]', 1, 1, '2025-07-17 00:42:12', '2025-07-17 00:42:12', NULL, NULL),
(842, NULL, NULL, '578d6d3b-28f7-4c26-a23f-89b0841a3aa9', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-17 00:42:55', '2025-07-17 00:42:55', '2025-07-17 00:42:55', NULL),
(843, '842', 'App\\Models\\Attachment', '853715a3-67e2-4bdf-8df9-a84367c3cf50', 'file', 'Tempo', 'Tempo.svg', 'image/svg+xml', 'public', 'public', 627661, '[]', '[]', '[]', '[]', 1, 1, '2025-07-17 00:42:55', '2025-07-17 00:42:55', NULL, NULL),
(844, NULL, NULL, '3cb593ea-6f1a-4f05-abdf-e2da59888d69', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-21 00:11:06', '2025-07-21 00:11:06', '2025-07-21 00:11:06', NULL),
(845, '844', 'App\\Models\\Attachment', '352f1f6e-3187-4cd4-ad0e-be6c06d0fb6b', 'attachment', 'Package', 'Package.gif', 'image/gif', 'public', 'public', 383050, '[]', '[]', '[]', '[]', 1, 1, '2025-07-21 00:11:06', '2025-07-21 00:17:34', '2025-07-21 00:17:34', NULL),
(846, NULL, NULL, 'bb1fa208-5e74-4c42-ad7e-0a4b267ad6b8', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-21 01:11:38', '2025-07-21 01:11:38', '2025-07-21 01:11:38', NULL),
(847, '846', 'App\\Models\\Attachment', 'b550fada-6c01-4881-965f-4b7e0d486ce9', 'attachment', 'Package--1', 'Package--1.gif', 'image/gif', 'public', 'public', 375867, '[]', '[]', '[]', '[]', 1, 1, '2025-07-21 01:11:38', '2025-07-21 01:11:38', NULL, NULL),
(848, NULL, NULL, 'ee826396-48e9-4a04-8885-2dcfa6a9b4a9', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-21 01:13:22', '2025-07-21 01:13:22', '2025-07-21 01:13:22', NULL),
(849, '848', 'App\\Models\\Attachment', '84e98cf6-1570-44c8-9c13-757000130b5b', 'attachment', 'home', 'home.png', 'image/png', 'public', 'public', 1121850, '[]', '[]', '[]', '[]', 1, 1, '2025-07-21 01:13:22', '2025-07-21 01:13:22', NULL, NULL),
(850, NULL, NULL, '7cfd17cb-fb06-47ba-a0ac-22378c734aed', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-21 01:13:22', '2025-07-21 01:13:22', '2025-07-21 01:13:22', NULL),
(851, '850', 'App\\Models\\Attachment', '8bb64de6-76f8-4214-9757-a68742be923f', 'attachment', 'location', 'location.png', 'image/png', 'public', 'public', 345322, '[]', '[]', '[]', '[]', 1, 1, '2025-07-21 01:13:22', '2025-07-21 01:13:22', NULL, NULL),
(852, NULL, NULL, '4a814fa1-944b-4afc-b717-ce0f1b47f467', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-21 01:13:22', '2025-07-21 01:13:22', '2025-07-21 01:13:22', NULL),
(853, '852', 'App\\Models\\Attachment', 'f15ca1bd-d23b-4cd7-9084-a5757abeff38', 'attachment', 'ride', 'ride.png', 'image/png', 'public', 'public', 527852, '[]', '[]', '[]', '[]', 1, 1, '2025-07-21 01:13:22', '2025-07-21 01:13:22', NULL, NULL),
(854, NULL, NULL, '9268d460-cfde-4e23-927b-d222397a2869', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-21 01:13:22', '2025-07-21 01:13:22', '2025-07-21 01:13:22', NULL),
(855, '854', 'App\\Models\\Attachment', 'a42da17b-f201-4aa6-b230-8de6b5f077c3', 'attachment', 'payout', 'payout.png', 'image/png', 'public', 'public', 461106, '[]', '[]', '[]', '[]', 1, 1, '2025-07-21 01:13:22', '2025-07-21 01:13:22', NULL, NULL),
(856, NULL, NULL, 'e785f285-b1e8-4347-b7d6-b05ee71bff00', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-21 01:13:22', '2025-07-21 01:13:22', '2025-07-21 01:13:22', NULL),
(857, '856', 'App\\Models\\Attachment', '2d4991b0-48bb-437e-8790-200cdffb862f', 'attachment', 'rating', 'rating.png', 'image/png', 'public', 'public', 338380, '[]', '[]', '[]', '[]', 1, 1, '2025-07-21 01:13:22', '2025-07-21 01:13:22', NULL, NULL),
(858, NULL, NULL, '0fba7a76-2f52-44d8-82ab-f574a4a77d99', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-21 01:14:25', '2025-07-21 01:14:25', '2025-07-21 01:14:25', NULL),
(859, '858', 'App\\Models\\Attachment', 'b5dacdcc-96f0-4f4c-abe3-e6481739d50d', 'attachment', 'footer', 'footer.png', 'image/png', 'public', 'public', 2063172, '[]', '[]', '[]', '[]', 1, 1, '2025-07-21 01:14:25', '2025-07-21 01:14:25', NULL, NULL),
(861, NULL, NULL, 'e8c6a043-9290-4366-88fe-6a02ab6b6c52', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-21 01:19:32', '2025-07-21 01:19:32', '2025-07-21 01:19:32', NULL),
(862, '861', 'App\\Models\\Attachment', 'ec44f67d-da0f-4b02-9260-90b8f8239e7e', 'attachment', 'phone-2', 'phone-2.png', 'image/png', 'public', 'public', 407203, '[]', '[]', '[]', '[]', 1, 1, '2025-07-21 01:19:32', '2025-07-21 01:19:32', NULL, NULL),
(863, NULL, NULL, '827ec6ff-a55d-450b-a12a-c8df286ff5ed', NULL, NULL, NULL, NULL, 'public', 'public', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-07-21 01:19:32', '2025-07-21 01:19:32', '2025-07-21 01:19:32', NULL),
(864, '863', 'App\\Models\\Attachment', 'b95983c4-4d07-4eee-bfd5-2534e97c05af', 'attachment', 'phone-1', 'phone-1.png', 'image/png', 'public', 'public', 904939, '[]', '[]', '[]', '[]', 1, 1, '2025-07-21 01:19:32', '2025-07-21 01:19:32', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `system_reserve` int NOT NULL DEFAULT '0',
  `created_by_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `status`, `system_reserve`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin', 1, 1, 1, '2025-01-22 23:43:06', '2025-01-22 23:43:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint UNSIGNED NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `module` bigint UNSIGNED DEFAULT NULL,
  `section` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `badge` int DEFAULT '0',
  `badgeable` tinyint(1) DEFAULT '0',
  `badge_callback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `menu` bigint UNSIGNED NOT NULL,
  `depth` int NOT NULL DEFAULT '0',
  `quick_link` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `role_id` int NOT NULL DEFAULT '0',
  `created_by_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `label`, `route`, `params`, `slug`, `permission`, `parent`, `module`, `section`, `sort`, `class`, `icon`, `badge`, `badgeable`, `badge_callback`, `menu`, `depth`, `quick_link`, `status`, `role_id`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'static.dashboard', 'admin.dashboard.index', NULL, 'staticdashboard', '', 0, NULL, 'static.home', 0, NULL, 'ri-dashboard-line', 0, 0, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(2, 'static.users.users', 'admin.user.index', NULL, 'staticusersusers', 'user.index', 0, NULL, 'static.user_management', 1, NULL, 'ri-group-line', 0, 0, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(3, 'static.users.all', 'admin.user.index', NULL, 'staticusersall', 'user.index', 2, NULL, 'static.user_management', 2, NULL, 'ri-user-3-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(4, 'static.users.add', 'admin.user.create', NULL, 'staticusersadd', 'user.create', 2, NULL, 'static.user_management', 3, NULL, 'ri-user-add-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(5, 'static.users.role_permissions', 'admin.role.index', NULL, 'staticusersrole-permissions', 'role.index', 2, NULL, 'static.user_management', 4, NULL, 'ri-lock-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(6, 'static.media.media', 'admin.media.index', NULL, 'staticmediamedia', 'attachment.index', 0, NULL, 'static.home', 5, NULL, 'ri-folder-open-line', 0, 0, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(7, 'static.blogs.blogs', 'admin.blog.index', NULL, 'staticblogsblogs', 'blog.index', 0, NULL, 'static.content_management', 6, NULL, 'ri-pushpin-line', 0, 0, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(8, 'static.blogs.all_blogs', 'admin.blog.index', NULL, 'staticblogsall-blogs', 'blog.index', 7, NULL, 'static.content_management', 7, NULL, 'ri-bookmark-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(9, 'static.blogs.add_blogs', 'admin.blog.create', NULL, 'staticblogsadd-blogs', 'blog.create', 7, NULL, 'static.content_management', 8, NULL, 'ri-add-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(10, 'static.categories.categories', 'admin.category.index', NULL, 'staticcategoriescategories', 'category.index', 7, NULL, 'static.content_management', 9, NULL, 'ri-folder-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(11, 'static.tags.tags', 'admin.tag.index', NULL, 'statictagstags', 'tag.index', 7, NULL, 'static.content_management', 10, NULL, 'ri-price-tag-3-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(12, 'static.pages.pages', 'admin.page.index', NULL, 'staticpagespages', 'page.index', 0, NULL, 'static.content_management', 11, NULL, 'ri-pages-line', 0, 0, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(13, 'static.pages.all_page', 'admin.page.index', NULL, 'staticpagesall-page', 'page.index', 12, NULL, 'static.content_management', 12, NULL, 'ri-list-check', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(14, 'static.pages.add', 'admin.page.create', NULL, 'staticpagesadd', 'page.create', 12, NULL, 'static.content_management', 13, NULL, 'ri-add-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(15, 'static.notify_templates.notify_templates', 'admin.email-template.index', NULL, 'staticnotify-templatesnotify-templates', 'email_template.index', 0, NULL, 'static.promotion_management', 14, NULL, 'ri-pushpin-line', 0, 0, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(16, 'static.notify_templates.email', 'admin.email-template.index', NULL, 'staticnotify-templatesemail', 'email_template.index', 15, NULL, 'static.promotion_management', 15, NULL, 'ri-dashboard-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(17, 'static.notify_templates.sms', 'admin.sms-template.index', NULL, 'staticnotify-templatessms', 'sms_template.index', 15, NULL, 'static.promotion_management', 16, NULL, 'ri-dashboard-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(18, 'static.notify_templates.push_notification', 'admin.push-notification-template.index', NULL, 'staticnotify-templatespush-notification', 'push_notification_template.index', 15, NULL, 'static.promotion_management', 17, NULL, 'ri-dashboard-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(19, 'static.testimonials.testimonials', 'admin.testimonial.index', NULL, 'statictestimonialstestimonials', 'testimonial.index', 0, NULL, 'static.promotion_management', 18, NULL, 'ri-group-line', 0, 0, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(20, 'static.testimonials.all_testimonials', 'admin.testimonial.index', NULL, 'statictestimonialsall-testimonials', 'testimonial.index', 19, NULL, 'static.promotion_management', 19, NULL, 'ri-list-check', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(21, 'static.testimonials.add', 'admin.testimonial.create', NULL, 'statictestimonialsadd', 'testimonial.create', 19, NULL, 'static.promotion_management', 20, NULL, 'ri-add-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(22, 'static.faqs.faqs', 'admin.faq.index', NULL, 'staticfaqsfaqs', 'faq.index', 0, NULL, 'static.content_management', 21, NULL, 'ri-questionnaire-line', 0, 0, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(23, 'static.general_settings', 'admin.setting.index', NULL, 'staticgeneral-settings', 'setting.index', 0, NULL, 'static.setting_management', 22, NULL, 'ri-settings-5-line', 0, 0, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(24, 'static.languages.languages', 'admin.language.index', NULL, 'staticlanguageslanguages', 'language.index', 23, NULL, 'static.setting_management', 23, NULL, 'ri-translate-2', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(25, 'static.taxes.taxes', 'admin.tax.index', NULL, 'statictaxestaxes', 'tax.index', 23, NULL, 'static.financial_management', 24, NULL, 'ri-percent-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(26, 'static.currencies.currencies', 'admin.currency.index', NULL, 'staticcurrenciescurrencies', 'currency.index', 23, NULL, 'static.financial_management', 25, NULL, 'ri-currency-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(27, 'static.plugins.plugins', 'admin.plugin.index', NULL, 'staticpluginsplugins', 'plugin.index', 23, NULL, 'static.setting_management', 26, NULL, 'ri-plug-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(28, 'static.payment_methods.payment_methods', 'admin.payment-method.index', NULL, 'staticpayment-methodspayment-methods', 'payment-method.index', 23, NULL, 'static.setting_management', 27, NULL, 'ri-secure-payment-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(29, 'static.sms_gateways.sms_gateways', 'admin.sms-gateway.index', NULL, 'staticsms-gatewayssms-gateways', 'sms-gateway.index', 23, NULL, 'static.setting_management', 28, NULL, 'ri-message-2-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(30, 'static.systems.about', 'admin.about-system.index', NULL, 'staticsystemsabout', 'about-system.index', 23, NULL, 'static.setting_management', 29, NULL, 'ri-apps-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(31, 'static.settings.settings', 'admin.setting.index', NULL, 'staticsettingssettings', 'setting.index', 23, NULL, 'static.setting_management', 30, NULL, 'ri-settings-5-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(32, 'static.appearance.appearance', 'admin.robot.index', NULL, 'staticappearanceappearance', 'appearance.index', 0, NULL, 'static.setting_management', 31, NULL, 'ri-swap-3-line', 0, 0, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(33, 'static.appearance.robots', 'admin.robot.index', NULL, 'staticappearancerobots', 'appearance.index', 32, NULL, 'static.setting_management', 32, NULL, '', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(34, 'static.landing_pages.landing_page_title', 'admin.landing-page.index', NULL, 'staticlanding-pageslanding-page-title', 'landing_page.index', 32, NULL, 'static.setting_management', 33, NULL, 'ri-pages-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(35, 'static.landing_pages.subscribers', 'admin.subscribes', NULL, 'staticlanding-pagessubscribers', 'landing_page.index', 32, NULL, 'static.setting_management', 34, NULL, 'ri-pages-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(36, 'static.appearance.customizations', 'admin.customization.index', NULL, 'staticappearancecustomizations', 'appearance.index', 32, NULL, 'static.setting_management', 35, NULL, 'ri-pages-line', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(37, 'static.system_tools.system_tools', 'admin.backup.index', NULL, 'staticsystem-toolssystem-tools', 'system-tool.index', 0, NULL, 'static.setting_management', 36, NULL, 'ri-shield-user-line', 0, 0, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(38, 'static.system_tools.backup', 'admin.backup.index', NULL, 'staticsystem-toolsbackup', 'system-tool.index', 37, NULL, 'static.setting_management', 37, NULL, '', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(39, 'static.system_tools.activity_logs', 'admin.activity-logs.index', NULL, 'staticsystem-toolsactivity-logs', 'system-tool.index', 37, NULL, 'static.setting_management', 38, NULL, '', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(40, 'static.system_tools.database_cleanup', 'admin.cleanup-db.index', NULL, 'staticsystem-toolsdatabase-cleanup', 'system-tool.index', 37, NULL, 'static.setting_management', 39, NULL, '', 0, 0, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(41, 'static.menus.menus', 'admin.menu.index', NULL, 'staticmenusmenus', 'menu.index', 0, NULL, 'static.setting_management', 40, NULL, 'ri-menu-2-line', 0, 0, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:33:55', '2025-07-08 18:33:55', NULL),
(42, 'taxido::static.riders.riders', NULL, NULL, 'tx_riders', 'rider.index', 0, 1, 'static.user_management', 3, NULL, 'ri-group-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(43, 'taxido::static.riders.all', 'admin.rider.index', NULL, 'tx_all_riders', 'rider.index', 42, 1, 'static.user_management', 41, NULL, 'ri-team-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(44, 'taxido::static.riders.add', 'admin.rider.create', NULL, 'tx_rider_create', 'rider.create', 42, 1, 'static.user_management', 42, NULL, 'ri-user-add-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(45, 'taxido::static.wallets.wallet', 'admin.rider-wallet.index', NULL, 'tx_rider_wallet', 'rider_wallet.index', 42, 1, 'static.user_management', 43, NULL, 'ri-wallet-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(46, 'taxido::static.drivers.drivers', NULL, NULL, 'tx_drivers', 'driver.index', 0, 1, 'static.user_management', 4, NULL, 'ri-user-2-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(47, 'taxido::static.drivers.verified_drivers', 'admin.driver.index', NULL, 'tx_all_drivers', 'driver.index', 46, 1, 'static.user_management', 44, NULL, 'ri-check-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(48, 'taxido::static.drivers.unverified_driver', 'admin.driver.unverified-drivers', NULL, 'tx_unverified_drivers', 'unverified_driver.index', 46, 1, 'static.user_management', 45, NULL, 'ri-alert-line', 0, 1, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(49, 'taxido::static.drivers.add', 'admin.driver.create', NULL, 'tx_driver_add', 'driver.create', 46, 1, 'static.user_management', 46, NULL, 'ri-add-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(50, 'taxido::static.driver_documents.driver_documents', 'admin.driver-document.index', NULL, 'tx_driverDocument', 'driver_document.index', 46, 1, 'static.user_management', 47, NULL, 'ri-document-line', 0, 1, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(51, 'taxido::static.driver_rules.driver_rules', 'admin.driver-rule.index', NULL, 'tx_driverRule', 'driver_rule.index', 46, 1, 'static.user_management', 48, NULL, 'ri-gavel-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(52, 'taxido::static.locations.driver_location', 'admin.driver-location.index', NULL, 'tx_locations', 'driver_location.index', 46, 1, 'static.user_management', 49, NULL, 'ri-road-map-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(53, 'taxido::static.notices.notice', 'admin.notice.index', NULL, 'taxidostaticnoticesnotice', 'notice.index', 46, 1, 'static.user_management', 50, NULL, 'ri-notice-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(54, 'taxido::static.wallets.wallet', 'admin.driver-wallet.index', NULL, 'taxidostaticwalletswallet', 'driver_wallet.index', 46, 1, 'static.user_management', 51, NULL, 'ri-wallet-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(55, 'taxido::static.withdraw_requests.withdraw_request', 'admin.withdraw-request.index', NULL, 'tx_withdrawRequest', 'withdraw_request.index', 46, 1, 'static.user_management', 52, NULL, 'ri-money-dollar-circle-line', 0, 1, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(56, 'taxido::static.commission_histories.commission_histories', 'admin.cab-commission-history.index', NULL, 'tx_commissionHistory', 'cab_commission_history.index', 46, 1, 'static.user_management', 53, NULL, 'ri-money-dollar-circle-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(57, 'taxido::static.dispatchers.dispatchers', NULL, NULL, 'tx_dispatcher', 'rider.index', 0, 1, 'static.user_management', 54, NULL, 'ri-group-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(58, 'taxido::static.dispatchers.all', 'admin.dispatcher.index', NULL, 'tx_all_dispatchers', 'dispatcher.index', 57, 1, 'static.user_management', 55, NULL, 'ri-team-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(59, 'taxido::static.dispatchers.add', 'admin.dispatcher.create', NULL, 'tx_dispatcher_create', 'dispatcher.create', 57, 1, 'static.user_management', 56, NULL, 'ri-user-add-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(60, 'taxido::static.fleet_managers.fleet_managers', NULL, NULL, 'tx_fleet_manager', 'fleet_manager.index', 0, 1, 'static.user_management', 57, NULL, 'ri-truck-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(61, 'taxido::static.fleet_managers.all', 'admin.fleet-manager.index', NULL, 'tx_all_fleet_managers', 'fleet_manager.index', 60, 1, 'static.user_management', 58, NULL, 'ri-team-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(62, 'taxido::static.fleet_managers.add', 'admin.fleet-manager.create', NULL, 'tx_fleet_manager_create', 'fleet_manager.create', 60, 1, 'static.user_management', 59, NULL, 'ri-user-add-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(63, 'taxido::static.wallets.wallet', 'admin.fleet-wallet.index', NULL, 'tx_fleet_manager_wallet', 'fleet_wallet.index', 60, 1, 'static.user_management', 60, NULL, 'ri-wallet-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(64, 'taxido::static.fleet_withdraw_requests.withdraw_request', 'admin.fleet-withdraw-request.index', NULL, 'tx_fleet_withdrawRequest', 'fleet_withdraw_request.index', 60, 1, 'static.user_management', 61, NULL, 'ri-money-dollar-circle-line', 0, 1, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(65, 'taxido::static.zones.zones', NULL, NULL, 'zones', 'zone.index', 0, 1, 'taxido::static.cab_management', 6, NULL, 'ri-route-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(66, 'taxido::static.zones.zones', 'admin.zone.index', NULL, 'tx_zones', 'zone.index', 65, 1, 'taxido::static.cab_management', 62, NULL, 'ri-map-2-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(67, 'taxido::static.zones.add', 'admin.zone.create', NULL, 'tx_zones_create', 'zone.create', 65, 1, 'taxido::static.cab_management', 63, NULL, 'ri-map-2-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(68, 'taxido::static.services.services', 'admin.service.index', NULL, 'tx_service', 'service.index', 0, 1, 'taxido::static.cab_management', 7, NULL, 'ri-pin-distance-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(69, 'taxido::static.services.cab', NULL, NULL, 'tx_service_cab', 'service.index', 0, 1, 'static.home', 8, NULL, 'ri-roadster-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(70, 'taxido::static.service_categories.serviceCategory', 'admin.service-category.cab.index', NULL, 'tx_service_categories_cab', 'service.index', 69, 1, 'static.home', 8, NULL, 'ri-taxi-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(71, 'taxido::static.service_categories.vehicles', 'admin.vehicle-type.cab.index', NULL, 'tx_service_categories_vehicle_cab', 'service.index', 69, 1, 'static.home', 8, NULL, 'ri-taxi-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(72, 'taxido::static.services.freight', NULL, NULL, 'tx_service_freight', 'service.index', 0, 1, 'static.home', 9, NULL, 'ri-truck-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(73, 'taxido::static.service_categories.serviceCategory', 'admin.service-category.freight.index', NULL, 'tx_service_categories_freight', 'service.index', 72, 1, 'static.home', 8, NULL, 'ri-taxi-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(74, 'taxido::static.service_categories.vehicles', 'admin.vehicle-type.freight.index', NULL, 'tx_service_categories_vehicle_freight', 'service.index', 72, 1, 'static.home', 8, NULL, 'ri-taxi-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(75, 'taxido::static.services.parcel', NULL, NULL, 'tx_service_parcel', 'service.index', 0, 1, 'static.home', 9, NULL, 'ri-archive-2-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(76, 'taxido::static.service_categories.serviceCategory', 'admin.service-category.parcel.index', NULL, 'tx_service_categories_parcel', 'service.index', 75, 1, 'static.home', 8, NULL, 'ri-taxi-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(77, 'taxido::static.service_categories.vehicles', 'admin.vehicle-type.parcel.index', NULL, 'tx_service_categories_vehicle_parcel', 'service.index', 75, 1, 'static.home', 8, NULL, 'ri-taxi-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(78, 'taxido::static.heatmaps.heat_map', 'admin.heat-map', NULL, 'tx_heatmap', 'heat_map.index', 0, 1, 'taxido::static.cab_management', 9, NULL, 'ri-fire-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(79, 'taxido::static.vehicles', NULL, NULL, 'taxido', '', 0, 1, 'taxido::static.cab_management', 10, NULL, 'ri-taxi-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(80, 'taxido::static.rental_vehicle.rental_vehicles', 'admin.rental-vehicle.index', NULL, 'tx_rental_vehicle', 'rental_vehicle.index', 79, 1, 'taxido::static.cab_management', 64, NULL, 'ri-clock-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(81, 'taxido::static.ambulances.ambulances', 'admin.ambulance.index', NULL, 'tx_ambulance', 'ambulance.index', 79, 1, 'taxido::static.cab_management', 65, NULL, 'ri-ambulance-fill', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(82, 'taxido::static.hourly_package.hourly_packages', 'admin.hourly-package.index', NULL, 'tx_hourlyPackage', 'hourly_package.index', 79, 1, 'taxido::static.cab_management', 66, NULL, 'ri-clock-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(83, 'taxido::static.documents.documents', 'admin.document.index', NULL, 'tx_documents', 'document.index', 79, 1, 'taxido::static.cab_management', 67, NULL, 'ri-file-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(84, 'taxido::static.cancellation-reasons.cancellation-reasons', 'admin.cancellation-reason.index', NULL, 'tx_cancellationReason', 'cancellation_reason.index', 79, 1, 'taxido::static.cab_management', 68, NULL, 'ri-error-warning-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(85, 'taxido::static.soses.soses', NULL, NULL, 'tx_sos', 'sos.index', 0, 1, 'taxido::static.cab_management', 11, NULL, 'ri-alarm-warning-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(86, 'taxido::static.soses.soses', 'admin.sos.index', NULL, 'tx_soses', 'sos.index', 85, 1, 'taxido::static.cab_management', 69, NULL, 'ri-alert-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(87, 'taxido::static.soses.sos_alerts', 'admin.sos-alerts.index', NULL, 'tx_sos_alerts', 'sos_alert.index', 85, 1, 'taxido::static.cab_management', 70, NULL, 'ri-list-check', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(88, 'taxido::static.subscriptions.subscriptions', NULL, NULL, 'tx_subscription', 'plan.index', 0, 1, 'taxido::static.price_management', 12, NULL, 'ri-vip-crown-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(89, 'taxido::static.subscriptions.driver_subscription', 'admin.driver-subscription.index', NULL, 'tx_driverSubscription', 'subscription.index', 88, 1, 'taxido::static.price_management', 71, NULL, 'ri-file-blank-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(90, 'taxido::static.plans.plans', 'admin.plan.index', NULL, 'tx_plans', 'plan.index', 88, 1, 'taxido::static.price_management', 72, NULL, 'ri-gavel-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(91, 'taxido::static.coupons.coupons', 'admin.coupon.index', NULL, 'tx_coupons', 'coupon.index', 0, 1, 'taxido::static.price_management', 13, NULL, 'ri-coupon-2-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(92, 'taxido::static.extra_charges.extra_charges', 'admin.extra-charge.index', NULL, 'tx_extraCharges', 'extra_charge-2.index', 0, 1, 'taxido::static.price_management', 13, NULL, 'ri-money-dollar-circle-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:31', '2025-07-22 08:25:49', NULL),
(93, 'taxido::static.surge_prices.surge_prices', 'admin.surge-price.index', NULL, 'tx_surge_price', 'surge_price.index', 0, 1, 'taxido::static.price_management', 14, NULL, 'ri-price-tag-3-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(94, 'taxido::static.airports.airports', 'admin.airport.index', NULL, 'tx_airport', 'airport.index', 0, 1, 'taxido::static.cab_management', 15, NULL, 'ri-plane-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(95, 'taxido::static.reports.reports', NULL, NULL, 'tx_reports', 'report.index', 0, 1, 'taxido::static.cab_management', 16, NULL, 'ri-folder-chart-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(96, 'taxido::static.reports.transaction_reports', 'admin.transaction-report.index', NULL, 'tx_transaction_reports', 'report.index', 95, 1, 'taxido::static.cab_management', 73, NULL, 'ri-road-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(97, 'taxido::static.reports.ride_reports', 'admin.ride-report.index', NULL, 'tx_ride_reports', 'report.index', 95, 1, 'taxido::static.cab_management', 74, NULL, 'ri-traffic-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(98, 'taxido::static.reports.driver_reports', 'admin.driver-report.index', NULL, 'tx_driver_reports', 'report.index', 95, 1, 'taxido::static.cab_management', 75, NULL, 'ri-user-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(99, 'taxido::static.reports.coupon_reports', 'admin.coupon-report.index', NULL, 'tx_coupon_reports', 'report.index', 95, 1, 'taxido::static.cab_management', 76, NULL, 'ri-road-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(100, 'taxido::static.reports.zone_reports', 'admin.zone-report.index', NULL, 'tx_zone_reports', 'report.index', 95, 1, 'taxido::static.cab_management', 77, NULL, 'ri-bar-chart-2-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(101, 'taxido::static.reviews.reviews', NULL, NULL, 'tx_reviews', 'driver_review.index', 0, 1, 'taxido::static.cab_management', 17, NULL, 'ri-user-star-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(102, 'taxido::static.reviews.rider_reviews', 'admin.rider-review.index', NULL, 'tx_rider_review', 'rider.create', 101, 1, 'taxido::static.cab_management', 78, NULL, 'ri-star-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(103, 'taxido::static.reviews.driver_reviews', 'admin.driver-review.index', NULL, 'taxidostaticreviewsdriver-reviews', 'driver_review.index', 101, 1, 'taxido::static.cab_management', 79, NULL, 'ri-star-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(104, 'taxido::static.settings.app_settings', 'admin.taxido-setting.index', NULL, 'tx_setting', 'taxido_setting.index', 0, 1, 'taxido::static.cab_management', 18, NULL, 'ri-settings-4-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(105, 'taxido::static.rides.rides', NULL, NULL, 'tx_ride', 'ride.index', 0, 1, 'static.home', 10, NULL, 'ri-map-2-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(106, 'taxido::static.rides.ride_requests', 'admin.ride-request.index', NULL, 'tx_all_ride_requests', 'ride_request.index', 105, 1, 'static.home', 80, NULL, 'ri-traffic-light-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(107, 'taxido::static.rides.all', 'admin.ride.index', NULL, 'tx_all_rides', 'ride.index', 105, 1, 'static.home', 81, NULL, 'ri-traffic-light-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(108, 'taxido::static.rides.scheduled', 'admin.ride.status.filter', '{\"status\":\"scheduled\"}', 'tx_scheduled_rides', 'ride.index', 105, 1, 'static.home', 82, NULL, 'ri-traffic-light-line', 0, 1, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(109, 'taxido::static.rides.accepted', 'admin.ride.status.filter', '{\"status\":\"accepted\"}', 'tx_accepted_rides', 'ride.index', 105, 1, 'static.home', 83, NULL, 'ri-traffic-light-line', 0, 1, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(110, 'taxido::static.rides.arrived', 'admin.ride.status.filter', '{\"status\":\"arrived\"}', 'tx_arrived_rides', 'ride.index', 105, 1, 'static.home', 84, NULL, 'ri-traffic-light-line', 0, 1, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(111, 'taxido::static.rides.started', 'admin.ride.status.filter', '{\"status\":\"started\"}', 'tx_started_rides', 'ride.index', 105, 1, 'static.home', 85, NULL, 'ri-traffic-light-line', 0, 1, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(112, 'taxido::static.rides.cancelled', 'admin.ride.status.filter', '{\"status\":\"cancelled\"}', 'tx_cancelled_rides', 'ride.index', 105, 1, 'static.home', 86, NULL, 'ri-traffic-light-line', 0, 1, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(113, 'taxido::static.rides.completed', 'admin.ride.status.filter', '{\"status\":\"completed\"}', 'tx_completed_rides', 'ride.index', 105, 1, 'static.home', 87, NULL, 'ri-traffic-light-line', 0, 1, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(114, 'taxido::static.banners.banners', 'admin.banner.index', NULL, 'tx_banners', 'banner.index', 0, 1, 'static.promotion_management', 88, NULL, 'ri-todo-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(115, 'taxido::static.onboardings.onboardings', 'admin.onboarding.index', NULL, 'tx_onboardings', 'onboarding.index', 0, 1, 'static.promotion_management', 89, NULL, 'ri-guide-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(116, 'taxido::static.push_notification.push_notification', NULL, NULL, 'tx_pushNotification', 'push_notification.index', 0, 1, 'static.promotion_management', 19, NULL, 'ri-send-plane-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(117, 'taxido::static.push_notification.all', 'admin.push-notification.index', NULL, 'tx_all_pushNotification', 'push_notification.index', 116, 1, 'static.promotion_management', 90, NULL, 'ri-notification-2-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(118, 'taxido::static.push_notification.send', 'admin.push-notification.create', NULL, 'tx_send_pushNotification', 'push_notification.create', 116, 1, 'static.promotion_management', 91, NULL, 'ri-send-plane-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(119, 'taxido::static.chats.chats', 'admin.chat.index', NULL, 'tx_chat', 'chat.index', 0, 1, 'static.home', 4, NULL, 'ri-chat-1-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(120, 'ticket::static.ticket.support_ticket', NULL, NULL, 'ticket', 'ticket.ticket.index', 0, 2, 'ticket::static.section', 20, NULL, 'ri-user-voice-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(121, 'ticket::static.ticket.dashboard', 'admin.ticket.dashboard', NULL, 'tc_ticket_dashboard', 'ticket.ticket.index', 120, 2, 'ticket::static.section', 21, NULL, 'ri-group-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(122, 'ticket::static.ticket.all', 'admin.ticket.index', NULL, 'tc_ticket', 'ticket.ticket.index', 120, 2, 'ticket::static.section', 92, NULL, 'ri-group-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(123, 'ticket::static.executive.all_support_executive', 'admin.executive.index', NULL, 'tc_all_executives', 'ticket.executive.index', 120, 2, 'ticket::static.section', 93, NULL, 'ri-team-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(124, 'ticket::static.ticket.status', 'admin.status.index', NULL, 'tc_status', 'ticket.status.index', 120, 2, 'ticket::static.section', 94, NULL, 'ri-group-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(125, 'ticket::static.priority.priority', 'admin.priority.index', NULL, 'tc_priority', 'ticket.priority.index', 120, 2, 'ticket::static.section', 95, NULL, 'ri-group-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(126, 'ticket::static.knowledge.knowledge', NULL, NULL, 'tc_knowledge', 'ticket.knowledge.index', 0, 2, 'ticket::static.section', 22, NULL, 'ri-git-repository-line', 0, NULL, NULL, 1, 0, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(127, 'ticket::static.knowledge.all', 'admin.knowledge.index', NULL, 'tc_all_knowledge', 'ticket.knowledge.index', 126, 2, 'ticket::static.section', 96, NULL, 'ri-team-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(128, 'ticket::static.knowledge.add', 'admin.knowledge.create', NULL, 'tc_knowledge_create', 'ticket.knowledge.create', 126, 2, 'ticket::static.section', 97, NULL, 'ri-id-card-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(129, 'ticket::static.knowledge.categories', 'admin.ticket.category.index', NULL, 'tc_category', 'ticket.category.index', 126, 2, 'ticket::static.section', 98, NULL, 'ri-id-card-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(130, 'ticket::static.knowledge.tags', 'admin.ticket.tag.index', NULL, 'tc_tag', 'ticket.tag.index', 126, 2, 'ticket::static.section', 99, NULL, 'ri-id-card-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(131, 'ticket::static.department.department', 'admin.department.index', NULL, 'tc_department', 'ticket.department.index', 120, 2, 'ticket::static.section', 100, NULL, 'ri-group-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(132, 'ticket::static.formfield.formfield', 'admin.formfield.index', NULL, 'tc_formfield', 'ticket.formfield.index', 120, 2, 'ticket::static.section', 101, NULL, 'ri-group-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL),
(133, 'ticket::static.setting.settings', 'admin.ticket.setting.index', NULL, 'tc_setting', 'ticket.setting.index', 120, 2, 'ticket::static.section', 102, NULL, 'ri-group-line', 0, NULL, NULL, 1, 1, 0, 1, 0, 1, '2025-07-08 18:34:32', '2025-07-22 08:25:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `reply_id` int DEFAULT NULL,
  `ticket_id` int NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `message_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `reply_id`, `ticket_id`, `message`, `message_id`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 1, 'My personal information is showing up incorrectly in the app (name, contact details). I’ve verified the data I entered and everything appears correct on my side. I suspect this could be an issue with how it was processed, but the system doesn’t seem to be at fault. Please assist in fixing the display of my information.', NULL, 1, '2025-01-28 00:24:06', '2025-01-28 00:24:06', NULL),
(2, NULL, 2, 'Hello,\r\nI recently completed a ride with your service (Ride ID: 1234589) from 456 Elm St to 789 Oak Rd. After arriving at my destination, I realized I accidentally left my phone in the backseat of the car. I’ve retraced my steps but couldn’t find it, and I’m hoping you can help me recover it.\r\n\r\nCould you please assist by checking with the driver to see if the phone was found in the vehicle? The phone is a black iPhone 13 with a blue case. If the driver has it, I would be happy to arrange a time for pickup or discuss the best way to have it returned.\r\n\r\nThank you so much for your help!\r\n\r\nBest regards,\r\nJohn', NULL, 1, '2025-01-28 00:28:38', '2025-01-28 00:28:38', NULL),
(3, NULL, 3, 'Hi,\r\nI recently took a ride (Ride ID: 100019) from 321 Maple St to 654 Pine St. However, I noticed that I was charged more than expected. The fare shown on the app before the ride started was $15, but I was billed $22. I’ve checked my route and the estimated time, and everything seems to match up, so I’m unsure why there was an extra charge.\r\n\r\nCould you please review my ride details and let me know if there was a mistake in the fare calculation? I would appreciate it if the overcharge could be corrected.', NULL, 1, '2025-01-28 00:31:15', '2025-01-28 00:31:15', NULL),
(4, NULL, 4, '.', NULL, 31, '2025-01-28 02:03:24', '2025-01-28 02:03:24', NULL),
(5, NULL, 5, '.', NULL, 31, '2025-01-28 02:03:32', '2025-01-28 02:03:32', NULL),
(6, NULL, 6, 'Jd', NULL, 43, '2025-01-28 02:07:12', '2025-01-28 02:07:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2017_08_11_073824_create_menus_wp_table', 1),
(6, '2017_08_11_074006_create_menu_items_wp_table', 1),
(7, '2021_11_25_094447_create_countries_table', 1),
(8, '2022_05_30_090203_create_media_table', 1),
(9, '2022_09_28_105314_create_categories_table', 1),
(10, '2022_10_01_135505_create_tags_table', 1),
(11, '2023_04_20_044705_create_notifications_table', 1),
(12, '2023_05_30_112559_create_modules_table', 1),
(13, '2023_10_07_060301_create_blogs_table', 1),
(14, '2023_11_15_131828_create_pages_table', 1),
(15, '2023_12_05_062849_create_payment_gateways_table', 1),
(16, '2024_04_20_061325_create_plugins_table', 1),
(17, '2024_05_01_042107_create_auth_tokens_table', 1),
(18, '2024_05_23_082318_create_personal_access_tokens_table', 1),
(19, '2024_05_25_081827_create_permission_tables', 1),
(20, '2024_07_09_095953_create_taxes_table', 1),
(21, '2024_07_09_104520_create_currencies_table', 1),
(22, '2024_07_12_043614_create_languages_table', 1),
(23, '2024_07_12_044309_add_columns_users_table', 1),
(24, '2024_07_12_044309_create_settings_table', 1),
(25, '2024_07_12_044309_create_taxido_settings_table', 1),
(26, '2024_07_18_084646_create_banners_table', 1),
(27, '2024_07_18_084724_create_documents_table', 1),
(28, '2024_07_18_084754_create_services_table', 1),
(29, '2024_07_18_084755_create_vehicle_types_table', 1),
(30, '2024_07_18_084756_create_airports_table', 1),
(31, '2024_07_19_082823_create_priorities_table', 1),
(32, '2024_07_19_090319_create_zones_table', 1),
(33, '2024_07_19_090419_create_addresses_table', 1),
(34, '2024_07_19_130334_create_faqs_table', 1),
(35, '2024_07_22_070950_create_driver_rules_table', 1),
(36, '2024_07_22_090803_create_form_fields_table', 1),
(37, '2024_07_22_124552_create_payment_accounts_table', 1),
(38, '2024_07_24_083029_create_message_table', 1),
(39, '2024_07_24_101439_create_wallets_table', 1),
(40, '2024_07_24_103346_create_driver_documents_table', 1),
(41, '2024_07_25_052049_create_ticket_settings_table', 1),
(42, '2024_08_01_061513_create_statuses_table', 1),
(43, '2024_08_02_115838_create_hourly_packages_table', 1),
(44, '2024_08_02_130158_create_coupons_table', 1),
(45, '2024_08_12_045713_create_departments_table', 1),
(46, '2024_08_12_115839_create_service_categories_table', 1),
(47, '2024_08_13_052445_create_tickets_table', 1),
(48, '2024_08_29_102551_create_withdraw_requests_table', 1),
(49, '2024_08_31_033317_add_alternative_text_to_media_table', 1),
(50, '2024_08_31_052446_create_reports_table', 1),
(51, '2024_09_03_070923_create_push_notifications_table', 1),
(52, '2024_09_03_072944_create_ratings_table', 1),
(53, '2024_09_06_122033_create_knowledge_base_categories_table', 1),
(54, '2024_09_06_123438_create_landing_pages_table', 1),
(55, '2024_09_07_094637_create_knowledge_base_tags_table', 1),
(56, '2024_09_09_094216_create_knowledge_bases_table', 1),
(57, '2024_09_09_115527_create_cancellation_reasons_table', 1),
(58, '2024_10_01_124515_create_rental_vehicles', 1),
(59, '2024_10_02_115840_create_rides_table', 1),
(60, '2024_10_07_120923_create_rider_reviews_table', 1),
(61, '2024_10_07_121023_create_driver_reviews_table', 1),
(62, '2024_10_08_070424_create_sos_table', 1),
(63, '2024_10_12_083722_create_email_templates', 1),
(64, '2024_10_14_111617_create_sms_templates', 1),
(65, '2024_10_15_041531_create_push_notification_templates', 1),
(66, '2024_11_22_062049_create_notices_table', 1),
(67, '2024_11_25_035910_create_testimonials_table', 1),
(68, '2024_11_27_054315_create_backup_logs', 1),
(69, '2024_11_28_120846_create_activity_log_table', 1),
(70, '2024_11_28_120847_add_event_column_to_activity_log_table', 1),
(71, '2024_11_28_120848_add_batch_uuid_column_to_activity_log_table', 1),
(72, '2024_12_16_035102_create_customizations_table', 1),
(73, '2024_12_22_060359_create_cab_commission_histories_table', 1),
(74, '2025_01_03_092822_create_plans_table', 1),
(75, '2025_01_20_133742_2023_10_07_060301_create_subscribes_table', 1),
(76, '2025_03_12_052604_create_onboardings_table', 1),
(77, '2025_06_20_084145_create_surge_prices_table', 1),
(78, '2025_07_01_115854_create_extra_charges_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 1),
(4, 'App\\Models\\User', 1),
(5, 'App\\Models\\User', 1),
(6, 'App\\Models\\User', 1),
(7, 'App\\Models\\User', 1),
(8, 'App\\Models\\User', 1),
(9, 'App\\Models\\User', 1),
(10, 'App\\Models\\User', 1),
(11, 'App\\Models\\User', 1),
(12, 'App\\Models\\User', 1),
(13, 'App\\Models\\User', 1),
(14, 'App\\Models\\User', 1),
(15, 'App\\Models\\User', 1),
(16, 'App\\Models\\User', 1),
(17, 'App\\Models\\User', 1),
(18, 'App\\Models\\User', 1),
(19, 'App\\Models\\User', 1),
(20, 'App\\Models\\User', 1),
(21, 'App\\Models\\User', 1),
(22, 'App\\Models\\User', 1),
(23, 'App\\Models\\User', 1),
(24, 'App\\Models\\User', 1),
(25, 'App\\Models\\User', 1),
(26, 'App\\Models\\User', 1),
(27, 'App\\Models\\User', 1),
(28, 'App\\Models\\User', 1),
(29, 'App\\Models\\User', 1),
(30, 'App\\Models\\User', 1),
(31, 'App\\Models\\User', 1),
(32, 'App\\Models\\User', 1),
(33, 'App\\Models\\User', 1),
(34, 'App\\Models\\User', 1),
(35, 'App\\Models\\User', 1),
(36, 'App\\Models\\User', 1),
(37, 'App\\Models\\User', 1),
(38, 'App\\Models\\User', 1),
(39, 'App\\Models\\User', 1),
(40, 'App\\Models\\User', 1),
(41, 'App\\Models\\User', 1),
(42, 'App\\Models\\User', 1),
(43, 'App\\Models\\User', 1),
(44, 'App\\Models\\User', 1),
(45, 'App\\Models\\User', 1),
(46, 'App\\Models\\User', 1),
(47, 'App\\Models\\User', 1),
(48, 'App\\Models\\User', 1),
(49, 'App\\Models\\User', 1),
(50, 'App\\Models\\User', 1),
(51, 'App\\Models\\User', 1),
(52, 'App\\Models\\User', 1),
(53, 'App\\Models\\User', 1),
(54, 'App\\Models\\User', 1),
(55, 'App\\Models\\User', 1),
(56, 'App\\Models\\User', 1),
(57, 'App\\Models\\User', 1),
(58, 'App\\Models\\User', 1),
(59, 'App\\Models\\User', 1),
(60, 'App\\Models\\User', 1),
(61, 'App\\Models\\User', 1),
(62, 'App\\Models\\User', 1),
(63, 'App\\Models\\User', 1),
(64, 'App\\Models\\User', 1),
(65, 'App\\Models\\User', 1),
(66, 'App\\Models\\User', 1),
(67, 'App\\Models\\User', 1),
(68, 'App\\Models\\User', 1),
(69, 'App\\Models\\User', 1),
(70, 'App\\Models\\User', 1),
(71, 'App\\Models\\User', 1),
(72, 'App\\Models\\User', 1),
(73, 'App\\Models\\User', 1),
(74, 'App\\Models\\User', 1),
(75, 'App\\Models\\User', 1),
(76, 'App\\Models\\User', 1),
(77, 'App\\Models\\User', 1),
(78, 'App\\Models\\User', 1),
(79, 'App\\Models\\User', 1),
(80, 'App\\Models\\User', 1),
(81, 'App\\Models\\User', 1),
(82, 'App\\Models\\User', 1),
(83, 'App\\Models\\User', 1),
(84, 'App\\Models\\User', 1),
(85, 'App\\Models\\User', 1),
(86, 'App\\Models\\User', 1),
(87, 'App\\Models\\User', 1),
(88, 'App\\Models\\User', 1),
(89, 'App\\Models\\User', 1),
(90, 'App\\Models\\User', 1),
(91, 'App\\Models\\User', 1),
(92, 'App\\Models\\User', 1),
(93, 'App\\Models\\User', 1),
(94, 'App\\Models\\User', 1),
(95, 'App\\Models\\User', 1),
(96, 'App\\Models\\User', 1),
(97, 'App\\Models\\User', 1),
(98, 'App\\Models\\User', 1),
(99, 'App\\Models\\User', 1),
(100, 'App\\Models\\User', 1),
(101, 'App\\Models\\User', 1),
(102, 'App\\Models\\User', 1),
(103, 'App\\Models\\User', 1),
(104, 'App\\Models\\User', 1),
(105, 'App\\Models\\User', 1),
(106, 'App\\Models\\User', 1),
(107, 'App\\Models\\User', 1),
(108, 'App\\Models\\User', 1),
(109, 'App\\Models\\User', 1),
(110, 'App\\Models\\User', 1),
(111, 'App\\Models\\User', 1),
(112, 'App\\Models\\User', 1),
(113, 'App\\Models\\User', 1),
(114, 'App\\Models\\User', 1),
(115, 'App\\Models\\User', 1),
(116, 'App\\Models\\User', 1),
(117, 'App\\Models\\User', 1),
(118, 'App\\Models\\User', 1),
(119, 'App\\Models\\User', 1),
(120, 'App\\Models\\User', 1),
(121, 'App\\Models\\User', 1),
(122, 'App\\Models\\User', 1),
(123, 'App\\Models\\User', 1),
(124, 'App\\Models\\User', 1),
(125, 'App\\Models\\User', 1),
(126, 'App\\Models\\User', 1),
(127, 'App\\Models\\User', 1),
(128, 'App\\Models\\User', 1),
(129, 'App\\Models\\User', 1),
(130, 'App\\Models\\User', 1),
(131, 'App\\Models\\User', 1),
(132, 'App\\Models\\User', 1),
(133, 'App\\Models\\User', 1),
(134, 'App\\Models\\User', 1),
(135, 'App\\Models\\User', 1),
(136, 'App\\Models\\User', 1),
(137, 'App\\Models\\User', 1),
(138, 'App\\Models\\User', 1),
(139, 'App\\Models\\User', 1),
(140, 'App\\Models\\User', 1),
(141, 'App\\Models\\User', 1),
(142, 'App\\Models\\User', 1),
(143, 'App\\Models\\User', 1),
(144, 'App\\Models\\User', 1),
(145, 'App\\Models\\User', 1),
(146, 'App\\Models\\User', 1),
(147, 'App\\Models\\User', 1),
(148, 'App\\Models\\User', 1),
(149, 'App\\Models\\User', 1),
(150, 'App\\Models\\User', 1),
(151, 'App\\Models\\User', 1),
(152, 'App\\Models\\User', 1),
(153, 'App\\Models\\User', 1),
(154, 'App\\Models\\User', 1),
(155, 'App\\Models\\User', 1),
(156, 'App\\Models\\User', 1),
(157, 'App\\Models\\User', 1),
(158, 'App\\Models\\User', 1),
(159, 'App\\Models\\User', 1),
(160, 'App\\Models\\User', 1),
(161, 'App\\Models\\User', 1),
(162, 'App\\Models\\User', 1),
(163, 'App\\Models\\User', 1),
(164, 'App\\Models\\User', 1),
(165, 'App\\Models\\User', 1),
(166, 'App\\Models\\User', 1),
(167, 'App\\Models\\User', 1),
(168, 'App\\Models\\User', 1),
(169, 'App\\Models\\User', 1),
(170, 'App\\Models\\User', 1),
(171, 'App\\Models\\User', 1),
(172, 'App\\Models\\User', 1),
(173, 'App\\Models\\User', 1),
(174, 'App\\Models\\User', 1),
(175, 'App\\Models\\User', 1),
(176, 'App\\Models\\User', 1),
(177, 'App\\Models\\User', 1),
(178, 'App\\Models\\User', 1),
(179, 'App\\Models\\User', 1),
(180, 'App\\Models\\User', 1),
(181, 'App\\Models\\User', 1),
(182, 'App\\Models\\User', 1),
(183, 'App\\Models\\User', 1),
(184, 'App\\Models\\User', 1),
(185, 'App\\Models\\User', 1),
(186, 'App\\Models\\User', 1),
(187, 'App\\Models\\User', 1),
(188, 'App\\Models\\User', 1),
(189, 'App\\Models\\User', 1),
(190, 'App\\Models\\User', 1),
(191, 'App\\Models\\User', 1),
(192, 'App\\Models\\User', 1),
(193, 'App\\Models\\User', 1),
(194, 'App\\Models\\User', 1),
(195, 'App\\Models\\User', 1),
(196, 'App\\Models\\User', 1),
(197, 'App\\Models\\User', 1),
(198, 'App\\Models\\User', 1),
(199, 'App\\Models\\User', 1),
(200, 'App\\Models\\User', 1),
(201, 'App\\Models\\User', 1),
(202, 'App\\Models\\User', 1),
(203, 'App\\Models\\User', 1),
(204, 'App\\Models\\User', 1),
(205, 'App\\Models\\User', 1),
(206, 'App\\Models\\User', 1),
(207, 'App\\Models\\User', 1),
(208, 'App\\Models\\User', 1),
(209, 'App\\Models\\User', 1),
(210, 'App\\Models\\User', 1),
(211, 'App\\Models\\User', 1),
(212, 'App\\Models\\User', 1),
(213, 'App\\Models\\User', 1),
(214, 'App\\Models\\User', 1),
(215, 'App\\Models\\User', 1),
(216, 'App\\Models\\User', 1),
(217, 'App\\Models\\User', 1),
(218, 'App\\Models\\User', 1),
(219, 'App\\Models\\User', 1),
(220, 'App\\Models\\User', 1),
(221, 'App\\Models\\User', 1),
(222, 'App\\Models\\User', 1),
(223, 'App\\Models\\User', 1),
(224, 'App\\Models\\User', 1),
(225, 'App\\Models\\User', 1),
(226, 'App\\Models\\User', 1),
(227, 'App\\Models\\User', 1),
(228, 'App\\Models\\User', 1),
(229, 'App\\Models\\User', 1),
(230, 'App\\Models\\User', 1),
(231, 'App\\Models\\User', 1),
(232, 'App\\Models\\User', 1),
(233, 'App\\Models\\User', 1),
(234, 'App\\Models\\User', 1),
(235, 'App\\Models\\User', 1),
(236, 'App\\Models\\User', 1),
(237, 'App\\Models\\User', 1),
(238, 'App\\Models\\User', 1),
(239, 'App\\Models\\User', 1),
(240, 'App\\Models\\User', 1),
(241, 'App\\Models\\User', 1),
(242, 'App\\Models\\User', 1),
(243, 'App\\Models\\User', 1),
(244, 'App\\Models\\User', 1),
(245, 'App\\Models\\User', 1),
(246, 'App\\Models\\User', 1),
(247, 'App\\Models\\User', 1),
(248, 'App\\Models\\User', 1),
(249, 'App\\Models\\User', 1),
(250, 'App\\Models\\User', 1),
(251, 'App\\Models\\User', 1),
(252, 'App\\Models\\User', 1),
(253, 'App\\Models\\User', 1),
(254, 'App\\Models\\User', 1),
(255, 'App\\Models\\User', 1),
(256, 'App\\Models\\User', 1),
(257, 'App\\Models\\User', 1),
(258, 'App\\Models\\User', 1),
(259, 'App\\Models\\User', 1),
(260, 'App\\Models\\User', 1),
(261, 'App\\Models\\User', 1),
(262, 'App\\Models\\User', 1),
(263, 'App\\Models\\User', 1),
(264, 'App\\Models\\User', 1),
(265, 'App\\Models\\User', 1),
(266, 'App\\Models\\User', 1),
(267, 'App\\Models\\User', 1),
(268, 'App\\Models\\User', 1),
(269, 'App\\Models\\User', 1),
(270, 'App\\Models\\User', 1),
(271, 'App\\Models\\User', 1),
(272, 'App\\Models\\User', 1),
(273, 'App\\Models\\User', 1),
(274, 'App\\Models\\User', 1),
(275, 'App\\Models\\User', 1),
(276, 'App\\Models\\User', 1),
(277, 'App\\Models\\User', 1),
(278, 'App\\Models\\User', 1),
(279, 'App\\Models\\User', 1),
(280, 'App\\Models\\User', 1),
(281, 'App\\Models\\User', 1),
(282, 'App\\Models\\User', 1),
(283, 'App\\Models\\User', 1),
(284, 'App\\Models\\User', 1),
(285, 'App\\Models\\User', 1),
(286, 'App\\Models\\User', 1),
(287, 'App\\Models\\User', 1),
(288, 'App\\Models\\User', 1),
(289, 'App\\Models\\User', 1),
(290, 'App\\Models\\User', 1),
(291, 'App\\Models\\User', 1),
(292, 'App\\Models\\User', 1),
(293, 'App\\Models\\User', 1),
(294, 'App\\Models\\User', 1),
(295, 'App\\Models\\User', 1),
(296, 'App\\Models\\User', 1),
(297, 'App\\Models\\User', 1),
(298, 'App\\Models\\User', 1),
(299, 'App\\Models\\User', 1),
(300, 'App\\Models\\User', 1),
(301, 'App\\Models\\User', 1),
(302, 'App\\Models\\User', 1),
(303, 'App\\Models\\User', 1),
(304, 'App\\Models\\User', 1),
(305, 'App\\Models\\User', 1),
(306, 'App\\Models\\User', 1),
(307, 'App\\Models\\User', 1),
(308, 'App\\Models\\User', 1),
(309, 'App\\Models\\User', 1),
(310, 'App\\Models\\User', 1),
(311, 'App\\Models\\User', 1),
(312, 'App\\Models\\User', 1),
(313, 'App\\Models\\User', 1),
(314, 'App\\Models\\User', 1),
(315, 'App\\Models\\User', 1),
(316, 'App\\Models\\User', 1),
(317, 'App\\Models\\User', 1),
(318, 'App\\Models\\User', 1),
(319, 'App\\Models\\User', 1),
(320, 'App\\Models\\User', 1),
(321, 'App\\Models\\User', 1),
(322, 'App\\Models\\User', 1),
(323, 'App\\Models\\User', 1),
(324, 'App\\Models\\User', 1),
(325, 'App\\Models\\User', 1),
(326, 'App\\Models\\User', 1),
(327, 'App\\Models\\User', 1),
(328, 'App\\Models\\User', 1),
(329, 'App\\Models\\User', 1),
(330, 'App\\Models\\User', 1),
(331, 'App\\Models\\User', 1),
(332, 'App\\Models\\User', 1),
(333, 'App\\Models\\User', 1),
(334, 'App\\Models\\User', 1),
(335, 'App\\Models\\User', 1),
(336, 'App\\Models\\User', 1),
(337, 'App\\Models\\User', 1),
(338, 'App\\Models\\User', 1),
(339, 'App\\Models\\User', 1),
(340, 'App\\Models\\User', 1),
(341, 'App\\Models\\User', 1),
(342, 'App\\Models\\User', 1),
(343, 'App\\Models\\User', 1),
(344, 'App\\Models\\User', 1),
(345, 'App\\Models\\User', 1),
(346, 'App\\Models\\User', 1),
(347, 'App\\Models\\User', 1),
(348, 'App\\Models\\User', 1),
(349, 'App\\Models\\User', 1),
(350, 'App\\Models\\User', 1),
(351, 'App\\Models\\User', 1),
(352, 'App\\Models\\User', 1),
(353, 'App\\Models\\User', 1),
(354, 'App\\Models\\User', 1),
(355, 'App\\Models\\User', 1),
(356, 'App\\Models\\User', 1),
(357, 'App\\Models\\User', 1),
(358, 'App\\Models\\User', 1),
(359, 'App\\Models\\User', 1),
(360, 'App\\Models\\User', 1),
(361, 'App\\Models\\User', 1),
(362, 'App\\Models\\User', 1),
(363, 'App\\Models\\User', 1),
(364, 'App\\Models\\User', 1),
(365, 'App\\Models\\User', 1),
(366, 'App\\Models\\User', 1),
(367, 'App\\Models\\User', 1),
(368, 'App\\Models\\User', 1),
(369, 'App\\Models\\User', 1),
(370, 'App\\Models\\User', 1),
(371, 'App\\Models\\User', 1),
(372, 'App\\Models\\User', 1),
(373, 'App\\Models\\User', 1),
(374, 'App\\Models\\User', 1),
(375, 'App\\Models\\User', 1),
(376, 'App\\Models\\User', 1),
(377, 'App\\Models\\User', 1),
(378, 'App\\Models\\User', 1),
(379, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(3, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 14),
(3, 'App\\Models\\User', 15),
(3, 'App\\Models\\User', 16),
(4, 'App\\Models\\User', 17),
(4, 'App\\Models\\User', 18),
(4, 'App\\Models\\User', 19),
(4, 'App\\Models\\User', 20),
(4, 'App\\Models\\User', 21),
(4, 'App\\Models\\User', 22),
(4, 'App\\Models\\User', 23),
(4, 'App\\Models\\User', 24),
(4, 'App\\Models\\User', 25),
(4, 'App\\Models\\User', 26),
(4, 'App\\Models\\User', 27),
(4, 'App\\Models\\User', 28),
(4, 'App\\Models\\User', 29),
(4, 'App\\Models\\User', 30),
(4, 'App\\Models\\User', 31),
(4, 'App\\Models\\User', 32),
(4, 'App\\Models\\User', 33),
(4, 'App\\Models\\User', 34),
(4, 'App\\Models\\User', 35),
(4, 'App\\Models\\User', 36),
(3, 'App\\Models\\User', 37),
(3, 'App\\Models\\User', 38),
(3, 'App\\Models\\User', 39),
(3, 'App\\Models\\User', 40),
(3, 'App\\Models\\User', 41),
(3, 'App\\Models\\User', 42),
(3, 'App\\Models\\User', 43),
(2, 'App\\Models\\User', 44),
(2, 'App\\Models\\User', 45),
(2, 'App\\Models\\User', 46),
(2, 'App\\Models\\User', 47),
(2, 'App\\Models\\User', 48),
(5, 'App\\Models\\User', 49),
(5, 'App\\Models\\User', 50),
(5, 'App\\Models\\User', 51),
(5, 'App\\Models\\User', 52),
(5, 'App\\Models\\User', 53),
(4, 'App\\Models\\User', 54),
(4, 'App\\Models\\User', 55),
(2, 'App\\Models\\User', 56),
(6, 'App\\Models\\User', 57),
(7, 'App\\Models\\User', 58),
(7, 'App\\Models\\User', 59),
(7, 'App\\Models\\User', 60),
(7, 'App\\Models\\User', 61),
(7, 'App\\Models\\User', 62),
(7, 'App\\Models\\User', 63),
(7, 'App\\Models\\User', 64),
(4, 'App\\Models\\User', 65),
(4, 'App\\Models\\User', 66);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `actions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `actions`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'media', '{\"index\":\"media.index\",\"create\":\"media.create\",\"edit\":\"media.edit\",\"trash\":\"media.destroy\",\"restore\":\"media.restore\",\"delete\":\"media.forceDelete\"}', '2025-07-08 18:33:51', '2025-07-08 18:33:51', NULL),
(2, 'users', '{\"index\":\"user.index\",\"create\":\"user.create\",\"edit\":\"user.edit\",\"trash\":\"user.destroy\",\"restore\":\"user.restore\",\"delete\":\"user.forceDelete\"}', '2025-07-08 18:33:51', '2025-07-08 18:33:51', NULL),
(3, 'roles', '{\"index\":\"role.index\",\"create\":\"role.create\",\"edit\":\"role.edit\",\"delete\":\"role.destroy\"}', '2025-07-08 18:33:51', '2025-07-08 18:33:51', NULL),
(4, 'attachments', '{\"index\":\"attachment.index\",\"create\":\"attachment.create\",\"delete\":\"attachment.destroy\",\"edit\":\"attachment.edit\"}', '2025-07-08 18:33:51', '2025-07-08 18:33:51', NULL),
(5, 'categories', '{\"index\":\"category.index\",\"create\":\"category.create\",\"edit\":\"category.edit\",\"delete\":\"category.destroy\"}', '2025-07-08 18:33:52', '2025-07-08 18:33:52', NULL),
(6, 'tags', '{\"index\":\"tag.index\",\"create\":\"tag.create\",\"edit\":\"tag.edit\",\"trash\":\"tag.destroy\",\"restore\":\"tag.restore\",\"delete\":\"tag.forceDelete\"}', '2025-07-08 18:33:52', '2025-07-08 18:33:52', NULL),
(7, 'blogs', '{\"index\":\"blog.index\",\"create\":\"blog.create\",\"edit\":\"blog.edit\",\"trash\":\"blog.destroy\",\"restore\":\"blog.restore\",\"delete\":\"blog.forceDelete\"}', '2025-07-08 18:33:52', '2025-07-08 18:33:52', NULL),
(8, 'pages', '{\"index\":\"page.index\",\"create\":\"page.create\",\"edit\":\"page.edit\",\"trash\":\"page.destroy\",\"restore\":\"page.restore\",\"delete\":\"page.forceDelete\"}', '2025-07-08 18:33:52', '2025-07-08 18:33:52', NULL),
(9, 'testimonials', '{\"index\":\"testimonial.index\",\"create\":\"testimonial.create\",\"edit\":\"testimonial.edit\",\"trash\":\"testimonial.destroy\",\"restore\":\"testimonial.restore\",\"delete\":\"testimonial.forceDelete\"}', '2025-07-08 18:33:52', '2025-07-08 18:33:52', NULL),
(10, 'taxes', '{\"index\":\"tax.index\",\"create\":\"tax.create\",\"edit\":\"tax.edit\",\"trash\":\"tax.destroy\",\"restore\":\"tax.restore\",\"delete\":\"tax.forceDelete\"}', '2025-07-08 18:33:52', '2025-07-08 18:33:52', NULL),
(11, 'currencies', '{\"index\":\"currency.index\",\"create\":\"currency.create\",\"edit\":\"currency.edit\",\"trash\":\"currency.destroy\",\"restore\":\"currency.restore\",\"delete\":\"currency.forceDelete\"}', '2025-07-08 18:33:52', '2025-07-08 18:33:52', NULL),
(12, 'languages', '{\"index\":\"language.index\",\"create\":\"language.create\",\"edit\":\"language.edit\",\"trash\":\"language.destroy\",\"restore\":\"language.restore\",\"delete\":\"language.forceDelete\"}', '2025-07-08 18:33:52', '2025-07-08 18:33:52', NULL),
(13, 'settings', '{\"index\":\"ticket.setting.index\",\"create\":\"ticket.setting.create\",\"edit\":\"ticket.setting.edit\",\"trash\":\"ticket.setting.destroy\",\"restore\":\"ticket.setting.restore\",\"delete\":\"ticket.setting.forceDelete\"}', '2025-07-08 18:33:52', '2025-07-08 18:34:28', NULL),
(14, 'system-tools', '{\"index\":\"system-tool.index\",\"create\":\"system-tool.create\",\"edit\":\"system-tool.edit\",\"trash\":\"system-tool.destroy\",\"restore\":\"system-tool.restore\",\"delete\":\"system-tool.forceDelete\"}', '2025-07-08 18:33:52', '2025-07-08 18:33:52', NULL),
(15, 'plugins', '{\"index\":\"plugin.index\",\"create\":\"plugin.create\",\"edit\":\"plugin.edit\",\"trash\":\"plugin.destroy\",\"restore\":\"plugin.restore\",\"delete\":\"plugin.forceDelete\"}', '2025-07-08 18:33:53', '2025-07-08 18:33:53', NULL),
(16, 'about-system', '{\"index\":\"about-system.index\"}', '2025-07-08 18:33:53', '2025-07-08 18:33:53', NULL),
(17, 'payment-methods', '{\"index\":\"payment-method.index\",\"edit\":\"payment-method.edit\"}', '2025-07-08 18:33:53', '2025-07-08 18:33:53', NULL),
(18, 'sms-gateways', '{\"index\":\"sms-gateway.index\",\"edit\":\"sms-gateway.edit\"}', '2025-07-08 18:33:53', '2025-07-08 18:33:53', NULL),
(19, 'sms_templates', '{\"index\":\"sms_template.index\",\"create\":\"sms_template.create\",\"edit\":\"sms_template.edit\",\"trash\":\"sms_template.destroy\",\"delete\":\"sms_template.forceDelete\"}', '2025-07-08 18:33:53', '2025-07-08 18:33:53', NULL),
(20, 'email_templates', '{\"index\":\"email_template.index\",\"create\":\"email_template.create\",\"trash\":\"email_template.destroy\",\"edit\":\"email_template.edit\",\"delete\":\"email_template.forceDelete\"}', '2025-07-08 18:33:53', '2025-07-08 18:33:53', NULL),
(21, 'push_notification_templates', '{\"index\":\"push_notification_template.index\",\"create\":\"push_notification_template.create\",\"trash\":\"push_notification_template.destroy\",\"edit\":\"push_notification_template.edit\",\"delete\":\"push_notification_template.forceDelete\"}', '2025-07-08 18:33:53', '2025-07-08 18:33:53', NULL),
(22, 'landing_page', '{\"index\":\"landing_page.index\",\"edit\":\"landing_page.edit\"}', '2025-07-08 18:33:53', '2025-07-08 18:33:53', NULL),
(23, 'appearance', '{\"index\":\"appearance.index\",\"edit\":\"appearance.edit\",\"create\":\"appearance.create\"}', '2025-07-08 18:33:53', '2025-07-08 18:33:53', NULL),
(24, 'backups', '{\"index\":\"backup.index\",\"create\":\"backup.create\",\"edit\":\"backup.edit\",\"trash\":\"backup.destroy\",\"restore\":\"backup.restore\",\"delete\":\"backup.forceDelete\"}', '2025-07-08 18:33:53', '2025-07-08 18:33:53', NULL),
(25, 'riders', '{\"index\":\"rider.index\",\"create\":\"rider.create\",\"edit\":\"rider.edit\",\"trash\":\"rider.destroy\",\"restore\":\"rider.restore\",\"delete\":\"rider.forceDelete\"}', '2025-07-08 18:34:16', '2025-07-08 18:34:16', NULL),
(26, 'drivers', '{\"index\":\"driver.index\",\"create\":\"driver.create\",\"edit\":\"driver.edit\",\"trash\":\"driver.destroy\",\"restore\":\"driver.restore\",\"delete\":\"driver.forceDelete\"}', '2025-07-08 18:34:16', '2025-07-08 18:34:16', NULL),
(27, 'dispatchers', '{\"index\":\"dispatcher.index\",\"create\":\"dispatcher.create\",\"edit\":\"dispatcher.edit\",\"trash\":\"dispatcher.destroy\",\"restore\":\"dispatcher.restore\",\"delete\":\"dispatcher.forceDelete\"}', '2025-07-08 18:34:16', '2025-07-08 18:34:16', NULL),
(28, 'unverified_drivers', '{\"index\":\"unverified_driver.index\",\"create\":\"unverified_driver.create\",\"edit\":\"unverified_driver.edit\",\"trash\":\"unverified_driver.destroy\",\"restore\":\"unverified_driver.restore\",\"delete\":\"unverified_driver.forceDelete\"}', '2025-07-08 18:34:16', '2025-07-08 18:34:16', NULL),
(29, 'banners', '{\"index\":\"banner.index\",\"create\":\"banner.create\",\"edit\":\"banner.edit\",\"trash\":\"banner.destroy\",\"restore\":\"banner.restore\",\"delete\":\"banner.forceDelete\"}', '2025-07-08 18:34:16', '2025-07-08 18:34:16', NULL),
(30, 'documents', '{\"index\":\"document.index\",\"create\":\"document.create\",\"edit\":\"document.edit\",\"trash\":\"document.destroy\",\"restore\":\"document.restore\",\"delete\":\"document.forceDelete\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(31, 'vehicle_types', '{\"index\":\"vehicle_type.index\",\"create\":\"vehicle_type.create\",\"edit\":\"vehicle_type.edit\",\"trash\":\"vehicle_type.destroy\",\"restore\":\"vehicle_type.restore\",\"delete\":\"vehicle_type.forceDelete\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(32, 'coupons', '{\"index\":\"coupon.index\",\"create\":\"coupon.create\",\"edit\":\"coupon.edit\",\"trash\":\"coupon.destroy\",\"restore\":\"coupon.restore\",\"delete\":\"coupon.forceDelete\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(33, 'zones', '{\"index\":\"zone.index\",\"create\":\"zone.create\",\"edit\":\"zone.edit\",\"trash\":\"zone.destroy\",\"restore\":\"zone.restore\",\"delete\":\"zone.forceDelete\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(34, 'faqs', '{\"index\":\"faq.index\",\"create\":\"faq.create\",\"edit\":\"faq.edit\",\"trash\":\"faq.destroy\",\"restore\":\"faq.restore\",\"delete\":\"faq.forceDelete\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(35, 'heatmaps', '{\"index\":\"heat_map.index\",\"create\":\"heat_map.create\",\"edit\":\"heat_map.edit\",\"trash\":\"heat_map.destroy\",\"restore\":\"heat_map.restore\",\"delete\":\"heat_map.forceDelete\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(36, 'soses', '{\"index\":\"sos.index\",\"create\":\"sos.create\",\"edit\":\"sos.edit\",\"trash\":\"sos.destroy\",\"restore\":\"sos.restore\",\"delete\":\"sos.forceDelete\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(37, 'driver_documents', '{\"index\":\"driver_document.index\",\"create\":\"driver_document.create\",\"edit\":\"driver_document.edit\",\"trash\":\"driver_document.destroy\",\"restore\":\"driver_document.restore\",\"delete\":\"driver_document.forceDelete\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(38, 'driver_rules', '{\"index\":\"driver_rule.index\",\"create\":\"driver_rule.create\",\"edit\":\"driver_rule.edit\",\"trash\":\"driver_rule.destroy\",\"restore\":\"driver_rule.restore\",\"delete\":\"driver_rule.forceDelete\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(39, 'extra_charges', '{\"index\":\"extra_charge.index\",\"create\":\"extra_charge.create\",\"edit\":\"extra_charge.edit\",\"trash\":\"extra_charge.destroy\",\"restore\":\"extra_charge.restore\",\"delete\":\"extra_charge.forceDelete\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(40, 'cab_commission_histories', '{\"index\":\"cab_commission_history.index\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(41, 'notices', '{\"index\":\"notice.index\",\"create\":\"notice.create\",\"edit\":\"notice.edit\",\"trash\":\"notice.destroy\",\"restore\":\"notice.restore\",\"delete\":\"notice.forceDelete\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(42, 'driver_wallets', '{\"index\":\"driver_wallet.index\",\"credit\":\"driver_wallet.credit\",\"debit\":\"driver_wallet.debit\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(43, 'services', '{\"index\":\"service.index\",\"edit\":\"service.edit\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(44, 'onboardings', '{\"index\":\"onboarding.index\",\"edit\":\"onboarding.edit\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(45, 'service_categories', '{\"index\":\"service_category.index\",\"edit\":\"service_category.edit\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(46, 'taxido_settings', '{\"index\":\"taxido_setting.index\",\"edit\":\"taxido_setting.edit\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(47, 'ride_request', '{\"index\":\"ride_request.index\",\"create\":\"ride_request.create\",\"edit\":\"ride_request.edit\",\"trash\":\"ride_request.destroy\",\"restore\":\"ride_request.restore\",\"delete\":\"ride_request.forceDelete\"}', '2025-07-08 18:34:17', '2025-07-08 18:34:17', NULL),
(48, 'rides', '{\"index\":\"ride.index\",\"create\":\"ride.create\",\"edit\":\"ride.edit\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(49, 'plans', '{\"index\":\"plan.index\",\"create\":\"plan.create\",\"edit\":\"plan.edit\",\"trash\":\"plan.destroy\",\"restore\":\"plan.restore\",\"delete\":\"plan.forceDelete\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(50, 'airports', '{\"index\":\"airport.index\",\"create\":\"airport.create\",\"edit\":\"airport.edit\",\"trash\":\"airport.destroy\",\"restore\":\"airport.restore\",\"delete\":\"airport.forceDelete\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(51, 'surge_prices', '{\"index\":\"surge_price.index\",\"create\":\"surge_price.create\",\"edit\":\"surge_price.edit\",\"trash\":\"surge_price.destroy\",\"restore\":\"surge_price.restore\",\"delete\":\"surge_price.forceDelete\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(52, 'subscriptions', '{\"index\":\"subscription.index\",\"create\":\"subscription.create\",\"edit\":\"subscription.edit\",\"destroy\":\"subscription.destroy\",\"purchase\":\"subscription.purchase\",\"cancel\":\"subscription.cancel\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(53, 'bids', '{\"index\":\"bid.index\",\"create\":\"bid.create\",\"edit\":\"bid.edit\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(54, 'push_notifications', '{\"index\":\"push_notification.index\",\"create\":\"push_notification.create\",\"trash\":\"push_notification.destroy\",\"delete\":\"push_notification.forceDelete\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(55, 'rider_wallets', '{\"index\":\"rider_wallet.index\",\"credit\":\"rider_wallet.credit\",\"debit\":\"rider_wallet.debit\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(56, 'withdraw_requests', '{\"index\":\"withdraw_request.index\",\"create\":\"withdraw_request.create\",\"edit\":\"withdraw_request.edit\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(57, 'fleet_withdraw_requests', '{\"index\":\"fleet_withdraw_request.index\",\"create\":\"fleet_withdraw_request.create\",\"edit\":\"fleet_withdraw_request.edit\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(58, 'reports', '{\"index\":\"report.index\",\"create\":\"report.create\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(59, 'driver_locations', '{\"index\":\"driver_location.index\",\"create\":\"driver_location.create\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(60, 'cancellation_reasons', '{\"index\":\"cancellation_reason.index\",\"create\":\"cancellation_reason.create\",\"edit\":\"cancellation_reason.edit\",\"trash\":\"cancellation_reason.destroy\",\"restore\":\"cancellation_reason.restore\",\"delete\":\"cancellation_reason.forceDelete\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(61, 'driver_reviews', '{\"index\":\"driver_review.index\",\"create\":\"driver_review.create\",\"trash\":\"driver_review.destroy\",\"restore\":\"driver_review.restore\",\"delete\":\"driver_review.forceDelete\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(62, 'rider_reviews', '{\"index\":\"rider_review.index\",\"create\":\"rider_review.create\",\"trash\":\"rider_review.destroy\",\"restore\":\"rider_review.restore\",\"delete\":\"rider_review.forceDelete\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(63, 'hourly_packages', '{\"index\":\"hourly_package.index\",\"create\":\"hourly_package.create\",\"edit\":\"hourly_package.edit\",\"trash\":\"hourly_package.destroy\",\"restore\":\"hourly_package.restore\",\"delete\":\"hourly_package.forceDelete\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(64, 'sos_alerts', '{\"index\":\"sos_alert.index\",\"create\":\"sos_alert.create\",\"edit\":\"sos_alert.edit\",\"trash\":\"sos_alert.destroy\",\"restore\":\"sos_alert.restore\",\"delete\":\"sos_alert.forceDelete\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(65, 'rental_vehicles', '{\"index\":\"rental_vehicle.index\",\"create\":\"rental_vehicle.create\",\"edit\":\"rental_vehicle.edit\",\"trash\":\"rental_vehicle.destroy\",\"restore\":\"rental_vehicle.restore\",\"delete\":\"rental_vehicle.forceDelete\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(66, 'fleet_managers', '{\"index\":\"fleet_manager.index\",\"create\":\"fleet_manager.create\",\"edit\":\"fleet_manager.edit\",\"trash\":\"fleet_manager.destroy\",\"restore\":\"fleet_manager.restore\",\"delete\":\"fleet_manager.forceDelete\"}', '2025-07-08 18:34:18', '2025-07-08 18:34:18', NULL),
(67, 'fleet_wallets', '{\"index\":\"fleet_wallet.index\",\"credit\":\"fleet_wallet.credit\",\"debit\":\"fleet_wallet.debit\"}', '2025-07-08 18:34:19', '2025-07-08 18:34:19', NULL),
(68, 'chats', '{\"index\":\"chat.index\",\"send\":\"chat.send\",\"reply\":\"chat.replay\",\"delete\":\"chat.delete\"}', '2025-07-08 18:34:19', '2025-07-08 18:34:19', NULL),
(69, 'ambulances', '{\"index\":\"ambulance.index\"}', '2025-07-08 18:34:19', '2025-07-08 18:34:19', NULL),
(70, 'tickets', '{\"index\":\"ticket.ticket.index\",\"create\":\"ticket.ticket.create\",\"reply\":\"ticket.ticket.reply\",\"trash\":\"ticket.ticket.destroy\",\"restore\":\"ticket.ticket.restore\",\"delete\":\"ticket.ticket.forceDelete\"}', '2025-07-08 18:34:27', '2025-07-08 18:34:27', NULL),
(71, 'priorities', '{\"index\":\"ticket.priority.index\",\"create\":\"ticket.priority.create\",\"edit\":\"ticket.priority.edit\",\"trash\":\"ticket.priority.destroy\",\"restore\":\"ticket.priority.restore\",\"delete\":\"ticket.priority.forceDelete\"}', '2025-07-08 18:34:27', '2025-07-08 18:34:27', NULL),
(72, 'executives', '{\"index\":\"ticket.executive.index\",\"create\":\"ticket.executive.create\",\"edit\":\"ticket.executive.edit\",\"trash\":\"ticket.executive.destroy\",\"restore\":\"ticket.executive.restore\",\"delete\":\"ticket.executive.forceDelete\"}', '2025-07-08 18:34:27', '2025-07-08 18:34:27', NULL),
(73, 'departments', '{\"index\":\"ticket.department.index\",\"create\":\"ticket.department.create\",\"edit\":\"ticket.department.edit\",\"show\":\"ticket.department.show\",\"trash\":\"ticket.department.destroy\",\"restore\":\"ticket.department.restore\",\"delete\":\"ticket.department.forceDelete\"}', '2025-07-08 18:34:27', '2025-07-08 18:34:27', NULL),
(74, 'formfields', '{\"index\":\"ticket.formfield.index\",\"create\":\"ticket.formfield.create\",\"edit\":\"ticket.formfield.edit\",\"trash\":\"ticket.formfield.destroy\",\"restore\":\"ticket.formfield.restore\",\"delete\":\"ticket.formfield.forceDelete\"}', '2025-07-08 18:34:27', '2025-07-08 18:34:27', NULL),
(75, 'statuses', '{\"index\":\"ticket.status.index\",\"create\":\"ticket.status.create\",\"edit\":\"ticket.status.edit\",\"trash\":\"ticket.status.destroy\",\"restore\":\"ticket.status.restore\",\"delete\":\"ticket.status.forceDelete\"}', '2025-07-08 18:34:27', '2025-07-08 18:34:27', NULL),
(76, 'knowledge', '{\"index\":\"ticket.knowledge.index\",\"create\":\"ticket.knowledge.create\",\"edit\":\"ticket.knowledge.edit\",\"trash\":\"ticket.knowledge.destroy\",\"restore\":\"ticket.knowledge.restore\",\"delete\":\"ticket.knowledge.forceDelete\"}', '2025-07-08 18:34:27', '2025-07-08 18:34:27', NULL),
(77, 'knowledge_categories', '{\"index\":\"ticket.category.index\",\"create\":\"ticket.category.create\",\"edit\":\"ticket.category.edit\",\"delete\":\"ticket.category.destroy\"}', '2025-07-08 18:34:27', '2025-07-08 18:34:27', NULL),
(78, 'knowledge_tags', '{\"index\":\"ticket.tag.index\",\"create\":\"ticket.tag.create\",\"edit\":\"ticket.tag.edit\",\"trash\":\"ticket.tag.destroy\",\"restore\":\"ticket.tag.restore\",\"delete\":\"ticket.tag.forceDelete\"}', '2025-07-08 18:34:27', '2025-07-08 18:34:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` bigint UNSIGNED NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_to` enum('all','particular') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'all',
  `status` int DEFAULT '1',
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice_drivers`
--

CREATE TABLE `notice_drivers` (
  `id` bigint UNSIGNED NOT NULL,
  `notice_id` bigint UNSIGNED NOT NULL,
  `driver_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `module`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('205b7d83-8220-4dca-b002-74f4fa853703', 'Modules\\Taxido\\Notifications\\RideRequestNotification', 'App\\Models\\User', 31, NULL, '{\"title\":\"New Ride Request\",\"message\":\"You have a new ride request from Robert Miller\",\"type\":\"ride request\"}', NULL, '2025-01-25 02:39:37', '2025-01-25 02:39:37'),
('7bbe8b99-5810-4490-a5f9-db36c063f8b0', 'Modules\\Taxido\\Notifications\\RideRequestNotification', 'App\\Models\\User', 31, NULL, '{\"title\":\"New Ride Request\",\"message\":\"You have a new ride request from Robert Miller\",\"type\":\"ride_request\"}', NULL, '2025-04-29 07:04:24', '2025-04-29 07:04:24'),
('c6445c01-6e0f-4a90-a9db-c6c4a59e3be5', 'Modules\\Taxido\\Notifications\\RideRequestNotification', 'App\\Models\\User', 25, NULL, '{\"title\":\"New Ride Request\",\"message\":\"You have a new ride request from Daniel Miller\",\"type\":\"ride_request\"}', NULL, '2025-04-29 07:04:26', '2025-04-29 07:04:26'),
('cdd6a87a-f169-4e07-aa49-59d9f0e4fa35', 'Modules\\Taxido\\Notifications\\SOSAlertNotification', 'App\\Models\\User', 1, NULL, '{\"title\":\"SOS Alert Triggered\",\"message\":\"\\ud83d\\udea8 SOS alert triggered during ride #100028. Immediate attention required.\",\"type\":\"sos_alert\"}', '2025-06-14 06:18:14', '2025-04-29 07:46:33', '2025-04-29 07:46:33'),
('d6622622-b903-481a-8258-b11b6b2f7198', 'Modules\\Taxido\\Notifications\\SOSAlertNotification', 'App\\Models\\User', 1, NULL, '{\"title\":\"SOS Alert Triggered\",\"message\":\"\\ud83d\\udea8 SOS alert triggered during ride #100028. Immediate attention required.\",\"type\":\"sos_alert\"}', '2025-06-13 18:30:00', '2025-04-29 07:40:29', '2025-04-29 07:40:55'),
('ea809201-b10f-49fd-8c43-dc837b667575', 'Modules\\Taxido\\Notifications\\RideRequestNotification', 'App\\Models\\User', 31, NULL, '{\"title\":\"New Ride Request\",\"message\":\"You have a new ride request from Robert Miller\",\"type\":\"ride request\"}', NULL, '2025-01-25 02:44:14', '2025-01-25 02:44:14');

-- --------------------------------------------------------

--
-- Table structure for table `onboardings`
--

CREATE TABLE `onboardings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('rider','driver') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'rider',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `onboarding_image_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `onboardings`
--

INSERT INTO `onboardings` (`id`, `title`, `type`, `description`, `onboarding_image_id`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\n    \"en\": \"Accept A Job\",\n    \"ar\": \"اقبل وظيفة\",\n    \"fr\": \"Accepter un emploi\",\n    \"de\": \"Einen Job annehmen\"\n}\n', 'driver', '{\n    \"en\": \"Easily browse and accept job requests in just one tap. Stay in control of your schedule and start earning instantly.\",\n    \"ar\": \"تصفح وقبول طلبات العمل بسهولة بلمسة واحدة. تحكم في جدولك وابدأ في الكسب فورًا.\",\n    \"fr\": \"Parcourez et acceptez facilement les demandes d\'emploi en un seul clic. Gardez le contrôle de votre emploi du temps et commencez à gagner immédiatement.\",\n    \"de\": \"Durchsuchen und akzeptieren Sie Jobanfragen ganz einfach mit nur einem Tippen. Behalten Sie die Kontrolle über Ihren Zeitplan und beginnen Sie sofort zu verdienen.\"\n}\n', '{\"en\":\"785\"}', 1, 1, '2025-03-16 18:20:42', '2025-04-30 01:56:22', NULL),
(2, '{\n    \"en\": \"Earn Money\",\n    \"ar\": \"اكسب المال\",\n    \"fr\": \"Gagner de l\'argent\",\n    \"de\": \"Geld verdienen\"\n}\n', 'driver', '{\n    \"en\": \"Complete rides or deliveries and earn money seamlessly. Get paid quickly and enjoy financial freedom on your terms.\",\n    \"ar\": \"أكمل الرحلات أو عمليات التوصيل واكسب المال بسلاسة. احصل على أموالك بسرعة واستمتع بالحرية المالية بشروطك.\",\n    \"fr\": \"Effectuez des courses ou des livraisons et gagnez de l\'argent en toute simplicité. Soyez payé rapidement et profitez de la liberté financière selon vos conditions.\",\n    \"de\": \"Absolvieren Sie Fahrten oder Lieferungen und verdienen Sie nahtlos Geld. Lassen Sie sich schnell bezahlen und genießen Sie finanzielle Freiheit nach Ihren eigenen Bedingungen.\"\n}\n', '{\"en\":\"787\"}', 1, 1, '2025-03-16 18:20:42', '2025-04-30 01:56:39', NULL),
(3, '{\n    \"en\": \"Enable Your Location\",\n    \"ar\": \"قم بتمكين موقعك\",\n    \"fr\": \"Activez votre emplacement\",\n    \"de\": \"Aktivieren Sie Ihren Standort\"\n}\n', 'driver', '{\n    \"en\": \"Turn on your location services to receive nearby job requests and provide better service to customers in real-time.\",\n    \"ar\": \"قم بتشغيل خدمات الموقع لتلقي طلبات الوظائف القريبة وتقديم خدمة أفضل للعملاء في الوقت الفعلي.\",\n    \"fr\": \"Activez vos services de localisation pour recevoir des demandes d\'emploi à proximité et offrir un meilleur service aux clients en temps réel.\",\n    \"de\": \"Aktivieren Sie Ihre Standortdienste, um nahegelegene Jobanfragen zu erhalten und Kunden in Echtzeit einen besseren Service zu bieten.\"\n}\n', '{\"en\":\"789\"}', 1, 1, '2025-03-16 18:20:42', '2025-04-30 01:56:48', NULL),
(4, '{\n    \"en\": \"Choose Your Destination\",\n    \"ar\": \"اختر وجهتك\",\n    \"fr\": \"Choisissez votre destination\",\n    \"de\": \"Wählen Sie Ihr Ziel\"\n}\n', 'rider', '{\n    \"en\": \"Select your preferred route or destination before starting your ride. Plan your trips for a smooth and hassle-free journey.\",\n    \"ar\": \"حدد مسارك أو وجهتك المفضلة قبل بدء رحلتك. خطط لرحلاتك لضمان رحلة سلسة وخالية من المتاعب.\",\n    \"fr\": \"Sélectionnez votre itinéraire ou destination préféré avant de commencer votre trajet. Planifiez vos voyages pour un trajet fluide et sans tracas.\",\n    \"de\": \"Wählen Sie Ihre bevorzugte Route oder Ihr Ziel, bevor Sie Ihre Fahrt beginnen. Planen Sie Ihre Fahrten für eine reibungslose und stressfreie Reise.\"\n}\n', '{\"en\":\"795\"}', 1, 1, '2025-03-16 18:20:42', '2025-04-30 01:56:57', NULL),
(5, '{\n    \"en\": \"Enjoy Your Trip\",\n    \"ar\": \"استمتع برحلتك\",\n    \"fr\": \"Profitez de votre voyage\",\n    \"de\": \"Genießen Sie Ihre Reise\"\n}\n', 'rider', '{\n    \"en\": \"Sit back and enjoy a comfortable ride with our seamless service. Travel with ease and reach your destination worry-free.\",\n    \"ar\": \"اجلس واسترخِ واستمتع برحلة مريحة مع خدمتنا السلسة. سافر براحة ووصل إلى وجهتك دون قلق.\",\n    \"fr\": \"Installez-vous confortablement et profitez d\'un trajet agréable avec notre service fluide. Voyagez en toute simplicité et atteignez votre destination sans souci.\",\n    \"de\": \"Lehnen Sie sich zurück und genießen Sie eine komfortable Fahrt mit unserem nahtlosen Service. Reisen Sie entspannt und erreichen Sie Ihr Ziel sorgenfrei.\"\n}\n', '{\"en\":\"797\"}', 1, 1, '2025-03-16 18:20:42', '2025-04-30 01:57:05', NULL),
(6, '{\n    \"en\": \"Check Fare & Book Ride\",\n    \"ar\": \"تحقق من الأجرة واحجز الرحلة\",\n    \"fr\": \"Vérifiez le tarif et réservez votre trajet\",\n    \"de\": \"Tarif prüfen & Fahrt buchen\"\n}\n', 'rider', '{\n    \"en\": \"Get an estimated fare before confirming your ride. Compare options and book your trip with confidence.\",\n    \"ar\": \"احصل على تقدير للأجرة قبل تأكيد رحلتك. قارن الخيارات واحجز رحلتك بثقة.\",\n    \"fr\": \"Obtenez un tarif estimé avant de confirmer votre trajet. Comparez les options et réservez votre voyage en toute confiance.\",\n    \"de\": \"Erhalten Sie einen geschätzten Fahrpreis, bevor Sie Ihre Fahrt bestätigen. Vergleichen Sie Optionen und buchen Sie Ihre Reise mit Vertrauen.\"\n}\n', '{\"en\":\"799\"}', 1, 1, '2025-03-16 18:20:42', '2025-04-30 01:57:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `page_meta_image_id` bigint UNSIGNED DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `meta_title`, `meta_description`, `page_meta_image_id`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"Privacy Policy\",\"ar\":\"سياسة الخصوصية\",\"de\":\"Privacy PolicyDatenschutzrichtlinie\",\"fr\":\"Politique de confidentialité\"}', 'privacy-policy', '{\"en\":\"<p><strong>Privacy Policy for Cab Management Service</strong></p>\\r\\n<p><strong>Information Collection and Use</strong></p>\\r\\n<p>We collect personal information to provide, personalize, and improve our cab services. This information may include:</p>\\r\\n<ul>\\r\\n<li><strong>Personal Information</strong>: Name, email address, phone number, postal address, and any other details you choose to provide.</li>\\r\\n<li><strong>Payment Information</strong>: Credit card numbers, billing address, and payment history for processing your rides.</li>\\r\\n<li><strong>Location Information</strong>: Your current location, including pick-up and drop-off points, to facilitate ride matching and navigation.</li>\\r\\n<li><strong>Usage Data</strong>: IP address, device type, browser type, and app usage data to analyze and improve user experience.</li>\\r\\n<li><strong>Ride Information</strong>: Details of your trips, such as start and end locations, ride duration, driver information, and ratings.</li>\\r\\n</ul>\\r\\n<p>We use this data to:</p>\\r\\n<ul>\\r\\n<li>Communicate with you regarding your bookings, promotions, or service updates.</li>\\r\\n<li>Process payments and manage your ride requests.</li>\\r\\n<li>Improve service delivery by analyzing patterns in rides, feedback, and user behavior.</li>\\r\\n<li>Personalize your experience with tailored recommendations or services.</li>\\r\\n</ul>\\r\\n<p><strong>Data Sharing and Disclosure</strong></p>\\r\\n<p>We do not sell or rent your personal information to third parties. However, we may share your personal information with trusted third-party service providers for the purpose of delivering our services. These include:</p>\\r\\n<ul>\\r\\n<li><strong>Payment Processors</strong>: For processing payments securely.</li>\\r\\n<li><strong>Ride-Matching Systems and Navigation Providers</strong>: To enable the most efficient trip matching and route optimization.</li>\\r\\n<li><strong>Customer Support</strong>: We may use third-party tools to provide you with support services.</li>\\r\\n</ul>\\r\\n<p>All third parties we work with are contractually obligated to protect your personal information and use it only for the purposes for which it was shared.</p>\\r\\n<p>We may also disclose your information if required by law or to protect our rights, property, or safety, or the rights and safety of our users and others.</p>\\r\\n<p><strong>Data Security</strong></p>\\r\\n<p>We prioritize the security of your personal information and employ industry-standard practices to protect it from unauthorized access, disclosure, alteration, or destruction. Our security measures include:</p>\\r\\n<ul>\\r\\n<li><strong>Encryption</strong>: We use encryption to protect sensitive payment and personal data.</li>\\r\\n<li><strong>Firewalls &amp; Access Controls</strong>: To prevent unauthorized access to our systems.</li>\\r\\n<li><strong>Secure Transactions</strong>: We partner with trusted third-party payment processors to handle financial transactions securely.</li>\\r\\n</ul>\\r\\n<p>Despite these measures, please be aware that no method of transmission over the internet or electronic storage is entirely secure. While we take significant precautions to protect your data, we cannot guarantee absolute security.</p>\\r\\n<p>You are responsible for maintaining the confidentiality of your account credentials and for any activities that occur under your account.</p>\\r\\n<p><strong>Data Retention</strong></p>\\r\\n<p>We will retain your personal information only for as long as necessary to provide you with our services or as required by law. Once the information is no longer needed for the purposes outlined in this Privacy Policy, we will securely delete or anonymize it.</p>\\r\\n<p><strong>Policy Updates</strong></p>\\r\\n<p>We reserve the right to update or change our Privacy Policy at any time. Any changes will take effect immediately upon posting the revised Privacy Policy on this page. We encourage you to review this Privacy Policy periodically for any updates. Continued use of our services after any changes signifies your acceptance of those changes.</p>\\r\\n<p><strong>Contact Us</strong></p>\\r\\n<p>If you have any questions or concerns about this Privacy Policy, please contact us:</p>\\r\\n<ul>By email:&nbsp;support@pixelstrap.com</ul>\",\"ar\":\"<p><strong>سياسة الخصوصية لخدمة إدارة سيارات الأجرة</strong></p>\\r\\n<p><strong>جمع المعلومات واستخدامها</strong></p>\\r\\n<p>نقوم بجمع المعلومات الشخصية لتقديم وتخصيص وتحسين خدمات سيارات الأجرة لدينا. قد تشمل هذه المعلومات:</p>\\r\\n<ul>\\r\\n<li><strong>المعلومات الشخصية</strong>: الاسم، عنوان البريد الإلكتروني، رقم الهاتف، العنوان البريدي، وأي تفاصيل أخرى تختار تقديمها.</li>\\r\\n<li><strong>معلومات الدفع</strong>: أرقام بطاقات الائتمان، عنوان الفوترة، وتاريخ الدفع لمعالجة رحلاتك.</li>\\r\\n<li><strong>معلومات الموقع</strong>: موقعك الحالي، بما في ذلك نقاط الالتقاط والتوصيل، لتسهيل مطابقة الرحلات والملاحة.</li>\\r\\n<li><strong>بيانات الاستخدام</strong>: عنوان الـ IP، نوع الجهاز، نوع المتصفح، وبيانات استخدام التطبيق لتحليل وتحسين تجربة المستخدم.</li>\\r\\n<li><strong>معلومات الرحلة</strong>: تفاصيل رحلاتك، مثل نقاط البداية والنهاية، مدة الرحلة، معلومات السائق، والتقييمات.</li>\\r\\n</ul>\\r\\n<p>نستخدم هذه البيانات لـ:</p>\\r\\n<ul>\\r\\n<li>التواصل معك بشأن حجوزاتك، العروض الترويجية، أو تحديثات الخدمة.</li>\\r\\n<li>معالجة المدفوعات وإدارة طلبات رحلاتك.</li>\\r\\n<li>تحسين تقديم الخدمة من خلال تحليل الأنماط في الرحلات، التعليقات، وسلوك المستخدم.</li>\\r\\n<li>تخصيص تجربتك من خلال التوصيات أو الخدمات المخصصة.</li>\\r\\n</ul>\\r\\n<p><strong>مشاركة البيانات والإفصاح عنها</strong></p>\\r\\n<p>نحن لا نبيع أو نؤجر معلوماتك الشخصية لأطراف ثالثة. ومع ذلك، قد نشارك معلوماتك الشخصية مع مزودي خدمات طرف ثالث موثوق بهم من أجل تقديم خدماتنا. تشمل هذه الأطراف:</p>\\r\\n<ul>\\r\\n<li>معالجو المدفوعات: لمعالجة المدفوعات بشكل آمن.</li>\\r\\n<li>أنظمة مطابقة الرحلات ومزودو خدمات الملاحة: لتمكين مطابقة الرحلات الأكثر كفاءة وتحسين المسارات.</li>\\r\\n<li>دعم العملاء: قد نستخدم أدوات طرف ثالث لتقديم خدمات الدعم لك.</li>\\r\\n</ul>\\r\\n<p>جميع الأطراف الثالثة التي نعمل معها ملزمة قانونًا بحماية معلوماتك الشخصية واستخدامها فقط للأغراض التي تم من أجلها مشاركتها.</p>\\r\\n<p>قد نكشف أيضًا عن معلوماتك إذا كان ذلك مطلوبًا بموجب القانون أو لحماية حقوقنا أو ممتلكاتنا أو سلامتنا، أو حقوق وسلامة مستخدمينا وآخرين.</p>\\r\\n<p><strong>أمن البيانات</strong></p>\\r\\n<p>نحن نولي أولوية قصوى لأمن معلوماتك الشخصية ونتبع أفضل الممارسات لحمايتها من الوصول غير المصرح به أو الكشف عنها أو تعديلها أو تدميرها. تشمل تدابير الأمان لدينا:</p>\\r\\n<ul>\\r\\n<li><strong>التشفير</strong>: نستخدم التشفير لحماية البيانات الحساسة مثل الدفع والمعلومات الشخصية.</li>\\r\\n<li><strong>جدران الحماية &amp; ضوابط الوصول</strong>: لمنع الوصول غير المصرح به إلى أنظمتنا.</li>\\r\\n<li><strong>المعاملات الآمنة</strong>: نتعاون مع معالجي مدفوعات موثوقين لمعالجة المعاملات المالية بشكل آمن.</li>\\r\\n</ul>\\r\\n<p>على الرغم من هذه التدابير، يرجى ملاحظة أنه لا توجد طريقة نقل عبر الإنترنت أو تخزين إلكتروني آمنة 100%. على الرغم من أننا نتخذ احتياطات كبيرة لحماية بياناتك، إلا أنه لا يمكننا ضمان الأمان المطلق.</p>\\r\\n<p>أنت مسؤول عن الحفاظ على سرية بيانات حسابك وأي أنشطة تحدث تحت حسابك.</p>\\r\\n<p><strong>الاحتفاظ بالبيانات</strong></p>\\r\\n<p>سنحتفظ بمعلوماتك الشخصية فقط طالما كانت ضرورية لتقديم خدماتنا أو كما هو مطلوب بموجب القانون. بمجرد أن تصبح المعلومات غير ضرورية للأغراض المحددة في سياسة الخصوصية هذه، سنقوم بحذفها أو إخفاء هويتها بشكل آمن.</p>\\r\\n<p><strong>تحديثات السياسة</strong></p>\\r\\n<p>نحتفظ بالحق في تحديث أو تغيير سياسة الخصوصية الخاصة بنا في أي وقت. ستكون أي تغييرات سارية المفعول فور نشر سياسة الخصوصية المعدلة على هذه الصفحة. نشجعك على مراجعة سياسة الخصوصية هذه بشكل دوري لمعرفة أي تحديثات. يشير استخدامك المستمر لخدماتنا بعد أي تغييرات إلى قبولك لهذه التغييرات.</p>\\r\\n<p><strong>اتصل بنا</strong></p>\\r\\n<p>إذا كانت لديك أي أسئلة أو استفسارات بشأن سياسة الخصوصية هذه، يرجى الاتصال بنا:</p>\\r\\n<ul>\\r\\n<li>بالبريد الإلكتروني: <a href=\\\"mailto:support@pixelstrap.com\\\">support@pixelstrap.com</a></li>\\r\\n</ul>\",\"de\":\"<p><strong>Datenschutzerkl&auml;rung f&uuml;r den Taxi-Management-Service</strong></p>\\r\\n<p><strong>Erhebung und Verwendung von Informationen</strong></p>\\r\\n<p>Wir erheben pers&ouml;nliche Informationen, um unsere Taxi-Dienste bereitzustellen, zu personalisieren und zu verbessern. Diese Informationen k&ouml;nnen umfassen:</p>\\r\\n<ul>\\r\\n<li><strong>Pers&ouml;nliche Informationen</strong>: Name, E-Mail-Adresse, Telefonnummer, Postadresse und alle anderen Angaben, die Sie uns freiwillig zur Verf&uuml;gung stellen.</li>\\r\\n<li><strong>Zahlungsinformationen</strong>: Kreditkartennummern, Rechnungsadresse und Zahlungshistorie zur Bearbeitung Ihrer Fahrten.</li>\\r\\n<li><strong>Standortinformationen</strong>: Ihr aktueller Standort, einschlie&szlig;lich Abhol- und Zielorte, um die Fahrtzuordnung und Navigation zu erleichtern.</li>\\r\\n<li><strong>Verwendungsdaten</strong>: IP-Adresse, Ger&auml;tetyp, Browsertyp und App-Nutzungsdaten, um die Benutzererfahrung zu analysieren und zu verbessern.</li>\\r\\n<li><strong>Fahrtdaten</strong>: Details Ihrer Fahrten, wie Start- und Zielorte, Fahrtdauer, Fahrerinformationen und Bewertungen.</li>\\r\\n</ul>\\r\\n<p>Wir verwenden diese Daten, um:</p>\\r\\n<ul>\\r\\n<li>Mit Ihnen bez&uuml;glich Ihrer Buchungen, Werbeaktionen oder Service-Updates zu kommunizieren.</li>\\r\\n<li>Zahlungen zu verarbeiten und Ihre Fahrtanfragen zu verwalten.</li>\\r\\n<li>Die Servicequalit&auml;t zu verbessern, indem wir Muster in Fahrten, Feedback und Nutzerverhalten analysieren.</li>\\r\\n<li>Ihre Erfahrung mit ma&szlig;geschneiderten Empfehlungen oder Dienstleistungen zu personalisieren.</li>\\r\\n</ul>\\r\\n<p><strong>Weitergabe und Offenlegung von Daten</strong></p>\\r\\n<p>Wir verkaufen oder vermieten Ihre pers&ouml;nlichen Informationen nicht an Dritte. Wir k&ouml;nnen jedoch Ihre pers&ouml;nlichen Informationen an vertrauensw&uuml;rdige Drittanbieter weitergeben, um unsere Dienstleistungen bereitzustellen. Diese umfassen:</p>\\r\\n<ul>\\r\\n<li>Zahlungsabwickler: Zur sicheren Bearbeitung von Zahlungen.</li>\\r\\n<li>Fahrtzuordnungssysteme und Navigationsanbieter: Zur Gew&auml;hrleistung der effizientesten Fahrtzuordnung und Routenoptimierung.</li>\\r\\n<li>Kundensupport: Wir k&ouml;nnen Drittanbieter-Tools verwenden, um Ihnen Support-Dienste anzubieten.</li>\\r\\n</ul>\\r\\n<p>Alle Drittanbieter, mit denen wir zusammenarbeiten, sind vertraglich verpflichtet, Ihre pers&ouml;nlichen Informationen zu sch&uuml;tzen und diese nur f&uuml;r die Zwecke zu verwenden, f&uuml;r die sie weitergegeben wurden.</p>\\r\\n<p>Wir k&ouml;nnen Ihre Informationen auch offenlegen, wenn dies gesetzlich vorgeschrieben ist oder zum Schutz unserer Rechte, Eigentum oder Sicherheit oder der Rechte und Sicherheit unserer Nutzer und anderer Personen erforderlich ist.</p>\\r\\n<p><strong>Datensicherheit</strong></p>\\r\\n<p>Wir legen gro&szlig;en Wert auf die Sicherheit Ihrer pers&ouml;nlichen Informationen und wenden branchen&uuml;bliche Praktiken an, um sie vor unbefugtem Zugriff, Offenlegung, &Auml;nderung oder Zerst&ouml;rung zu sch&uuml;tzen. Unsere Sicherheitsma&szlig;nahmen umfassen:</p>\\r\\n<ul>\\r\\n<li><strong>Verschl&uuml;sselung</strong>: Wir verwenden Verschl&uuml;sselung, um sensible Zahlungs- und pers&ouml;nliche Daten zu sch&uuml;tzen.</li>\\r\\n<li><strong>Firewalls &amp; Zugriffskontrollen</strong>: Um unbefugten Zugriff auf unsere Systeme zu verhindern.</li>\\r\\n<li><strong>Sichere Transaktionen</strong>: Wir arbeiten mit vertrauensw&uuml;rdigen Drittanbietern f&uuml;r die Zahlungsabwicklung zusammen, um Finanztransaktionen sicher abzuwickeln.</li>\\r\\n</ul>\\r\\n<p>Dennoch m&ouml;chten wir Sie darauf hinweisen, dass keine &Uuml;bertragungsmethode &uuml;ber das Internet oder elektronische Speicherung v&ouml;llig sicher ist. W&auml;hrend wir erhebliche Vorsichtsma&szlig;nahmen treffen, um Ihre Daten zu sch&uuml;tzen, k&ouml;nnen wir keine absolute Sicherheit garantieren.</p>\\r\\n<p>Sie sind daf&uuml;r verantwortlich, die Vertraulichkeit Ihrer Kontoinformationen zu wahren und f&uuml;r alle Aktivit&auml;ten, die unter Ihrem Konto stattfinden.</p>\\r\\n<p><strong>Datenspeicherung</strong></p>\\r\\n<p>Wir werden Ihre pers&ouml;nlichen Informationen nur so lange aufbewahren, wie es notwendig ist, um Ihnen unsere Dienstleistungen bereitzustellen oder wie es gesetzlich vorgeschrieben ist. Sobald die Informationen nicht mehr f&uuml;r die in dieser Datenschutzerkl&auml;rung genannten Zwecke ben&ouml;tigt werden, werden wir diese sicher l&ouml;schen oder anonymisieren.</p>\\r\\n<p><strong>&Auml;nderungen der Richtlinie</strong></p>\\r\\n<p>Wir behalten uns das Recht vor, unsere Datenschutzerkl&auml;rung jederzeit zu aktualisieren oder zu &auml;ndern. &Auml;nderungen werden sofort nach der Ver&ouml;ffentlichung der &uuml;berarbeiteten Datenschutzerkl&auml;rung auf dieser Seite wirksam. Wir empfehlen Ihnen, diese Datenschutzerkl&auml;rung regelm&auml;&szlig;ig auf Aktualisierungen zu &uuml;berpr&uuml;fen. Die fortgesetzte Nutzung unserer Dienstleistungen nach &Auml;nderungen bedeutet, dass Sie diese &Auml;nderungen akzeptieren.</p>\\r\\n<p><strong>Kontaktieren Sie uns</strong></p>\\r\\n<p>Wenn Sie Fragen oder Bedenken zu dieser Datenschutzerkl&auml;rung haben, kontaktieren Sie uns bitte:</p>\\r\\n<ul>\\r\\n<li>Per E-Mail: <a href=\\\"mailto:support@pixelstrap.com\\\">support@pixelstrap.com</a></li>\\r\\n</ul>\",\"fr\":\"<p><strong>Politique de confidentialit&eacute; pour le service de gestion de taxi</strong></p>\\r\\n<p><strong>Collecte et utilisation des informations</strong></p>\\r\\n<p>Nous collectons des informations personnelles afin de fournir, personnaliser et am&eacute;liorer nos services de taxi. Ces informations peuvent inclure :</p>\\r\\n<ul>\\r\\n<li><strong>Informations personnelles</strong> : Nom, adresse e-mail, num&eacute;ro de t&eacute;l&eacute;phone, adresse postale et toutes autres informations que vous choisissez de nous fournir.</li>\\r\\n<li><strong>Informations de paiement</strong> : Num&eacute;ros de carte de cr&eacute;dit, adresse de facturation et historique des paiements pour le traitement de vos trajets.</li>\\r\\n<li><strong>Informations de localisation</strong> : Votre emplacement actuel, y compris les points de prise en charge et de d&eacute;pose, pour faciliter l\'appariement des trajets et la navigation.</li>\\r\\n<li><strong>Donn&eacute;es d\'utilisation</strong> : Adresse IP, type d\'appareil, type de navigateur et donn&eacute;es d\'utilisation de l\'application pour analyser et am&eacute;liorer l\'exp&eacute;rience utilisateur.</li>\\r\\n<li><strong>Informations sur les trajets</strong> : D&eacute;tails de vos trajets, tels que les lieux de d&eacute;part et d\'arriv&eacute;e, la dur&eacute;e du trajet, les informations sur le chauffeur et les &eacute;valuations.</li>\\r\\n</ul>\\r\\n<p>Nous utilisons ces donn&eacute;es pour :</p>\\r\\n<ul>\\r\\n<li>Communiquer avec vous concernant vos r&eacute;servations, promotions ou mises &agrave; jour des services.</li>\\r\\n<li>Traiter les paiements et g&eacute;rer vos demandes de trajets.</li>\\r\\n<li>Am&eacute;liorer la qualit&eacute; du service en analysant les tendances des trajets, les retours et le comportement des utilisateurs.</li>\\r\\n<li>Personnaliser votre exp&eacute;rience avec des recommandations ou des services sur mesure.</li>\\r\\n</ul>\\r\\n<p><strong>Partage et divulgation des donn&eacute;es</strong></p>\\r\\n<p>Nous ne vendons ni ne louons vos informations personnelles &agrave; des tiers. Cependant, nous pouvons partager vos informations personnelles avec des prestataires de services tiers de confiance dans le but de fournir nos services. Ceux-ci incluent :</p>\\r\\n<ul>\\r\\n<li>Processeurs de paiement : Pour traiter les paiements de mani&egrave;re s&eacute;curis&eacute;e.</li>\\r\\n<li>Syst&egrave;mes de jumelage de trajets et fournisseurs de navigation : Pour garantir l\'appariement des trajets le plus efficace et l\'optimisation des itin&eacute;raires.</li>\\r\\n<li>Support client : Nous pouvons utiliser des outils tiers pour vous fournir des services d\'assistance.</li>\\r\\n</ul>\\r\\n<p>Tous les tiers avec lesquels nous travaillons sont contractuellement oblig&eacute;s de prot&eacute;ger vos informations personnelles et de les utiliser uniquement aux fins pour lesquelles elles ont &eacute;t&eacute; partag&eacute;es.</p>\\r\\n<p>Nous pouvons &eacute;galement divulguer vos informations si la loi l\'exige ou pour prot&eacute;ger nos droits, biens ou s&eacute;curit&eacute;, ou les droits et la s&eacute;curit&eacute; de nos utilisateurs et d\'autres personnes.</p>\\r\\n<p><strong>S&eacute;curit&eacute; des donn&eacute;es</strong></p>\\r\\n<p>Nous accordons une grande importance &agrave; la s&eacute;curit&eacute; de vos informations personnelles et appliquons des pratiques conformes aux normes de l\'industrie pour les prot&eacute;ger contre tout acc&egrave;s non autoris&eacute;, divulgation, modification ou destruction. Nos mesures de s&eacute;curit&eacute; comprennent :</p>\\r\\n<ul>\\r\\n<li><strong>Cryptage</strong> : Nous utilisons le cryptage pour prot&eacute;ger les donn&eacute;es sensibles relatives aux paiements et aux informations personnelles.</li>\\r\\n<li><strong>Pare-feu et contr&ocirc;les d\'acc&egrave;s</strong> : Pour pr&eacute;venir tout acc&egrave;s non autoris&eacute; &agrave; nos syst&egrave;mes.</li>\\r\\n<li><strong>Transactions s&eacute;curis&eacute;es</strong> : Nous collaborons avec des processeurs de paiement de confiance pour garantir la s&eacute;curit&eacute; des transactions financi&egrave;res.</li>\\r\\n</ul>\\r\\n<p>Cependant, veuillez noter qu\'aucune m&eacute;thode de transmission sur Internet ou de stockage &eacute;lectronique n\'est totalement s&eacute;curis&eacute;e. Bien que nous prenions des pr&eacute;cautions importantes pour prot&eacute;ger vos donn&eacute;es, nous ne pouvons pas garantir une s&eacute;curit&eacute; absolue.</p>\\r\\n<p>Vous &ecirc;tes responsable de la confidentialit&eacute; de vos identifiants de compte et de toutes les activit&eacute;s qui se d&eacute;roulent sous votre compte.</p>\\r\\n<p><strong>Conservation des donn&eacute;es</strong></p>\\r\\n<p>Nous conserverons vos informations personnelles uniquement pendant le temps n&eacute;cessaire pour vous fournir nos services ou selon ce qui est requis par la loi. Une fois que les informations ne sont plus n&eacute;cessaires aux fins &eacute;nonc&eacute;es dans cette politique de confidentialit&eacute;, nous les supprimerons ou les anonymiserons de mani&egrave;re s&eacute;curis&eacute;e.</p>\\r\\n<p><strong>Mises &agrave; jour de la politique</strong></p>\\r\\n<p>Nous nous r&eacute;servons le droit de mettre &agrave; jour ou de modifier cette politique de confidentialit&eacute; &agrave; tout moment. Les modifications prendront effet imm&eacute;diatement apr&egrave;s la publication de la politique de confidentialit&eacute; r&eacute;vis&eacute;e sur cette page. Nous vous encourageons &agrave; consulter p&eacute;riodiquement cette politique de confidentialit&eacute; pour prendre connaissance des mises &agrave; jour. L\'utilisation continue de nos services apr&egrave;s toute modification signifie que vous acceptez ces changements.</p>\\r\\n<p><strong>Contactez-nous</strong></p>\\r\\n<p>Si vous avez des questions ou des pr&eacute;occupations concernant cette politique de confidentialit&eacute;, veuillez nous contacter :</p>\\r\\n<ul>\\r\\n<li>Par e-mail : <a href=\\\"mailto:support@pixelstrap.com\\\">support@pixelstrap.com</a></li>\\r\\n</ul>\"}', NULL, NULL, NULL, 1, 1, '2025-01-24 02:56:38', '2025-01-24 03:04:47', NULL),
(2, '{\n  \"en\": \"Booking and Cancellation\",\n  \"fr\": \"Réservation et annulation\",\n  \"ar\": \"الحجز والإلغاء\",\n  \"de\": \"Buchung und Stornierung\"\n}\n', 'booking-and-cancellation', '{\"en\":\"<ul>\\r\\n<li data-start=\\\"1237\\\" data-end=\\\"1288\\\">You can book a ride through our app or website.</li>\\r\\n<li data-start=\\\"1289\\\" data-end=\\\"1395\\\">Cancellation policies apply, and fees may be charged if a ride is canceled after a certain time frame.</li>\\r\\n<li data-start=\\\"1396\\\" data-end=\\\"1476\\\">We reserve the right to cancel or refuse any ride request at our discretion.</li>\\r\\n</ul>\"}', NULL, NULL, NULL, 1, 1, '2025-03-06 06:02:40', '2025-03-06 06:02:40', NULL),
(3, '{\n  \"en\": \"Terms and Conditions\",\n  \"fr\": \"Conditions générales\",\n  \"ar\": \"الشروط والأحكام\",\n  \"de\": \"Allgemeine Geschäftsbedingungen\"\n}\n', 'terms-and-conditions', '{\"en\":\"<p data-pm-slice=\\\"1 3 []\\\"><strong>1. Eligibility</strong> To use our services, you must be at least 18 years old or have legal parental/guardian consent. By using our platform, you confirm that you meet these requirements.</p>\\r\\n<p><strong>2. Services Provided</strong> We offer vehicle rental and freight transportation services subject to availability. The terms for each service, including pricing and availability, are specified at the time of booking.</p>\\r\\n<p><strong>3. Booking and Payment</strong></p>\\r\\n<ul data-spread=\\\"false\\\">\\r\\n<li>\\r\\n<p>All bookings must be made through our website or mobile application.</p>\\r\\n</li>\\r\\n<li>\\r\\n<p>Payment must be completed before the service is provided.</p>\\r\\n</li>\\r\\n<li>\\r\\n<p>We accept payments via credit/debit card, digital wallets, and other approved methods.</p>\\r\\n</li>\\r\\n<li>\\r\\n<p>Prices are subject to change without prior notice.</p>\\r\\n</li>\\r\\n</ul>\\r\\n<p><strong>4. Cancellation and Refund Policy</strong></p>\\r\\n<ul data-spread=\\\"false\\\">\\r\\n<li>\\r\\n<p>Customers may cancel bookings within a specified period for a full or partial refund, depending on the service booked.</p>\\r\\n</li>\\r\\n<li>\\r\\n<p>No refunds will be issued for last-minute cancellations unless stated otherwise.</p>\\r\\n</li>\\r\\n<li>\\r\\n<p>Refunds, if applicable, will be processed within 7-14 business days.</p>\\r\\n</li>\\r\\n</ul>\\r\\n<p><strong>5. User Responsibilities</strong></p>\\r\\n<ul data-spread=\\\"false\\\">\\r\\n<li>\\r\\n<p>You must provide accurate and complete information when using our services.</p>\\r\\n</li>\\r\\n<li>\\r\\n<p>Any misuse, fraudulent activity, or violation of our terms will result in account suspension or termination.</p>\\r\\n</li>\\r\\n<li>\\r\\n<p>You are responsible for maintaining the confidentiality of your account credentials.</p>\\r\\n</li>\\r\\n</ul>\\r\\n<p><strong>6. Liability Disclaimer</strong></p>\\r\\n<ul data-spread=\\\"false\\\">\\r\\n<li>\\r\\n<p>We are not liable for any damages, losses, or injuries resulting from the use of our services, except where required by law.</p>\\r\\n</li>\\r\\n<li>\\r\\n<p>In case of vehicle rental, the customer assumes full responsibility for any damages beyond normal wear and tear.</p>\\r\\n</li>\\r\\n</ul>\"}', NULL, NULL, NULL, 1, 1, '2025-03-06 06:03:08', '2025-03-06 06:03:08', NULL),
(4, '{\n  \"en\": \"Modifications to Terms\",\n  \"fr\": \"Modifications des conditions\",\n  \"ar\": \"تعديلات على الشروط\",\n  \"de\": \"Änderungen der Bedingungen\"\n}\n', 'modifications-to-terms', '{\"en\":\"<p data-pm-slice=\\\"1 1 []\\\">We reserve the right to modify, update, or change these Terms and Conditions at any time. Any modifications will be effective immediately upon posting the revised version on our website or mobile application. It is your responsibility to review these terms periodically. Continued use of our services after any updates constitute acceptance of the revised terms.</p>\"}', NULL, NULL, NULL, 1, 1, '2025-03-06 06:03:39', '2025-03-06 06:03:39', NULL),
(5, '{\n  \"en\": \"Guidelines\",\n  \"fr\": \"Lignes directrices\",\n  \"ar\": \"الإرشادات\",\n  \"de\": \"Richtlinien\"\n}\n', 'guidelines', '{\"en\":\"<p data-start=\\\"163\\\" data-end=\\\"373\\\"><strong data-start=\\\"163\\\" data-end=\\\"182\\\">1. Introduction</strong><br data-start=\\\"182\\\" data-end=\\\"185\\\" />These Driver Terms and Guidelines outline the responsibilities, expectations, and policies for drivers using our platform. By registering as a driver, you agree to comply with these terms.</p>\\r\\n<p data-start=\\\"375\\\" data-end=\\\"408\\\"><strong data-start=\\\"375\\\" data-end=\\\"406\\\">2. Eligibility Requirements</strong></p>\\r\\n<ul data-start=\\\"409\\\" data-end=\\\"626\\\">\\r\\n<li data-start=\\\"409\\\" data-end=\\\"487\\\">Drivers must hold a valid driver\'s license for the region they operate in.</li>\\r\\n<li data-start=\\\"488\\\" data-end=\\\"567\\\">A clean driving record is required, and background checks may be conducted.</li>\\r\\n<li data-start=\\\"568\\\" data-end=\\\"626\\\">Vehicles must meet our safety and operational standards.</li>\\r\\n</ul>\\r\\n<p data-start=\\\"628\\\" data-end=\\\"664\\\"><strong data-start=\\\"628\\\" data-end=\\\"662\\\">3. Ride Acceptance and Conduct</strong></p>\\r\\n<ul data-start=\\\"665\\\" data-end=\\\"926\\\">\\r\\n<li data-start=\\\"665\\\" data-end=\\\"738\\\">Drivers must accept ride requests promptly and ensure timely pickups.</li>\\r\\n<li data-start=\\\"739\\\" data-end=\\\"833\\\">Professional behavior is expected at all times&mdash;drivers must treat passengers with respect.</li>\\r\\n<li data-start=\\\"834\\\" data-end=\\\"926\\\">Use of alcohol, drugs, or any prohibited substances while driving is strictly forbidden.</li>\\r\\n</ul>\\r\\n<p data-start=\\\"928\\\" data-end=\\\"967\\\"><strong data-start=\\\"928\\\" data-end=\\\"965\\\">4. Vehicle Maintenance and Safety</strong></p>\\r\\n<ul data-start=\\\"968\\\" data-end=\\\"1206\\\">\\r\\n<li data-start=\\\"968\\\" data-end=\\\"1065\\\">Vehicles must be in good condition, regularly maintained, and comply with safety regulations.</li>\\r\\n<li data-start=\\\"1066\\\" data-end=\\\"1139\\\">The use of seat belts by both the driver and passengers is mandatory.</li>\\r\\n<li data-start=\\\"1140\\\" data-end=\\\"1206\\\">Drivers must follow all traffic laws and avoid reckless driving.</li>\\r\\n</ul>\\r\\n<p data-start=\\\"1208\\\" data-end=\\\"1238\\\"><strong data-start=\\\"1208\\\" data-end=\\\"1236\\\">5. Earnings and Payments</strong></p>\\r\\n<ul data-start=\\\"1239\\\" data-end=\\\"1461\\\">\\r\\n<li data-start=\\\"1239\\\" data-end=\\\"1314\\\">Payments for rides will be processed according to our payment schedule.</li>\\r\\n<li data-start=\\\"1315\\\" data-end=\\\"1395\\\">Commission and service fees will be deducted as per the platform&rsquo;s policies.</li>\\r\\n<li data-start=\\\"1396\\\" data-end=\\\"1461\\\">Any disputes regarding payments must be reported within 7 days.</li>\\r\\n</ul>\\r\\n<p data-start=\\\"1463\\\" data-end=\\\"1496\\\"><strong data-start=\\\"1463\\\" data-end=\\\"1494\\\">6. Penalties and Suspension</strong></p>\\r\\n<ul data-start=\\\"1497\\\" data-end=\\\"1761\\\">\\r\\n<li data-start=\\\"1497\\\" data-end=\\\"1657\\\">Repeated complaints, violations of policies, or failure to maintain service quality may result in warnings, temporary suspension, or permanent deactivation.</li>\\r\\n<li data-start=\\\"1658\\\" data-end=\\\"1761\\\">Fraudulent activities, such as fake rides or fare manipulation, will lead to immediate termination.</li>\\r\\n</ul>\\r\\n<p data-start=\\\"1763\\\" data-end=\\\"1799\\\"><strong data-start=\\\"1763\\\" data-end=\\\"1797\\\">7. Privacy and Confidentiality</strong></p>\\r\\n<ul data-start=\\\"1800\\\" data-end=\\\"1967\\\">\\r\\n<li data-start=\\\"1800\\\" data-end=\\\"1891\\\">Drivers must not share passenger details or trip information with unauthorized parties.</li>\\r\\n<li data-start=\\\"1892\\\" data-end=\\\"1967\\\">Any data collected must be handled in compliance with our Privacy Policy.</li>\\r\\n</ul>\"}', NULL, NULL, NULL, 1, 1, '2025-03-06 06:04:10', '2025-03-06 06:04:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_accounts`
--

CREATE TABLE `payment_accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `paypal_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_holder_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routing_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_accounts`
--

INSERT INTO `payment_accounts` (`id`, `user_id`, `paypal_email`, `bank_name`, `bank_holder_name`, `bank_account_no`, `swift`, `routing_number`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 17, NULL, 'Bank of America', 'John Smith', '12345678901', 'BOFAUS3N', 'BOFA123456', 1, '2025-01-23 01:21:12', '2025-01-23 01:21:12', NULL),
(2, 18, NULL, 'Chase Bank', 'Mike Brown', '98765432101', 'CHASUS33', 'CHAS987654', 1, '2025-01-23 01:23:04', '2025-01-23 01:23:04', NULL),
(3, 19, NULL, 'Wells Fargo', 'David Scott', '23456789012', 'WFBIUS6S', 'WFBI234567', 1, '2025-01-23 01:29:18', '2025-01-23 01:29:18', NULL),
(4, 20, NULL, 'Citibank', 'Chris Adams', '34567890123', 'CITIUS33', 'CITI345678', 1, '2025-01-23 01:31:45', '2025-01-23 01:31:45', NULL),
(5, 21, NULL, 'US Bank', 'Robert King', '45678901234', 'USBKUS44', 'USBK456789', 1, '2025-01-23 01:33:56', '2025-01-23 01:33:56', NULL),
(6, 22, NULL, 'Bank of America', 'Mark Williams', '56789012345', 'BOFAUS3N', 'BOFA567890', 1, '2025-01-23 01:35:43', '2025-01-23 01:35:43', NULL),
(7, 23, NULL, 'Wells Fargo', 'Paul Jones', '67890123456', 'WFBIUS6S', 'WFBI678901', 1, '2025-01-23 01:39:09', '2025-01-23 01:39:09', NULL),
(8, 24, NULL, 'Chase Bank', 'Lucas Rodriguez', '78901234567', 'CHASUS33', 'CHAS789012', 1, '2025-01-23 01:41:05', '2025-01-23 01:41:05', NULL),
(9, 25, NULL, 'Citibank', 'Daniel Miller', '89012345678', 'CITIUS33', 'CITI890123', 1, '2025-01-23 01:43:01', '2025-01-23 01:43:01', NULL),
(10, 26, NULL, 'Wells Fargo', 'Brian Clark', '90123456789', 'WFBIUS6S', 'WFBI901234', 1, '2025-01-23 01:44:40', '2025-01-23 01:44:40', NULL),
(11, 27, NULL, 'Bank of America', 'Stephen Morris', '12345678901', 'BOFAUS3N', 'BOFA123456', 1, '2025-01-23 01:50:03', '2025-01-23 01:50:03', NULL),
(12, 28, NULL, 'Chase Bank', 'Aaron Brown', '23456789012', 'CHASUS33', 'CHAS234567', 1, '2025-01-23 01:52:02', '2025-01-23 01:52:02', NULL),
(13, 29, NULL, 'Citibank', 'Michael Williams', '34567890123', 'CITIUS33', 'CITI345678', 1, '2025-01-23 01:57:52', '2025-01-23 01:57:52', NULL),
(14, 30, NULL, 'Citibank', 'Thomas Rodriguez', '56789012345', 'CITIUS33', 'WFBI456789', 1, '2025-01-23 02:01:19', '2025-01-23 02:01:19', NULL),
(15, 31, NULL, 'Wells Fargo', 'Robert Miller', 'fastkartpersonal@gmail.com', 'WFBIUS6S', 'WFBI456789', 1, '2025-01-23 02:02:04', '2025-01-24 22:18:53', NULL),
(16, 32, NULL, 'Chase Bank', 'Alex Jones', '67890123456', 'CHASUS33', 'CHAS678901', 1, '2025-01-23 02:08:48', '2025-01-23 02:08:48', NULL),
(17, 33, NULL, 'Bank of America', 'Daniel Scott', '78901234567', 'BOFAUS3N', 'BOFA789012', 1, '2025-01-23 02:11:55', '2025-01-23 22:21:39', '2025-01-23 22:21:39'),
(18, 34, NULL, 'Wells Fargo', 'Samuel Thompson', '89012345678', 'WFBIUS6S', 'WFBI890123', 1, '2025-01-23 02:16:34', '2025-01-23 02:16:34', NULL),
(19, 35, NULL, 'Citibank', 'Matthew Martinez', '90123456789', 'CITIUS33', 'CITI901234', 1, '2025-01-23 02:20:23', '2025-01-23 02:20:23', NULL),
(20, 36, NULL, 'SBI', 'Raj Kumar', '123987456', 'SBININBBXXX', 'SBIN0003', 1, '2025-01-23 02:23:49', '2025-01-28 01:53:01', NULL),
(21, 33, NULL, 'Bank of America', 'Daniel Scott', '78901234567', 'BOFAUS3N', 'BOFA789012', 1, '2025-01-23 22:37:43', '2025-01-23 22:37:43', NULL),
(22, 54, NULL, 'Bank Mandiri', 'Riyan Prasetyo', '567890123', 'BMRIIDJA', 'BMRI0036', 1, '2025-01-28 03:10:33', '2025-01-28 03:10:33', NULL),
(23, 55, NULL, 'National Bank of Egypt', 'Salma Mahmoud', '987654321', 'NBEGEGCX', 'NBEGEGCX', 1, '2025-01-28 03:22:20', '2025-01-28 03:22:20', NULL),
(25, 59, NULL, 'Global Bank', 'John Doe', '9876543210', 'GB12345', 'GBN0001234', 1, '2025-04-28 07:41:09', '2025-04-28 07:41:09', NULL),
(26, 60, NULL, 'Central Bank', 'Jane Smith', '1234567890', 'CB12345', 'CBN0001234', 1, '2025-04-28 07:43:23', '2025-04-28 07:43:23', NULL),
(27, 61, NULL, 'National Bank', 'Robert Brown', '2345678901', 'NB12345', 'NBN0001234', 1, '2025-04-28 07:44:26', '2025-04-28 07:44:26', NULL),
(28, 62, NULL, 'International Bank', 'Emily White', '3456789012', 'IB12345', 'IBN0001234', 1, '2025-04-28 07:45:21', '2025-04-28 07:45:21', NULL),
(29, 63, NULL, 'Global Financial Bank', 'Sarah Blue', '5678901234', 'GFB12345', 'GFB0001234', 1, '2025-04-28 07:46:30', '2025-04-28 07:46:30', NULL),
(30, 64, NULL, 'Central Bank', 'Fleet Manager', '4567890523', 'FM12345', 'FMN0001234', 1, '2025-04-28 07:49:24', '2025-04-28 07:49:24', NULL),
(31, 65, NULL, 'Global Bank', 'Martin Rojas', '000123456789', 'GLBUSA123', 'GLB123456789', 1, '2025-04-29 03:57:13', '2025-04-29 03:57:13', NULL),
(32, 66, NULL, 'Prime Bank', 'David Cruz', '001234567890', 'PRMUSA456', 'PRM123456789', 1, '2025-04-29 04:04:53', '2025-04-29 04:04:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mode` enum('live','sandbox') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `configs` json DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways_transactions`
--

CREATE TABLE `payment_gateways_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_verified` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `request_type` enum('web','api') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'api'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways_transactions`
--

INSERT INTO `payment_gateways_transactions` (`id`, `item_id`, `amount`, `transaction_id`, `payment_method`, `payment_status`, `type`, `redirect_url`, `is_verified`, `created_at`, `updated_at`, `request_type`) VALUES
(1, '2', 65.60, '1KW24236W0563415A', 'PayPal', 'COMPLETED', 'ride', NULL, 1, '2025-01-29 02:48:33', '2025-01-29 02:53:13', 'api'),
(2, '4', 93.30, '07E640980Y260472G', 'PayPal', 'COMPLETED', 'ride', NULL, 1, '2025-01-29 03:51:17', '2025-01-29 03:53:24', 'api'),
(3, '9', 848.30, '89D0694936943401N', 'PayPal', 'COMPLETED', 'ride', NULL, 1, '2025-01-29 23:41:13', '2025-01-29 23:42:46', 'api'),
(4, '10', 96.30, '7FD89815LS030821U', 'PayPal', 'PENDING', 'ride', NULL, 1, '2025-01-29 23:58:19', '2025-01-30 00:01:28', 'api'),
(5, '9', 849.60, '62C35466BX503930H', 'PayPal', 'COMPLETED', 'ride', NULL, 1, '2025-01-29 23:58:46', '2025-01-29 23:59:52', 'api'),
(6, '10', 97.60, '12417355U4390710K', 'PayPal', 'PENDING', 'ride', NULL, 0, '2025-01-30 00:01:46', '2025-01-30 00:01:48', 'api'),
(7, '12', 88.30, '2WP3805924643591G', 'PayPal', 'COMPLETED', 'ride', NULL, 1, '2025-01-30 00:58:06', '2025-01-30 01:00:03', 'api'),
(8, '13', 392.00, '5NV89847SN830570Y', 'PayPal', 'COMPLETED', 'ride', NULL, 1, '2025-01-30 01:27:29', '2025-01-30 01:28:41', 'api'),
(9, '15', 37.00, '826508463U116544F', 'PayPal', 'COMPLETED', 'ride', NULL, 1, '2025-01-30 06:31:25', '2025-01-30 06:32:19', 'api'),
(10, '19', 132.00, '2M468994HJ848801U', 'PayPal', 'COMPLETED', 'ride', NULL, 1, '2025-03-20 02:44:58', '2025-03-20 02:45:35', 'api'),
(11, '25', 227.00, '4SL67864T00174539', 'PayPal', 'COMPLETED', 'ride', NULL, 1, '2025-03-20 04:13:15', '2025-03-20 04:13:43', 'api'),
(12, '26', 132.00, '2EV52479GE000272P', 'PayPal', 'COMPLETED', 'ride', NULL, 1, '2025-03-20 04:16:28', '2025-03-20 04:16:55', 'api');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'media.index', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(2, 'media.create', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(3, 'media.edit', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(4, 'media.destroy', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(5, 'media.restore', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(6, 'media.forceDelete', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(7, 'user.index', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(8, 'user.create', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(9, 'user.edit', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(10, 'user.destroy', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(11, 'user.restore', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(12, 'user.forceDelete', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(13, 'role.index', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(14, 'role.create', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(15, 'role.edit', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(16, 'role.destroy', 'web', '2025-07-08 18:33:51', '2025-07-08 18:33:51'),
(17, 'attachment.index', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(18, 'attachment.create', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(19, 'attachment.destroy', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(20, 'attachment.edit', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(21, 'category.index', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(22, 'category.create', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(23, 'category.edit', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(24, 'category.destroy', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(25, 'tag.index', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(26, 'tag.create', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(27, 'tag.edit', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(28, 'tag.destroy', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(29, 'tag.restore', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(30, 'tag.forceDelete', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(31, 'blog.index', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(32, 'blog.create', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(33, 'blog.edit', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(34, 'blog.destroy', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(35, 'blog.restore', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(36, 'blog.forceDelete', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(37, 'page.index', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(38, 'page.create', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(39, 'page.edit', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(40, 'page.destroy', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(41, 'page.restore', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(42, 'page.forceDelete', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(43, 'testimonial.index', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(44, 'testimonial.create', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(45, 'testimonial.edit', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(46, 'testimonial.destroy', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(47, 'testimonial.restore', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(48, 'testimonial.forceDelete', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(49, 'tax.index', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(50, 'tax.create', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(51, 'tax.edit', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(52, 'tax.destroy', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(53, 'tax.restore', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(54, 'tax.forceDelete', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(55, 'currency.index', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(56, 'currency.create', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(57, 'currency.edit', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(58, 'currency.destroy', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(59, 'currency.restore', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(60, 'currency.forceDelete', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(61, 'language.index', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(62, 'language.create', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(63, 'language.edit', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(64, 'language.destroy', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(65, 'language.restore', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(66, 'language.forceDelete', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(67, 'setting.index', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(68, 'setting.edit', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(69, 'system-tool.index', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(70, 'system-tool.create', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(71, 'system-tool.edit', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(72, 'system-tool.destroy', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(73, 'system-tool.restore', 'web', '2025-07-08 18:33:52', '2025-07-08 18:33:52'),
(74, 'system-tool.forceDelete', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(75, 'plugin.index', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(76, 'plugin.create', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(77, 'plugin.edit', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(78, 'plugin.destroy', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(79, 'plugin.restore', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(80, 'plugin.forceDelete', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(81, 'about-system.index', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(82, 'payment-method.index', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(83, 'payment-method.edit', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(84, 'sms-gateway.index', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(85, 'sms-gateway.edit', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(86, 'sms_template.index', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(87, 'sms_template.create', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(88, 'sms_template.edit', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(89, 'sms_template.destroy', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(90, 'sms_template.forceDelete', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(91, 'email_template.index', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(92, 'email_template.create', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(93, 'email_template.destroy', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(94, 'email_template.edit', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(95, 'email_template.forceDelete', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(96, 'push_notification_template.index', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(97, 'push_notification_template.create', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(98, 'push_notification_template.destroy', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(99, 'push_notification_template.edit', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(100, 'push_notification_template.forceDelete', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(101, 'landing_page.index', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(102, 'landing_page.edit', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(103, 'appearance.index', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(104, 'appearance.edit', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(105, 'appearance.create', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(106, 'backup.index', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(107, 'backup.create', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(108, 'backup.edit', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(109, 'backup.destroy', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(110, 'backup.restore', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(111, 'backup.forceDelete', 'web', '2025-07-08 18:33:53', '2025-07-08 18:33:53'),
(112, 'rider.index', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(113, 'rider.create', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(114, 'rider.edit', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(115, 'rider.destroy', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(116, 'rider.restore', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(117, 'rider.forceDelete', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(118, 'driver.index', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(119, 'driver.create', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(120, 'driver.edit', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(121, 'driver.destroy', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(122, 'driver.restore', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(123, 'driver.forceDelete', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(124, 'dispatcher.index', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(125, 'dispatcher.create', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(126, 'dispatcher.edit', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(127, 'dispatcher.destroy', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(128, 'dispatcher.restore', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(129, 'dispatcher.forceDelete', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(130, 'unverified_driver.index', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(131, 'unverified_driver.create', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(132, 'unverified_driver.edit', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(133, 'unverified_driver.destroy', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(134, 'unverified_driver.restore', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(135, 'unverified_driver.forceDelete', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(136, 'banner.index', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(137, 'banner.create', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(138, 'banner.edit', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(139, 'banner.destroy', 'web', '2025-07-08 18:34:16', '2025-07-08 18:34:16'),
(140, 'banner.restore', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(141, 'banner.forceDelete', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(142, 'document.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(143, 'document.create', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(144, 'document.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(145, 'document.destroy', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(146, 'document.restore', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(147, 'document.forceDelete', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(148, 'vehicle_type.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(149, 'vehicle_type.create', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(150, 'vehicle_type.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(151, 'vehicle_type.destroy', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(152, 'vehicle_type.restore', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(153, 'vehicle_type.forceDelete', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(154, 'coupon.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(155, 'coupon.create', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(156, 'coupon.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(157, 'coupon.destroy', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(158, 'coupon.restore', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(159, 'coupon.forceDelete', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(160, 'zone.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(161, 'zone.create', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(162, 'zone.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(163, 'zone.destroy', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(164, 'zone.restore', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(165, 'zone.forceDelete', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(166, 'faq.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(167, 'faq.create', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(168, 'faq.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(169, 'faq.destroy', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(170, 'faq.restore', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(171, 'faq.forceDelete', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(172, 'heat_map.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(173, 'heat_map.create', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(174, 'heat_map.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(175, 'heat_map.destroy', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(176, 'heat_map.restore', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(177, 'heat_map.forceDelete', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(178, 'sos.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(179, 'sos.create', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(180, 'sos.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(181, 'sos.destroy', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(182, 'sos.restore', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(183, 'sos.forceDelete', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(184, 'driver_document.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(185, 'driver_document.create', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(186, 'driver_document.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(187, 'driver_document.destroy', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(188, 'driver_document.restore', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(189, 'driver_document.forceDelete', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(190, 'driver_rule.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(191, 'driver_rule.create', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(192, 'driver_rule.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(193, 'driver_rule.destroy', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(194, 'driver_rule.restore', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(195, 'driver_rule.forceDelete', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(196, 'extra_charge.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(197, 'extra_charge.create', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(198, 'extra_charge.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(199, 'extra_charge.destroy', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(200, 'extra_charge.restore', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(201, 'extra_charge.forceDelete', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(202, 'cab_commission_history.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(203, 'notice.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(204, 'notice.create', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(205, 'notice.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(206, 'notice.destroy', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(207, 'notice.restore', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(208, 'notice.forceDelete', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(209, 'driver_wallet.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(210, 'driver_wallet.credit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(211, 'driver_wallet.debit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(212, 'service.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(213, 'service.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(214, 'onboarding.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(215, 'onboarding.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(216, 'service_category.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(217, 'service_category.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(218, 'taxido_setting.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(219, 'taxido_setting.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(220, 'ride_request.index', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(221, 'ride_request.create', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(222, 'ride_request.edit', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(223, 'ride_request.destroy', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(224, 'ride_request.restore', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(225, 'ride_request.forceDelete', 'web', '2025-07-08 18:34:17', '2025-07-08 18:34:17'),
(226, 'ride.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(227, 'ride.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(228, 'ride.edit', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(229, 'plan.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(230, 'plan.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(231, 'plan.edit', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(232, 'plan.destroy', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(233, 'plan.restore', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(234, 'plan.forceDelete', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(235, 'airport.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(236, 'airport.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(237, 'airport.edit', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(238, 'airport.destroy', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(239, 'airport.restore', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(240, 'airport.forceDelete', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(241, 'surge_price.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(242, 'surge_price.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(243, 'surge_price.edit', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(244, 'surge_price.destroy', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(245, 'surge_price.restore', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(246, 'surge_price.forceDelete', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(247, 'subscription.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(248, 'subscription.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(249, 'subscription.edit', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(250, 'subscription.destroy', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(251, 'subscription.purchase', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(252, 'subscription.cancel', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(253, 'bid.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(254, 'bid.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(255, 'bid.edit', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(256, 'push_notification.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(257, 'push_notification.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(258, 'push_notification.destroy', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(259, 'push_notification.forceDelete', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(260, 'rider_wallet.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(261, 'rider_wallet.credit', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(262, 'rider_wallet.debit', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(263, 'withdraw_request.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(264, 'withdraw_request.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(265, 'withdraw_request.edit', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(266, 'fleet_withdraw_request.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(267, 'fleet_withdraw_request.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(268, 'fleet_withdraw_request.edit', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(269, 'report.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(270, 'report.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(271, 'driver_location.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(272, 'driver_location.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(273, 'cancellation_reason.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(274, 'cancellation_reason.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(275, 'cancellation_reason.edit', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(276, 'cancellation_reason.destroy', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(277, 'cancellation_reason.restore', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(278, 'cancellation_reason.forceDelete', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(279, 'driver_review.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(280, 'driver_review.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(281, 'driver_review.destroy', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(282, 'driver_review.restore', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(283, 'driver_review.forceDelete', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(284, 'rider_review.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(285, 'rider_review.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(286, 'rider_review.destroy', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(287, 'rider_review.restore', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(288, 'rider_review.forceDelete', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(289, 'hourly_package.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(290, 'hourly_package.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(291, 'hourly_package.edit', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(292, 'hourly_package.destroy', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(293, 'hourly_package.restore', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(294, 'hourly_package.forceDelete', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(295, 'sos_alert.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(296, 'sos_alert.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(297, 'sos_alert.edit', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(298, 'sos_alert.destroy', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(299, 'sos_alert.restore', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(300, 'sos_alert.forceDelete', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(301, 'rental_vehicle.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(302, 'rental_vehicle.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(303, 'rental_vehicle.edit', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(304, 'rental_vehicle.destroy', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(305, 'rental_vehicle.restore', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(306, 'rental_vehicle.forceDelete', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(307, 'fleet_manager.index', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(308, 'fleet_manager.create', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(309, 'fleet_manager.edit', 'web', '2025-07-08 18:34:18', '2025-07-08 18:34:18'),
(310, 'fleet_manager.destroy', 'web', '2025-07-08 18:34:19', '2025-07-08 18:34:19'),
(311, 'fleet_manager.restore', 'web', '2025-07-08 18:34:19', '2025-07-08 18:34:19'),
(312, 'fleet_manager.forceDelete', 'web', '2025-07-08 18:34:19', '2025-07-08 18:34:19'),
(313, 'fleet_wallet.index', 'web', '2025-07-08 18:34:19', '2025-07-08 18:34:19'),
(314, 'fleet_wallet.credit', 'web', '2025-07-08 18:34:19', '2025-07-08 18:34:19'),
(315, 'fleet_wallet.debit', 'web', '2025-07-08 18:34:19', '2025-07-08 18:34:19'),
(316, 'chat.index', 'web', '2025-07-08 18:34:19', '2025-07-08 18:34:19'),
(317, 'chat.send', 'web', '2025-07-08 18:34:19', '2025-07-08 18:34:19'),
(318, 'chat.replay', 'web', '2025-07-08 18:34:19', '2025-07-08 18:34:19'),
(319, 'chat.delete', 'web', '2025-07-08 18:34:19', '2025-07-08 18:34:19'),
(320, 'ambulance.index', 'web', '2025-07-08 18:34:19', '2025-07-08 18:34:19'),
(321, 'ticket.ticket.index', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(322, 'ticket.ticket.create', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(323, 'ticket.ticket.reply', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(324, 'ticket.ticket.destroy', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(325, 'ticket.ticket.restore', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(326, 'ticket.ticket.forceDelete', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(327, 'ticket.priority.index', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(328, 'ticket.priority.create', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(329, 'ticket.priority.edit', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(330, 'ticket.priority.destroy', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(331, 'ticket.priority.restore', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(332, 'ticket.priority.forceDelete', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(333, 'ticket.executive.index', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(334, 'ticket.executive.create', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(335, 'ticket.executive.edit', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(336, 'ticket.executive.destroy', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(337, 'ticket.executive.restore', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(338, 'ticket.executive.forceDelete', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(339, 'ticket.department.index', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(340, 'ticket.department.create', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(341, 'ticket.department.edit', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(342, 'ticket.department.show', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(343, 'ticket.department.destroy', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(344, 'ticket.department.restore', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(345, 'ticket.department.forceDelete', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(346, 'ticket.formfield.index', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(347, 'ticket.formfield.create', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(348, 'ticket.formfield.edit', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(349, 'ticket.formfield.destroy', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(350, 'ticket.formfield.restore', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(351, 'ticket.formfield.forceDelete', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(352, 'ticket.status.index', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(353, 'ticket.status.create', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(354, 'ticket.status.edit', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(355, 'ticket.status.destroy', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(356, 'ticket.status.restore', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(357, 'ticket.status.forceDelete', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(358, 'ticket.knowledge.index', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(359, 'ticket.knowledge.create', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(360, 'ticket.knowledge.edit', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(361, 'ticket.knowledge.destroy', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(362, 'ticket.knowledge.restore', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(363, 'ticket.knowledge.forceDelete', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(364, 'ticket.category.index', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(365, 'ticket.category.create', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(366, 'ticket.category.edit', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(367, 'ticket.category.destroy', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(368, 'ticket.tag.index', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(369, 'ticket.tag.create', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(370, 'ticket.tag.edit', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(371, 'ticket.tag.destroy', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(372, 'ticket.tag.restore', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(373, 'ticket.tag.forceDelete', 'web', '2025-07-08 18:34:27', '2025-07-08 18:34:27'),
(374, 'ticket.setting.index', 'web', '2025-07-08 18:34:28', '2025-07-08 18:34:28'),
(375, 'ticket.setting.create', 'web', '2025-07-08 18:34:28', '2025-07-08 18:34:28'),
(376, 'ticket.setting.edit', 'web', '2025-07-08 18:34:28', '2025-07-08 18:34:28'),
(377, 'ticket.setting.destroy', 'web', '2025-07-08 18:34:28', '2025-07-08 18:34:28'),
(378, 'ticket.setting.restore', 'web', '2025-07-08 18:34:28', '2025-07-08 18:34:28'),
(379, 'ticket.setting.forceDelete', 'web', '2025-07-08 18:34:28', '2025-07-08 18:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `role_type`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 16, 'auth_token', 'rider', '15e7aef1e752d402b65773e5615e65b8adcf73f9f595ff253fa00de14664fced', '[\"*\"]', '2025-01-23 01:04:20', NULL, '2025-01-23 00:39:19', '2025-01-23 01:15:22'),
(2, 'App\\Models\\User', 16, 'auth_token', 'rider', '825146819dffcc80aa47472a35c4dc75b59efdbed4e2d788fcf887bc5a372073', '[\"*\"]', '2025-01-23 01:16:31', NULL, '2025-01-23 01:15:22', '2025-01-23 01:16:31'),
(3, 'App\\Models\\User', 43, 'auth_token', 'rider', 'b9a7f856bb76960f1d5f41ec5a257f0d8908975c19df23e23dcecae42175371f', '[\"*\"]', '2025-01-24 05:10:05', NULL, '2025-01-24 05:10:01', '2025-03-20 02:34:08'),
(4, 'App\\Models\\User', 43, 'auth_token', 'rider', 'fda6a89816264b74b26d22812fbef500de9e0cdc874a5a68a0c881d123e56c62', '[\"*\"]', '2025-01-24 08:10:56', NULL, '2025-01-24 05:10:05', '2025-03-20 02:34:08'),
(5, 'App\\Models\\User', 18, 'auth_token', 'driver', '0f6ad70fbf27d440cdd7f5e11c9404110d5c9279383e063c72857c481553fa1c', '[\"*\"]', NULL, NULL, '2025-01-24 05:12:57', '2025-01-30 00:34:05'),
(6, 'App\\Models\\User', 19, 'auth_token', 'driver', '0e5604bd18491926365b37d62140f9b8e97b287c0b77726eb4ea8a66fe7f4706', '[\"*\"]', '2025-01-24 19:31:31', NULL, '2025-01-24 05:41:11', '2025-01-24 19:31:31'),
(7, 'App\\Models\\User', 43, 'auth_token', 'rider', '33945bf3ff57e30351f678eb17aece43dda50f0c28568e27222bce1d1b7620b4', '[\"*\"]', '2025-01-25 03:48:45', NULL, '2025-01-24 19:38:44', '2025-03-20 02:34:08'),
(8, 'App\\Models\\User', 31, 'auth_token', 'driver', '5100474f7a1d9640efb62e9355a7ecd8e61bc168028b36d860170d630a72e5ce', '[\"*\"]', NULL, NULL, '2025-01-24 19:53:23', '2025-03-20 03:24:12'),
(9, 'App\\Models\\User', 31, 'auth_token', 'driver', 'b4a15c4007480eb4f039e281ad398057bdf724063309ae78ff4d617fdbda99b2', '[\"*\"]', NULL, NULL, '2025-01-24 19:53:43', '2025-03-20 03:24:12'),
(10, 'App\\Models\\User', 31, 'auth_token', 'driver', 'fa9e04e8a03af3b96bd6e48bca43c6950417e3c70e610ddd75e9648448a8927c', '[\"*\"]', '2025-01-24 20:51:01', NULL, '2025-01-24 19:53:49', '2025-03-20 03:24:12'),
(11, 'App\\Models\\User', 31, 'auth_token', 'driver', 'abdc6078c7f518eadd1f79edbb8586ba6b35d6fb101bcd5b21c444ce930ae116', '[\"*\"]', '2025-01-25 03:52:23', NULL, '2025-01-24 20:05:36', '2025-03-20 03:24:12'),
(12, 'App\\Models\\User', 43, 'auth_token', 'rider', '728ccae2c53a408d40e076db9fe622eebf15a28d972a4af92d115397bcd0ac2f', '[\"*\"]', '2025-01-27 20:24:34', NULL, '2025-01-27 02:56:34', '2025-03-20 02:34:08'),
(13, 'App\\Models\\User', 31, 'auth_token', 'driver', '8eb0d794f6f287c9e69ef4c2c905c7a9b719efc172898c9f7abf45fd7c0b83ba', '[\"*\"]', NULL, NULL, '2025-01-27 04:13:28', '2025-03-20 03:24:12'),
(14, 'App\\Models\\User', 34, 'auth_token', 'driver', 'c65a3410b188e79dbdccd0c6971dfb146b02f92e1a5da58d499f6a171f966b14', '[\"*\"]', NULL, NULL, '2025-01-27 20:54:57', '2025-01-30 05:53:39'),
(15, 'App\\Models\\User', 34, 'auth_token', 'driver', '81664806025ee1ab2b1b55800951e6c32632c3eb8bee1d2352e1c326b3b42db6', '[\"*\"]', '2025-01-27 20:56:30', NULL, '2025-01-27 20:55:44', '2025-01-30 05:53:39'),
(16, 'App\\Models\\User', 31, 'auth_token', 'driver', 'da95a4992510bdc5bf1c4f3495462d77d2e02d17dc77e09077c997a08432b37e', '[\"*\"]', '2025-01-27 21:02:43', NULL, '2025-01-27 21:02:26', '2025-03-20 03:24:12'),
(17, 'App\\Models\\User', 31, 'auth_token', 'driver', 'cedf740d50e7c7f36036589c4f78fdf8bc20d51b2b5bbb5158ca6944d837c1cf', '[\"*\"]', '2025-01-27 21:16:50', NULL, '2025-01-27 21:04:47', '2025-03-20 03:24:12'),
(18, 'App\\Models\\User', 43, 'auth_token', 'rider', 'f58065f04e616f5c1bc11bf3ce6920fc2094edaeaee175d4a60de052ac1cf7d5', '[\"*\"]', '2025-01-28 03:58:42', NULL, '2025-01-27 21:06:16', '2025-03-20 02:34:08'),
(19, 'App\\Models\\User', 31, 'auth_token', 'driver', 'd6fef0ea0d1641c011090b7e98340795af6b266af604c9b96f8f133791d79f43', '[\"*\"]', '2025-01-28 04:30:31', NULL, '2025-01-27 21:36:03', '2025-03-20 03:24:12'),
(20, 'App\\Models\\User', 43, 'auth_token', 'rider', 'a863756ef225b3065a54bedae1ff6e9f97cfb26db7a086b5d9aa1409cb87f762', '[\"*\"]', '2025-01-28 01:48:27', NULL, '2025-01-28 01:09:06', '2025-03-20 02:34:08'),
(21, 'App\\Models\\User', 36, 'auth_token', 'driver', 'd9cdf3d26241feaf10994e86b9430b726ff0e533bcef2f2d82818781061027f4', '[\"*\"]', '2025-01-28 04:39:01', NULL, '2025-01-28 04:31:19', '2025-01-28 04:39:01'),
(22, 'App\\Models\\User', 43, 'auth_token', 'rider', 'd7ee1cb2bcbf4c6cad620f97423749ba6165e5c173e5b096d6bb2fd04a9b23bf', '[\"*\"]', '2025-01-28 05:00:03', NULL, '2025-01-28 04:34:52', '2025-03-20 02:34:08'),
(23, 'App\\Models\\User', 10, 'auth_token', 'rider', '6b1adfd4463f487f9621c0a54dfbdf511810d9c2778cc7b1eaedf6d928111112', '[\"*\"]', '2025-01-28 22:18:01', NULL, '2025-01-28 22:02:30', '2025-01-29 22:49:39'),
(24, 'App\\Models\\User', 25, 'auth_token', 'driver', '169934580425f684c60956382ffc585f2850438cb0e7f39a8f57b02a87cc0f0c', '[\"*\"]', '2025-01-29 04:05:07', NULL, '2025-01-29 01:11:34', '2025-04-29 06:45:32'),
(25, 'App\\Models\\User', 14, 'auth_token', 'rider', '5c046def99a231bc144876638205a5c9a19d7f64076863b982dc3d4576c471f2', '[\"*\"]', '2025-01-30 00:23:57', NULL, '2025-01-29 01:14:40', '2025-01-30 00:23:57'),
(26, 'App\\Models\\User', 29, 'auth_token', 'driver', 'c8e9522fc8746bd40443a31006a74ba64b2ce15353ba1b4d53af9b4b5090ee6e', '[\"*\"]', '2025-01-29 04:05:42', NULL, '2025-01-29 02:44:52', '2025-01-29 04:05:42'),
(27, 'App\\Models\\User', 40, 'auth_token', 'rider', '7403856a434268ba2d4e7c39c7380b01b849997a25ec72ba70da45ebcddbf897', '[\"*\"]', '2025-01-29 03:36:30', NULL, '2025-01-29 02:46:02', '2025-04-29 06:06:08'),
(28, 'App\\Models\\User', 30, 'auth_token', 'driver', '532b40b9e5e34de5da1774e9e475ca2d9fda905bbcf7095893e334fceb0c0cbb', '[\"*\"]', '2025-01-29 04:35:11', NULL, '2025-01-29 03:25:10', '2025-01-29 04:35:11'),
(29, 'App\\Models\\User', 42, 'auth_token', 'rider', '1fc80e0fe6a78b0d0c0881c1327d2bbc81d025e9a1507a0865c4dab766be8e6c', '[\"*\"]', '2025-01-30 06:48:39', NULL, '2025-01-29 03:39:55', '2025-01-30 06:48:39'),
(30, 'App\\Models\\User', 27, 'auth_token', 'driver', '398a1c0948b51a11d1a030beca5f6871ffc24bb8158167ecdba3d4f780b10b2a', '[\"*\"]', '2025-01-29 23:37:10', NULL, '2025-01-29 04:57:46', '2025-01-29 23:37:10'),
(31, 'App\\Models\\User', 11, 'auth_token', 'rider', '62f0e00da74eb146bc510ae96d4c5d662d3a3ceaac31450726545af54f3bdc49', '[\"*\"]', '2025-01-30 01:00:03', NULL, '2025-01-29 05:35:00', '2025-01-30 01:00:03'),
(32, 'App\\Models\\User', 28, 'auth_token', 'driver', '6c8260897c35aa72d0981375207e3a8e72bffc78bee769a375b57bff75d7a4d4', '[\"*\"]', '2025-01-29 23:51:37', NULL, '2025-01-29 06:25:20', '2025-01-29 23:51:37'),
(33, 'App\\Models\\User', 26, 'auth_token', 'driver', '79bbcf0b603c7b219824fea2d2c6df27cf87cab3b14640009a3cf76e307dba79', '[\"*\"]', '2025-01-29 07:12:31', NULL, '2025-01-29 06:41:49', '2025-01-29 07:12:31'),
(34, 'App\\Models\\User', 10, 'auth_token', 'rider', '99ec4b8abeadf5acd1240adcd0e3dd84712bbb560690e25ce891a21b80bf9fdc', '[\"*\"]', '2025-01-29 23:24:22', NULL, '2025-01-29 22:49:39', '2025-01-29 23:24:22'),
(35, 'App\\Models\\User', 9, 'auth_token', 'rider', 'e76333d206874b360b2747c7e20fe440d9bc8b0df53ca807d4c04b5db5745c9e', '[\"*\"]', '2025-01-30 01:06:20', NULL, '2025-01-29 23:30:24', '2025-02-18 04:16:49'),
(36, 'App\\Models\\User', 37, 'auth_token', 'rider', 'c62bb7315c7c1bed4900dcdf5f1e82764302b9e97ee9d065a091d70954b89880', '[\"*\"]', '2025-01-30 06:37:24', NULL, '2025-01-29 23:46:30', '2025-01-30 06:37:24'),
(37, 'App\\Models\\User', 35, 'auth_token', 'driver', '5fa00107869c9a1a7bbf32a912c8291efebba70e08a8a73802a7d98244f11af4', '[\"*\"]', NULL, NULL, '2025-01-30 00:06:42', '2025-01-30 00:06:42'),
(38, 'App\\Models\\User', 21, 'auth_token', 'driver', '0c8410f0d10fcb2c6067a1550a6058e701452e45cb05b5fb20a6c6d0bb835364', '[\"*\"]', '2025-01-30 01:28:41', NULL, '2025-01-30 00:21:24', '2025-01-30 01:28:41'),
(39, 'App\\Models\\User', 18, 'auth_token', 'driver', 'fdffe05eee08564a8eafb6d8d2e15efc476fe7b2ec11fbbd39dd3a0262afa61f', '[\"*\"]', '2025-01-30 06:46:09', NULL, '2025-01-30 00:34:05', '2025-01-30 06:46:09'),
(40, 'App\\Models\\User', 17, 'auth_token', 'driver', '72c6ce583d6087f3329bf4597cf7897ed9f94bac5bdc35675184cb9213383c2a', '[\"*\"]', '2025-01-30 06:23:12', NULL, '2025-01-30 04:13:41', '2025-01-30 06:23:12'),
(41, 'App\\Models\\User', 6, 'auth_token', 'rider', '3ecb01f2ce781d341fdfe0a873dad3df2847f4d01fdfd8c7421eee48d28638bf', '[\"*\"]', '2025-01-30 04:23:57', NULL, '2025-01-30 04:17:00', '2025-01-30 04:23:57'),
(42, 'App\\Models\\User', 34, 'auth_token', 'driver', '77b3d69ca4d95818ef21bca343b80f6c37e2d48102479d0c31d9c6d7b053a400', '[\"*\"]', NULL, NULL, '2025-01-30 05:53:39', '2025-01-30 05:53:39'),
(43, 'App\\Models\\User', 41, 'auth_token', 'rider', '78ad4e6fa0009685fd04eaac689d1349aaaa61964950faf6670368b0db7335e5', '[\"*\"]', '2025-01-30 06:47:45', NULL, '2025-01-30 05:58:05', '2025-01-30 06:47:45'),
(44, 'App\\Models\\User', 25, 'auth_token', 'driver', 'a4b5839027e9410ae8b94dfb4039044d50b6ca77ed20766fc30f8084e1b33464', '[\"*\"]', '2025-02-18 04:32:58', NULL, '2025-02-18 03:55:47', '2025-04-29 06:45:32'),
(45, 'App\\Models\\User', 9, 'auth_token', 'rider', 'b855545a15ac258fe162797cef704fc915d13edcf00428a7e5834de69c06115e', '[\"*\"]', '2025-02-18 04:29:52', NULL, '2025-02-18 04:16:49', '2025-02-18 04:29:52'),
(46, 'App\\Models\\User', 3, 'auth_token', 'rider', 'cb0bf80bfe1ac82c2e7af314cb38f1bca3ef2e692d6cc792ee82e67484d4179b', '[\"*\"]', '2025-03-07 05:45:47', NULL, '2025-03-07 05:43:19', '2025-04-29 23:31:11'),
(47, 'App\\Models\\User', 3, 'auth_token', 'rider', 'ea40393972a13f4e7a2832e29a7b23453be9d5efd60302e19c8eabcdcc16b504', '[\"*\"]', '2025-03-20 04:33:29', NULL, '2025-03-20 02:22:12', '2025-04-29 23:31:11'),
(48, 'App\\Models\\User', 4, 'auth_token', 'driver', '44bde7c7332bb99b92491881f6b5e8613b6ff2f138495863268ce941c2ee612a', '[\"*\"]', '2025-03-20 02:23:47', NULL, '2025-03-20 02:23:18', '2025-03-20 03:31:29'),
(49, 'App\\Models\\User', 31, 'auth_token', 'driver', 'f51882aea6d26a8c80c2aaefa4111233ef9c4489c4a2f5b0e4d15890e5bf2216', '[\"*\"]', '2025-03-20 02:50:56', NULL, '2025-03-20 02:24:08', '2025-03-20 03:24:12'),
(50, 'App\\Models\\User', 43, 'auth_token', 'rider', 'b5ef6992fd2b0879b30631f3571dec2ae3f2ba9b88c570e87a8faa9ec1a8dccd', '[\"*\"]', NULL, NULL, '2025-03-20 02:33:47', '2025-03-20 02:34:08'),
(51, 'App\\Models\\User', 43, 'auth_token', 'rider', '066d9b6ac34f00120e81fede6af29f2144bda63c72d8c5a0f478749fd2d3bf13', '[\"*\"]', '2025-03-20 02:40:08', NULL, '2025-03-20 02:34:08', '2025-03-20 02:40:08'),
(52, 'App\\Models\\User', 31, 'auth_token', 'driver', '69ea8f3f30f0fe56ebb3097d57888952c566b94240bc877152e1fcc0c072dfca', '[\"*\"]', '2025-03-20 03:31:21', NULL, '2025-03-20 03:24:12', '2025-03-20 03:31:21'),
(53, 'App\\Models\\User', 4, 'auth_token', 'driver', '5e2170312753ff1f8a98fedaa874ce387de69cbe4cb945f5d22c31216fa077c5', '[\"*\"]', '2025-03-20 03:32:56', NULL, '2025-03-20 03:31:29', '2025-03-20 03:32:56'),
(54, 'App\\Models\\User', 25, 'auth_token', 'driver', '4cf9aa8eb758f3dc74926b4fa318dfbae478a665caaea3698aadbc27d6d31770', '[\"*\"]', '2025-03-20 04:22:58', NULL, '2025-03-20 03:35:16', '2025-04-29 06:45:32'),
(55, 'App\\Models\\User', 25, 'auth_token', 'driver', 'da00d75a13fac535342bc8c593a8122f07d7950a0379f11c47178e88e2f5259d', '[\"*\"]', '2025-03-20 05:20:14', NULL, '2025-03-20 05:15:42', '2025-04-29 06:45:32'),
(56, 'App\\Models\\User', 3, 'auth_token', 'rider', '7ad29828d9046796c7b3f49dbd5b4692ad2b3b7058c149879036a148b229b055', '[\"*\"]', '2025-03-20 05:39:39', NULL, '2025-03-20 05:37:40', '2025-04-29 23:31:11'),
(57, 'App\\Models\\User', 3, 'auth_token', 'rider', 'f8cd1c8da38c5c4c764a73408795042880d7597fafe6369152717f58234d083a', '[\"*\"]', '2025-04-28 05:29:41', NULL, '2025-04-28 04:55:17', '2025-04-29 23:31:11'),
(58, 'App\\Models\\User', 40, 'auth_token', 'rider', '5212077837084d49d8d34b782b7801c6618f1c38b56d9eec1927e1077d05c0ac', '[\"*\"]', '2025-04-29 07:05:46', NULL, '2025-04-29 06:06:08', '2025-04-29 07:05:46'),
(59, 'App\\Models\\User', 3, 'auth_token', 'rider', '36ac4cbfae00d402a94e0ad16fde0aa269bc2abed6b3e86f718be9c8dd0ea183', '[\"*\"]', '2025-04-29 07:04:23', NULL, '2025-04-29 06:44:52', '2025-04-29 23:31:11'),
(60, 'App\\Models\\User', 25, 'auth_token', 'driver', 'e1c4f61a8ba41b76d02c1627ef8cc77992f4a9d4a3f4343eaf833c9f3051d268', '[\"*\"]', '2025-04-29 07:46:31', NULL, '2025-04-29 06:45:32', '2025-04-29 07:46:31'),
(61, 'App\\Models\\User', 3, 'auth_token', 'rider', '1dc96f59721569dd9825012f143c022d829dbda51e0ca2b7661ccf6bc3ca453c', '[\"*\"]', '2025-04-29 23:41:45', NULL, '2025-04-29 23:31:11', '2025-04-29 23:41:45'),
(62, 'App\\Models\\User', 66, 'auth_token', 'driver', '88cf01fe3f3136ff8d2372038fecfcf1c8a0f19188aa3d76c3deb87678d631d5', '[\"*\"]', '2025-04-29 23:32:39', NULL, '2025-04-29 23:31:27', '2025-04-29 23:32:39'),
(63, 'App\\Models\\User', 65, 'auth_token', 'driver', '5635fd4e7662efea9b22a588104337221681c9e336beb2f2c965e6eae9acd079', '[\"*\"]', '2025-04-29 23:42:23', NULL, '2025-04-29 23:42:11', '2025-04-29 23:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` enum('daily','weekly','monthly','yearly') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'monthly',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` int DEFAULT '1',
  `created_by_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `duration`, `description`, `price`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"Standard Ride Plan\"}', 'monthly', '{\"en\":[\"Affordable city travel for short distances.\",\"Comfortable ride within the city limits.\"]}', 150.00, 1, 1, '2025-01-23 05:20:17', '2025-01-23 05:29:01', NULL),
(2, '{\"en\":\"Intercity Ride Plan\"}', 'yearly', '{\"en\":[\"Travel between cities with door-to-door service.\",\"Comfort and reliability for long-distance journeys.\",\"Fixed pricing for intercity travel.\"]}', 5500.00, 1, 1, '2025-01-23 05:23:12', '2025-01-23 05:30:06', NULL),
(3, '{\"en\":\"Premium Ride Plan\"}', 'monthly', '{\"en\":[\"Luxury ride with premium comfort and amenities.\",\"Indulge in top-tier service with every ride.\"]}', 600.00, 1, 1, '2025-01-23 05:31:03', '2025-01-23 05:31:03', NULL),
(4, '{\"en\":\"Weekend Package Plan\"}', 'yearly', '{\"en\":[\"Round-trip intercity ride for a weekend getaway.\",\"Flexible departure and return time for your convenience.\",\"Explore new destinations with ease and comfort.\"]}', 9000.00, 1, 1, '2025-01-23 05:31:56', '2025-01-23 05:31:56', NULL),
(5, '{\"en\":\"Rental Plan\"}', 'monthly', '{\"en\":[\"Rent a car for up to 8 hours with unlimited mileage.\",\"Flexible rental for personal use.\",\"Ideal for day trips or city exploration.\"]}', 1000.00, 1, 1, '2025-01-23 05:32:53', '2025-01-23 05:32:53', NULL),
(6, '{\"en\":\"Scheduled Ride Plan\"}', 'monthly', '{\"en\":[\"Pre-book your ride for a specific time slot.\",\"Guaranteed availability when you need it most.\"]}', 250.00, 1, 1, '2025-01-23 05:33:34', '2025-01-23 05:33:34', NULL),
(7, '{\"en\":\"Package Ride Plan\"}', 'monthly', '{\"en\":[\"Fast delivery of small packages within the city.\",\"Secure transport for parcels to any location.\"]}', 120.00, 1, 1, '2025-01-23 05:34:52', '2025-01-23 05:34:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `plan_service_categories`
--

CREATE TABLE `plan_service_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED NOT NULL,
  `service_category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_service_categories`
--

INSERT INTO `plan_service_categories` (`id`, `plan_id`, `service_category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 2, 1, NULL, NULL, NULL),
(3, 2, 2, NULL, NULL, NULL),
(4, 3, 1, NULL, NULL, NULL),
(5, 3, 5, NULL, NULL, NULL),
(6, 4, 1, NULL, NULL, NULL),
(7, 4, 2, NULL, NULL, NULL),
(8, 4, 3, NULL, NULL, NULL),
(9, 5, 5, NULL, NULL, NULL),
(10, 6, 1, NULL, NULL, NULL),
(11, 6, 4, NULL, NULL, NULL),
(12, 7, 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `slug` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `thumbnail_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `version` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `name`, `description`, `status`, `slug`, `thumbnail_url`, `version`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Taxido', 'A cab booking management platform enabling ride management for users and drivers.', 1, 'taxido', NULL, NULL, '2025-01-22 23:43:06', '2025-07-22 08:25:49', NULL),
(2, 'Ticket', 'Ticket Support for tracking and resolving user support requests.', 1, 'ticket', NULL, NULL, '2025-01-22 23:43:08', '2025-07-22 08:25:49', NULL),
(3, 'Alphanet', 'Alphanet is a digital payment platform for secure online transactions and services.', 1, 'alphanet', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 08:25:49', NULL),
(4, 'CCAvenue', 'Enables businesses to process payments with CCAvenue, a trusted payment gateway for India.', 1, 'ccavenue', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 14:16:57', NULL),
(5, 'Firebase', 'Firebase is a platform for building and managing mobile and web applications.', 1, 'firebase', NULL, NULL, '2025-01-22 23:43:19', '2025-05-15 01:50:32', NULL),
(6, 'FlutterWave', 'Integrate Flutterwave to support payment processing across Africa with multiple currencies and methods.', 1, 'flutterwave', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 14:16:57', NULL),
(7, 'Instamojo', 'Instamojo is a payment platform that simplifies online payments for businesses and entrepreneurs.', 1, 'instamojo', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 08:25:49', NULL),
(8, 'Iyzico', 'Iyzico is a payment gateway providing secure online payment solutions for businesses in Turkey and beyond.', 1, 'iyzico', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 14:16:57', NULL),
(9, 'Midtrans', 'Midtrans is a payment gateway that provides businesses in Southeast Asia with reliable and secure online payment processing.', 1, 'midtrans', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 08:25:49', NULL),
(10, 'Mollie', 'Mollie is a payment gateway that enables businesses to accept online payments easily', 1, 'mollie', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 14:16:57', NULL),
(11, 'Msg91', 'MSG91 is a messaging platform for SMS, email, and voice communication services.', 1, 'msg91', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 08:25:49', NULL),
(12, 'Nexmo', 'Nexmo is a cloud communication platform for SMS, voice, and messaging services.', 1, 'nexmo', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 14:16:57', NULL),
(13, 'PayPal', 'PayPal is a secure online payment platform for global transactions and money transfers.', 1, 'paypal', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 14:16:57', NULL),
(14, 'Paystack', 'Paystack is an online payment solution that helps businesses accept and manage payments', 1, 'paystack', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 14:16:57', NULL),
(15, 'PhonePe', 'PhonePe is a digital payment platform for UPI-based transactions and mobile payments.', 1, 'phonepe', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 14:16:57', NULL),
(16, 'RazorPay', 'Razorpay is a payment gateway that simplifies online payments for businesses and customers.', 1, 'razorpay', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 14:16:57', NULL),
(17, 'Sslcommerz', 'SSLCommerz is a payment gateway that offers secure and seamless online payment solutions.', 1, 'sslcommerz', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 14:16:57', NULL),
(18, 'Stripe', 'Stripe enables secure online payments, supporting cards, wallets, and global transactions.', 1, 'stripe', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 08:25:49', NULL),
(19, 'Twilio', 'Twilio is a cloud communications platform that enables businesses to integrate messaging, voice, and video capabilities into applications.', 1, 'twilio', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 08:25:49', NULL),
(20, 'TwoFactor', 'TwoFactor is a security service that provides two-factor authentication for enhanced online account protection.', 1, 'twofactor', NULL, NULL, '2025-01-22 23:43:19', '2025-07-22 14:16:57', NULL),
(21, 'BKash', '', 1, 'bkash', NULL, NULL, '2025-03-06 05:48:54', '2025-07-22 08:25:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE `priorities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_value_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resolve_in` int NOT NULL,
  `resolve_value_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `system_reserve` int NOT NULL DEFAULT '0',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`id`, `name`, `slug`, `color`, `response_in`, `response_value_in`, `resolve_in`, `resolve_value_in`, `status`, `system_reserve`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"High\"}', 'high', 'danger', '30', 'minute', 180, 'minute', 1, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(2, '{\"en\":\"Medium\"}', 'medium', 'secondary', '2', 'hour', 3, 'hour', 1, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(3, '{\"en\":\"Low\"}', 'low', 'primary', '1', 'week', 1, 'week', 1, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(4, '{\"en\":\"Urgent\"}', 'urgent', 'danger', '15', 'minute', 60, 'minute', 1, 0, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(5, '{\"en\":\"Critical\"}', 'critical', 'danger', '10', 'minute', 30, 'minute', 1, 0, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(6, '{\"en\":\"High Priority\"}', 'high-priority', 'warning', '1', 'hour', 2, 'hour', 1, 0, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(7, '{\"en\":\"Medium Priority\"}', 'medium-priority', 'info', '3', 'hour', 6, 'hour', 1, 0, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `push_notifications`
--

CREATE TABLE `push_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `push_notification_templates`
--

CREATE TABLE `push_notification_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `push_notification_templates`
--

INSERT INTO `push_notification_templates` (`id`, `title`, `slug`, `content`, `url`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"New Ride Assignment \\ud83d\\ude97\",\"ar\":null,\"fr\":null}', 'create-ride-driver', '{\"en\":\"{{driver_name}}, you\'ve been assigned Ride #{{ride_number}} ({{service_category}}). Pick up {{rider_name}} for a {{distance}}{{distance_unit}} trip. Fare: {{fare_amount}}\\\"\",\"ar\":null,\"fr\":null}', '{\"en\":null,\"ar\":null,\"fr\":null}', NULL, '2025-06-01 13:38:04', '2025-06-01 13:38:04'),
(2, '{\"en\":\"\\\"New Ride Created #{{ride_number}}\",\"ar\":null,\"fr\":null}', 'create-ride-admin', '{\"en\":\"{rider_name}} booked {{service_category}} ({{vehicle_type}}). Driver: {{driver_name}}. {{distance}}{{distance_unit}} for {{fare_amount}}\",\"ar\":null,\"fr\":null}', '{\"en\":null,\"ar\":null,\"fr\":null}', NULL, '2025-06-01 13:42:33', '2025-06-01 13:42:33'),
(3, '{\"en\":\"Withdrawal Request Update\",\"ar\":null,\"fr\":null}', 'update-withdraw-request-driver', '{\"en\":\"Hello {{driver_name}}, your withdrawal request of {{amount}} has been updated. Current status: {{status}}.\",\"ar\":null,\"fr\":null}', '{\"en\":null,\"ar\":null,\"fr\":null}', NULL, '2025-06-01 14:01:03', '2025-06-01 14:01:03'),
(4, '{\"en\":\"Document Status Updated\",\"ar\":null,\"fr\":null}', 'driver-document-status-update', '{\"en\":\"Hello {{{driver_name}}, your document \\\"{{document_name}}\\\" has been {{status}}. Please check your profile for details.\",\"ar\":null,\"fr\":null}', '{\"en\":null,\"ar\":null,\"fr\":null}', NULL, '2025-06-01 14:02:00', '2025-06-01 14:02:00'),
(5, '{\"en\":\"Bid Status Update\",\"ar\":null,\"fr\":null}', 'bid-status-driver', '{\"en\":\"Hello {{driver_name}}, your bid on ride {{ride_number}} with {{rider_name}} has been {{bid_status}} by {{company_name}}.\",\"ar\":null,\"fr\":null}', '{\"en\":null,\"ar\":null,\"fr\":null}', NULL, '2025-06-01 14:03:41', '2025-06-01 14:03:41'),
(6, '{\"en\":\"New Ride Request Received\",\"ar\":null,\"fr\":null}', 'ride-request-driver', '{\"en\":\"Hi {{driver_name}}, a new ride request has been assigned to you by {{rider_name}} ({{rider_phone}}).  \\r\\nRoute: {{locations}}  \\r\\nService Type: {{services}} - {{service_category}}  \\r\\nVehicle: {{vehicle_type}}  \\r\\nFare Estimate: {{fare_amount}}  \\r\\nTrip Distance: {{distance}} {{distance_unit}}  \\r\\nKindly review and accept the request as soon as possible.\",\"ar\":null,\"fr\":null}', '{\"en\":null,\"ar\":null,\"fr\":null}', NULL, '2025-06-01 14:13:57', '2025-06-01 14:13:57'),
(7, '{\"en\":\"Withdraw Request Created\",\"ar\":null,\"fr\":null}', 'create-withdraw-request-admin', '{\"en\":\"Hello {{driver_name}}, a new withdrawal request of {{amount}} has been created on your behalf by the admin.\",\"ar\":null,\"fr\":null}', '{\"en\":null,\"ar\":null,\"fr\":null}', NULL, '2025-06-01 14:15:16', '2025-06-01 14:15:16');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint UNSIGNED NOT NULL,
  `ticket_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rental_vehicles`
--

CREATE TABLE `rental_vehicles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `zone_id` int DEFAULT NULL,
  `commission_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_rate` double DEFAULT NULL,
  `vehicle_type_id` bigint UNSIGNED NOT NULL,
  `normal_image_id` bigint UNSIGNED DEFAULT NULL,
  `front_view_id` bigint UNSIGNED DEFAULT NULL,
  `side_view_id` bigint UNSIGNED DEFAULT NULL,
  `boot_view_id` bigint UNSIGNED DEFAULT NULL,
  `interior_image_id` bigint UNSIGNED DEFAULT NULL,
  `vehicle_per_day_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `allow_with_driver` int DEFAULT '1',
  `driver_per_day_charge` decimal(8,2) DEFAULT '0.00',
  `vehicle_subtype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fuel_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gear_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_speed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mileage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interior` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `status` bigint UNSIGNED DEFAULT '1',
  `is_ac` bigint UNSIGNED DEFAULT '1',
  `bag_count` bigint UNSIGNED NOT NULL DEFAULT '0',
  `verified_status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `registration_no` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `registration_image_id` bigint UNSIGNED DEFAULT NULL,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rental_vehicles`
--

INSERT INTO `rental_vehicles` (`id`, `name`, `description`, `zone_id`, `commission_type`, `commission_rate`, `vehicle_type_id`, `normal_image_id`, `front_view_id`, `side_view_id`, `boot_view_id`, `interior_image_id`, `vehicle_per_day_price`, `allow_with_driver`, `driver_per_day_charge`, `vehicle_subtype`, `fuel_type`, `gear_type`, `vehicle_speed`, `mileage`, `interior`, `driver_id`, `status`, `is_ac`, `bag_count`, `verified_status`, `registration_no`, `registration_image_id`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"Hyundai Verna\"}', '{\"en\":\"The Verna is a good option for those who want the ease of driving, futuristic, and a feature-packed sedan. Highlights include the cabin experience, practicality, comfort, and boot space. However, the turbo engine is certainly not a perfect pick, it does offer an attractive combination of executive comfort and driving joy.\"}', NULL, NULL, NULL, 4, 396, 394, 398, 390, 392, 80.00, 1, 20.00, 'Sedan', 'Petrol', 'Manual / Automatic', '120 km/h', '18.6 - 20.6 kmpl', 'Air Purifier,Sunroof,Cup Holders,Powered driver seat,Heated and ventilated seats', 21, 1, 1, 0, 'approved', 'GH6734FF', 400, 1, '2025-01-24 00:50:00', '2025-01-24 01:32:16', NULL),
(2, '{\"en\":\"Maruti Dzire\"}', '{\"en\":\"The Maruti Dzire is a subcompact sedan that offers comfort and practicality of a sedan at the price of a hatchback. The Dzire 2024 features a new Z-series petrol engine, which is borrowed from the Swift, and it is also available with an optional CNG powertrain. Since its launch, the Dzire has been the top-selling subcompact sedan in India.\"}', NULL, NULL, NULL, 4, 338, 334, 332, 336, 331, 50.00, 1, 20.00, 'Sedan', 'Petrol / CNG', 'Manual / Automatic', '100 km/h', '24.79 - 25.71 kmpl', 'Parking Sensors,Cup Holders,Rear AC Vents,360-degree camera,9-inch touchscreen', 17, 1, 1, 0, 'approved', 'MH01CD5678', 400, 1, '2025-01-24 01:19:09', '2025-01-24 01:19:09', NULL),
(3, '{\"en\":\"Hyundai Aura\"}', '{\"en\":\"The Hyundai Aura is an entry-level, subcompact sedan that offers a good blend of comfort and convenience features while being equipped with the necessary safety kit. It comes with a petrol engine which can be paired with both manual and automatic options, and also gets a choice of a factory-fitted CNG kit.\"}', NULL, NULL, NULL, 4, 341, 342, 345, 348, 346, 35.00, 1, 20.00, 'CNG,Sedan', 'Petrol', 'Manual', '100 km/h', '65 Litres', 'Wireless Charger,Android Auto/Apple CarPlay,Automatic Climate Control,Parking Sensors,Engine Start/Stop Button', 18, 1, 1, 0, 'approved', 'KA03EF9123', 400, 1, '2025-01-24 01:24:30', '2025-01-24 01:24:30', NULL),
(4, '{\"en\":\"Honda City\"}', '{\"en\":\"The Honda City has a striking exterior that gives it quite a sporty look, while its interior has an elegant look and has best-in-segment quality. Both the cabin and the ride offered by the car are comfortable, with the knee room of rear seats similar to the cars in the segments above.\"}', NULL, NULL, NULL, 4, 358, 350, 357, 354, 352, 30.00, 1, 20.00, 'Sedan', 'Petrol', 'Manual / Automatic', '80 km/h', '17.8 - 18.4 kmpl', 'Height Adjustable Driver Seat,Tyre Pressure Monitor,Wireless Charger,Android Auto/Apple CarPlay,Voice Commands', 19, 1, 1, 0, 'approved', 'GH6734FF', 400, 1, '2025-01-24 01:31:40', '2025-01-24 01:31:40', NULL),
(5, '{\"en\":\"Tata Tigor\"}', '{\"en\":\"The Tata Tigor is an entry-level sedan that has been refreshed with several updates over the years. The sub-4m sedan stands out for its safety features and offers everything you\'d expect at its price point. It comes with multiple powertrain options including petrol, CNG and even an EV version, with an AMT automatic option available for the CNG variants as well.\"}', NULL, NULL, NULL, 4, 362, 364, 360, 366, 368, 30.00, 1, 15.00, 'Sedan', 'CNG / Petrol', 'Manual / Automatic', '100 km/h', '15 km/ltr', '8-speaker sound system,Advanced Internet Features,Parking Sensors,Engine Start/Stop Button,Automatic Climate Control', 23, 1, 1, 0, 'approved', 'GJ05AB1234', 400, 1, '2025-01-24 01:46:33', '2025-01-24 01:46:33', NULL),
(6, '{\"en\":\"Honda Amaze\"}', '{\"en\":\"The Honda Amaze is a subcompact sedan that combines Honda\'s trusted brand value with elegant design, inside and out. Powered by a 90 PS 1.2-litre naturally aspirated petrol engine, it stands as the most powerful car in its segment. The Amaze is the only subcompact sedan in India equipped with ADAS.\"}', NULL, NULL, NULL, 4, 375, 374, 370, 376, 378, 35.00, 1, 12.00, 'Sedan', 'Petrol', 'Manual / Automatic', '80 km/h', '18.65 - 19.46 kmpl', 'Rear AC Vents,Engine Start/Stop Button,Cup Holders,Parking Sensors,Advanced Internet Features', 21, 1, 1, 0, 'approved', 'DL05GH1234', 400, 1, '2025-01-24 01:51:00', '2025-01-24 01:51:00', NULL),
(7, '{\"en\":\"Maruti Ciaz\"}', '{\"en\":\"The Maruti Ciaz is a compact sedan that is known for its affordability and comfort. It has a claimed mileage of up to 20.65 kmpl which also makes it a great choice for buyers seeking fuel efficiency. It offers good space for five passengers and makes for a practical, comfortable and value-for-money city car.\"}', NULL, NULL, NULL, 4, 388, 385, 384, 386, 380, 56.00, 1, 20.00, 'Sedan', 'Petrol', 'Manual / Automatic', '80 km/h', '20.04 - 20.65 kmpl', 'Rear AC Vents,Air Purifier,Voice Commands,multi-info display,LED projector headlamps', 23, 1, 1, 0, 'approved', 'TN07HI5678', 400, 1, '2025-01-24 01:54:57', '2025-01-24 01:54:57', NULL),
(8, '{\"en\":\"Maruti Swift\"}', '{\"en\":\"The Maruti Swift is a midsize hatchback in India which offers a good balance of features, performance, and fuel efficiency. It is available with Suzuki’s new 1.2-litre Z series 3- cylinder petrol engine in both 5-speed manual or 5-speed AMT transmission. The Swift is now also available in CNG offering a claimed fuel efficiency of 32.85 km/kg.\"}', NULL, NULL, NULL, 3, 412, 410, 414, 418, 416, 37.00, 1, 12.00, 'Sedan', 'CNG / Petrol', 'Manual / Automatic', '80 km/h', '24.8 - 25.75 kmpl', 'Engine Start/Stop Button,Rear AC Vents,Rear Camera,9-inch touchscreen,9-inch touchscreen', 34, 1, 1, 0, 'approved', 'DL05GH1234', 400, 1, '2025-01-24 02:11:46', '2025-01-24 02:11:46', NULL),
(9, '{\"en\":\"Maruti Baleno\"}', '{\"en\":\"The current-spec facelifted Baleno has added a lot of modern styling elements and features like a 360-degree camera and a head-up display (HUD). The ride quality is also improved in comparison to the pre-facelift model. The comfortable seats, the smooth engine, along with the pricing it comes at, make the Baleno a choiceable option for individuals and small families.\"}', NULL, NULL, NULL, 3, 426, 422, 425, 428, 420, 45.00, 1, 20.00, 'hatchback', 'Petrol / CNG', 'Manual / Automatic', '80 km/h', '22.35 - 22.94 kmpl', '360 Degree Camera,Heads-up Display,9-inch SmartPlay Pro Infotainment System,Android Auto/Apple CarPlay', 33, 1, 1, 0, 'approved', 'GJ05AB1234', 400, 1, '2025-01-24 02:18:08', '2025-01-24 02:18:08', NULL),
(10, '{\"en\":\"Tata Tiago\"}', '{\"en\":\"The Tata Tiago presents a compelling option for those in the market for a budget-friendly hatchback. With its new CNG AMT variants, a variety of features, and good fuel efficiency\"}', NULL, NULL, NULL, 3, 435, 438, 436, 430, 432, 23.00, 1, 15.00, 'hatchback', 'CNG / Petrol', 'Manual / Automatic', '80 km/h', '19 - 20.09 kmpl', 'Keyless Entry,Air Conditioner,Android Auto/Apple CarPlay,Rear Camera,Power Windows', 32, 1, 1, 0, 'approved', 'DL05GH1234', 400, 1, '2025-01-24 02:30:38', '2025-01-24 02:30:38', NULL),
(11, '{\"en\":\"Citroen C3\"}', '{\"en\":\"Passenger safety is taken care of by up to six airbags, ABS with EBD, and a rear camera with parking sensors. The turbo variants of the C3 also get electronic stability program (ESP), hill-hold assist, and a tyre pressure monitoring system (TPMS).\"}', NULL, NULL, NULL, 3, 446, 448, 444, 440, 442, 32.00, 1, 12.00, 'hatchback', 'CNG / Petrol', 'Automatic / Manual', '80 km/h', '19.3 kmpl', 'Practical storage spaces,Mobile dock with wire organizer,10.25-inch infotainment screen', 31, 1, 1, 0, 'approved', 'DL05GH1234', 400, 1, '2025-01-24 02:37:07', '2025-01-24 02:37:07', NULL),
(12, '{\"en\":\"Maruti Ignis\"}', '{\"en\":\"The Maruti Suzuki Ignis is a comfortable, spacious and feature-loaded hatchback for a small family. Though, the interior lacks the finesse in quality, it\'s a practical and efficient car that stands out in a crowd too.\"}', NULL, NULL, NULL, 3, 460, 468, 466, 464, 462, 36.00, 1, 10.00, 'hatchback', 'Petrol', 'Manual / Automatic', '80 km/h', '20.89 kmpl', 'Power Windows,Dual airbags,roof wraps,LED projector headlamps', 30, 1, 1, 0, 'approved', 'DL05GH1234', 400, 1, '2025-01-24 02:47:14', '2025-01-24 02:47:14', NULL),
(13, '{\"en\":\"Maruti Wagon R\"}', '{\"en\":\"Maruti Wagon R has features such as 7-inch infotainment, a 4-speaker sound system, steering-mounted audio controls and remote keyless entry.\"}', NULL, NULL, NULL, 3, 472, 474, 478, 476, 470, 26.00, 1, 20.00, 'hatchback', 'Petrol / CNG', 'Manual / Automatic', '75 km/h', '23.56 - 25.19 kmpl', 'Keyless Entry,Bluetooth Connectivity,Bluetooth Connectivity', 28, 1, 1, 0, 'approved', 'GJ05AB1234', 400, 1, '2025-01-24 02:54:31', '2025-01-24 02:54:31', NULL),
(14, '{\"en\":\"Honda Shine\"}', '{\"en\":\"The Honda Shine 125 comes equipped with a silent start system, side stand engine cut-off, an engine kill switch and alloy wheels. The dual pod analogue instrument console of the Honda Shine includes a speedometer, odometer, fuel gauge, and tell-tale lights.\"}', NULL, NULL, NULL, 1, 490, 492, 498, 554, 556, 22.00, 1, 10.00, 'bike', 'Petrol', 'Manual', '45 km/h', '55 kmpl', 'Engine Combi Brake System,Odometer Analogue,Fuel gauge', 29, 1, 1, 0, 'approved', 'DL05GH1234', 400, 1, '2025-01-24 03:16:49', '2025-01-24 03:16:49', NULL),
(15, '{\"en\":\"Honda Activa 125\"}', '{\"en\":\"The 2025 Honda Activa 125 gets a new headlight and tons of features with the addition of a new 4.2-inch TFT display making it a great choice for a family oriented scooter.\"}', NULL, NULL, NULL, 1, 526, 528, 522, 524, 520, 12.00, 1, 7.00, 'bike', 'Petrol', 'Automatic', '60 km/h', '19 km/ltr', 'Seat Opening Switch,Speedometer Digital,Odometer Digital,External Fuel Filling', 26, 1, 1, 0, 'approved', 'KA03EF9123', 400, 1, '2025-01-24 03:20:30', '2025-01-24 03:20:30', NULL),
(16, '{\"en\":\"TVS Raider\"}', '{\"en\":\"TVS Raider stands out in the 125cc segment with its sporty design, advanced features, and reliable performance. Ideal for city riding. It gets a fully digital instrument cluster, and segment-first under-seat storage. The Raider 125 combines style, comfort, and efficiency, making it a top choice in its class.\"}', NULL, NULL, NULL, 1, 500, 508, 502, 506, 504, 17.00, 1, 5.00, 'bike', 'Petrol', 'Manual', '60 km/h', '15 km/ltr', 'Engine Synchronized Braking System,DRLs,Tripmeter Digital', 25, 1, 1, 0, 'approved', 'GJ05AB1234', 400, 1, '2025-01-24 03:23:12', '2025-01-24 03:23:12', NULL),
(17, '{\"en\":\"Honda SP125\"}', '{\"en\":\"The Honda SP125 is a sporty 125cc commuter from the Japanese manufacturer which now gets improved styling and an extensive features list for the 2025 iteration.\"}', NULL, NULL, NULL, 1, 556, 551, 558, 554, 552, 18.00, 1, 7.00, 'bike', 'Petrol', 'Manual', '50 km/h', '19 km/ltr', 'Navigation,Mobile Connectivity Bluetooth,Odometer Digital', 20, 1, 1, 0, 'approved', 'MH01CD5678', 400, 1, '2025-01-24 03:27:31', '2025-01-24 03:27:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rental_vehicle_zones`
--

CREATE TABLE `rental_vehicle_zones` (
  `id` bigint UNSIGNED NOT NULL,
  `rental_vehicle_id` bigint UNSIGNED NOT NULL,
  `zone_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rental_vehicle_zones`
--

INSERT INTO `rental_vehicle_zones` (`id`, `rental_vehicle_id`, `zone_id`) VALUES
(1, 14, 1),
(2, 15, 1),
(3, 16, 1),
(4, 17, 1),
(5, 8, 1),
(6, 9, 1),
(7, 10, 1),
(8, 11, 1),
(9, 12, 1),
(10, 13, 1),
(11, 1, 1),
(12, 2, 1),
(13, 3, 1),
(14, 4, 1),
(15, 5, 1),
(16, 6, 1),
(17, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rider_reviews`
--

CREATE TABLE `rider_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `ride_id` bigint UNSIGNED DEFAULT NULL,
  `rider_id` bigint UNSIGNED DEFAULT NULL,
  `service_id` bigint UNSIGNED DEFAULT NULL,
  `service_category_id` bigint UNSIGNED DEFAULT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rating` decimal(8,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rider_reviews`
--

INSERT INTO `rider_reviews` (`id`, `ride_id`, `rider_id`, `service_id`, `service_category_id`, `driver_id`, `message`, `rating`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 8, 10, 2, 2, 28, 'Outstanding driver! Arrived on time, handled the parcel with care, and ensured it was delivered safely and promptly. Highly reliable!', 5.00, '2025-01-29 23:24:22', '2025-01-29 23:24:22', NULL),
(2, 12, 9, 1, 5, 18, 'Fantastic provider! The car was in excellent condition, clean, and ready for the rental. Clear instructions and very accommodating. Would rent again!', 4.00, '2025-01-30 01:06:21', '2025-01-30 01:06:21', NULL),
(3, 13, 37, 1, 1, 21, 'Excellent driver! Punctual, friendly, and made the ride comfortable. Would definitely recommend!', 5.00, '2025-01-30 02:05:30', '2025-01-30 02:05:30', NULL),
(4, 25, 3, 1, 1, 25, 'Nice drive 😄', 5.00, '2025-03-20 04:21:38', '2025-03-20 04:21:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rider_wallets`
--

CREATE TABLE `rider_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `rider_id` bigint UNSIGNED DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rider_wallets`
--

INSERT INTO `rider_wallets` (`id`, `rider_id`, `balance`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 16, 0.00, '2025-01-23 00:39:19', '2025-01-23 00:39:19', NULL),
(2, 6, 150.00, '2025-01-23 20:42:44', '2025-01-23 20:42:54', NULL),
(3, 12, 0.00, '2025-01-23 20:43:01', '2025-01-23 20:43:01', NULL),
(4, 38, 371.00, '2025-01-23 20:43:05', '2025-01-23 20:45:16', NULL),
(5, 3, 665.00, '2025-01-24 04:38:21', '2025-04-30 00:39:19', NULL),
(6, 43, 500.00, '2025-01-24 06:02:19', '2025-01-25 01:47:13', NULL),
(7, 14, 0.00, '2025-01-24 20:11:34', '2025-01-24 20:11:34', NULL),
(8, 13, 0.00, '2025-01-24 20:11:47', '2025-01-24 20:11:47', NULL),
(9, 8, 0.00, '2025-01-24 20:11:57', '2025-01-24 20:11:57', NULL),
(10, 15, 0.00, '2025-01-24 20:12:12', '2025-01-24 20:12:12', NULL),
(11, 37, 0.00, '2025-01-24 20:12:19', '2025-01-24 20:12:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rider_wallet_histories`
--

CREATE TABLE `rider_wallet_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `rider_wallet_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `type` enum('credit','debit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rider_wallet_histories`
--

INSERT INTO `rider_wallet_histories` (`id`, `rider_wallet_id`, `order_id`, `amount`, `type`, `detail`, `transaction_id`, `from_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, NULL, 150.00, 'credit', 'Admin has credited the balance.', NULL, NULL, '2025-01-23 20:42:54', '2025-01-23 20:42:54', NULL),
(2, 4, NULL, 520.00, 'credit', 'Admin has credited the balance.', NULL, NULL, '2025-01-23 20:43:12', '2025-01-23 20:43:12', NULL),
(3, 4, NULL, 230.00, 'debit', 'Admin debited the balance due to a refund for a canceled ride.', NULL, NULL, '2025-01-23 20:44:14', '2025-01-23 20:44:14', NULL),
(4, 4, NULL, 55.00, 'credit', 'Admin credited the balance as a promotional reward for first-time booking.', NULL, NULL, '2025-01-23 20:44:44', '2025-01-23 20:44:44', NULL),
(5, 4, NULL, 26.00, 'credit', 'Admin has credited the balance.', NULL, NULL, '2025-01-23 20:45:16', '2025-01-23 20:45:16', NULL),
(6, 6, NULL, 500.00, 'credit', 'Topup wallet balance.', NULL, NULL, '2025-01-25 01:47:13', '2025-01-25 01:47:13', NULL),
(7, 5, NULL, 100.00, 'credit', 'Admin has credited the balance.', NULL, NULL, '2025-04-30 00:35:23', '2025-04-30 00:35:23', NULL),
(8, 5, NULL, 500.00, 'credit', 'Bonus to Rider', NULL, NULL, '2025-04-30 00:38:44', '2025-04-30 00:38:44', NULL),
(9, 5, NULL, 80.00, 'credit', 'Admin has credited the balance.', NULL, NULL, '2025-04-30 00:39:05', '2025-04-30 00:39:05', NULL),
(10, 5, NULL, 60.00, 'debit', 'Admin has debited the balance.', NULL, NULL, '2025-04-30 00:39:12', '2025-04-30 00:39:12', NULL),
(11, 5, NULL, 45.00, 'credit', 'Admin has credited the balance.', NULL, NULL, '2025-04-30 00:39:19', '2025-04-30 00:39:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rides`
--

CREATE TABLE `rides` (
  `id` bigint UNSIGNED NOT NULL,
  `ambulance_id` int DEFAULT NULL,
  `ride_number` bigint NOT NULL,
  `rider_id` bigint UNSIGNED DEFAULT NULL,
  `ride_status_id` bigint UNSIGNED DEFAULT NULL,
  `service_id` bigint UNSIGNED DEFAULT NULL,
  `service_category_id` bigint UNSIGNED DEFAULT NULL,
  `vehicle_type_id` bigint UNSIGNED DEFAULT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `coupon_id` bigint UNSIGNED DEFAULT NULL,
  `hourly_package_id` bigint UNSIGNED DEFAULT NULL,
  `coupon_total_discount` decimal(8,2) DEFAULT NULL,
  `rider` json DEFAULT NULL,
  `parcel_delivered_otp` int DEFAULT NULL,
  `parcel_receiver` json DEFAULT NULL,
  `otp` int DEFAULT NULL,
  `cargo_image_id` bigint UNSIGNED DEFAULT NULL,
  `is_otp_verified` int DEFAULT '0',
  `locations` json DEFAULT NULL,
  `location_coordinates` json DEFAULT NULL,
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_mode` enum('online','offline') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'online',
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `ride_fare` double DEFAULT NULL,
  `driver_tips` decimal(8,4) DEFAULT NULL,
  `tax` decimal(8,4) DEFAULT NULL,
  `platform_fees` decimal(8,4) DEFAULT NULL,
  `zone_charge` decimal(8,4) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `processing_fee` double DEFAULT NULL,
  `wallet_balance` decimal(8,4) DEFAULT NULL,
  `bid_extra_amount` double DEFAULT NULL,
  `commission` double DEFAULT NULL,
  `driver_commission` double DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `waiting_charges` double DEFAULT NULL,
  `waiting_total_times` double DEFAULT NULL,
  `rider_cancellation_charge` double DEFAULT NULL,
  `driver_cancellation_charge` double DEFAULT NULL,
  `currency_symbol` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancellation_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `invoice_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `dropped_at` timestamp NULL DEFAULT NULL,
  `parcel_otp_verified_at` timestamp NULL DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `no_of_days` bigint UNSIGNED DEFAULT NULL,
  `driver_rent` double DEFAULT NULL,
  `vehicle_rent` double DEFAULT NULL,
  `is_with_driver` int NOT NULL DEFAULT '0',
  `additional_distance_charge` double DEFAULT NULL,
  `additional_minute_charge` double DEFAULT NULL,
  `additional_weight_charge` double DEFAULT NULL,
  `rental_vehicle_id` bigint UNSIGNED DEFAULT NULL,
  `assign_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `assigned_driver` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `vehicle_per_day_price` decimal(8,4) DEFAULT NULL,
  `driver_per_day_charge` decimal(8,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rides`
--

INSERT INTO `rides` (`id`, `ambulance_id`, `ride_number`, `rider_id`, `ride_status_id`, `service_id`, `service_category_id`, `vehicle_type_id`, `driver_id`, `coupon_id`, `hourly_package_id`, `coupon_total_discount`, `rider`, `parcel_delivered_otp`, `parcel_receiver`, `otp`, `cargo_image_id`, `is_otp_verified`, `locations`, `location_coordinates`, `duration`, `weight`, `distance`, `distance_unit`, `payment_method`, `payment_mode`, `payment_status`, `ride_fare`, `driver_tips`, `tax`, `platform_fees`, `zone_charge`, `description`, `processing_fee`, `wallet_balance`, `bid_extra_amount`, `commission`, `driver_commission`, `sub_total`, `total`, `waiting_charges`, `waiting_total_times`, `rider_cancellation_charge`, `driver_cancellation_charge`, `currency_symbol`, `comment`, `cancellation_reason`, `invoice_url`, `invoice_id`, `created_by_id`, `dropped_at`, `parcel_otp_verified_at`, `start_time`, `end_time`, `no_of_days`, `driver_rent`, `vehicle_rent`, `is_with_driver`, `additional_distance_charge`, `additional_minute_charge`, `additional_weight_charge`, `rental_vehicle_id`, `assign_type`, `assigned_driver`, `vehicle_per_day_price`, `driver_per_day_charge`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 100000, 14, 3, 1, 1, 3, 25, NULL, NULL, NULL, '{\"id\": 14, \"name\": \"Alex Clark\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"alex.rider@example.com\", \"phone\": 2057520309, \"status\": 1, \"location\": null, \"username\": \"alexrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:04:59.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 14, \"profile_image\": null, \"referral_code\": \"lFygK2Vkga\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', NULL, NULL, 4271, NULL, 0, '[\"Midtown Manhattan, New York, NY\", \"Central Park, New York, NY\", \"Times Square, New York, NY\"]', '[{\"lat\": \"40.754932\", \"lng\": \"-73.984016\"}, {\"lat\": \"40.785091\", \"lng\": \"-73.968285\"}, {\"lat\": \"40.7580\", \"lng\": \"-73.9855\"}]', NULL, NULL, '5.6', 'mile', 'paypal', 'online', 'PENDING', 158, NULL, 7.0000, 10.0000, NULL, 'This is ride Request', NULL, NULL, NULL, NULL, NULL, 158, 175, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(2, NULL, 100001, 14, 8, 1, 5, 1, 25, NULL, NULL, NULL, '{\"id\": 14, \"name\": \"Alex Clark\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"alex.rider@example.com\", \"phone\": 2057520309, \"status\": 1, \"location\": null, \"username\": \"alexrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:04:59.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 14, \"profile_image\": null, \"referral_code\": \"lFygK2Vkga\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', NULL, NULL, 3768, NULL, 0, '[\"Union Square, New York, NY\", \"The High Line, New York, NY\"]', '[{\"lat\": \"40.7347\", \"lng\": \"-73.9927\"}, {\"lat\": \"40.747993\", \"lng\": \"-74.004765\"}]', NULL, NULL, NULL, NULL, 'PayPal', 'online', 'COMPLETED', 34, 10.0000, 7.0000, 10.0000, NULL, NULL, 1.3, NULL, NULL, NULL, NULL, 44, 65.6, NULL, NULL, NULL, NULL, NULL, 'Excellet Ride', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-29 02:07:47', '2025-01-31 02:07:47', NULL, NULL, NULL, 0, NULL, NULL, NULL, 16, NULL, NULL, 17.0000, 5.0000, '2025-04-12 10:31:40', '2025-04-14 10:31:40', NULL),
(3, NULL, 100002, 40, 8, 3, 2, 3, 30, NULL, NULL, NULL, '{\"id\": 40, \"name\": \"Kaitlyn Coleman\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"kaitlyn.coleman@riderexample.com\", \"phone\": 2045550325, \"status\": 1, \"location\": null, \"username\": \"kaitlyncoleman\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T08:00:12.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 40, \"profile_image\": null, \"referral_code\": \"rTvPxBvW0Y\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', NULL, NULL, 1211, NULL, 0, '[\"Piazza del Popolo, Rome, Italy\", \"Colosseo (Colosseum), Piazza del Colosseo, Rome, Italy\", \"Vatican City, St. Peter’s Square, Rome, Italy\", \"Pantheon, Piazza della Rotonda, Rome, Italy\"]', '[{\"lat\": \"41.8902\", \"lng\": \"12.4922\"}, {\"lat\": \"41.9029\", \"lng\": \"41.9029\"}, {\"lat\": \"41.8986\", \"lng\": \"12.4769\"}]', NULL, NULL, '25.5', 'mile', 'cash', 'offline', 'COMPLETED', 630, NULL, 7.0000, 10.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 630, 647, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(4, NULL, 100003, 42, 5, 1, 1, 3, 30, NULL, NULL, NULL, '{\"id\": 42, \"name\": \"Olivia Sanders\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"olivia.sanders@riderexample.com\", \"phone\": 2045550317, \"status\": 1, \"location\": null, \"username\": \"oliviasanders\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T08:35:19.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 42, \"profile_image\": null, \"referral_code\": \"ZkqO6Qvgaz\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', NULL, NULL, 3821, NULL, 0, '[\"Villa Borghese, Piazzale del Museo Borghese, Rome, Italy\", \"Roman Forum, Via della Salara Vecchia, Rome, Italy\", \"Piazza Venezia, Rome, Italy\"]', '[{\"lat\": \"41.9144\", \"lng\": \"12.4923\"}, {\"lat\": \"41.8925\", \"lng\": \"12.4853\"}, {\"lat\": \"41.8947\", \"lng\": \"12.4813\"}]', NULL, NULL, '3', 'mile', 'PayPal', 'online', 'FAILED', 75, NULL, 7.0000, 10.0000, NULL, NULL, 1.3, NULL, NULL, NULL, NULL, 75, 93.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-12 10:31:40', '2025-04-14 10:31:40', NULL),
(5, NULL, 100004, 42, 8, 2, 1, 3, 30, NULL, NULL, NULL, '{\"id\": 42, \"name\": \"Olivia Sanders\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"olivia.sanders@riderexample.com\", \"phone\": 2045550317, \"status\": 1, \"location\": null, \"username\": \"oliviasanders\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T08:35:19.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 42, \"profile_image\": null, \"referral_code\": \"ZkqO6Qvgaz\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 6253, '{\"name\": \"Marco Rossi\", \"phone\": \"3456789123\", \"country_code\": \"39\"}', 1297, NULL, 1, '[\"Via del Corso, Rome, Italy\", \"Campo de\' Fiori, Rome, Italy\", \"Piazza di Spagna (Spanish Steps), Rome, Italy\"]', '[{\"lat\": \"41.9043\", \"lng\": \"12.4810\"}, {\"lat\": \"41.8949\", \"lng\": \"12.4745\"}, {\"lat\": \"41.9057\", \"lng\": \"12.4820\"}]', NULL, '5', '2', 'mile', 'cash', 'online', 'PROCESSING', 70, NULL, 7.0000, 10.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-29 04:22:10', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-12 10:31:40', '2025-04-14 10:31:40', NULL),
(6, NULL, 100005, 11, 3, 1, 2, 3, 26, NULL, NULL, NULL, '{\"id\": 11, \"name\": \"Amy Wilson\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"amy.rider@example.com\", \"phone\": 2055550306, \"status\": 1, \"location\": null, \"username\": \"amyrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:02:49.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 11, \"profile_image\": null, \"referral_code\": \"aFR4tPLmCa\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 9080, NULL, 4834, NULL, 0, '[\"123 Main St, Downtown LA, Los Angeles, CA 90012, USA\", \"456 Sunset Blvd, West Hollywood, Los Angeles, CA 90028, USA\"]', '[{\"lat\": 34.0705, \"lng\": -118.4483}, {\"lat\": 34.1016, \"lng\": -118.3412}]', NULL, NULL, '6', 'mile', 'midtrance', 'online', 'PENDING', 172, NULL, 7.0000, 10.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 172, 189, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(7, NULL, 100006, 11, 3, 1, 5, 1, 26, NULL, NULL, NULL, '{\"id\": 11, \"name\": \"Amy Wilson\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"amy.rider@example.com\", \"phone\": 2055550306, \"status\": 1, \"location\": null, \"username\": \"amyrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:02:49.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 11, \"profile_image\": null, \"referral_code\": \"aFR4tPLmCa\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', NULL, NULL, 1747, NULL, 0, '[\"Union Square, New York, NY\", \"The High Line, New York, NY\"]', '[{\"lat\": \"40.7365\", \"lng\": \"73.9913\"}, {\"lat\": \"40.7479\", \"lng\": \"74.0044\"}]', NULL, NULL, NULL, NULL, 'midtrans', 'online', 'PENDING', 48, NULL, 7.0000, 10.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-29 02:07:47', '2025-02-02 02:07:47', NULL, NULL, NULL, 0, NULL, NULL, NULL, 15, NULL, NULL, 12.0000, 7.0000, '2025-04-12 10:31:40', '2025-04-14 10:31:40', NULL),
(8, NULL, 100007, 10, 8, 2, 2, 6, 28, NULL, NULL, NULL, '{\"id\": 10, \"name\": \"Matt Miller\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"matt.rider@example.com\", \"phone\": 2055550305, \"status\": 1, \"location\": null, \"username\": \"mattrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:02:09.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 10, \"profile_image\": null, \"referral_code\": \"18peXDdqL6\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 2324, '{\"name\": \"Luca Bianchi\", \"phone\": \"3498765432\", \"country_code\": \"81\"}', 2366, NULL, 0, '[\"Shibuya Station, Shibuya, Tokyo, Japan\", \"Shinjuku Station, Shinjuku, Tokyo 160-0022, Japan\"]', '[{\"lat\": \"35.658034\", \"lng\": \"139.701636\"}, {\"lat\": \"35.690921\", \"lng\": \"139.700258\"}]', NULL, '5', '8.5', 'km', 'cash', 'offline', 'COMPLETED', 270, NULL, 7.0000, 10.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 270, 287, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(9, NULL, 100008, 9, 8, 1, 3, 4, 27, NULL, 2, NULL, '{\"id\": 9, \"name\": \"Eric Parker\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"eric.rider@example.com\", \"phone\": 2055550304, \"status\": 1, \"location\": null, \"username\": \"ericrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:01:42.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 9, \"profile_image\": null, \"referral_code\": \"a2Dm47O3uW\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 7478, NULL, 3960, NULL, 0, '[\"Melbourne Zoo, Parkville, Victoria, Australia\", \"Melbourne Central, Melbourne, Victoria, Australia\"]', '[{\"lat\": \"-37.8267\", \"lng\": \"144.9574\"}, {\"lat\": \"-37.8137\", \"lng\": \"144.9631\"}]', NULL, NULL, '20', 'km', 'PayPal', 'online', 'COMPLETED', 800, 30.0000, 7.0000, 10.0000, NULL, NULL, 1.3, NULL, NULL, NULL, NULL, 830, 849.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-21 05:14:22', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(10, NULL, 100009, 37, 8, 1, 5, 3, 28, NULL, NULL, NULL, '{\"id\": 37, \"name\": \"Kimberly Ward\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"kimberly.ward@riderexample.com\", \"phone\": 2045550321, \"status\": 1, \"location\": null, \"username\": \"kimberlyward\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T07:57:58.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 37, \"profile_image\": null, \"referral_code\": \"3S1OV1QVa0\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', NULL, NULL, 8134, NULL, 0, '[\"Tokyo Station, Chūō, Tokyo, Japan\", \"Ueno Park, Taito, Tokyo 110-0007, Japan\"]', '[{\"lat\": \"35.6897\", \"lng\": \"139.6922\"}, {\"lat\": \"35.6762\", \"lng\": \"139.6503\"}]', NULL, NULL, NULL, NULL, 'PayPal', 'online', 'CANCELLED', 120, NULL, 7.0000, 10.0000, NULL, NULL, 1.3, NULL, NULL, NULL, NULL, 78, 97.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-18 02:07:47', '2025-09-21 02:07:47', NULL, NULL, NULL, 0, NULL, NULL, NULL, 13, NULL, NULL, 26.0000, 20.0000, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(11, NULL, 100010, 14, 2, 1, 4, 4, 21, NULL, NULL, NULL, '{\"id\": 14, \"name\": \"Alex Clark\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"alex.rider@example.com\", \"phone\": 2057520309, \"status\": 1, \"location\": null, \"username\": \"alexrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:04:59.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 14, \"profile_image\": null, \"referral_code\": \"lFygK2Vkga\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 3153, NULL, 1280, NULL, 0, '[\"V&A Waterfront, Cape Town, South Africa\", \"Table Mountain, Cape Town, South Africa\"]', '[{\"lat\": \"-33.9249\", \"lng\": \"18.4241\"}, {\"lat\": \"-33.9258\", \"lng\": \"18.4232\"}]', NULL, NULL, '15', 'km', 'cash', 'online', 'PENDING', 375, NULL, 7.0000, 10.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 375, 392, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-15 02:07:47', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-16 10:31:40', '2025-04-14 10:31:40', NULL),
(12, NULL, 100011, 11, 8, 1, 5, 4, 18, NULL, NULL, NULL, '{\"id\": 11, \"name\": \"Amy Wilson\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"amy.rider@example.com\", \"phone\": 2055550306, \"status\": 1, \"location\": null, \"username\": \"amyrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:02:49.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 11, \"profile_image\": null, \"referral_code\": \"aFR4tPLmCa\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', NULL, NULL, 4080, NULL, 0, '[\"Location 1, Lagos, Nigeria\", \"Lekki, Lagos, Nigeria\"]', '[{\"lat\": \"6.513212771013711\", \"lng\": \"3.382981342411826\"}, {\"lat\": \"6.5244\", \"lng\": \"3.3792\"}]', NULL, NULL, NULL, NULL, 'PayPal', 'online', 'COMPLETED', 70, NULL, 7.0000, 10.0000, NULL, NULL, 1.3, NULL, NULL, NULL, NULL, 70, 88.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-03 05:07:47', '2025-02-05 05:07:47', NULL, NULL, NULL, 0, NULL, NULL, NULL, 3, NULL, NULL, 35.0000, 20.0000, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(13, NULL, 100012, 37, 8, 1, 1, 4, 21, NULL, NULL, NULL, '{\"id\": 37, \"name\": \"Kimberly Ward\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"kimberly.ward@riderexample.com\", \"phone\": 2045550321, \"status\": 1, \"location\": null, \"username\": \"kimberlyward\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T07:57:58.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 37, \"profile_image\": null, \"referral_code\": \"3S1OV1QVa0\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 9516, NULL, 2894, NULL, 0, '[\"Cape Town, South Africa\", \"V&A Waterfront, Cape Town, South Africa\", \"Table Mountain, Cape Town, South Africa\", \"Cape of Good Hope, Cape Town, South Africa\"]', '[{\"lat\": \"-33.94121239867857\", \"lng\": \"18.643195525564572\"}, {\"lat\": \"-33.9249\", \"lng\": \"18.4241\"}, {\"lat\": \"-33.9244\", \"lng\": \"18.4232\"}, {\"lat\": \"-33.9264\", \"lng\": \"18.4232\"}]', NULL, NULL, '15', 'km', 'PayPal', 'online', 'COMPLETED', 375, NULL, 7.0000, 10.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 375, 392, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(14, NULL, 100013, 6, 3, 1, 3, 3, 17, NULL, 4, NULL, '{\"id\": 6, \"name\": \"Ashley Hall\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"ashley.hall@riderexample.com\", \"phone\": 2045550301, \"status\": 1, \"location\": null, \"username\": \"ashleyhall\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T05:47:54.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"359\", \"rating_count\": 0, \"created_by_id\": 6, \"profile_image\": null, \"referral_code\": \"jJp7gB4Z8l\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 7378, NULL, 7369, NULL, 0, '[\"Shinjuku Station, Shinjuku, Tokyo 160-0022, Japan\", \"Shibuya Station, Shibuya, Tokyo, Japan\"]', '[{\"lat\": 35.706236857934186, \"lng\": 139.78880337583252}, {\"lat\": 35.71794496559185, \"lng\": 139.73181179868408}]', NULL, NULL, '25', 'mile', 'paypal', 'online', 'PENDING', 1048, NULL, 7.0000, 10.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1048, 1065, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-30 06:29:34', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(15, NULL, 100014, 41, 8, 1, 2, 1, 18, NULL, NULL, NULL, '{\"id\": 41, \"name\": \"Abigail Butler\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"abigail.butler@riderexample.com\", \"phone\": 2045550319, \"status\": 1, \"location\": null, \"username\": \"abigailbutler\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T08:33:21.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 41, \"profile_image\": null, \"referral_code\": \"BDv49fjFga\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 6424, NULL, 3992, NULL, 0, '[\"Lekki Phase 1, Lagos, Nigeria\", \"Victoria Island, Lagos, Nigeria\"]', '[{\"lat\": \"6.5132\", \"lng\": \"3.3830\"}, {\"lat\": \"6.4681\", \"lng\": \"3.5901\"}]', NULL, NULL, '5', 'km', 'PayPal', 'online', 'COMPLETED', 20, NULL, 7.0000, 10.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 37, NULL, NULL, NULL, NULL, NULL, NULL, 'I’ve had a scheduling conflict arise and need to cancel the ride.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(16, NULL, 100015, 42, 7, 1, 2, 1, 18, NULL, NULL, NULL, '{\"id\": 42, \"name\": \"Olivia Sanders\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"olivia.sanders@riderexample.com\", \"phone\": 2045550317, \"status\": 1, \"location\": null, \"username\": \"oliviasanders\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T08:35:19.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 42, \"profile_image\": null, \"referral_code\": \"ZkqO6Qvgaz\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 9786, NULL, 4252, NULL, 0, '[\"Victoria Island, Lagos, Nigeria\", \"Ajah, Lagos, Nigeria\"]', '[{\"lat\": \"6.4965\", \"lng\": \"3.3710\"}, {\"lat\": \"6.4400\", \"lng\": \"3.4160\"}]', NULL, NULL, '3', 'mile', 'cash', 'online', 'PENDING', 20, NULL, 7.0000, 10.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 37, NULL, NULL, NULL, NULL, NULL, NULL, 'Due to unforeseen traffic or other delays, I’m unable to complete the ride as planned.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(18, NULL, 100016, 9, 8, 1, 1, 3, 25, NULL, NULL, NULL, '{\"id\": 9, \"name\": \"Eric Parker\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"eric.rider@example.com\", \"phone\": 2055550304, \"status\": 1, \"location\": null, \"username\": \"ericrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:01:42.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 9, \"profile_image\": null, \"referral_code\": \"a2Dm47O3uW\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 7024, NULL, 7389, NULL, 0, '[\"Hoboken, New Jersey, USA\", \"Manhattan, New York, USA\", \"Jersey City, New Jersey, USA\"]', '[{\"lat\": \"40.81794642341028\", \"lng\": \"-74.05756897701521\"}, {\"lat\": \"40.7831\", \"lng\": \"-73.9712\"}, {\"lat\": \"40.7178\", \"lng\": \"-74.0434\"}]', NULL, NULL, '30', 'mile', 'cash', 'online', 'PENDING', 730, NULL, 7.0000, 10.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 730, 747, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-12 10:31:40', '2025-04-14 10:31:40', NULL),
(19, NULL, 100017, 3, 8, 1, 1, 3, 31, NULL, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 8011, NULL, 3352, NULL, 0, '[\"Sunnybank, Queensland, Australia\", \"Mount Gravatt, Queensland, Australia\"]', '[{\"lat\": \"-27.588324\", \"lng\": \"153.057419\"}, {\"lat\": \"-27.544615\", \"lng\": \"153.076511\"}]', NULL, NULL, '6.869', 'km', 'PayPal', 'online', 'COMPLETED', 105, 10.0000, 7.0000, 10.0000, NULL, 'undefined', NULL, NULL, NULL, NULL, NULL, 115, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-12 10:31:40', '2025-04-14 10:31:40', NULL),
(20, NULL, 100018, 3, 7, 1, 1, 3, 25, NULL, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 3994, NULL, 6416, NULL, 0, '[\"Richmond, Victoria, Australia\", \"Camberwell, Victoria, Australia\"]', '[{\"lat\": \"-37.818287\", \"lng\": \"145.001757\"}, {\"lat\": \"-37.835660\", \"lng\": \"145.070480\"}]', NULL, NULL, '6.869', 'km', 'cash', 'online', 'PENDING', 30, NULL, 7.0000, 10.0000, NULL, 'undefined', NULL, NULL, NULL, NULL, NULL, 40, 47, NULL, NULL, NULL, NULL, NULL, NULL, 'Driver Too Late', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(21, NULL, 100019, 3, 7, 2, 1, 3, 25, NULL, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 1530, NULL, 2447, NULL, 0, '[\"New York City, New York, USA\", \"Philadelphia, Pennsylvania, USA\"]', '[{\"lat\": \"40.7127753\", \"lng\": \"-74.0059728\"}, {\"lat\": \"39.9525839\", \"lng\": \"-75.1652215\"}]', NULL, NULL, '282.477', 'km', 'cash', 'online', 'PENDING', 30, NULL, 7.0000, 10.0000, NULL, 'undefined', NULL, NULL, NULL, NULL, NULL, 40, 47, NULL, NULL, NULL, NULL, NULL, NULL, 'Found Another Ride', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-12 10:31:40', '2025-04-14 10:31:40', NULL),
(22, NULL, 100020, 3, 3, 1, 1, 3, 25, NULL, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 6454, NULL, 8444, NULL, 0, '[\"Downtown Dallas, Dallas, Texas, USA\", \"Bishop Arts District, Dallas, Texas, USA\"]', '[{\"lat\": \"32.7766642\", \"lng\": \"-96.79698789999999\"}, {\"lat\": \"32.7472956\", \"lng\": \"-96.8280034\"}]', NULL, NULL, '8.423', 'km', 'cash', 'online', 'PENDING', 130, NULL, 7.0000, 10.0000, NULL, 'undefined', NULL, NULL, NULL, NULL, NULL, 130, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-12 10:31:40', '2025-04-14 10:31:40', NULL),
(23, NULL, 100021, 3, 7, 1, 1, 3, 25, NULL, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 4875, NULL, 3437, NULL, 0, '[\"Downtown Austin, Austin, Texas, USA\", \"Pflugerville, Texas, USA\"]', '[{\"lat\": \"30.2711286\", \"lng\": \"-97.7436995\"}, {\"lat\": \"30.4393696\", \"lng\": \"-97.6200043\"}]', NULL, NULL, '20.743', 'km', 'cash', 'online', 'PENDING', 30, NULL, 7.0000, 10.0000, NULL, 'undefined', NULL, NULL, NULL, NULL, NULL, 40, 47, NULL, NULL, NULL, NULL, NULL, NULL, 'Incorrect Fare or Charges', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-12 10:31:40', '2025-04-14 10:31:40', NULL),
(24, NULL, 100022, 3, 8, 1, 1, 3, 25, NULL, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 1167, NULL, 7383, NULL, 0, '[\"Downtown Los Angeles, Los Angeles, California, USA\", \"Whittier, California, USA\"]', '[{\"lat\": \"34.040713\", \"lng\": \"-118.2467693\"}, {\"lat\": \"33.9791793\", \"lng\": \"-118.032844\"}]', NULL, NULL, '20.743', 'km', 'cash', 'online', 'PENDING', 312, NULL, 7.0000, 10.0000, NULL, 'undefined', NULL, NULL, NULL, NULL, NULL, 312, 329, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(25, NULL, 100023, 3, 8, 1, 1, 3, 25, NULL, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 9950, NULL, 2122, NULL, 0, '[\"Downtown San Francisco, California, USA\", \"Mission District, San Francisco, California, USA\"]', '[{\"lat\": \"37.7749295\", \"lng\": \"-122.4194155\"}, {\"lat\": \"37.7597034\", \"lng\": \"-122.4280937\"}]', NULL, NULL, '13.322', 'km', 'PayPal', 'online', 'COMPLETED', 200, 10.0000, 7.0000, 10.0000, NULL, 'undefined', NULL, NULL, NULL, NULL, NULL, 210, 227, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-12 10:31:40', '2025-04-14 10:31:40', NULL),
(26, NULL, 100024, 3, 8, 1, 1, 3, 25, NULL, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', 2029, NULL, 4765, NULL, 0, '[\"The Strip, Las Vegas, Nevada, USA\", \"Downtown Las Vegas, Nevada, USA\"]', '[{\"lat\": \"36.114647\", \"lng\": \"-115.172813\"}, {\"lat\": \"36.169941\", \"lng\": \"-115.13983\"}]', NULL, NULL, '6.869', 'km', 'PayPal', 'online', 'COMPLETED', 105, 10.0000, 7.0000, 10.0000, NULL, 'undefined', NULL, NULL, NULL, NULL, NULL, 115, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-12 10:31:40', '2025-04-14 10:31:40', NULL),
(27, NULL, 100027, 3, 3, 1, 4, 1, 25, NULL, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"email\": \"rider@example.com\", \"phone\": 123456789, \"country_code\": \"1\"}', 4368, NULL, 1961, NULL, 0, '[\"Empire State Building, New York, NY 10001, USA\", \"Central Park, New York, NY, USA\"]', '[{\"lat\": \"40.748817\", \"lng\": \"-73.985428\"}, {\"lat\": \"40.7580\", \"lng\": \"-73.9855\"}]', NULL, NULL, '6.639', 'km', 'cash', 'online', 'PENDING', 73, NULL, 7.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 73, 80, NULL, NULL, NULL, NULL, '$', NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-29 06:46:30', '2025-04-29 06:46:30', NULL),
(28, NULL, 100028, 3, 3, 1, 2, 3, 25, NULL, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"email\": \"rider@example.com\", \"phone\": 123456789, \"country_code\": \"1\"}', 4977, NULL, 8974, NULL, 0, '[\"Brisbane City, Queensland, Australia\", \"Indooroopilly, Queensland, Australia\"]', '[{\"lat\": \"-27.470125\", \"lng\": \"153.021072\"}, {\"lat\": \"-27.499604\", \"lng\": \"152.997649\"}]', NULL, NULL, '6.639', 'km', 'cash', 'online', 'PENDING', 120, NULL, 7.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, 127, NULL, NULL, NULL, NULL, '$', NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-29 07:04:38', '2025-04-29 07:04:38', NULL),
(29, NULL, 100029, 3, 3, 4, NULL, NULL, 66, NULL, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"email\": \"rider@example.com\", \"phone\": 123456789, \"country_code\": \"1\"}', NULL, NULL, 5113, NULL, 0, '[\"Downtown Brooklyn, New York, USA\"]', '[{\"lat\": \"40.695721\", \"lng\": \"-73.985941\"}]', NULL, NULL, '3', 'km', NULL, 'online', 'PENDING', 3, NULL, 0.0000, 10.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 13, NULL, NULL, NULL, NULL, '$', NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-29 23:32:39', '2025-04-29 23:32:39', NULL),
(30, NULL, 100030, 3, 3, 4, NULL, NULL, 65, NULL, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"email\": \"rider@example.com\", \"phone\": 123456789, \"country_code\": \"1\"}', NULL, NULL, 4601, NULL, 0, '[\"Bradenton, Florida, USA\"]', '[{\"lat\": \"27.432395\", \"lng\": \"-82.731577\"}]', NULL, NULL, '11.7', 'km', NULL, 'online', 'PENDING', 12, NULL, 0.0000, 10.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 22, NULL, NULL, NULL, NULL, '$', NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-29 23:42:23', '2025-04-29 23:42:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ride_bids`
--

CREATE TABLE `ride_bids` (
  `id` bigint UNSIGNED NOT NULL,
  `ride_id` bigint UNSIGNED DEFAULT NULL,
  `bid_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ride_bids`
--

INSERT INTO `ride_bids` (`id`, `ride_id`, `bid_id`) VALUES
(15, 1, 1),
(16, 1, 2),
(17, 3, 3),
(18, 3, 4),
(19, 4, 5),
(20, 5, 6),
(21, 5, 7),
(22, 5, 8),
(23, 6, 9),
(24, 6, 10),
(25, 13, 11),
(26, 15, 12),
(27, 15, 13),
(28, 15, 14),
(29, 16, 15),
(30, 18, 16),
(31, 19, 17),
(32, 20, 18),
(33, 21, 19),
(34, 22, 20),
(35, 23, 21),
(36, 24, 22),
(37, 25, 23),
(38, 26, 24);

-- --------------------------------------------------------

--
-- Table structure for table `ride_requests`
--

CREATE TABLE `ride_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `ride_number` bigint DEFAULT NULL,
  `ambulance_id` int DEFAULT NULL,
  `rider_id` bigint UNSIGNED DEFAULT NULL,
  `service_id` bigint UNSIGNED DEFAULT NULL,
  `vehicle_type_id` bigint UNSIGNED DEFAULT NULL,
  `service_category_id` bigint UNSIGNED DEFAULT NULL,
  `hourly_package_id` bigint UNSIGNED DEFAULT NULL,
  `cargo_image_id` bigint UNSIGNED DEFAULT NULL,
  `rider` json DEFAULT NULL,
  `locations` json DEFAULT NULL,
  `location_coordinates` json DEFAULT NULL,
  `parcel_receiver` json DEFAULT NULL,
  `parcel_delivered_otp` int DEFAULT NULL,
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ride_fare` double DEFAULT NULL,
  `additional_distance_charge` double DEFAULT NULL,
  `additional_minute_charge` double DEFAULT NULL,
  `additional_weight_charge` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `commission` double DEFAULT NULL,
  `driver_commission` double DEFAULT NULL,
  `bid_extra_amount` double DEFAULT NULL,
  `platform_fee` double DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `currency_symbol` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `no_of_days` bigint UNSIGNED DEFAULT NULL,
  `driver_per_day_charge` double DEFAULT NULL,
  `vehicle_per_day_charge` double DEFAULT NULL,
  `driver_rent` double DEFAULT NULL,
  `vehicle_rent` double DEFAULT NULL,
  `is_with_driver` int NOT NULL DEFAULT '0',
  `rental_vehicle_id` bigint UNSIGNED DEFAULT NULL,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ride_requests`
--

INSERT INTO `ride_requests` (`id`, `ride_number`, `ambulance_id`, `rider_id`, `service_id`, `vehicle_type_id`, `service_category_id`, `hourly_package_id`, `cargo_image_id`, `rider`, `locations`, `location_coordinates`, `parcel_receiver`, `parcel_delivered_otp`, `duration`, `distance`, `distance_unit`, `weight`, `payment_method`, `ride_fare`, `additional_distance_charge`, `additional_minute_charge`, `additional_weight_charge`, `tax`, `commission`, `driver_commission`, `bid_extra_amount`, `platform_fee`, `sub_total`, `total`, `currency_symbol`, `description`, `start_time`, `end_time`, `no_of_days`, `driver_per_day_charge`, `vehicle_per_day_charge`, `driver_rent`, `vehicle_rent`, `is_with_driver`, `rental_vehicle_id`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 100000, NULL, 14, 1, 3, 1, NULL, NULL, '{\"id\": 14, \"name\": \"Alex Clark\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"alex.rider@example.com\", \"phone\": 2057520309, \"status\": 1, \"location\": null, \"username\": \"alexrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:04:59.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 14, \"profile_image\": null, \"referral_code\": \"lFygK2Vkga\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Midtown Manhattan, New York, NY\", \"Central Park, New York, NY\", \"Times Square, New York, NY\"]', '[{\"lat\": \"40.754932\", \"lng\": \"-73.984016\"}, {\"lat\": \"40.785091\", \"lng\": \"-73.968285\"}, {\"lat\": \"40.7580\", \"lng\": \"-73.9855\"}]', NULL, 7773, NULL, '5.6', 'mile', NULL, 'paypal', 160, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'This is ride Request', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 14, '2025-01-29 02:07:47', '2025-01-29 02:09:04', '2025-01-29 02:09:04'),
(2, 100001, NULL, 14, 1, 1, 5, NULL, NULL, '{\"id\": 14, \"name\": \"Alex Clark\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"alex.rider@example.com\", \"phone\": 2057520309, \"status\": 1, \"location\": null, \"username\": \"alexrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:04:59.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 14, \"profile_image\": null, \"referral_code\": \"lFygK2Vkga\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Union Square, New York, NY\", \"The High Line, New York, NY\"]', '[{\"lat\": \"40.7347\", \"lng\": \"-73.9927\"}, {\"lat\": \"40.747993\", \"lng\": \"-74.004765\"}]', NULL, NULL, NULL, NULL, NULL, NULL, 'midtrans', 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-29 02:07:47', '2025-01-31 02:07:47', 2, NULL, NULL, NULL, NULL, 0, 16, 14, '2025-01-29 02:38:39', '2025-01-29 02:40:34', '2025-01-29 02:40:34'),
(4, 100002, NULL, 40, 3, 3, 2, NULL, NULL, '{\"id\": 40, \"name\": \"Kaitlyn Coleman\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"kaitlyn.coleman@riderexample.com\", \"phone\": 2045550325, \"status\": 1, \"location\": null, \"username\": \"kaitlyncoleman\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T08:00:12.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 40, \"profile_image\": null, \"referral_code\": \"rTvPxBvW0Y\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Piazza del Popolo, Rome, Italy\", \"Colosseo (Colosseum), Piazza del Colosseo, Rome, Italy\", \"Vatican City, St. Peter’s Square, Rome, Italy\", \"Pantheon, Piazza della Rotonda, Rome, Italy\"]', '[{\"lat\": \"41.8902\", \"lng\": \"12.4922\"}, {\"lat\": \"41.9029\", \"lng\": \"41.9029\"}, {\"lat\": \"41.8986\", \"lng\": \"12.4769\"}]', NULL, 8761, NULL, '25.5', 'mile', NULL, 'cash', 616, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 40, '2025-01-29 03:30:47', '2025-01-29 03:34:07', '2025-01-29 03:34:07'),
(5, 100003, NULL, 42, 1, 3, 1, NULL, NULL, '{\"id\": 42, \"name\": \"Olivia Sanders\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"olivia.sanders@riderexample.com\", \"phone\": 2045550317, \"status\": 1, \"location\": null, \"username\": \"oliviasanders\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T08:35:19.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 42, \"profile_image\": null, \"referral_code\": \"ZkqO6Qvgaz\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Villa Borghese, Piazzale del Museo Borghese, Rome, Italy\", \"Roman Forum, Via della Salara Vecchia, Rome, Italy\", \"Piazza Venezia, Rome, Italy\"]', '[{\"lat\": \"41.9144\", \"lng\": \"12.4923\"}, {\"lat\": \"41.8925\", \"lng\": \"12.4853\"}, {\"lat\": \"41.8947\", \"lng\": \"12.4813\"}]', NULL, 8336, NULL, '3', 'mile', NULL, 'paypal', 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 42, '2025-01-29 03:48:18', '2025-01-29 03:49:30', '2025-01-29 03:49:30'),
(6, 100004, NULL, 42, 2, 3, 1, NULL, NULL, '{\"id\": 42, \"name\": \"Olivia Sanders\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"olivia.sanders@riderexample.com\", \"phone\": 2045550317, \"status\": 1, \"location\": null, \"username\": \"oliviasanders\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T08:35:19.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 42, \"profile_image\": null, \"referral_code\": \"ZkqO6Qvgaz\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Via del Corso, Rome, Italy\", \"Campo de\' Fiori, Rome, Italy\", \"Piazza di Spagna (Spanish Steps), Rome, Italy\"]', '[{\"lat\": \"41.9043\", \"lng\": \"12.4810\"}, {\"lat\": \"41.8949\", \"lng\": \"12.4745\"}, {\"lat\": \"41.9057\", \"lng\": \"12.4820\"}]', NULL, 6253, NULL, '2', 'mile', '5', 'cash', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 42, '2025-01-29 03:59:00', '2025-01-29 04:07:11', '2025-01-29 04:07:11'),
(8, 100005, NULL, 11, 1, 3, 2, NULL, NULL, '{\"id\": 11, \"name\": \"Amy Wilson\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"amy.rider@example.com\", \"phone\": 2055550306, \"status\": 1, \"location\": null, \"username\": \"amyrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:02:49.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 11, \"profile_image\": null, \"referral_code\": \"aFR4tPLmCa\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"123 Main St, Downtown LA, Los Angeles, CA 90012, USA\", \"456 Sunset Blvd, West Hollywood, Los Angeles, CA 90028, USA\"]', '[{\"lat\": \"34.0522\", \"lng\": \"-118.2437\"}, {\"lat\": \"34.0900\", \"lng\": \"118.3600\"}]', NULL, 9080, NULL, '6', 'mile', NULL, 'midtrance', 172, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 11, '2025-01-29 06:54:24', '2025-01-29 06:58:02', '2025-01-29 06:58:02'),
(9, 100006, NULL, 11, 1, 1, 5, NULL, NULL, '{\"id\": 11, \"name\": \"Amy Wilson\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"amy.rider@example.com\", \"phone\": 2055550306, \"status\": 1, \"location\": null, \"username\": \"amyrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:02:49.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 11, \"profile_image\": null, \"referral_code\": \"aFR4tPLmCa\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Union Square, New York, NY\", \"The High Line, New York, NY\"]', '[{\"lat\": \"40.7347\", \"lng\": \"-73.9927\"}, {\"lat\": \"40.747993\", \"lng\": \"-74.004765\"}]', NULL, NULL, NULL, NULL, NULL, NULL, 'midtrans', 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-29 02:07:47', '2025-02-02 02:07:47', 4, NULL, NULL, NULL, NULL, 0, 15, 11, '2025-01-29 07:06:35', '2025-01-29 07:12:31', '2025-01-29 07:12:31'),
(11, 100007, NULL, 10, 2, 6, 2, NULL, NULL, '{\"id\": 10, \"name\": \"Matt Miller\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"matt.rider@example.com\", \"phone\": 2055550305, \"status\": 1, \"location\": null, \"username\": \"mattrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:02:09.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 10, \"profile_image\": null, \"referral_code\": \"18peXDdqL6\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Shibuya Station, Shibuya, Tokyo, Japan\", \"Tokyo Tower, Minato, Tokyo 105-0011, Japan\", \"Shinjuku Station, Shinjuku, Tokyo 160-0022, Japan\"]', '[{\"lat\": \"35.699436828935475\", \"lng\": \"139.802040077321\"}, {\"lat\": \"35.70306125994346\", \"lng\": \"139.80032346355148\"}, {\"lat\": \"35.699436828935475\", \"lng\": \"139.802040077321\"}]', NULL, 2324, NULL, '8.5', 'km', '5', 'cash', 270, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 10, '2025-01-29 22:54:49', '2025-01-29 22:56:47', '2025-01-29 22:56:47'),
(12, 100008, NULL, 9, 1, 4, 3, 2, NULL, '{\"id\": 9, \"name\": \"Eric Parker\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"eric.rider@example.com\", \"phone\": 2055550304, \"status\": 1, \"location\": null, \"username\": \"ericrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:01:42.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 9, \"profile_image\": null, \"referral_code\": \"a2Dm47O3uW\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Melbourne Zoo, Parkville, Victoria, Australia\", \"Melbourne Central, Melbourne, Victoria, Australia\"]', '[{\"lat\": \"-37.8267\", \"lng\": \"144.9574\"}, {\"lat\": \"-37.8137\", \"lng\": \"144.9631\"}]', NULL, 7478, NULL, '20', 'km', NULL, 'paypal', 800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 9, '2025-01-29 23:36:01', '2025-01-29 23:37:10', '2025-01-29 23:37:10'),
(13, NULL, NULL, 37, 1, 3, 5, NULL, NULL, '{\"id\": 37, \"name\": \"Kimberly Ward\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"kimberly.ward@riderexample.com\", \"phone\": 2045550321, \"status\": 1, \"location\": null, \"username\": \"kimberlyward\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T07:57:58.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 37, \"profile_image\": null, \"referral_code\": \"3S1OV1QVa0\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Tokyo Station, Chūō, Tokyo, Japan\", \"Ueno Park, Taito, Tokyo 110-0007, Japan\"]', '[{\"lat\": \"35.6897\", \"lng\": \"139.6922\"}, {\"lat\": \"35.6762\", \"lng\": \"139.6503\"}]', NULL, NULL, NULL, NULL, NULL, NULL, 'paypal', 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-18 02:07:47', '2025-09-21 02:07:47', 3, NULL, NULL, NULL, NULL, 0, 13, 37, '2025-01-29 23:51:08', '2025-01-29 23:51:38', '2025-01-29 23:51:38'),
(15, NULL, NULL, 14, 1, 4, 4, NULL, NULL, '{\"id\": 14, \"name\": \"Alex Clark\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"alex.rider@example.com\", \"phone\": 2057520309, \"status\": 1, \"location\": null, \"username\": \"alexrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:04:59.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 14, \"profile_image\": null, \"referral_code\": \"lFygK2Vkga\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"V&A Waterfront, Cape Town, South Africa\", \"Table Mountain, Cape Town, South Africa\"]', '[{\"lat\": \"-33.9249\", \"lng\": \"18.4241\"}, {\"lat\": \"-33.9258\", \"lng\": \"18.4232\"}]', NULL, 3153, NULL, '15', 'km', NULL, 'cash', 375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-15 02:07:47', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 14, '2025-01-30 00:23:57', '2025-01-30 00:25:19', '2025-01-30 00:25:19'),
(16, NULL, NULL, 11, 1, 4, 5, NULL, NULL, '{\"id\": 11, \"name\": \"Amy Wilson\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"amy.rider@example.com\", \"phone\": 2055550306, \"status\": 1, \"location\": null, \"username\": \"amyrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:02:49.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 11, \"profile_image\": null, \"referral_code\": \"aFR4tPLmCa\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Location 1, Lagos, Nigeria\", \"Lekki, Lagos, Nigeria\"]', '[{\"lat\": \"6.513212771013711\", \"lng\": \"3.382981342411826\"}, {\"lat\": \"6.5244\", \"lng\": \"3.3792\"}]', NULL, NULL, NULL, NULL, NULL, NULL, 'paypal', 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-03 05:07:47', '2025-02-05 05:07:47', 2, NULL, NULL, NULL, NULL, 0, 3, 11, '2025-01-30 00:41:32', '2025-01-30 00:43:46', '2025-01-30 00:43:46'),
(17, NULL, NULL, 37, 1, 4, 1, NULL, NULL, '{\"id\": 37, \"name\": \"Kimberly Ward\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"kimberly.ward@riderexample.com\", \"phone\": 2045550321, \"status\": 1, \"location\": null, \"username\": \"kimberlyward\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T07:57:58.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 37, \"profile_image\": null, \"referral_code\": \"3S1OV1QVa0\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Cape Town, South Africa\", \"V&A Waterfront, Cape Town, South Africa\", \"Table Mountain, Cape Town, South Africa\", \"Cape of Good Hope, Cape Town, South Africa\"]', '[{\"lat\": \"-33.94121239867857\", \"lng\": \"18.643195525564572\"}, {\"lat\": \"-33.9249\", \"lng\": \"18.4241\"}, {\"lat\": \"-33.9244\", \"lng\": \"18.4232\"}, {\"lat\": \"-33.9264\", \"lng\": \"18.4232\"}]', NULL, 9516, NULL, '15', 'km', NULL, 'cash', 375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 37, '2025-01-30 01:25:51', '2025-01-30 01:27:01', '2025-01-30 01:27:01'),
(18, NULL, NULL, 6, 1, 3, 3, 4, NULL, '{\"id\": 6, \"name\": \"Ashley Hall\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"ashley.hall@riderexample.com\", \"phone\": 2045550301, \"status\": 1, \"location\": null, \"username\": \"ashleyhall\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T05:47:54.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"359\", \"rating_count\": 0, \"created_by_id\": 6, \"profile_image\": null, \"referral_code\": \"jJp7gB4Z8l\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Gyeongbokgung Palace, Seoul, South Korea\", \"Everland, Yongin, South Korea\"]', '[{\"lat\": \"37.5665\", \"lng\": \"126.9780\"}, {\"lat\": \"37.5131\", \"lng\": \"127.0581\"}]', NULL, 1636, NULL, '25', 'mile', NULL, 'paypal', 1048, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 6, '2025-01-30 04:23:57', '2025-01-30 04:29:34', '2025-01-30 04:29:34'),
(19, NULL, NULL, 41, 1, 1, 2, NULL, NULL, '{\"id\": 41, \"name\": \"Abigail Butler\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"abigail.butler@riderexample.com\", \"phone\": 2045550319, \"status\": 1, \"location\": null, \"username\": \"abigailbutler\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T08:33:21.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 41, \"profile_image\": null, \"referral_code\": \"BDv49fjFga\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Lekki Phase 1, Lagos, Nigeria\", \"Victoria Island, Lagos, Nigeria\"]', '[{\"lat\": \"6.5132\", \"lng\": \"3.3830\"}, {\"lat\": \"6.4681\", \"lng\": \"3.5901\"}]', NULL, 6424, NULL, '5', 'km', NULL, 'cash', 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 41, '2025-01-30 06:22:47', '2025-01-30 06:26:41', '2025-01-30 06:26:41'),
(22, 100022, NULL, 42, 1, 1, 2, NULL, NULL, '{\"id\": 42, \"name\": \"Olivia Sanders\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"olivia.sanders@riderexample.com\", \"phone\": 2045550317, \"status\": 1, \"location\": null, \"username\": \"oliviasanders\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T08:35:19.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 42, \"profile_image\": null, \"referral_code\": \"ZkqO6Qvgaz\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Victoria Island, Lagos, Nigeria\", \"Ajah, Lagos, Nigeria\"]', '[{\"lat\": \"6.4965\", \"lng\": \"3.3710\"}, {\"lat\": \"6.4400\", \"lng\": \"3.4160\"}]', NULL, 9786, NULL, '3', 'mile', NULL, 'cash', 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 42, '2025-01-30 06:43:08', '2025-01-30 06:46:48', '2025-01-30 06:46:48'),
(23, 100023, NULL, 15, 3, 7, 2, NULL, NULL, '{\"id\": 15, \"name\": \"Katie Hall\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"katie.rider@example.com\", \"phone\": 2053250310, \"status\": 1, \"location\": null, \"username\": null, \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:05:58.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 1, \"profile_image\": null, \"referral_code\": null, \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Millennium Park, Chicago, IL, USA\", \"The Art Institute of Chicago, South Michigan Avenue, Chicago, IL, USA\"]', '[{\"lat\": \"41.8825524\", \"lng\": \"-87.62255139999999\"}, {\"lat\": \"41.8796031\", \"lng\": \"-87.6223504\"}]', '{\"name\": null, \"phone\": null, \"country_code\": \"93\"}', 5143, NULL, '1', 'km', NULL, 'cash', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2025-04-14 10:31:40', '2025-04-14 10:31:40', NULL),
(24, 100024, NULL, 8, 2, 7, 1, NULL, NULL, '{\"id\": 8, \"name\": \"Jake White\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"jake.rider@example.com\", \"phone\": 2055550303, \"status\": 1, \"location\": null, \"username\": null, \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T05:50:53.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 1, \"profile_image\": null, \"referral_code\": null, \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"City Centre, Nairobi, Nairobi Province, Kenya\", \"Kenya National Museum Society, Kipande Road, Nairobi, Kenya\", \"Nairobi Railway Station, Nairobi, Kenya\"]', '[{\"lat\": \"-1.2920659\", \"lng\": \"36.82194619999999\"}, {\"lat\": \"-1.2739629\", \"lng\": \"36.81442500000001\"}, {\"lat\": \"-1.2920408\", \"lng\": \"36.82788710000001\"}]', '{\"name\": \"Jane Smith\", \"phone\": \"701234567\", \"country_code\": \"254\"}', 4386, NULL, '1.5', 'km', '50', 'paypal', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A medium-sized package containing personal belongings, including clothes, books, and electronics. The parcel is securely packed in a cardboard box with fragile items marked. Please handle with care.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2025-04-14 10:31:40', '2025-04-14 10:31:40', NULL),
(25, 100025, NULL, 16, 1, 2, 4, NULL, NULL, '{\"id\": 16, \"name\": \"Marcus Griffin\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"marcus.griffin@riderexample.com\", \"phone\": 1234567899, \"status\": 1, \"location\": null, \"username\": \"Teater\", \"fcm_token\": \"doNmsm01Tu6CekyK_5STxd:APA91bH5ThpV19hijgcAozQLHBbKltTN9ik0DUQiuLq48j3DNDutDd47P7GP9L3j_mx_UlhzxYbgvTXGu7EL8ww8ty2MtQicxe0JthiCqHAZKO09yis78ks\", \"is_online\": 1, \"created_at\": \"2025-01-23T06:09:19.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"91\", \"rating_count\": 0, \"created_by_id\": 1, \"profile_image\": null, \"referral_code\": \"TEA949\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Tiananmen Square, 前门 Dongcheng, China\", \"Temple of Heaven, Tiantan East Road, Dongcheng, China\"]', '[{\"lat\": \"39.90548950000001\", \"lng\": \"116.3976317\"}, {\"lat\": \"39.88218029999999\", \"lng\": \"116.4066056\"}]', '{\"name\": null, \"phone\": null, \"country_code\": \"93\"}', 6143, NULL, '3.7', 'km', NULL, 'razorpay', 44.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-21 12:55:00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2025-04-12 10:31:40', '2025-04-14 10:31:40', NULL),
(26, 100026, NULL, 39, 1, 3, 3, 2, NULL, '{\"id\": 39, \"name\": \"Ryan Rivera\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"ryan.rivera@riderexample.com\", \"phone\": 2045550324, \"status\": 1, \"location\": null, \"username\": null, \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T07:59:11.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 1, \"profile_image\": null, \"referral_code\": null, \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Mount Vesuvius, Ottaviano, Metropolitan City of Naples, Italy\", \"Piazza del Duomo, Florence, Metropolitan City of Florence, Italy\"]', '[{\"lat\": \"40.82238299999999\", \"lng\": \"14.4289058\"}, {\"lat\": \"43.7734385\", \"lng\": \"11.2565501\"}]', '{\"name\": null, \"phone\": null, \"country_code\": \"93\"}', 6014, NULL, '20', 'km', NULL, 'midtrans', 540, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A ride booking package offers a set duration and distance at a fixed price for convenient, pre-defined transportation services.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2025-04-14 10:31:40', '2025-04-14 10:31:40', NULL),
(27, 100027, NULL, 40, 1, 4, 5, NULL, NULL, '{\"id\": 40, \"name\": \"Kaitlyn Coleman\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"kaitlyn.coleman@riderexample.com\", \"phone\": 2045550325, \"status\": 1, \"location\": null, \"username\": \"kaitlyncoleman\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T08:00:12.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 40, \"profile_image\": null, \"referral_code\": \"rTvPxBvW0Y\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Griffith Observatory, 2800 E Observatory Rd, Los Angeles, California, USA\", \"Downtown, Los Angeles, California, USA\"]', '[{\"lat\": \"34.1184341\", \"lng\": \"-118.3003935\"}, {\"lat\": \"34.055691\", \"lng\": \"-118.2487702\"}]', '{\"name\": null, \"phone\": null, \"country_code\": \"93\"}', 3535, NULL, '13.8', 'km', NULL, 'razorpay', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-01 04:27:00', '2025-05-03 04:27:00', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, '2025-04-14 10:31:40', '2025-04-14 10:31:40', NULL),
(28, 100028, NULL, 37, 1, 4, 1, NULL, NULL, '{\"id\": 37, \"name\": \"Kimberly Ward\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"kimberly.ward@riderexample.com\", \"phone\": 2045550321, \"status\": 1, \"location\": null, \"username\": \"kimberlyward\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T07:57:58.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 37, \"profile_image\": null, \"referral_code\": \"3S1OV1QVa0\", \"reviews_count\": 1, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Caminito la boca, Palos, Buenos Aires, Argentina\", \"Palermo Soho, Palermo, Buenos Aires, Argentina\", \"San Telmo, Buenos Aires, Argentina\"]', '[{\"lat\": \"-34.6374404\", \"lng\": \"-58.3610809\"}, {\"lat\": \"-34.5873739\", \"lng\": \"-58.428162\"}, {\"lat\": \"-34.6218351\", \"lng\": \"-58.3713942\"}]', '{\"name\": null, \"phone\": null, \"country_code\": \"93\"}', 2443, NULL, '3.1', 'km', NULL, 'flutterwave', 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2025-04-14 10:31:40', '2025-04-14 10:31:40', NULL),
(29, 100029, NULL, 41, 2, 7, 1, NULL, NULL, '{\"id\": 41, \"name\": \"Abigail Butler\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"abigail.butler@example.com\", \"phone\": 2045550319, \"status\": 1, \"location\": null, \"username\": \"abigailbutler\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T08:33:21.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 41, \"profile_image\": null, \"referral_code\": \"BDv49fjFga\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Tulum, Quintana Roo, Mexico\", \"Guadalajara, Jalisco, Mexico\"]', '[{\"lat\": \"20.2114185\", \"lng\": \"-87.46535019999999\"}, {\"lat\": \"20.6751707\", \"lng\": \"-103.3473385\"}]', '{\"name\": \"Juan Pérez\", \"phone\": \"15512345678\", \"country_code\": \"52\"}', 6350, NULL, '2', 'km', '5', 'bkash', 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2025-04-14 10:31:40', '2025-04-14 10:31:40', NULL),
(30, 100030, NULL, 12, 1, 4, 5, NULL, NULL, '{\"id\": 12, \"name\": \"Ben Taylor\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"ben.rider@example.com\", \"phone\": 2055550307, \"status\": 1, \"location\": null, \"username\": null, \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:03:42.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 1, \"profile_image\": null, \"referral_code\": null, \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Clear Mountain Road, Clear Mountain Queensland, Australia\", \"Kingston Road, Kingston Queensland, Australia\"]', '[{\"lat\": \"-27.3099486\", \"lng\": \"152.8966965\"}, {\"lat\": \"-27.6631531\", \"lng\": \"153.1187858\"}]', '{\"name\": null, \"phone\": null, \"country_code\": \"93\"}', 6987, NULL, '55.6', 'km', NULL, 'sslcommerz', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Book your ride for a smooth, comfortable journey with a professional driver. Choose from a variety of vehicles based on your needs, whether it\'s a quick trip across town or a longer journey. Enjoy safe, reliable, and timely service tailored to your preferences.', '2025-03-05 04:39:00', '2025-03-08 04:39:00', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, '2025-04-14 10:31:40', '2025-04-14 10:31:40', NULL),
(31, 100033, NULL, 10, 3, 10, 1, NULL, NULL, '{\"id\": 10, \"name\": \"Matt Miller\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"matt.rider@example.com\", \"phone\": 2055550305, \"status\": 1, \"location\": null, \"username\": \"mattrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:02:09.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 10, \"profile_image\": null, \"referral_code\": \"18peXDdqL6\", \"reviews_count\": 1, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"CN Tower, 301 Front St W, Toronto, ON, Canada\", \"Royal Ontario Museum, 100 Queens Park, Toronto, ON, Canada\", \"Yonge St, Toronto, ON, Canada\"]', '[{\"lat\": \"43.6428757\", \"lng\": \"-79.3873393\"}, {\"lat\": \"43.6677097\", \"lng\": \"-79.3947771\"}, {\"lat\": \"43.7485953\", \"lng\": \"-79.40776369999999\"}]', '{\"name\": null, \"phone\": null, \"country_code\": \"93\"}', 3908, NULL, '26', 'km', NULL, 'razorpay', 1950, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2025-04-14 10:31:40', '2025-04-14 10:31:40', NULL),
(32, 100031, NULL, 37, 1, 2, 4, NULL, NULL, '{\"id\": 37, \"name\": \"Kimberly Ward\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"kimberly.ward@riderexample.com\", \"phone\": 2045550321, \"status\": 1, \"location\": null, \"username\": \"kimberlyward\", \"fcm_token\": null, \"is_online\": null, \"created_at\": \"2025-01-23T07:57:58.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 37, \"profile_image\": null, \"referral_code\": \"3S1OV1QVa0\", \"reviews_count\": 1, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Eaton Centre, 220 Yonge St, Toronto, ON, Canada\", \"Kensington Market, Nassau Street, Toronto, ON, Canada\"]', '[{\"lat\": \"43.6544382\", \"lng\": \"-79.3806994\"}, {\"lat\": \"43.65510380000001\", \"lng\": \"-79.4034981\"}]', '{\"name\": null, \"phone\": null, \"country_code\": \"93\"}', 5562, NULL, '2.8', 'km', NULL, 'sslcommerz', 33.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-09 04:46:00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(34, NULL, NULL, 9, 1, 3, 1, NULL, NULL, '{\"id\": 9, \"name\": \"Eric Parker\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 1, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"eric.rider@example.com\", \"phone\": 2055550304, \"status\": 1, \"location\": null, \"username\": \"ericrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T06:01:42.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 0, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 9, \"profile_image\": null, \"referral_code\": \"a2Dm47O3uW\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 0, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Hoboken, New Jersey, USA\", \"Manhattan, New York, USA\", \"Jersey City, New Jersey, USA\"]', '[{\"lat\": \"40.81794642341028\", \"lng\": \"-74.05756897701521\"}, {\"lat\": \"40.7831\", \"lng\": \"-73.9712\"}, {\"lat\": \"40.7178\", \"lng\": \"-74.0434\"}]', NULL, 6336, NULL, '30', 'mile', NULL, 'cash', 750, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 9, '2025-02-18 04:26:12', '2025-02-18 04:29:53', '2025-02-18 04:29:53'),
(35, NULL, NULL, 3, 1, 3, 1, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Adajan, Surat, Gujarat, India\", \"Katargam, Surat, Gujarat, India\"]', '[{\"lat\": \"21.1959098\", \"lng\": \"72.79330209999999\"}, {\"lat\": \"21.2266205\", \"lng\": \"72.8312383\"}]', '{\"name\": null, \"phone\": null, \"country_code\": null}', 6664, NULL, '6.869', 'km', NULL, 'cash', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'undefined', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 3, '2025-03-20 02:23:36', '2025-03-20 02:24:22', '2025-03-20 02:24:22'),
(36, 100036, NULL, 3, 1, 3, 1, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Adajan, Surat, Gujarat, India\", \"Surat, Ved Road, Fatakdawadi, Industrial Area, Katargam, Surat, Gujarat, India\"]', '[{\"lat\": \"21.1959098\", \"lng\": \"72.79330209999999\"}, {\"lat\": \"21.2115471\", \"lng\": \"72.8229022\"}]', '{\"name\": null, \"phone\": null, \"country_code\": null}', 8922, NULL, '4.891', 'km', NULL, 'cash', 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'undefined', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2025-04-14 10:31:40', '2025-04-14 10:31:40', NULL),
(37, 100037, NULL, 3, 1, 3, 1, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Adajan, Surat, Gujarat, India\", \"Surat, Ved Road, Fatakdawadi, Industrial Area, Katargam, Surat, Gujarat, India\"]', '[{\"lat\": \"21.1959098\", \"lng\": \"72.79330209999999\"}, {\"lat\": \"21.2115471\", \"lng\": \"72.8229022\"}]', '{\"name\": null, \"phone\": null, \"country_code\": null}', 3453, NULL, '4.891', 'km', NULL, 'cash', 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'undefined', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2025-04-14 10:31:40', '2025-04-14 10:31:40', NULL),
(38, NULL, NULL, 3, 1, 3, 1, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Adajan, Surat, Gujarat, India\", \"Katargam, Surat, Gujarat, India\"]', '[{\"lat\": \"21.1959098\", \"lng\": \"72.79330209999999\"}, {\"lat\": \"21.2266205\", \"lng\": \"72.8312383\"}]', '{\"name\": null, \"phone\": null, \"country_code\": null}', 3994, NULL, '6.869', 'km', NULL, 'cash', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'undefined', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 3, '2025-03-20 03:48:51', '2025-03-20 03:51:11', '2025-03-20 03:51:11'),
(39, NULL, NULL, 3, 2, 3, 1, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Surat, Gujarat, India\", \"Mumbai, Maharashtra, India\"]', '[{\"lat\": \"21.1702401\", \"lng\": \"72.83106070000001\"}, {\"lat\": \"19.0759837\", \"lng\": \"72.8776559\"}]', '{\"name\": null, \"phone\": null, \"country_code\": null}', 1530, NULL, '282.477', 'km', NULL, 'cash', 4300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'undefined', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 3, '2025-03-20 03:53:15', '2025-03-20 03:54:26', '2025-03-20 03:54:26'),
(40, NULL, NULL, 3, 1, 3, 1, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Vesu, Surat, Gujarat, India\", \"Adajan, Surat, Gujarat, India\"]', '[{\"lat\": \"21.1417761\", \"lng\": \"72.77094149999999\"}, {\"lat\": \"21.1959098\", \"lng\": \"72.79330209999999\"}]', '{\"name\": null, \"phone\": null, \"country_code\": null}', 6454, NULL, '8.423', 'km', NULL, 'cash', 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'undefined', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 3, '2025-03-20 03:56:18', '2025-03-20 03:56:37', '2025-03-20 03:56:37'),
(41, NULL, NULL, 3, 1, 3, 1, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Adajan, Surat, Gujarat, India\", \"Kamrej, Gujarat, India\"]', '[{\"lat\": \"21.1959098\", \"lng\": \"72.79330209999999\"}, {\"lat\": \"21.2695241\", \"lng\": \"72.9576601\"}]', '{\"name\": null, \"phone\": null, \"country_code\": null}', 4875, NULL, '20.743', 'km', NULL, 'cash', 315, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'undefined', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 3, '2025-03-20 04:05:21', '2025-03-20 04:05:35', '2025-03-20 04:05:35'),
(42, NULL, NULL, 3, 1, 3, 1, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Adajan, Surat, Gujarat, India\", \"Kamrej, Gujarat, India\"]', '[{\"lat\": \"21.1959098\", \"lng\": \"72.79330209999999\"}, {\"lat\": \"21.2695241\", \"lng\": \"72.9576601\"}]', '{\"name\": null, \"phone\": null, \"country_code\": null}', 1441, NULL, '20.743', 'km', NULL, 'cash', 312, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'undefined', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 3, '2025-03-20 04:06:50', '2025-03-20 04:07:05', '2025-03-20 04:07:05'),
(43, 100043, NULL, 3, 1, 3, 1, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Adajan, Surat, Gujarat, India\", \"Mota Varachha, Surat, Gujarat, India\"]', '[{\"lat\": \"21.1959098\", \"lng\": \"72.79330209999999\"}, {\"lat\": \"21.2408267\", \"lng\": \"72.8806069\"}]', '{\"name\": null, \"phone\": null, \"country_code\": null}', 8510, NULL, '13.322', 'km', NULL, 'cash', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'undefined', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2025-04-14 10:31:40', '2025-04-14 10:31:40', NULL),
(44, NULL, NULL, 3, 1, 3, 1, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Adajan, Surat, Gujarat, India\", \"Mota Varachha, Surat, Gujarat, India\"]', '[{\"lat\": \"21.1959098\", \"lng\": \"72.79330209999999\"}, {\"lat\": \"21.2408267\", \"lng\": \"72.8806069\"}]', '{\"name\": null, \"phone\": null, \"country_code\": null}', 3166, NULL, '13.322', 'km', NULL, 'cash', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'undefined', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 3, '2025-03-20 04:10:36', '2025-03-20 04:10:56', '2025-03-20 04:10:56');
INSERT INTO `ride_requests` (`id`, `ride_number`, `ambulance_id`, `rider_id`, `service_id`, `vehicle_type_id`, `service_category_id`, `hourly_package_id`, `cargo_image_id`, `rider`, `locations`, `location_coordinates`, `parcel_receiver`, `parcel_delivered_otp`, `duration`, `distance`, `distance_unit`, `weight`, `payment_method`, `ride_fare`, `additional_distance_charge`, `additional_minute_charge`, `additional_weight_charge`, `tax`, `commission`, `driver_commission`, `bid_extra_amount`, `platform_fee`, `sub_total`, `total`, `currency_symbol`, `description`, `start_time`, `end_time`, `no_of_days`, `driver_per_day_charge`, `vehicle_per_day_charge`, `driver_rent`, `vehicle_rent`, `is_with_driver`, `rental_vehicle_id`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(45, NULL, NULL, 3, 1, 3, 1, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"role\": {\"id\": 3, \"name\": \"rider\", \"module\": 16, \"status\": 1, \"guard_name\": \"web\", \"system_reserve\": 1}, \"email\": \"rider@example.com\", \"phone\": 123456789, \"status\": 1, \"location\": null, \"username\": \"johnrider\", \"fcm_token\": null, \"is_online\": 1, \"created_at\": \"2025-01-23T07:43:06.000000Z\", \"is_on_ride\": null, \"service_id\": null, \"is_verified\": 1, \"country_code\": \"1\", \"rating_count\": 0, \"created_by_id\": 3, \"profile_image\": null, \"referral_code\": \"epotrhwJme\", \"reviews_count\": 0, \"referred_by_id\": null, \"system_reserve\": 1, \"profile_image_id\": null, \"email_verified_at\": null, \"service_category_id\": null}', '[\"Adajan, Surat, Gujarat, India\", \"Katargam, Surat, Gujarat, India\"]', '[{\"lat\": \"21.1959098\", \"lng\": \"72.79330209999999\"}, {\"lat\": \"21.2266205\", \"lng\": \"72.8312383\"}]', '{\"name\": null, \"phone\": null, \"country_code\": null}', 5186, NULL, '6.869', 'km', NULL, 'cash', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'undefined', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 3, '2025-03-20 04:14:42', '2025-03-20 04:14:57', '2025-03-20 04:14:57'),
(60, 100060, NULL, 3, 1, 1, 4, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"email\": \"rider@example.com\", \"phone\": 123456789, \"country_code\": \"1\"}', '[\"Alhambra, California, USA\", \"San Gabriel, California, USA\", \"East Los Angeles, California, USA\"]', '[{\"lat\": \"34.090009\", \"lng\": \"-118.128003\"}, {\"lat\": \"34.096201\", \"lng\": \"-118.105825\"}, {\"lat\": \"34.033190\", \"lng\": \"-118.154708\"}]', NULL, 7770, NULL, '7', 'km', NULL, 'cash', 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 3, '2025-04-28 05:29:41', '2025-04-28 05:29:41', NULL),
(61, 100061, NULL, 12, 4, NULL, NULL, NULL, NULL, '{\"id\": 12, \"name\": \"Ben Taylor\", \"email\": \"ben.rider@example.com\", \"phone\": 2055550307, \"country_code\": \"1\"}', '[\"East Williamsburg, Brooklyn, NY, USA\"]', '[{\"lat\": \"40.7141953\", \"lng\": \"-73.9316461\"}]', '{\"name\": null, \"phone\": null, \"country_code\": \"93\"}', 5584, NULL, '7.9', 'km', NULL, 'paypal', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ambulance ride provides safe and timely medical transport with essential care during emergencies.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, '2025-04-29 04:08:42', '2025-04-29 04:08:42', NULL),
(62, NULL, NULL, 3, 1, 1, 4, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"email\": \"rider@example.com\", \"phone\": 123456789, \"country_code\": \"1\"}', '[\"Times Square, Manhattan, New York, NY 10036, USA\", \"409, Anand Mahal Rd, above SBI bank, Opposite Center Point, Giriraj Society, Adajan, Surat, Gujarat 395009, India\', \'Katargam, Surat, Gujarat, India\"]', '[{\"lat\": \"21.2028\", \"lng\": \"72.7956\"}]', NULL, 4368, NULL, '6.639', 'km', NULL, 'cash', 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 3, '2025-04-29 06:45:02', '2025-04-29 06:46:30', '2025-04-29 06:46:30'),
(63, NULL, NULL, 3, 1, 3, 2, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"email\": \"rider@example.com\", \"phone\": 123456789, \"country_code\": \"1\"}', '[\"Times Square, Manhattan, New York, NY 10036, USA\", \"409, Anand Mahal Rd, above SBI bank, Opposite Center Point, Giriraj Society, Adajan, Surat, Gujarat 395009, India\', \'Katargam, Surat, Gujarat, India\"]', '[{\"lat\": \"21.2028\", \"lng\": \"72.7956\"}]', NULL, 4977, NULL, '6.639', 'km', NULL, 'cash', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 3, '2025-04-29 07:04:23', '2025-04-29 07:04:38', '2025-04-29 07:04:38'),
(64, NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"email\": \"rider@example.com\", \"phone\": 123456789, \"country_code\": \"1\"}', '[\"Downtown Brooklyn, New York, USA\"]', '[{\"lat\": \"40.695721\", \"lng\": \"-73.985941\"}]', NULL, NULL, NULL, '3', 'km', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 3, '2025-04-29 23:32:00', '2025-04-29 23:32:39', '2025-04-29 23:32:39'),
(65, NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, '{\"id\": 3, \"name\": \"John Due\", \"email\": \"rider@example.com\", \"phone\": 123456789, \"country_code\": \"1\"}', '[\"Bradenton, Florida, USA\"]', '[{\"lat\": \"27.432395\", \"lng\": \"-82.731577\"}]', NULL, NULL, NULL, '11.7', 'km', NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 3, '2025-04-29 23:41:45', '2025-04-29 23:42:23', '2025-04-29 23:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `ride_request_drivers`
--

CREATE TABLE `ride_request_drivers` (
  `id` bigint UNSIGNED NOT NULL,
  `ride_request_id` bigint UNSIGNED DEFAULT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ride_request_drivers`
--

INSERT INTO `ride_request_drivers` (`id`, `ride_request_id`, `driver_id`) VALUES
(27, 1, 25),
(28, 2, 25),
(29, 4, 30),
(30, 5, 30),
(32, 6, 30),
(34, 8, 26),
(35, 9, 26),
(36, 11, 28),
(37, 12, 27),
(38, 13, 28),
(39, 15, 21),
(40, 16, 18),
(42, 17, 21),
(43, 18, 17),
(45, 19, 18),
(46, 22, 18),
(48, 34, 25),
(51, 37, 31),
(52, 37, 25),
(59, 41, 25),
(60, 41, 31),
(61, 42, 25),
(62, 42, 31),
(64, 44, 25),
(65, 44, 31),
(68, 62, 36),
(69, 63, 31),
(70, 63, 25),
(71, 64, 36),
(72, 65, 65);

-- --------------------------------------------------------

--
-- Table structure for table `ride_request_zones`
--

CREATE TABLE `ride_request_zones` (
  `id` bigint UNSIGNED NOT NULL,
  `ride_request_id` bigint UNSIGNED DEFAULT NULL,
  `zone_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ride_request_zones`
--

INSERT INTO `ride_request_zones` (`id`, `ride_request_id`, `zone_id`) VALUES
(1, 35, 1),
(2, 36, 1),
(3, 37, 1),
(4, 38, 1),
(5, 39, 1),
(6, 40, 1),
(7, 41, 1),
(8, 42, 1),
(9, 43, 1),
(10, 44, 1),
(11, 45, 1),
(12, 60, 1),
(13, 62, 1),
(14, 63, 1),
(15, 64, 1),
(16, 65, 1),
(17, 18, 1),
(18, 24, 1),
(19, 12, 1),
(20, 34, 1),
(21, 11, 1),
(22, 31, 1),
(23, 8, 1),
(24, 9, 1),
(25, 16, 1),
(26, 30, 1),
(27, 61, 1),
(28, 1, 1),
(29, 2, 1),
(30, 15, 1),
(31, 23, 1),
(32, 25, 1),
(33, 13, 1),
(34, 17, 1),
(35, 28, 1),
(36, 32, 1),
(37, 26, 1),
(38, 4, 1),
(39, 27, 1),
(40, 19, 1),
(41, 29, 1),
(42, 5, 1),
(43, 6, 1),
(44, 22, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ride_status`
--

CREATE TABLE `ride_status` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` int DEFAULT NULL,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `system_reserve` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ride_status`
--

INSERT INTO `ride_status` (`id`, `name`, `slug`, `color`, `sequence`, `created_by_id`, `status`, `system_reserve`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Requested', 'requested', NULL, 1, NULL, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(2, 'Scheduled', 'scheduled', NULL, 2, NULL, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(3, 'Accepted', 'accepted', NULL, 3, NULL, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(4, 'Rejected', 'rejected', NULL, 4, NULL, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(5, 'Arrived', 'arrived', NULL, 5, NULL, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(6, 'Started', 'started', NULL, 6, NULL, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(7, 'Cancelled', 'cancelled', NULL, 7, NULL, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(8, 'Completed', 'completed', NULL, 8, NULL, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ride_status_activities`
--

CREATE TABLE `ride_status_activities` (
  `id` bigint UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ride_id` bigint UNSIGNED DEFAULT NULL,
  `ride_request_id` double DEFAULT NULL,
  `changed_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ride_status_activities`
--

INSERT INTO `ride_status_activities` (`id`, `status`, `ride_id`, `ride_request_id`, `changed_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(88, 'Requested', 1, NULL, '2025-01-29 07:39:04', '2025-01-29 02:09:04', '2025-01-29 02:09:04', NULL),
(89, 'Scheduled', 1, NULL, '2025-01-29 07:39:04', '2025-01-29 02:09:04', '2025-01-29 02:09:04', NULL),
(90, 'Accepted', 1, NULL, '2025-01-29 07:39:04', '2025-01-29 02:09:04', '2025-01-29 02:09:04', NULL),
(91, 'Requested', 2, NULL, '2025-01-29 08:10:34', '2025-01-29 02:40:34', '2025-01-29 02:40:34', NULL),
(92, 'Scheduled', 2, NULL, '2025-01-29 08:10:34', '2025-01-29 02:40:34', '2025-01-29 02:40:34', NULL),
(93, 'Accepted', 2, NULL, '2025-01-29 08:10:34', '2025-01-29 02:40:34', '2025-01-29 02:40:34', NULL),
(94, 'Requested', 3, NULL, '2025-01-29 09:04:06', '2025-01-29 03:34:06', '2025-01-29 03:34:06', NULL),
(95, 'Scheduled', 3, NULL, '2025-01-29 09:04:06', '2025-01-29 03:34:06', '2025-01-29 03:34:06', NULL),
(96, 'Accepted', 3, NULL, '2025-01-29 09:04:06', '2025-01-29 03:34:06', '2025-01-29 03:34:06', NULL),
(97, 'Requested', 4, NULL, '2025-01-29 09:19:30', '2025-01-29 03:49:30', '2025-01-29 03:49:30', NULL),
(98, 'Scheduled', 4, NULL, '2025-01-29 09:19:30', '2025-01-29 03:49:30', '2025-01-29 03:49:30', NULL),
(99, 'Accepted', 4, NULL, '2025-01-29 09:19:30', '2025-01-29 03:49:30', '2025-01-29 03:49:30', NULL),
(100, 'Requested', 5, NULL, '2025-01-29 10:03:53', '2025-01-29 04:07:11', '2025-01-29 04:35:11', NULL),
(101, 'Scheduled', 5, NULL, '2025-01-29 10:03:53', '2025-01-29 04:07:11', '2025-01-29 04:35:11', NULL),
(102, 'Accepted', 5, NULL, '2025-01-29 10:03:53', '2025-01-29 04:07:11', '2025-01-29 04:35:11', NULL),
(103, 'Rejected', 5, NULL, '2025-01-29 10:03:53', '2025-01-29 04:13:29', '2025-01-29 04:35:11', NULL),
(104, 'Arrived', 5, NULL, '2025-01-29 10:03:53', '2025-01-29 04:13:29', '2025-01-29 04:35:11', NULL),
(105, 'Started', 5, NULL, '2025-01-29 10:03:53', '2025-01-29 04:13:29', '2025-01-29 04:35:11', NULL),
(106, 'Completed', 5, NULL, '2025-01-29 10:03:53', '2025-01-29 04:33:53', '2025-01-29 04:35:11', NULL),
(107, 'Requested', 6, NULL, '2025-01-29 12:28:02', '2025-01-29 06:58:02', '2025-01-29 06:58:02', NULL),
(108, 'Scheduled', 6, NULL, '2025-01-29 12:28:02', '2025-01-29 06:58:02', '2025-01-29 06:58:02', NULL),
(109, 'Accepted', 6, NULL, '2025-01-29 12:28:02', '2025-01-29 06:58:02', '2025-01-29 06:58:02', NULL),
(110, 'Requested', 7, NULL, '2025-01-29 12:42:31', '2025-01-29 07:12:31', '2025-01-29 07:12:31', NULL),
(111, 'Scheduled', 7, NULL, '2025-01-29 12:42:31', '2025-01-29 07:12:31', '2025-01-29 07:12:31', NULL),
(112, 'Accepted', 7, NULL, '2025-01-29 12:42:31', '2025-01-29 07:12:31', '2025-01-29 07:12:31', NULL),
(113, 'Requested', 8, NULL, '2025-01-30 04:26:47', '2025-01-29 22:56:47', '2025-01-29 22:56:47', NULL),
(114, 'Scheduled', 8, NULL, '2025-01-30 04:26:47', '2025-01-29 22:56:47', '2025-01-29 22:56:47', NULL),
(115, 'Accepted', 8, NULL, '2025-01-30 04:26:47', '2025-01-29 22:56:47', '2025-01-29 22:56:47', NULL),
(116, 'Requested', 9, NULL, '2025-01-30 05:07:10', '2025-01-29 23:37:10', '2025-01-29 23:37:10', NULL),
(117, 'Scheduled', 9, NULL, '2025-01-30 05:07:10', '2025-01-29 23:37:10', '2025-01-29 23:37:10', NULL),
(118, 'Accepted', 9, NULL, '2025-01-30 05:07:10', '2025-01-29 23:37:10', '2025-01-29 23:37:10', NULL),
(119, 'Requested', 10, NULL, '2025-01-30 05:21:38', '2025-01-29 23:51:38', '2025-01-29 23:51:38', NULL),
(120, 'Scheduled', 10, NULL, '2025-01-30 05:21:38', '2025-01-29 23:51:38', '2025-01-29 23:51:38', NULL),
(121, 'Accepted', 10, NULL, '2025-01-30 05:21:38', '2025-01-29 23:51:38', '2025-01-29 23:51:38', NULL),
(122, 'Requested', 11, NULL, '2025-01-30 05:55:19', '2025-01-30 00:25:19', '2025-01-30 00:25:19', NULL),
(123, 'Scheduled', 11, NULL, '2025-01-30 05:55:19', '2025-01-30 00:25:19', '2025-01-30 00:25:19', NULL),
(124, 'Accepted', 11, NULL, '2025-01-30 05:55:19', '2025-01-30 00:25:19', '2025-01-30 00:25:19', NULL),
(125, 'Requested', 12, NULL, '2025-01-30 06:13:46', '2025-01-30 00:43:46', '2025-01-30 00:43:46', NULL),
(126, 'Scheduled', 12, NULL, '2025-01-30 06:13:46', '2025-01-30 00:43:46', '2025-01-30 00:43:46', NULL),
(127, 'Accepted', 12, NULL, '2025-01-30 06:13:46', '2025-01-30 00:43:46', '2025-01-30 00:43:46', NULL),
(131, 'Requested', 13, NULL, '2025-01-30 06:57:01', '2025-01-30 01:27:01', '2025-01-30 01:27:01', NULL),
(132, 'Scheduled', 13, NULL, '2025-01-30 06:57:01', '2025-01-30 01:27:01', '2025-01-30 01:27:01', NULL),
(133, 'Accepted', 13, NULL, '2025-01-30 06:57:01', '2025-01-30 01:27:01', '2025-01-30 01:27:01', NULL),
(134, 'Requested', 14, NULL, '2025-01-30 10:13:44', '2025-01-30 04:29:34', '2025-01-30 04:43:44', NULL),
(135, 'Scheduled', 14, NULL, '2025-01-30 10:13:44', '2025-01-30 04:29:34', '2025-01-30 04:43:44', NULL),
(136, 'Accepted', 14, NULL, '2025-01-30 10:13:44', '2025-01-30 04:29:34', '2025-01-30 04:43:44', NULL),
(137, 'Rejected', 14, NULL, '2025-01-30 10:13:44', '2025-01-30 04:43:44', '2025-01-30 04:43:44', NULL),
(138, 'Arrived', 14, NULL, '2025-01-30 10:13:44', '2025-01-30 04:43:45', '2025-01-30 04:43:45', NULL),
(139, 'Started', 14, NULL, '2025-01-30 10:13:44', '2025-01-30 04:43:45', '2025-01-30 04:43:45', NULL),
(140, 'Requested', 15, NULL, '2025-01-30 11:59:16', '2025-01-30 06:26:41', '2025-01-30 06:29:16', NULL),
(141, 'Scheduled', 15, NULL, '2025-01-30 11:59:16', '2025-01-30 06:26:41', '2025-01-30 06:29:16', NULL),
(142, 'Accepted', 15, NULL, '2025-01-30 11:59:16', '2025-01-30 06:26:41', '2025-01-30 06:29:16', NULL),
(143, 'Rejected', 15, NULL, '2025-01-30 11:59:16', '2025-01-30 06:29:16', '2025-01-30 06:29:16', NULL),
(144, 'Arrived', 15, NULL, '2025-01-30 11:59:16', '2025-01-30 06:29:16', '2025-01-30 06:29:16', NULL),
(145, 'Started', 15, NULL, '2025-01-30 11:59:16', '2025-01-30 06:29:16', '2025-01-30 06:29:16', NULL),
(146, 'Cancelled', 15, NULL, '2025-01-30 11:59:16', '2025-01-30 06:29:16', '2025-01-30 06:29:16', NULL),
(147, 'Requested', 16, NULL, '2025-01-30 12:17:45', '2025-01-30 06:46:48', '2025-01-30 06:47:45', NULL),
(148, 'Scheduled', 16, NULL, '2025-01-30 12:17:45', '2025-01-30 06:46:48', '2025-01-30 06:47:45', NULL),
(149, 'Accepted', 16, NULL, '2025-01-30 12:17:45', '2025-01-30 06:46:48', '2025-01-30 06:47:45', NULL),
(150, 'Rejected', 16, NULL, '2025-01-30 12:17:45', '2025-01-30 06:47:45', '2025-01-30 06:47:45', NULL),
(151, 'Arrived', 16, NULL, '2025-01-30 12:17:45', '2025-01-30 06:47:45', '2025-01-30 06:47:45', NULL),
(152, 'Started', 16, NULL, '2025-01-30 12:17:45', '2025-01-30 06:47:45', '2025-01-30 06:47:45', NULL),
(153, 'Cancelled', 16, NULL, '2025-01-30 12:17:45', '2025-01-30 06:47:45', '2025-01-30 06:47:45', NULL),
(157, 'Requested', 18, NULL, '2025-02-18 10:02:58', '2025-02-18 04:29:53', '2025-02-18 04:32:58', NULL),
(158, 'Scheduled', 18, NULL, '2025-02-18 10:02:58', '2025-02-18 04:29:53', '2025-02-18 04:32:58', NULL),
(159, 'Accepted', 18, NULL, '2025-02-18 10:02:58', '2025-02-18 04:29:53', '2025-02-18 04:32:58', NULL),
(160, 'Rejected', 18, NULL, '2025-02-18 10:02:58', '2025-02-18 04:32:58', '2025-02-18 04:32:58', NULL),
(161, 'Arrived', 18, NULL, '2025-02-18 10:02:58', '2025-02-18 04:32:58', '2025-02-18 04:32:58', NULL),
(162, 'Started', 18, NULL, '2025-02-18 10:02:58', '2025-02-18 04:32:58', '2025-02-18 04:32:58', NULL),
(163, 'Requested', 19, NULL, '2025-03-20 10:42:51', '2025-03-20 02:24:22', '2025-03-20 02:42:57', NULL),
(164, 'Scheduled', 19, NULL, '2025-03-20 10:42:51', '2025-03-20 02:24:22', '2025-03-20 02:42:57', NULL),
(165, 'Accepted', 19, NULL, '2025-03-20 10:42:51', '2025-03-20 02:24:22', '2025-03-20 02:42:57', NULL),
(166, 'Rejected', 19, NULL, '2025-03-20 10:42:51', '2025-03-20 02:41:07', '2025-03-20 02:42:57', NULL),
(167, 'Arrived', 19, NULL, '2025-03-20 10:42:51', '2025-03-20 02:41:07', '2025-03-20 02:42:57', NULL),
(168, 'Started', 19, NULL, '2025-03-20 10:42:51', '2025-03-20 02:41:07', '2025-03-20 02:42:57', NULL),
(169, 'Completed', 19, NULL, '2025-03-20 10:42:51', '2025-03-20 02:42:52', '2025-03-20 02:42:57', NULL),
(170, 'Requested', 20, NULL, '2025-03-20 11:51:30', '2025-03-20 03:51:11', '2025-03-20 03:51:31', NULL),
(171, 'Scheduled', 20, NULL, '2025-03-20 11:51:30', '2025-03-20 03:51:11', '2025-03-20 03:51:31', NULL),
(172, 'Accepted', 20, NULL, '2025-03-20 11:51:30', '2025-03-20 03:51:11', '2025-03-20 03:51:31', NULL),
(173, 'Rejected', 20, NULL, '2025-03-20 11:51:30', '2025-03-20 03:51:31', '2025-03-20 03:51:31', NULL),
(174, 'Arrived', 20, NULL, '2025-03-20 11:51:30', '2025-03-20 03:51:31', '2025-03-20 03:51:31', NULL),
(175, 'Started', 20, NULL, '2025-03-20 11:51:30', '2025-03-20 03:51:31', '2025-03-20 03:51:31', NULL),
(176, 'Cancelled', 20, NULL, '2025-03-20 11:51:30', '2025-03-20 03:51:31', '2025-03-20 03:51:31', NULL),
(177, 'Requested', 21, NULL, '2025-03-20 11:54:53', '2025-03-20 03:54:26', '2025-03-20 03:54:54', NULL),
(178, 'Scheduled', 21, NULL, '2025-03-20 11:54:53', '2025-03-20 03:54:26', '2025-03-20 03:54:54', NULL),
(179, 'Accepted', 21, NULL, '2025-03-20 11:54:53', '2025-03-20 03:54:26', '2025-03-20 03:54:54', NULL),
(180, 'Rejected', 21, NULL, '2025-03-20 11:54:53', '2025-03-20 03:54:54', '2025-03-20 03:54:54', NULL),
(181, 'Arrived', 21, NULL, '2025-03-20 11:54:53', '2025-03-20 03:54:54', '2025-03-20 03:54:54', NULL),
(182, 'Started', 21, NULL, '2025-03-20 11:54:53', '2025-03-20 03:54:54', '2025-03-20 03:54:54', NULL),
(183, 'Cancelled', 21, NULL, '2025-03-20 11:54:53', '2025-03-20 03:54:54', '2025-03-20 03:54:54', NULL),
(184, 'Requested', 22, NULL, '2025-03-20 11:56:37', '2025-03-20 03:56:37', '2025-03-20 03:56:37', NULL),
(185, 'Scheduled', 22, NULL, '2025-03-20 11:56:37', '2025-03-20 03:56:37', '2025-03-20 03:56:37', NULL),
(186, 'Accepted', 22, NULL, '2025-03-20 11:56:37', '2025-03-20 03:56:37', '2025-03-20 03:56:37', NULL),
(187, 'Requested', 23, NULL, '2025-03-20 12:06:19', '2025-03-20 04:05:35', '2025-03-20 04:06:19', NULL),
(188, 'Scheduled', 23, NULL, '2025-03-20 12:06:19', '2025-03-20 04:05:35', '2025-03-20 04:06:19', NULL),
(189, 'Accepted', 23, NULL, '2025-03-20 12:06:19', '2025-03-20 04:05:35', '2025-03-20 04:06:19', NULL),
(190, 'Rejected', 23, NULL, '2025-03-20 12:06:19', '2025-03-20 04:06:19', '2025-03-20 04:06:19', NULL),
(191, 'Arrived', 23, NULL, '2025-03-20 12:06:19', '2025-03-20 04:06:19', '2025-03-20 04:06:19', NULL),
(192, 'Started', 23, NULL, '2025-03-20 12:06:19', '2025-03-20 04:06:19', '2025-03-20 04:06:19', NULL),
(193, 'Cancelled', 23, NULL, '2025-03-20 12:06:19', '2025-03-20 04:06:19', '2025-03-20 04:06:19', NULL),
(194, 'Requested', 24, NULL, '2025-03-20 12:07:52', '2025-03-20 04:07:05', '2025-03-20 04:07:54', NULL),
(195, 'Scheduled', 24, NULL, '2025-03-20 12:07:52', '2025-03-20 04:07:05', '2025-03-20 04:07:54', NULL),
(196, 'Accepted', 24, NULL, '2025-03-20 12:07:52', '2025-03-20 04:07:05', '2025-03-20 04:07:54', NULL),
(197, 'Rejected', 24, NULL, '2025-03-20 12:07:52', '2025-03-20 04:07:38', '2025-03-20 04:07:54', NULL),
(198, 'Arrived', 24, NULL, '2025-03-20 12:07:52', '2025-03-20 04:07:38', '2025-03-20 04:07:54', NULL),
(199, 'Started', 24, NULL, '2025-03-20 12:07:52', '2025-03-20 04:07:38', '2025-03-20 04:07:54', NULL),
(200, 'Completed', 24, NULL, '2025-03-20 12:07:52', '2025-03-20 04:07:52', '2025-03-20 04:07:54', NULL),
(201, 'Requested', 25, NULL, '2025-03-20 12:12:32', '2025-03-20 04:10:56', '2025-03-20 04:12:32', NULL),
(202, 'Scheduled', 25, NULL, '2025-03-20 12:12:32', '2025-03-20 04:10:56', '2025-03-20 04:12:32', NULL),
(203, 'Accepted', 25, NULL, '2025-03-20 12:12:32', '2025-03-20 04:10:56', '2025-03-20 04:12:32', NULL),
(204, 'Rejected', 25, NULL, '2025-03-20 12:12:32', '2025-03-20 04:11:40', '2025-03-20 04:12:32', NULL),
(205, 'Arrived', 25, NULL, '2025-03-20 12:12:32', '2025-03-20 04:11:40', '2025-03-20 04:12:32', NULL),
(206, 'Started', 25, NULL, '2025-03-20 12:12:32', '2025-03-20 04:11:40', '2025-03-20 04:12:32', NULL),
(207, 'Completed', 25, NULL, '2025-03-20 12:12:32', '2025-03-20 04:12:32', '2025-03-20 04:12:32', NULL),
(208, 'Requested', 26, NULL, '2025-03-20 12:15:39', '2025-03-20 04:14:57', '2025-03-20 04:15:39', NULL),
(209, 'Scheduled', 26, NULL, '2025-03-20 12:15:39', '2025-03-20 04:14:57', '2025-03-20 04:15:39', NULL),
(210, 'Accepted', 26, NULL, '2025-03-20 12:15:39', '2025-03-20 04:14:57', '2025-03-20 04:15:39', NULL),
(211, 'Rejected', 26, NULL, '2025-03-20 12:15:39', '2025-03-20 04:15:23', '2025-03-20 04:15:39', NULL),
(212, 'Arrived', 26, NULL, '2025-03-20 12:15:39', '2025-03-20 04:15:23', '2025-03-20 04:15:39', NULL),
(213, 'Started', 26, NULL, '2025-03-20 12:15:39', '2025-03-20 04:15:23', '2025-03-20 04:15:39', NULL),
(214, 'Completed', 26, NULL, '2025-03-20 12:15:39', '2025-03-20 04:15:39', '2025-03-20 04:15:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ride_zones`
--

CREATE TABLE `ride_zones` (
  `id` bigint UNSIGNED NOT NULL,
  `ride_id` bigint UNSIGNED DEFAULT NULL,
  `zone_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ride_zones`
--

INSERT INTO `ride_zones` (`id`, `ride_id`, `zone_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 18, 1),
(18, 19, 1),
(19, 20, 1),
(20, 21, 1),
(21, 22, 1),
(22, 23, 1),
(23, 24, 1),
(24, 25, 1),
(25, 26, 1),
(26, 27, 1),
(27, 28, 1),
(28, 29, 1),
(29, 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_reserve` int NOT NULL DEFAULT '0',
  `module` bigint UNSIGNED DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `system_reserve`, `module`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', 1, NULL, 1, '2025-05-29 18:12:48', '2025-05-29 18:12:48'),
(2, 'user', 'web', 1, NULL, 1, '2025-05-29 18:12:48', '2025-05-29 18:12:48'),
(3, 'rider', 'web', 1, 18, 1, '2025-05-29 18:13:13', '2025-05-29 18:13:13'),
(4, 'driver', 'web', 1, 18, 1, '2025-05-29 18:13:13', '2025-05-29 18:13:13'),
(5, 'executive', 'web', 1, 19, 1, '2025-05-29 18:13:13', '2025-05-29 18:13:13'),
(6, 'dispatcher', 'web', 1, 18, 1, '2025-05-29 18:13:13', '2025-05-29 18:13:13'),
(7, 'fleet_manager', 'web', 1, 18, 1, '2025-05-29 18:13:27', '2025-05-29 18:13:27');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(21, 2),
(25, 2),
(31, 2),
(37, 2),
(43, 2),
(49, 2),
(55, 2),
(61, 2),
(106, 2),
(321, 2),
(322, 2),
(323, 2),
(324, 2),
(325, 2),
(326, 2),
(358, 2),
(364, 2),
(368, 2),
(112, 3),
(124, 3),
(136, 3),
(142, 3),
(148, 3),
(154, 3),
(178, 3),
(212, 3),
(216, 3),
(220, 3),
(221, 3),
(222, 3),
(223, 3),
(226, 3),
(227, 3),
(228, 3),
(253, 3),
(255, 3),
(260, 3),
(273, 3),
(279, 3),
(280, 3),
(284, 3),
(289, 3),
(295, 3),
(301, 3),
(316, 3),
(317, 3),
(318, 3),
(319, 3),
(320, 3),
(118, 4),
(120, 4),
(142, 4),
(148, 4),
(172, 4),
(178, 4),
(184, 4),
(185, 4),
(190, 4),
(196, 4),
(202, 4),
(209, 4),
(212, 4),
(216, 4),
(220, 4),
(222, 4),
(226, 4),
(228, 4),
(229, 4),
(235, 4),
(241, 4),
(247, 4),
(251, 4),
(252, 4),
(253, 4),
(254, 4),
(263, 4),
(264, 4),
(279, 4),
(284, 4),
(285, 4),
(289, 4),
(295, 4),
(301, 4),
(302, 4),
(303, 4),
(304, 4),
(305, 4),
(307, 4),
(316, 4),
(317, 4),
(318, 4),
(319, 4),
(320, 4),
(321, 5),
(322, 5),
(323, 5),
(118, 6),
(120, 6),
(124, 6),
(126, 6),
(130, 6),
(148, 6),
(160, 6),
(172, 6),
(212, 6),
(216, 6),
(220, 6),
(222, 6),
(223, 6),
(224, 6),
(226, 6),
(228, 6),
(271, 6),
(273, 6),
(320, 6),
(118, 7),
(148, 7),
(160, 7),
(172, 7),
(184, 7),
(190, 7),
(196, 7),
(202, 7),
(212, 7),
(216, 7),
(220, 7),
(226, 7),
(263, 7),
(264, 7),
(266, 7),
(267, 7),
(271, 7),
(307, 7),
(308, 7),
(309, 7),
(310, 7),
(311, 7),
(313, 7),
(320, 7);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `service_image_id` bigint UNSIGNED DEFAULT NULL,
  `service_icon_id` bigint UNSIGNED DEFAULT NULL,
  `type` enum('cab','parcel','freight','ambulance') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'cab',
  `status` int DEFAULT '1',
  `is_primary` int DEFAULT '0',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `slug`, `description`, `service_image_id`, `service_icon_id`, `type`, `status`, `is_primary`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"Cab\",\"ar\":\"سيارة أجرة\",\"fr\":\"Taxi\",\"de\":\"Taxi\"}', 'cab', '{\"en\":\"Quick and reliable ride service.\"}', 783, 23, 'cab', 1, 1, 1, '2025-04-23 19:50:10', '2025-04-30 01:54:11', NULL),
(2, '{\"en\":\"Parcel\",\"fr\":\"Colis\",\"de\":\"Paket\",\"ar\":\"قطعة\"}', 'parcel', '{\"en\":\"Secure and fast deliveries.\"}', 793, 30, 'parcel', 1, 0, 1, '2025-04-23 19:50:10', '2025-04-30 01:54:26', NULL),
(3, '{\"en\":\"Freight\",\"fr\":\"Fret\",\"de\":\"Fracht\",\"ar\":\"شحن\"}', 'freight', '{\"en\":\"Efficient and reliable goods transport.\"}', 791, 31, 'freight', 1, 0, 1, '2025-04-23 19:50:10', '2025-04-30 01:54:38', NULL),
(4, '{\"en\":\"Ambulance\"}', 'ambulance', '{\"en\":\"Emergency medical transport.\"}', 781, 743, 'ambulance', 1, 0, 1, '2025-04-23 19:50:10', '2025-04-30 01:54:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `service_category_image_id` bigint UNSIGNED DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `name`, `slug`, `type`, `service_id`, `description`, `service_category_image_id`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"Ride\"}', 'ride', 'ride', '1', '{\"en\":\"Long-distance travel options connecting cities, ideal for both passengers and freight shipments.\"}', 713, 1, 1, '2025-03-31 19:55:23', '2025-04-26 03:02:57', NULL),
(2, '{\"en\":\"Intercity\"}', 'intercity', 'intercity', '1', '{\"en\":\"For smooth and reliable intracity travel\"}', 725, 1, 1, '2025-03-31 19:55:23', '2025-04-26 03:03:08', NULL),
(3, '{\"en\":\"Package\"}', 'package', 'package', '1', '{\"en\":\"Package delivery services for both small and large parcels, ensuring timely and secure transport.\"}', 717, 1, 1, '2025-03-31 19:55:23', '2025-04-26 03:03:22', NULL),
(4, '{\"en\":\"Schedule\"}', 'schedule', 'schedule', '1', '{\"en\":\"Scheduled transport services for planned trips, offering both passenger and freight options.\"}', 705, 1, 1, '2025-03-31 19:55:23', '2025-04-26 03:03:36', NULL),
(5, '{\"en\":\"Rental\"}', 'rental', 'rental', '1', '{\"en\":\"Vehicle rentals for short or long-term use, suitable for personal or business requirements.\"}', 715, 1, 1, '2025-03-31 19:55:23', '2025-04-26 03:03:50', NULL),
(6, '{\"en\":\"Ride\"}', 'ride-parcel', 'ride', '2', '{\"en\":\"Long-distance travel options connecting cities, ideal for both passengers and freight shipments.\"}', 707, 1, 1, '2025-03-31 19:55:23', '2025-04-26 03:01:25', NULL),
(7, '{\"en\":\"Intercity\"}', 'intercity-parcel', 'intercity', '2', '{\"en\":\"For smooth and reliable intracity travel\"}', 721, 1, 1, '2025-03-31 19:55:23', '2025-04-26 03:01:36', NULL),
(8, '{\"en\":\"Schedule\"}', 'schedule-parcel', 'schedule', '2', '{\"en\":\"Scheduled transport services for planned trips, offering both passenger and freight options.\"}', 699, 1, 1, '2025-03-31 19:55:23', '2025-04-26 03:01:53', NULL),
(9, '{\"en\":\"Ride\"}', 'ride-freight', 'ride', '3', '{\"en\":\"Long-distance travel options connecting cities, ideal for both passengers and freight shipments.\"}', 711, 1, 1, '2025-03-31 19:55:23', '2025-04-26 02:58:27', NULL),
(10, '{\"en\":\"Intercity\"}', 'intercity-freight', 'intercity', '3', '{\"en\":\"For smooth and reliable intracity travel\"}', 723, 1, 1, '2025-03-31 19:55:23', '2025-04-26 02:59:17', NULL),
(11, '{\"en\":\"Schedule\"}', 'schedule-freight', 'schedule', '3', '{\"en\":\"Scheduled transport services for planned trips, offering both passenger and freight options.\"}', 703, 1, 1, '2025-03-31 19:55:23', '2025-04-26 03:00:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `values` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `values`, `created_at`, `updated_at`) VALUES
(1, '{\"mail\": null, \"email\": {\"mail_host\": \"ENTER_YOUR_HOST\", \"mail_port\": \"465\", \"mail_mailer\": \"smtp\", \"mail_password\": \"ENTER_YOUR_PASSWORD\", \"mail_username\": \"ENTER_YOUR_USERNAME\", \"mail_from_name\": \"no-reply\", \"mail_encryption\": \"ssl\", \"mail_from_address\": \"ENTER_YOUR_EMAIL@MAIL.COM\"}, \"general\": {\"mode\": \"light\", \"copyright\": \"Taxido theme by PixelStrap\", \"site_name\": \"Taxido\", \"time_format\": \"24\", \"platform_fees\": \"10\", \"default_timezone\": \"UTC\", \"favicon_image_id\": null, \"dark_logo_image_id\": \"643\", \"default_currency_id\": \"1\", \"default_language_id\": \"1\", \"default_sms_gateway\": \"twilio\", \"light_logo_image_id\": \"641\"}, \"firebase\": {\"service_json\": {\"type\": \"service_account\", \"auth_uri\": \"https://accounts.google.com/o/oauth2/auth\", \"client_id\": \"117532496491251072370\", \"token_uri\": \"https://oauth2.googleapis.com/token\", \"project_id\": \"taxidouserapp\", \"private_key\": \"-----BEGIN PRIVATE KEY-----\\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDpTrsefVhkFQ4c\\nRex4NqcQHrwOSJD7beVmsURauJn8C0ZOYt5hcnhQNbJiITVH626UIIqvEw3JDtSf\\ngV+GnO7YYJ1j0AIBaUk3XNd1bo7Ad7lZ3Zo+ucwDl1ipttN2Y38esysgyhhODrwD\\nkGP8ItIsUG0GN4yPRFE8PecDdtG3jyk56GcvIZnk0ipQ3hRKM0DAqd6aq1jaUvBi\\njHINq3XxD6HdHLG+Na7FnMFMlWoQT2s5+hFmmyiT+kNm5xV4vG7beXOy3ZNqZk4h\\n4iGvQVwenDieA8bdFAkHL7KCFUu16HAi3UQWjasInig1CizreWs/6gS5+evlPFQs\\n53QhvVynAgMBAAECggEAEWC5ZFR+zHmbAvUcX3nmqLc5V7EFB41QfH0ws7czVQg7\\n9OO9X7HIj2TohBGoJ9K7+lGQMuku6i5uHPFkfaDb04ciwggA1j0S5IpITClvfZuN\\nVUnBzvFE5nGT+5QwHQ3dLpq22Crlc476ZyOOpv2q/P0CmedyU0uJ53xO5D2p8kuV\\nnvZnc44DTRxCxrLDt6NIuAX2GhPZjwErKieP5U6vIQigtpYYDlFz68b3Qx/yX4jO\\nXfLLWEGudmcpy/p0P8UEYQUT92p3fJlr9h/h6Y5lFkiAIbkzf/TksU8OAL9+nfu0\\nv+YZebvP++GwmHyIdBDRjt7Jb4onciWWtgHuHt9FfQKBgQD9LaDAkFOlexzEElyk\\nsJ5PCKQU58CObbzR29FAr/1LdlnSQgIlCEZOLLS1PCUoDqW6Pi7UK68k9K7+vo49\\nPL9BxsvdONMlV0O44JWG3HCGONJ1V3mjKOPMSHSHk7a5R4dEgAKWw0eKwqf8zxCv\\na/geS16tzABDp+dM227xRZF02wKBgQDr6GhagGps+QFr25HoTWiPDsDzNJWx6izb\\ng3fGXPEji6LC4JMOU/HvOtsk5CO3sHjLI6RdFih4JVuRRO2qaeo8hfT9UUvOHtWs\\nHiT7c+d7vSqhGOWWkl5M8HXSZELc7W6H+4sF247TpN/HENpeV4DLwJTePcnh6TZA\\nh0UO1ys7JQKBgQC/9oerWgNCNn2SIQYDjTMLY9bdTvcORyBi0lPvw0C/peXm6Uus\\n/oAoJ/eAbzERFUINW7awAstSrv+8gYlh3xx46B2NB9f4uRjNJePaFGxxKMZSWFgP\\nISLPsqRAY/yosRZcFt9fpoMpL/ylT+8rwyam+ai5CDOvGLDk8oBFCeWG/wKBgGBj\\n88+WzOV90ODbNIDwsBpT8u7su4WYo3+F9jis3TKi6Xwq+qtODXqsV8J5HUb+6jxG\\ncfA/D4YX7ZQrz9hjsnvMWE/xGcI8wx2yq3W65AihQHvWimi9oZ5aWin/IXrX4OPb\\nGfDoxzEfGvhhoHgP1OZr5+fu40BVY/91xffMXzOpAoGBAKRAU4P4Rw7k2esD3L6O\\nQ6P91OVj2lcOCYxVuBY1AQWfTUl4VnP4aiFDBGpNiTzrUQ+fKGr85ppxt29cudO5\\n9A1PSRG3xreo0Zk12CjE8GJJxE2CBCGxgGzs8M2kcI+lVr4kkXTvAsc0/dKJblow\\nmln19pYmw1wh0kWlArK+z4XY\\n-----END PRIVATE KEY-----\\n\", \"client_email\": \"firebase-adminsdk-fbsvc@taxidouserapp.iam.gserviceaccount.com\", \"private_key_id\": \"93a6bfbced2ff4136ea5a0fb7f8ed6c4a462ba00\", \"universe_domain\": \"googleapis.com\", \"client_x509_cert_url\": \"https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40taxidouserapp.iam.gserviceaccount.com\", \"auth_provider_x509_cert_url\": \"https://www.googleapis.com/oauth2/v1/certs\"}, \"firebase_app_id\": null, \"firebase_api_key\": null, \"firebase_project_id\": null, \"firebase_auth_domain\": null, \"firebase_measurement_id\": null, \"firebase_storage_bucket\": null, \"firebase_messaging_sender_id\": null}, \"readings\": {\"status\": \"1\", \"home_page\": null}, \"undefined\": \"1\", \"activation\": {\"demo_mode\": \"1\", \"platform_fees\": \"1\", \"preloader_enabled\": \"1\", \"default_credentials\": \"1\", \"social_login_enable\": \"1\"}, \"appearance\": {\"font_family\": \"Inter\", \"primary_color\": \"#199675\", \"front_font_family\": \"DM Sans\", \"preloader_image_id\": null, \"sidebar_solid_color\": \"#199675\", \"sidebar_background_type\": \"gradient\", \"sidebar_gradient_color_1\": \"#199675\", \"sidebar_gradient_color_2\": \"#212121\"}, \"maintenance\": {\"content\": null, \"maintenance_mode\": \"0\"}, \"social_login\": {\"apple\": {\"client_id\": null, \"client_secret\": null}, \"google\": {\"client_id\": \"385954585063-alkuv99a6crlch8jd8i4tfefucpd98sv.apps.googleusercontent.com\", \"client_secret\": \"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\"}}, \"google_reCaptcha\": {\"secret\": \"ENTER_YOUR_SECRET_KEY\", \"status\": \"0\", \"site_key\": \"ENTER_YOUR_SITE_KEY\"}}', '2025-01-22 23:43:06', '2025-07-17 03:51:05');

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `title`, `slug`, `content`, `url`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, '{\"en\":\"New Ride Created\",\"ar\":null,\"fr\":null}', 'create-ride-admin', '{\"en\":\"Hello {{Rider Name}}, your ride {{Ride Number}} with driver {{Driver Name}} for {{Service Category}} service has been created. Estimated fare: {{Fare Amount}} for {{Distance}} {{Distance Unit}}.\",\"ar\":null,\"fr\":null}', '{\"en\":null,\"ar\":null,\"fr\":null}', NULL, '2025-06-01 12:32:50', '2025-06-01 12:32:50'),
(3, '{\"en\":\"Sent to the driver when ride is created\",\"ar\":null,\"fr\":null}', 'create-ride-driver', '{\"en\":\"{{driver_name}}{{ride_number}}{{services}}{{service_category}}{{rider_name}}{{bid_status}}{{rider_email}}{{rider_phone}}{{vehicle_type}}{{fare_amount}}{{distance}}{{distance_unit}}{{company_name}}\",\"ar\":null,\"fr\":null}', '{\"en\":null,\"ar\":null,\"fr\":null}', NULL, '2025-06-01 12:45:36', '2025-06-01 12:45:36'),
(4, '{\"en\":\"Update the Driver about the status of their Withdraw Request\",\"ar\":null,\"fr\":null}', 'update-withdraw-request-driver', '{\"en\":\"{{driver_name}}, your withdrawal of {{amount}} is now {{status}}.\",\"ar\":null,\"fr\":null}', '{\"en\":null,\"ar\":null,\"fr\":null}', NULL, '2025-06-01 13:19:31', '2025-06-01 13:19:41'),
(5, '{\"en\":\"Bid Status (Driver)\",\"ar\":null,\"fr\":null}', 'bid-status-driver', '{\"en\":\"{{driver_name}}, your bid for Ride #{{ride_number}} ({{rider_name}}) is {{bid_status}}.\",\"ar\":null,\"fr\":null}', '{\"en\":null,\"ar\":null,\"fr\":null}', NULL, '2025-06-01 13:22:15', '2025-06-01 13:22:15'),
(6, '{\"en\":\"Document Status Update Notification\",\"ar\":null,\"fr\":null}', 'driver-document-status-update', '{\"en\":\"Hello {{driver_name}}, your {{document_name}} status has been updated to {{status}}\",\"ar\":null,\"fr\":null}', '{\"en\":null,\"ar\":null,\"fr\":null}', NULL, '2025-06-01 13:25:07', '2025-06-01 13:25:07'),
(7, '{\"en\":\"New Withdrawal Request Alert\",\"ar\":null,\"fr\":null}', 'create-withdraw-request-admin', '{\"en\":\"New withdrawal request of {{amount}} by {{driver_name}}.\",\"ar\":null,\"fr\":null}', '{\"en\":null,\"ar\":null,\"fr\":null}', NULL, '2025-06-01 13:26:48', '2025-06-01 13:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `sos`
--

CREATE TABLE `sos` (
  `id` bigint UNSIGNED NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sos_image_id` bigint UNSIGNED DEFAULT NULL,
  `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_by_id` bigint UNSIGNED NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sos`
--

INSERT INTO `sos` (`id`, `title`, `slug`, `sos_image_id`, `country_code`, `phone`, `created_by_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"Police Assistance\",\"fr\":\"Assistance policière\",\"de\":\"Polizeihilfe\",\"ar\":\"مساعدة الشرطة\"}', 'police-assistance', 821, '1', '9115551234', 1, 1, '2025-01-23 20:12:46', '2025-07-16 22:12:29', NULL),
(2, '{\"en\":\"Vehicle Accident\",\"ar\":\"حادث سيارة\",\"de\":\"Fahrzeugunfall\",\"fr\":\"Accident de véhicule\"}', 'vehicle-accident', 819, '1', '9115552345', 1, 1, '2025-01-23 20:13:05', '2025-07-16 22:12:17', NULL),
(3, '{\"en\":\"Medical Emergency\",\"de\":\"Medizinischer Notfall\",\"ar\":\"حالة طوارئ طبية\",\"fr\":\"Urgence médicale\"}', 'medical-emergency', 817, '1', '9115553456', 1, 1, '2025-01-23 20:13:41', '2025-07-16 22:12:06', NULL),
(4, '{\"en\":\"Fire Emergency\",\"fr\":\"Urgence incendie\",\"de\":\"Feuer Notfall\",\"ar\":\"حالة طوارئ حريق\"}', 'fire-emergency', 823, '1', '9115556789', 1, 1, '2025-01-23 20:14:05', '2025-07-16 22:12:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sos_alerts`
--

CREATE TABLE `sos_alerts` (
  `id` bigint UNSIGNED NOT NULL,
  `location_coordinates` json DEFAULT NULL,
  `ride_id` bigint UNSIGNED DEFAULT NULL,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `sos_status_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sos_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sos_alerts`
--

INSERT INTO `sos_alerts` (`id`, `location_coordinates`, `ride_id`, `created_by_id`, `sos_status_id`, `created_at`, `updated_at`, `deleted_at`, `sos_id`) VALUES
(1, '{\"lat\": 41.89655, \"lng\": 27.19755}', 3, 1, 3, '2025-04-29 06:19:12', '2025-04-29 06:21:35', NULL, NULL),
(4, '{\"lat\": \"40.752600\", \"lng\": \"-73.985480\"}', 27, 40, 1, '2025-04-29 06:50:18', '2025-04-29 06:50:18', NULL, NULL),
(7, '{\"lat\": \"-27.484000\", \"lng\": \"153.008000\"}', 28, 25, 1, '2025-04-29 07:46:31', '2025-04-29 07:46:31', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sos_statuses`
--

CREATE TABLE `sos_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sos_statuses`
--

INSERT INTO `sos_statuses` (`id`, `name`, `slug`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Requested', 'requested', 1, '2025-04-14 19:02:43', '2025-04-14 19:02:43', NULL),
(2, 'Processing', 'processing', 1, '2025-04-14 19:03:43', '2025-04-14 19:03:43', NULL),
(3, 'Completed', 'completed', 1, '2025-04-14 19:03:43', '2025-04-14 19:03:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sos_status_activities`
--

CREATE TABLE `sos_status_activities` (
  `id` bigint UNSIGNED NOT NULL,
  `ride_id` bigint UNSIGNED DEFAULT NULL,
  `sos_alert_id` bigint UNSIGNED DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `changed_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sos_status_activities`
--

INSERT INTO `sos_status_activities` (`id`, `ride_id`, `sos_alert_id`, `status`, `changed_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 1, 'completed', '2025-04-29 11:51:35', '2025-04-29 06:21:35', '2025-04-29 06:21:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sos_zones`
--

CREATE TABLE `sos_zones` (
  `id` bigint UNSIGNED NOT NULL,
  `s_o_s_id` bigint UNSIGNED NOT NULL,
  `zone_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `system_reserve` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `slug`, `color`, `created_by_id`, `system_reserve`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"Open\"}', 'open', 'primary', 1, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(2, '{\"en\":\"Pending\"}', 'pending', 'secondary', 1, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(3, '{\"en\":\"Processing\"}', 'processing', 'dark', 1, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(4, '{\"en\":\"Solved\"}', 'solved', 'info', 1, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(5, '{\"en\":\"Hold\"}', 'hold', 'warning', 1, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL),
(6, '{\"en\":\"Closed\"}', 'closed', 'danger', 1, 1, 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` bigint UNSIGNED NOT NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surge_prices`
--

CREATE TABLE `surge_prices` (
  `id` bigint UNSIGNED NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `day` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `surge_prices`
--

INSERT INTO `surge_prices` (`id`, `start_time`, `end_time`, `day`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '06:00:00', '08:00:00', 'Sunday', 1, 1, '2025-07-16 00:37:58', '2025-07-16 00:37:58', NULL),
(2, '07:30:00', '09:00:00', 'Monday', 1, 1, '2025-07-16 00:38:46', '2025-07-16 00:38:46', NULL),
(3, '02:00:00', '03:00:00', 'Wednesday', 1, 1, '2025-07-16 00:39:31', '2025-07-16 00:39:31', NULL),
(4, '12:00:00', '16:00:00', 'Friday', 1, 1, '2025-07-16 00:40:30', '2025-07-16 00:40:30', NULL),
(5, '18:30:00', '22:00:00', 'Saturday', 1, 1, '2025-07-16 00:42:53', '2025-07-16 00:42:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by_id` bigint UNSIGNED NOT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `type`, `description`, `created_by_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"Urban Mobility\",\"de\":\"Urban Mobilität\",\"ar\":\"التنقل الحضري\"}', 'urban-mobility', 'post', '{\"en\":null}', 1, 1, '2025-01-23 00:55:08', '2025-01-23 01:06:49', NULL),
(2, '{\"en\":\"Future of Transportation\",\"fr\":\"Avenir des transports\",\"de\":\"Zukunft der Mobilität\",\"ar\":\"مستقبل النقل\"}', 'future-of-transportation', 'post', '{\"en\":null}', 1, 1, '2025-01-23 00:55:42', '2025-01-23 01:01:17', NULL),
(3, '{\"en\":\"Smart Travel\",\"de\":\"Fahrtenbuchung\",\"ar\":\"حجز الرحلات\"}', 'smart-travel', 'post', '{\"en\":null}', 1, 1, '2025-01-23 00:55:51', '2025-01-23 01:22:10', NULL),
(4, '{\"en\":\"Ride Booking\",\"ar\":\"السفر الذكي\",\"fr\":\"Voyage intelligent\"}', 'ride-booking', 'post', '{\"en\":null}', 1, 1, '2025-01-23 00:56:01', '2025-01-23 01:23:15', NULL),
(5, '{\"en\":\"Daily Commute\",\"de\":\"Tägliches Pendeln\",\"fr\":\"Trajets quotidiens\",\"ar\":\"التنقل اليومي\"}', 'daily-commute', 'post', '{\"en\":null}', 1, 1, '2025-01-23 01:26:07', '2025-01-23 01:28:03', NULL),
(6, '{\"en\":\"Benefits of Ride Booking\",\"de\":\"Vorteile der Fahrtenbuchung\",\"fr\":\"Avantages de la réservation de trajets\",\"ar\":\"فوائد حجز الرحلات\"}', 'benefits-of-ride-booking', 'post', '{\"en\":null}', 1, 1, '2025-01-23 01:26:22', '2025-01-23 01:29:51', NULL),
(7, '{\"en\":\"Convenient Travel\",\"ar\":\"السفر المريح\",\"fr\":\"Trajets quotidiens\",\"de\":\"Bequemes Reisen\"}', 'convenient-travel', 'post', '{\"en\":null}', 1, 1, '2025-01-23 01:26:34', '2025-01-23 01:31:57', NULL),
(8, '{\"en\":\"Road Safety\",\"de\":\"Verkehrssicherheit\",\"fr\":\"Sécurité routière\",\"ar\":\"سلامة الطرق\"}', 'road-safety', 'post', '{\"en\":null}', 1, 1, '2025-01-23 01:33:40', '2025-01-23 01:35:18', NULL),
(9, '{\"en\":\"Safe Rides\",\"de\":\"Sichere Fahrten\",\"fr\":\"Trajets sécurisés\",\"ar\":\"رحلات آمنة\"}', 'safe-rides', 'post', '{\"en\":null}', 1, 1, '2025-01-23 01:33:51', '2025-01-23 01:37:20', NULL),
(10, '{\"en\":\"Safety Features\",\"ar\":\"ميزات السلامة\",\"fr\":\"Fonctionnalités de sécurité\",\"de\":\"Sicherheitsfunktionen\"}', 'safety-features', 'post', '{\"en\":null}', 1, 1, '2025-01-23 01:34:00', '2025-01-23 01:38:30', NULL),
(11, '{\"en\":\"Choosing Ride Service\",\"de\":\"Wahl des Fahrdienstes\",\"fr\":\"Choisir un service de transport\",\"ar\":\"اختيار خدمة الركوب\"}', 'choosing-ride-service', 'post', '{\"en\":null}', 1, 1, '2025-01-23 01:41:01', '2025-01-23 01:45:41', NULL),
(12, '{\"en\":\"Ride Options\",\"fr\":\"Options de trajets\",\"de\":\"Fahrmöglichkeiten\",\"ar\":\"خيارات الرحلات\"}', 'ride-options', 'post', '{\"en\":null}', 1, 1, '2025-01-23 01:41:34', '2025-01-23 01:48:03', NULL),
(13, '{\"en\":\"Ride Selection\",\"ar\":\"اختيار الرحلة\",\"fr\":\"Sélection de trajet\",\"de\":\"Fahrtauswahl\"}', 'ride-selection', 'post', '{\"en\":null}', 1, 1, '2025-01-23 01:41:47', '2025-01-23 01:49:30', NULL),
(14, '{\"en\":\"Comfortable Rides\",\"de\":\"Bequeme Fahrten\",\"fr\":\"Trajets confortables\",\"ar\":\"الرحلات المريحة\"}', 'comfortable-rides', 'post', '{\"en\":null}', 1, 1, '2025-01-23 01:50:59', '2025-01-23 01:53:31', NULL),
(15, '{\"en\":\"Ride Experience\",\"ar\":\"تجربة الركوب\",\"de\":\"Fahrerlebnis\",\"fr\":\"Expérience de trajet\"}', 'ride-experience', 'post', '{\"en\":null}', 1, 1, '2025-01-23 01:51:13', '2025-01-23 01:56:08', NULL),
(16, '{\"en\":\"Ride Tips\",\"de\":\"Fahrtipps\",\"fr\":\"Astuces de trajet\",\"ar\":\"نصائح الرحلات\"}', 'ride-tips', 'post', '{\"en\":null}', 1, 1, '2025-01-23 01:51:25', '2025-01-23 01:57:45', NULL),
(17, '{\"en\":\"Ride Sharing\"}', 'ride-sharing', 'post', '{\"en\":null}', 1, 1, '2025-01-23 01:59:50', '2025-01-23 02:01:41', '2025-01-23 02:01:41'),
(18, '{\"en\":\"Eco-Friendly Travel\",\"de\":\"Umweltfreundliches Reisen\",\"fr\":\"Voyage éco-responsable\",\"ar\":\"السفر الصديق للبيئة\"}', 'eco-friendly-travel', 'post', '{\"en\":null}', 1, 1, '2025-01-23 01:59:59', '2025-01-23 02:02:57', NULL),
(19, '{\"en\":\"Green Travel\",\"de\":\"Grünes Reisen\",\"fr\":\"Voyage vert\",\"ar\":\"السفر الأخضر\"}', 'green-travel', 'post', '{\"en\":null}', 1, 1, '2025-01-23 02:00:10', '2025-01-23 02:04:26', NULL),
(20, '{\"en\":\"Ride Categories\",\"fr\":\"Catégories de trajets\",\"de\":\"Fahrtkategorien\",\"ar\":\"فئات الرحلات\"}', 'ride-categories', 'post', '{\"en\":null}', 1, 1, '2025-01-23 02:05:01', '2025-01-23 02:09:01', NULL),
(21, '{\"en\":\"Vehicle Options\",\"ar\":\"خيارات المركبات\",\"fr\":\"Options de véhicules\",\"de\":\"Fahrzeugoptionen\"}', 'vehicle-options', 'post', '{\"en\":null}', 1, 1, '2025-01-23 02:05:12', '2025-01-23 02:10:24', NULL),
(22, '{\"en\":\"Ride Choices\",\"de\":\"Fahrtwahl\",\"fr\":\"Choix de trajets\",\"ar\":\"اختيارات الرحلات\"}', 'ride-choices', 'post', '{\"en\":null}', 1, 1, '2025-01-23 02:05:26', '2025-01-23 02:11:36', NULL),
(23, '{\"en\":\"Save Money\",\"de\":\"Geld sparen\",\"fr\":\"Économiser de l’argent\",\"ar\":\"توفير المال\"}', 'save-money', 'post', '{\"en\":null}', 1, 1, '2025-01-23 02:11:57', '2025-01-23 02:14:52', NULL),
(24, '{\"en\":\"Save Time\",\"ar\":\"توفير الوقت\",\"fr\":\"Gagner du temps\",\"de\":\"Zeit sparen\"}', 'save-time', 'post', '{\"en\":null}', 1, 1, '2025-01-23 02:12:06', '2025-01-23 02:18:11', NULL),
(25, '{\"en\":\"Affordable Travel\",\"de\":\"Günstiges Reisen\",\"fr\":\"Voyage abordable\",\"ar\":\"السفر بأسعار معقولة\"}', 'affordable-travel', 'post', '{\"en\":null}', 1, 1, '2025-01-23 02:12:15', '2025-01-23 02:19:25', NULL),
(26, '{\"en\":\"Parcel Freight\",\"de\":\"Paketversand\",\"fr\":\"Fret de colis\",\"ar\":\"شحن الطرود\"}', 'parcel-freight', 'post', '{\"en\":null}', 1, 1, '2025-01-23 02:20:40', '2025-01-23 02:22:37', NULL),
(27, '{\"en\":\"Cab Services\",\"ar\":\"خدمات سيارات الأجرة\",\"fr\":\"Services de taxi\",\"de\":\"Taxi-Dienste\"}', 'cab-services', 'post', '{\"en\":null}', 1, 1, '2025-01-23 02:20:55', '2025-01-23 02:23:59', NULL),
(28, '{\"en\":\"Versatility\",\"de\":\"Vielseitigkeit\",\"fr\":\"Polyvalence\",\"ar\":\"التعددية\"}', 'versatility', 'post', '{\"en\":null}', 1, 1, '2025-01-23 02:21:03', '2025-01-23 02:25:35', NULL),
(29, '{\"en\":\"Vehicle Types\",\"de\":\"Fahrzeugtypen\",\"fr\":\"Types de véhicules\",\"ar\":\"حلول النقل\"}', 'vehicle-types', 'post', '{\"en\":null}', 1, 1, '2025-01-23 02:29:26', '2025-01-23 02:31:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(8,2) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"Tax\",\"de\":\"Steuer\",\"fr\":\"Impôt\",\"ar\":\"ضريبة\"}', 7.00, 1, 1, '2025-01-23 04:08:38', '2025-01-23 04:11:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taxido_settings`
--

CREATE TABLE `taxido_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `taxido_values` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxido_settings`
--

INSERT INTO `taxido_settings` (`id`, `taxido_values`, `created_at`, `updated_at`) VALUES
(1, '{\"ride\": {\"weight_unit\": \"kg\", \"country_code\": \"93\", \"distance_unit\": \"km\", \"parcel_weight_limit\": \"20\", \"min_intracity_radius\": \"10000\", \"increase_amount_range\": \"10\", \"find_driver_time_limit\": \"3\", \"driver_max_online_hours\": \"18\", \"max_bidding_fare_driver\": \"10\", \"schedule_min_hour_limit\": \"3\", \"ride_request_time_driver\": \"15\", \"rental_ambulance_request_time\": \"20\", \"schedule_ride_request_lead_time\": \"15\"}, \"wallet\": {\"tip_denominations\": \"50\", \"wallet_denominations\": \"50\", \"driver_min_wallet_balance\": \"0\"}, \"general\": {\"greetings\": [\"Hello\", \"<p>🌈 Let’s make today productive and successful! 🏆</p>\"], \"footer_branding_hashtag\": \"#GoTaxido\", \"footer_branding_attribution\": \"❤️ Made by Pixelstrap\"}, \"setting\": {\"app_version\": \"1.0.5\", \"splash_screen_id\": \"779\", \"driver_app_version\": \"1.0.5\", \"splash_driver_screen_id\": \"777\"}, \"location\": {\"map_provider\": \"google_map\", \"radius_meter\": \"1000\", \"radius_per_second\": \"10\", \"google_map_api_key\": \"\"}, \"referral\": {\"interval\": \"month\", \"validity\": \"3\", \"referral_amount\": \"50\", \"first_ride_discount\": \"30\"}, \"undefined\": \"1\", \"activation\": {\"bidding\": \"1\", \"ride_otp\": \"1\", \"parcel_otp\": \"1\", \"sos_enable\": \"0\", \"driver_tips\": \"1\", \"fleet_wallet\": \"1\", \"force_update\": \"1\", \"rider_wallet\": \"1\", \"cash_payments\": \"1\", \"coupon_enable\": \"1\", \"driver_wallet\": \"1\", \"online_payments\": \"1\", \"referral_enable\": \"1\", \"surge_price_enable\": \"1\", \"driver_verification\": \"1\", \"airport_price_enable\": \"1\", \"additional_minute_charge\": \"1\", \"additional_weight_charge\": \"1\", \"additional_distance_charge\": \"1\"}, \"driver_commission\": {\"status\": \"1\", \"min_withdraw_amount\": \"500\", \"fleet_commission_rate\": \"10\", \"fleet_commission_type\": \"percentage\", \"ambulance_per_km_charge\": \"1\", \"ambulance_commission_rate\": \"20\", \"ambulance_commission_type\": \"percentage\", \"ambulance_per_minute_charge\": \"2\"}}', '2025-01-22 23:43:07', '2025-07-22 08:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rating` int DEFAULT NULL,
  `status` int DEFAULT '1',
  `profile_image_id` bigint UNSIGNED DEFAULT NULL,
  `created_by_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `title`, `description`, `rating`, `status`, `profile_image_id`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"Sarah Johnson\",\"fr\":\"Sarah Johnson\",\"de\":\"Sarah Johnson\",\"ar\":\"Sarah Johnson\"}', '{\"en\":\"The intercity ride was incredibly comfortable and punctual. The driver was professional, and the car was spotless. I highly recommend this service for long-distance travel!\",\"fr\":\"J\'ai réservé un trajet programmé pour une réunion, et c\'était impeccable. Le chauffeur était professionnel, et la voiture était luxueuse. Je vais certainement réutiliser ce service !\",\"de\":\"Die Intercity-Fahrt war unglaublich bequem und pünktlich. Der Fahrer war professionell, und das Auto war makellos. Ich kann diesen Service für Langstreckenfahrten nur empfehlen!\",\"ar\":\"خدمة توصيل الطرود ممتازة. أرسلت عنصرًا هشًا، ووصل في حالة مثالية. الفريق تعامل معه بعناية كبير\\\"\"}', 4, 1, 78, 1, '2025-01-23 05:21:29', '2025-01-23 05:43:28', NULL),
(2, '{\"en\":\"Michael Brown\",\"fr\":\"Michael Brown\",\"de\":\"Michael Brown\",\"ar\":\"Michael Brown\"}', '{\"en\":\"I use the cab service daily for my commute, and it’s always reliable. The drivers are friendly, and the app makes booking so easy. Great value for money!\",\"fr\":\"Louer une voiture a été la meilleure décision pour nos vacances en famille. Le processus était facile, et la voiture était parfaite pour nos besoins. Excellent service !\",\"de\":\"Ich nutze den Cab-Service täglich für meinen Arbeitsweg, und er ist immer zuverlässig. Die Fahrer sind freundlich, und die App macht die Buchung so einfach. Großartiges Preis-Leistungs-Verhältnis!\",\"ar\":\"حجزت رحلة مجدولة لاجتماع، وكانت لا تشوبها شائبة. السائق كان محترفًا، والسيارة كانت فاخرة. بالتأكيد سأستخدم هذه الخدمة مرة أخر\"}', 5, 1, 81, 1, '2025-01-23 05:22:01', '2025-01-23 05:43:57', NULL),
(3, '{\"en\":\"David Wilson\",\"fr\":\"David Wilson\",\"de\":\"David Wilson\",\"ar\":\"David Wilson\"}', '{\"en\":\"I booked a scheduled ride for an early morning flight, and it was perfect. The driver arrived on time, and the ride was smooth and stress-free.\",\"fr\":\"J\'ai réservé un trajet programmé pour un vol tôt le matin, et c\'était parfait. Le chauffeur est arrivé à l\'heure, et le trajet était fluide et sans stress.\",\"de\":\"Ich musste ein dringendes Paket verschicken, und der Service war fantastisch. Die Lieferung war schnell, und das Tracking-System hielt mich auf dem Laufenden.\",\"ar\":\"كانت الرحلة بين المدن منقذة لي في رحلتي العملية. الواي فاي والمقاعد المريحة جعلت الرحلة الطويلة ممتعة. أوصي بها بشد\"}', 5, 1, 82, 1, '2025-01-23 05:24:13', '2025-01-23 05:43:07', NULL),
(4, '{\"en\":\"Emily Davis\",\"fr\":\"Emily Davis\",\"de\":\"Emily Davis\",\"ar\":\"Emily Davis\"}', '{\"en\":\"I needed to send an urgent package, and the service was fantastic. The delivery was fast, and the tracking system kept me updated every step of the way.\",\"fr\":\"J\'avais besoin d\'envoyer un colis urgent, et le service était fantastique. La livraison a été rapide, et le système de suivi m\'a tenu informé à chaque étape.\",\"de\":\"Ich habe eine geplante Fahrt für einen frühen Morgenflug gebucht, und es war perfekt. Der Fahrer kam pünktlich, und die Fahrt war reibungslos und stressfrei.\",\"ar\":\"كان تأجير سيارة لرحلتنا في عطلة نهاية الأسبوع سلسًا. كانت السيارة في حالة ممتازة، وعملية الاستلام والتسليم كانت مريحة للغاي\"}', 4, 1, 114, 1, '2025-01-23 05:25:51', '2025-01-23 05:42:49', NULL),
(5, '{\"en\":\"Olivia Martinez\",\"fr\":\"Olivia Martinez\",\"de\":\"Olivia Martinez\",\"ar\":\"Olivia Martinez\"}', '{\"en\":\"Renting a car for our weekend getaway was seamless. The vehicle was in excellent condition, and the pickup/drop-off process was super convenient\",\"fr\":\"Louer une voiture pour notre escapade de week-end a été simple. Le véhicule était en excellent état, et le processus de prise en charge/dépose était très pratique\",\"de\":\"Das Mieten eines Autos für unser Wochenendausflug war problemlos. Das Fahrzeug war in ausgezeichnetem Zustand, und der Abhol- und Rückgabeprozess war sehr bequem.\",\"ar\":\"كنت بحاجة إلى إرسال طرد عاجل، وكانت الخدمة رائعة. التوصيل كان سريعًا، ونظام التتبع أبقاني على اطلاع بكل خطوة.\"}', 5, 1, 116, 1, '2025-01-23 05:26:25', '2025-01-23 05:42:25', NULL),
(6, '{\"en\":\"James Anderson\",\"fr\":\"James Anderson\",\"de\":\"James Anderson\",\"ar\":\"James Anderson\"}', '{\"en\":\"The intercity ride was a lifesaver for my business trip. The Wi-Fi and comfortable seating made the long journey enjoyable. Highly recommended!\",\"fr\":\"Le trajet intercity a été un sauveur pour mon voyage d\'affaires. Le Wi-Fi et les sièges confortables ont rendu le long trajet agréable. Je le recommande vivement !\",\"de\":\"Die Intercity-Fahrt war ein Lebensretter für meine Geschäftsreise. Das Wi-Fi und die bequemen Sitze machten die lange Fahrt angenehm. Sehr empfehlenswert\",\"ar\":\"كنت بحاجة إلى إرسال طرد عاجل، وكانت الخدمة رائعة. التوصيل كان سريعًا، ونظام التتبع أبقاني على اطلاع بكل خطو\"}', 5, 1, 88, 1, '2025-01-23 05:27:02', '2025-01-23 05:41:40', NULL),
(7, '{\"en\":\"Sophia Lee\",\"fr\":\"Sophia Lee\",\"de\":\"Sophia Lee\"}', '{\"en\":\"I’ve been using the cab service for months, and it’s always been a great experience. The drivers are courteous, and the cars are always clean\",\"fr\":\"Le service de livraison de colis est excellent. J\'ai envoyé un objet fragile, et il est arrivé en parfait état. L\'équipe l\'a manipulé avec grand soin\",\"de\":\"Ich nutze den Cab-Service seit Monaten, und es war immer eine großartige Erfahrung. Die Fahrer sind höflich, und die Autos sind immer sauber.\\\"\"}', 5, 1, 120, 1, '2025-01-23 05:27:45', '2025-01-23 05:37:45', NULL),
(8, '{\"en\":\"Daniel Clark\",\"fr\":\"Daniel Clark\",\"de\":\"Daniel Clark\",\"ar\":\"Daniel Clark\"}', '{\"en\":\"The package delivery service is top-notch. I sent a fragile item, and it arrived in perfect condition. The team handled it with great care.\",\"fr\":\"J\'utilise le service de cab depuis des mois, et c\'est toujours une excellente expérience. Les chauffeurs sont courtois, et les voitures sont toujours propres.\",\"de\":\"Der Paketzustellungsdienst ist erstklassig. Ich habe ein zerbrechliches Objekt verschickt, und es kam in perfektem Zustand an. Das Team hat es mit großer Sorgfalt behandelt.\",\"ar\":\"حجزت رحلة مجدولة لرحلة طيران مبكرة، وكانت مثالية. وصل السائق في الوقت المحدد، وكانت الرحلة سلسة وخالية من التوتر.\"}', 5, 1, 84, 1, '2025-01-23 05:28:15', '2025-01-23 05:41:57', NULL),
(9, '{\"en\":\"Ava Rodriguez\",\"fr\":\"Ava Rodriguez\",\"de\":\"Ava Rodriguez\",\"ar\":\"Ava Rodriguez\"}', '{\"en\":\"I booked a scheduled ride for a meeting, and it was flawless. The driver was professional, and the car was luxurious. I’ll definitely use this service again!\",\"fr\":\"J\'utilise le service de cab quotidiennement pour mes déplacements, et il est toujours fiable. Les chauffeurs sont sympathiques, et l\'application rend la réservation très facile. Excellent rapport qualité-prix !\",\"de\":\"Ich habe eine geplante Fahrt für ein Meeting gebucht, und es war makellos. Der Fahrer war professionell, und das Auto war luxuriös. Ich werde diesen Service definitiv wieder nutzen!\",\"ar\":\"أستخدم خدمة سيارات الأجرة يوميًا للتنقل، وهي دائمًا موثوقة. السائقون ودودون، والتطبيق يجعل الحجز سهلًا للغاية. قيمة رائعة مقابل الما\"}', 5, 1, 127, 1, '2025-01-23 05:28:50', '2025-01-23 05:41:25', NULL),
(10, '{\"en\":\"Noah Garcia\",\"fr\":\"Noah Garcia\",\"de\":\"Noah Garcia\",\"ar\":\"Noah Garcia\"}', '{\"en\":\"Renting a car was the best decision for our family vacation. The process was easy, and the car was perfect for our needs. Great service overall!\",\"fr\":\"Le trajet intercity était incroyablement confortable et ponctuel. Le chauffeur était professionnel, et la voiture était impeccable. Je recommande vivement ce service pour les voyages longue distance !\",\"de\":\"Das Mieten eines Autos war die beste Entscheidung für unseren Familienurlaub. Der Prozess war einfach, und das Auto war perfekt für unsere Bedürfnisse. Großartiger Service insgesamt!\",\"ar\":\"كانت الرحلة بين المدن مريحة للغاية وفي الموعد المحدد. السائق كان محترفًا، والسيارة كانت نظيفة تمامًا. أوصي بشدة بهذه الخدمة للسفر لمسافات طويل\"}', 5, 1, 75, 1, '2025-01-23 05:29:22', '2025-01-23 05:40:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `priority_id` bigint UNSIGNED DEFAULT NULL,
  `other_input_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_status_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `name`, `slug`, `ticket_number`, `subject`, `email`, `product_id`, `department_id`, `priority_id`, `other_input_field`, `ticket_status_id`, `note`, `status`, `created_by_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'Robert Miller', 'id5585', 'ID5585', 'Incorrect Personal Information', 'robertmil.@example.com', NULL, 1, 1, NULL, 1, NULL, 1, 1, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(2, NULL, 'John Due', 'id1159', 'ID1159', 'Missing Item from Ride', 'john.@example.com', NULL, 2, 2, NULL, 2, NULL, 1, 1, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(3, NULL, 'Thomas Rodriguez', 'id5657', 'ID5657', 'Issue with Ride Fare', 'thomas.@example.com', NULL, 3, 5, NULL, 3, NULL, 1, 1, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(4, 31, NULL, 'id3269', 'ID3269', 'Ride no work', NULL, NULL, 4, 1, NULL, 4, NULL, 1, 31, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(5, 31, NULL, 'id8179', 'ID8179', 'Ride no work', NULL, NULL, 5, 1, NULL, 5, NULL, 1, 31, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL),
(6, 43, NULL, 'id6048', 'ID6048', 'Test', NULL, NULL, 6, 1, NULL, 6, NULL, 1, 43, '2025-04-13 10:31:40', '2025-04-14 10:31:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_settings`
--

CREATE TABLE `ticket_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `values` json DEFAULT NULL,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_settings`
--

INSERT INTO `ticket_settings` (`id`, `values`, `created_by_id`, `created_at`, `updated_at`) VALUES
(1, '{\"email\": {\"mail_host\": \"ENTER_YOUR_HOST\", \"mail_port\": 465, \"mail_mailer\": \"smtp\", \"mail_password\": \"ENTER_YOUR_PASSWORD\", \"mail_username\": \"ENTER_YOUR_USERNAME\", \"mail_from_name\": \"no-reply\", \"mailgun_domain\": \"ENTER_YOUR_MAILGUN_DOMAIN\", \"mailgun_secret\": \"ENTER_YOUR_MAILGUN_SECRET\", \"mail_encryption\": \"ssl\", \"system_test_mail\": true, \"mail_from_address\": \"ENTER_YOUR_EMAIL@MAIL.COM\", \"password_reset_mail\": true}, \"general\": {\"ticket_prefix\": \"ID\", \"ticket_suffix\": \"random\", \"ticket_priority\": 1}, \"activation\": {\"ticket_recaptcha_enable\": 1, \"assign_notification_enable\": 1, \"create_notification_enable\": 1, \"status_notification_enable\": 1, \"replied_notification_enable\": 1}, \"email_piping\": {\"mail_host\": \"ENTER_YOUR_HOST\", \"mail_port\": 993, \"mail_password\": \"ENTER_YOUR_PASSWORD\", \"mail_protocol\": \"imap\", \"mail_username\": \"ENTER_YOUR_USERNAME\", \"mail_encryption\": \"ssl\"}, \"storage_configuration\": {\"max_file_upload\": 6, \"max_file_upload_size\": 2000000, \"supported_file_types\": [\"pdf\", \"csv\", \"doc\", \"jpeg\", \"jpg\", \"zip\", \"png\", \"docx\"]}}', 1, '2025-01-22 23:43:08', '2025-01-22 23:43:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image_id` bigint UNSIGNED DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `fleet_manager_id` bigint DEFAULT NULL,
  `referral_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referred_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `system_reserve` int NOT NULL DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_online` int DEFAULT NULL,
  `is_on_ride` int DEFAULT NULL,
  `location` json DEFAULT NULL,
  `service_id` bigint UNSIGNED DEFAULT NULL,
  `service_category_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `country_code`, `phone`, `password`, `profile_image_id`, `is_verified`, `status`, `fleet_manager_id`, `referral_code`, `fcm_token`, `referred_by_id`, `created_by_id`, `system_reserve`, `remember_token`, `deleted_at`, `created_at`, `updated_at`, `is_online`, `is_on_ride`, `location`, `service_id`, `service_category_id`) VALUES
(1, 'Administrator', 'admin', 'admin@example.com', '2025-01-22 23:43:05', '1', '2025550110', '$2y$12$Jz8GyLhgsGsXDINx6voWlep6ITahB23wJys0othy9yLTOJSzgcuOi', 586, 1, 1, NULL, '8AS3QkxWCE', NULL, NULL, 1, 1, 'p2cSyvqFJTFidl5EQG56EFiMXiXKgWcxYt7UpKRUkpbhfAbZCelnrgEOBJzQ', NULL, '2025-01-22 23:43:05', '2025-01-25 01:17:53', 1, NULL, NULL, NULL, NULL),
(2, 'Joseph', 'josephuser', 'joseph.user@example.com', '2025-01-22 23:43:06', NULL, '0', '$2y$12$8r/./YvBHRZ9LBU4fIZ.Ve0AkEo8lkRytJOsxJQT/jRtptJLru6XC', NULL, 1, 1, NULL, '8fsOlNkOih', NULL, NULL, NULL, 1, '832OHqcHgk', NULL, '2025-01-22 23:43:06', '2025-01-22 23:43:06', 1, NULL, NULL, NULL, NULL),
(3, 'John Due', 'johnrider', 'rider@example.com', NULL, '1', '0123456789', '$2y$10$Cl2u7HVwDQavkkjQVdjK.OM2TlUWFtXu8deyjjPsiM81l032qn/dm', NULL, 1, 1, NULL, 'epotrhwJme', 'dfsdf', NULL, 1, 1, NULL, NULL, '2025-01-22 23:43:06', '2025-04-28 04:55:17', 1, NULL, NULL, NULL, NULL),
(4, 'Jack Nicole', 'jackdriver', 'daniel.driver@example.com\n', NULL, '1', '2055550210', '$2y$10$Yw4NHYI3vVTcZWtDTMFr7uhFHLhikyuMkwATiTDTH6yDqRfjEGw/.', NULL, 1, 1, NULL, 'lEuGd3dJ6g', NULL, NULL, 4, 1, NULL, NULL, '2025-01-22 23:43:07', '2025-03-20 02:23:34', 1, NULL, '[{\"lat\": 21.1983038, \"lng\": 72.7960866}]', NULL, NULL),
(5, 'Smith Due', NULL, 'executive@example.com', NULL, '1', '78945622', '$2y$10$8jTmiacZ2.DxKKUIDlyvi.Qp4YvozJaY3ehcCIFv/wUDFpdqsQUQW', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2025-01-22 23:43:08', '2025-01-22 23:43:08', 1, NULL, NULL, NULL, NULL),
(6, 'Ashley Hall', 'ashleyhall', 'ashley.hall@riderexample.com', NULL, '359', '2045550301', '$2y$12$Eu5HQt5rOrgayIXiBbSwteJ0J18WQlHmyBODxJeALF2RyB1zS85fK', NULL, 0, 1, NULL, 'jJp7gB4Z8l', NULL, NULL, 6, 0, NULL, NULL, '2025-01-23 00:17:54', '2025-01-30 04:17:00', 1, NULL, NULL, NULL, NULL),
(7, 'Lisa Brown', NULL, 'lisa.rider@example.com', NULL, '1', '2055550302', '$2y$12$tYhf5kZZsn5TB6r.cT/BOusCOkx.ygBT6JE3rl3XtOrUZYSv0E3li', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 00:19:43', '2025-01-23 00:19:43', 1, NULL, NULL, NULL, NULL),
(8, 'Jake White', NULL, 'jake.rider@example.com', NULL, '1', '2055550303', '$2y$12$X5/IHcruOLn169two07zuucDGVvy5RGsafjbl3KUISY4bTaMBantO', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 00:20:53', '2025-01-23 00:20:53', 1, NULL, NULL, NULL, NULL),
(9, 'Eric Parker', 'ericrider', 'eric.rider@example.com', NULL, '1', '2055550304', '$2y$12$BsVVxH5vv47OPUlFVeiUHu6dGTplTrXuipyxWSADpEoshNc5NG9We', NULL, 0, 1, NULL, 'a2Dm47O3uW', NULL, NULL, 9, 0, NULL, NULL, '2025-01-23 00:31:42', '2025-01-29 23:30:24', 1, NULL, NULL, NULL, NULL),
(10, 'Matt Miller', 'mattrider', 'matt.rider@example.com', NULL, '1', '2055550305', '$2y$12$ba0JLs9c1bztIDMO83V20e7nrFLKIdzObltgLQQ9L70xCTZUA89Lu', NULL, 0, 1, NULL, '18peXDdqL6', NULL, NULL, 10, 0, NULL, NULL, '2025-01-23 00:32:09', '2025-01-29 22:49:39', 1, NULL, NULL, NULL, NULL),
(11, 'Amy Wilson', 'amyrider', 'amy.rider@example.com', NULL, '1', '2055550306', '$2y$12$Nea2fMOx8OEOk7nBnE0aWeolMO4/J9RCH1fVXtfG1v8YwYSeuUcUq', NULL, 0, 1, NULL, 'aFR4tPLmCa', NULL, NULL, 11, 0, NULL, NULL, '2025-01-23 00:32:49', '2025-01-29 05:35:00', 1, NULL, NULL, NULL, NULL),
(12, 'Ben Taylor', NULL, 'ben.rider@example.com', NULL, '1', '2055550307', '$2y$12$iAlMpYLlFOfHRPWdY6HSMurh06xyBp4ARWFdBiJLbF/A3m3sBEyty', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 00:33:42', '2025-01-23 00:33:42', 1, NULL, NULL, NULL, NULL),
(13, 'Sarah Harris', NULL, 'sarah.rider@example.com', NULL, '1', '2059540308', '$2y$12$RUHgktB5vyb5fibOX6BWEe1qIey3uDJNV3fof7.RIR11iFxllbILK', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 00:34:16', '2025-01-23 00:34:16', 1, NULL, NULL, NULL, NULL),
(14, 'Alex Clark', 'alexrider', 'alex.rider@example.com', NULL, '1', '2057520309', '$2y$12$ieXPDl6aG3KzRGVcW2GhpeU9DEqZcnvs2BSLWungIYRYO4N/iY5DS', NULL, 0, 1, NULL, 'lFygK2Vkga', NULL, NULL, 14, 0, NULL, NULL, '2025-01-23 00:34:59', '2025-01-29 01:14:40', 1, NULL, NULL, NULL, NULL),
(15, 'Katie Hall', NULL, 'katie.rider@example.com', NULL, '1', '2053250310', '$2y$12$w2Lj/MtyE1b.18Il4H/gBe5illcss/35Q8GcG.lRtrDRodSjhkZ2C', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 00:35:58', '2025-01-23 00:35:58', 1, NULL, NULL, NULL, NULL),
(16, 'Marcus Griffin', 'Teater', 'marcus.griffin@riderexample.com', NULL, '91', '1234567899', NULL, NULL, 0, 1, NULL, 'TEA949', 'doNmsm01Tu6CekyK_5STxd:APA91bH5ThpV19hijgcAozQLHBbKltTN9ik0DUQiuLq48j3DNDutDd47P7GP9L3j_mx_UlhzxYbgvTXGu7EL8ww8ty2MtQicxe0JthiCqHAZKO09yis78ks', NULL, 1, 0, NULL, NULL, '2025-01-23 00:39:19', '2025-01-23 02:26:03', 1, NULL, NULL, NULL, 1),
(17, 'John Smith', 'johnsmith', 'johnsmith.driver@example.com', NULL, '1', '2053250310', NULL, 622, 1, 1, NULL, NULL, NULL, NULL, 17, 0, NULL, NULL, '2025-01-23 01:21:12', '2025-01-30 04:13:41', 1, NULL, '[{\"lat\": 37.544256323159765, \"lng\": 126.9832105308884}]', 1, NULL),
(18, 'Mike Brown', 'mikebrown', 'mikebrown.driver@example.com', NULL, '1', '2055550299', NULL, 599, 1, 1, NULL, NULL, NULL, NULL, 18, 0, NULL, NULL, '2025-01-23 01:23:04', '2025-01-30 00:34:05', 1, NULL, '[{\"lat\": 6.513212771013711, \"lng\": 3.382981342411826}]', 1, 2),
(19, 'David Scott', 'davidscott', 'david.scott@gmail.com', NULL, '1', '7990661829', NULL, 565, 1, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 01:29:18', '2025-01-25 01:01:06', 1, NULL, '[{\"lat\": -34.59615290177227, \"lng\": -58.447176215622214}]', 1, 4),
(20, 'Chris Adams', 'chrisadams', 'chris.driver@example.com', NULL, '1', '2055550204', NULL, 600, 1, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 01:31:45', '2025-01-25 01:00:29', 1, NULL, '[{\"lat\": 13.735239281367912, \"lng\": 100.52079061529236}]', 2, 1),
(21, 'Robert King', 'robertking', 'robert.driver@example.com', NULL, '1', '2055550205', NULL, 596, 1, 1, NULL, NULL, NULL, NULL, 21, 0, NULL, NULL, '2025-01-23 01:33:56', '2025-01-30 00:21:24', 1, NULL, '[{\"lat\": -33.94121239867857, \"lng\": 18.643195525564572}]', 1, 5),
(22, 'Mark Williams', 'markwilliams', 'mark.driver@example.com', NULL, '1', '2055550206', NULL, 614, 1, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 01:35:43', '2025-01-25 00:56:52', 1, NULL, '[{\"lat\": -22.963945722254937, \"lng\": -48.55248252684832}]', 1, 1),
(23, 'Paul Jones', 'pauljones', 'paul.driver@example.com', NULL, '1', '2055550207', NULL, 619, 1, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 01:39:09', '2025-01-25 00:45:50', 1, NULL, '[{\"lat\": 55.76180242273754, \"lng\": 37.645440282379134}]', 1, 2),
(24, 'Lucas Rodriguez', 'lucasrodriguez', 'lucas.driver@example.com', NULL, '1', '2055550208', NULL, 620, 1, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 01:41:05', '2025-01-25 00:45:06', 1, NULL, '[{\"lat\": 39.89930849204199, \"lng\": 116.37714921333922}]', 2, 2),
(25, 'Daniel Miller', 'danielmiller', 'driver@example.com', NULL, '1', '1234567890', '$2y$12$YNA2TFRmK7bInr0klQObzOMmpmmmjm2FVj7udXQWbe.7doylFYzxK', 562, 1, 1, NULL, NULL, NULL, NULL, 25, 0, NULL, NULL, '2025-01-23 01:43:01', '2025-03-20 04:22:56', 1, 0, '[{\"lat\": \"34.090009\", \"lng\": \"-118.128003\"}]', 1, 2),
(26, 'Brian Clark', 'brianclark', 'brian.driver@example.com', NULL, '1', '2055550210', NULL, 584, 1, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 01:44:40', '2025-01-29 06:53:53', 1, NULL, '[{\"lat\": 34.08681301666202, \"lng\": -118.32716791615388}]', 3, 1),
(27, 'Stephen Morris', 'stephenmorris', 'stephen.driver@example.com', NULL, '1', '2055550211', NULL, 572, 1, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 01:50:03', '2025-01-29 05:47:17', 1, NULL, '[{\"lat\": -37.8136, \"lng\": 144.9631}]', 2, 1),
(28, 'Aaron Brown', 'aaronbrown', 'aaron.driver@example.com', NULL, '1', '2055550212', NULL, 578, 1, 1, NULL, NULL, NULL, NULL, 28, 0, NULL, NULL, '2025-01-23 01:52:02', '2025-01-29 06:25:20', 1, NULL, '[{\"lat\": 35.69045781132972, \"lng\": 139.7616755138559}]', 1, 1),
(29, 'Michael Williams', 'michaelwilliams', 'michael.driver@example.com', NULL, '1', '2055550213', NULL, 569, 1, 1, NULL, NULL, NULL, NULL, 29, 0, NULL, NULL, '2025-01-23 01:57:52', '2025-01-29 02:44:52', 1, NULL, '[{\"lat\": 41.87377186615283, \"lng\": -87.68547677543283}]', 1, 2),
(30, 'Thomas Rodriguez', 'thomasrodriguez', 'thomas.driver@example.com', NULL, '1', '2055550215', NULL, 570, 1, 1, NULL, NULL, NULL, NULL, 30, 0, NULL, NULL, '2025-01-23 02:01:19', '2025-01-29 03:25:10', 1, NULL, '[{\"lat\": 41.89069308330897, \"lng\": 12.484102536135833}]', 1, 2),
(31, 'Robert Miller', 'robertmiller', 'robertmil.driver@example.com', NULL, '1', '2055550214', NULL, 574, 1, 1, 64, NULL, 'cfOT2flhQjeW-R1a762ppA:APA91bFKLEuRwxWhbnapepve2tD_8IFEPq2MqfMqZK0yH8zKqw0xxjXPVzApowDbChZXAtSxB8RpiUxqAhiv02xMEv7F_IVus1crG9ip6l0AoWGvm_H4ErQ', NULL, 1, 0, NULL, NULL, '2025-01-23 02:02:04', '2025-04-29 01:59:15', 1, 0, '[{\"lat\": 18.772213167863544, \"lng\": 73.83981727187502}]', 4, NULL),
(32, 'Alex Jones', 'alexjones', 'alex.driver@example.com', NULL, '1', '2055550216', NULL, 582, 1, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 02:08:48', '2025-01-28 00:49:24', 1, NULL, '[{\"lat\": 39.127657036614856, \"lng\": -81.17716018800469}]', 3, 2),
(33, 'Daniel Scott', 'danielscott', 'danielst.driver@example.com', NULL, '1', '2055550217', NULL, 577, 1, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 02:11:55', '2025-01-25 00:32:03', 1, NULL, '[{\"lat\": 37.77405502191213, \"lng\": -122.45113442668914}]', 1, 4),
(34, 'Samuel Thompson', 'samuelthompson', 'samuel.driver@example.com', NULL, '1', '2055550218', NULL, 561, 1, 1, NULL, NULL, NULL, NULL, 34, 0, NULL, NULL, '2025-01-23 02:16:34', '2025-01-30 05:53:39', NULL, NULL, '[{\"lat\": 19.349259433276355, \"lng\": -99.02030611500837}]', 2, 3),
(35, 'Matthew Martinez', 'matthewmartinez', 'matthew.driver@example.com', NULL, '1', '2055550219', NULL, 599, 1, 1, NULL, NULL, NULL, NULL, 35, 0, NULL, NULL, '2025-01-23 02:20:23', '2025-01-30 00:06:42', NULL, NULL, '[{\"lat\": 25.04884459284733, \"lng\": 55.14675345865175}]', 1, 2),
(36, 'Rayon Scarl', 'rayonscarl', 'raj.kumar@example.com', NULL, '91', '9856543210', NULL, 592, 1, 1, 64, NULL, 'dw87s_qARPuwO9H8oXniTh:APA91bFesADsj5tGBYG2oUMy3k4ebE4yb_-mheMwMfQEpu70Rvx8O2qsAsELSAPWflRN7hQa62v3fm2797YYUOFzWTQ3tUNeIDlQhsEB6nedulZwMBeBbjM', NULL, 1, 0, NULL, NULL, '2025-01-23 02:23:49', '2025-04-29 03:59:36', 1, 1, '[{\"lat\": 35.77884766079101, \"lng\": -104.99245772578128}]', 4, NULL),
(37, 'Kimberly Ward', 'kimberlyward', 'kimberly.ward@riderexample.com', NULL, '1', '2045550321', '$2y$12$eHYL3TYe1dwG.8uJOvKXdOKwhLifR0diGqjrG.RA1/Yd5ozexvy8a', NULL, 0, 1, NULL, '3S1OV1QVa0', NULL, NULL, 37, 0, NULL, NULL, '2025-01-23 02:27:58', '2025-01-29 23:46:31', NULL, NULL, NULL, NULL, NULL),
(38, 'Victoria Evans', NULL, 'victoria.evans@riderexample.com', NULL, '1', '2045550323', '$2y$12$jEmNqYDwsb5Ugx5dsNQvyeLuJlKsWmuyUfEnFwMV9.FezDDePsIR.', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 02:28:32', '2025-01-23 02:28:32', NULL, NULL, NULL, NULL, NULL),
(39, 'Ryan Rivera', NULL, 'ryan.rivera@riderexample.com', NULL, '1', '2045550324', '$2y$12$g3HjOl0w/Bkf3DBW4zFlPeUyQqmsKqAIPkJLNs2hEvnG1QiQQA7ti', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 02:29:11', '2025-01-23 02:29:11', NULL, NULL, NULL, NULL, NULL),
(40, 'Kaitlyn Coleman', 'kaitlyncoleman', 'kaitlyn.coleman@riderexample.com', NULL, '1', '2045550325', '$2y$12$Fj4H/PDybQh1ik80LLfc7eMY/b9UycU5N2.KANZWFiJlemnFSTn2O', NULL, 0, 1, NULL, 'rTvPxBvW0Y', 'dfsdf', NULL, 1, 0, NULL, NULL, '2025-01-23 02:30:12', '2025-04-29 06:06:08', NULL, NULL, NULL, NULL, NULL),
(41, 'Abigail Butler', 'abigailbutler', 'abigail.butler@example.com', NULL, '1', '2045550319', '$2y$12$wFUHsrHPv4byO4H2.xrSneuuC.JL5dV92GAMFWvuJhrxVxBYX6Wji', NULL, 0, 1, NULL, 'BDv49fjFga', NULL, NULL, 41, 0, NULL, NULL, '2025-01-23 03:03:21', '2025-01-30 05:58:05', NULL, NULL, NULL, NULL, NULL),
(42, 'Olivia Sanders', 'oliviasanders', 'olivia.sanders@riderexample.com', NULL, '1', '2045550317', '$2y$12$zI0oXokZoyKkeR4XamLfZuTIGnaSezBiDrPD8mHcSm/klJVzewWie', NULL, 0, 1, NULL, 'ZkqO6Qvgaz', NULL, NULL, 42, 0, NULL, NULL, '2025-01-23 03:05:19', '2025-01-29 03:39:55', NULL, NULL, NULL, NULL, NULL),
(43, 'Luke Howard', 'lukehoward', 'luke.howard@riderexample.com', NULL, '1', '2045550314', '$2y$12$SDY.qPVqqYk62fsv/aK1j./abSaXYSMEsNMIOh08092HeRur7X8su', NULL, 0, 1, NULL, 'OHGkA6sOqj', NULL, NULL, 43, 0, NULL, NULL, '2025-01-23 03:06:13', '2025-03-20 02:34:08', 1, NULL, NULL, NULL, NULL),
(44, 'Mia Walker', 'miawalker', 'mia.walker@adminexample.com', NULL, '1', '2025550112', '$2y$12$AXVe8EdHUjY85xVPwoeBh.y.GqBnSGuw0fg/XbX323NW3Wxu61AwC', NULL, 0, 1, NULL, 'iPUCEGUfap', NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 03:19:21', '2025-01-23 03:19:21', NULL, NULL, NULL, NULL, NULL),
(45, 'Emily Davis', 'emilydavis', 'emily.davis@adminexample.com', NULL, '1', '2025550104', '$2y$12$TK/tQtpJMNlrLr.537A9EOyMDL/wZyeRyYoI.ibiGeWj.A7cJnSYW', NULL, 0, 1, NULL, 'pF5Mh4npW6', NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 03:20:00', '2025-01-23 03:20:00', 1, NULL, NULL, NULL, NULL),
(46, 'John Anderson', 'johnanderson', 'john.anderson@adminexample.com', NULL, '1', '2025550101', '$2y$12$hI0UNn67vTnbg/JPluYk7uu9ZLeMQzRBhbATkp5m4TlzLyRKAu7Ja', NULL, 0, 1, NULL, '5B63ZvSeA7', NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 03:20:36', '2025-01-23 03:20:36', 1, NULL, NULL, NULL, NULL),
(47, 'Daniel Taylor', 'danieltaylor', 'daniel.taylor@adminexample.com', NULL, '1', '2025550107', '$2y$12$LHoAR5PIN03C.f4ud47YPOxzRotQbMQZXDhfPpx9Kd3uFCb4yKr0G', NULL, 0, 1, NULL, 'wK9eT7dg0J', NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 03:21:29', '2025-01-23 03:21:29', 1, NULL, NULL, NULL, NULL),
(48, 'Ethan Clark', 'ethanclark', 'ethan.clark@adminexample.com', NULL, '1', '2025550111', '$2y$12$wPwxHoKNedOeGG2EfscAtO5iUWEwgNRke5hbNsfN.UZP7zG0QEXe6', NULL, 0, 1, NULL, '9ddknG5x8f', NULL, NULL, 1, 0, NULL, NULL, '2025-01-23 03:22:04', '2025-01-23 03:22:04', 1, NULL, NULL, NULL, NULL),
(49, 'James Wilson', NULL, 'james.wilson@example.com', NULL, '1', '5559012345', '$2y$12$F9yJCkeXB7bYAbaAhMPfsOUelKq/6uHK/5rLhJ8l2/0JbB3L6HfBS', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-28 00:34:34', '2025-01-28 00:34:34', NULL, NULL, NULL, NULL, NULL),
(50, 'Anna Scott', NULL, 'anna.scott@example.com', NULL, '1', '5552340123', '$2y$12$5ETo3L1zSjAMrOT08Buq8uhb/ZCmackQ9jn2skZ3VIVhj7Khaq8HK', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-28 00:35:23', '2025-01-28 00:35:23', NULL, NULL, NULL, NULL, NULL),
(51, 'Robert Clark', NULL, 'robert.clark@example.com', NULL, '1', '5553452345', '$2y$12$YMvtwDCiRucI.SjjH03apuCmkmbBBKGzQBQfOrwZPfKKDawmx2dmG', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-28 00:36:22', '2025-01-28 00:36:22', NULL, NULL, NULL, NULL, NULL),
(52, 'Kevin Turner', NULL, 'kevin.turner@example.com', NULL, '1', '5557890123', '$2y$12$zZ5o8WcrjCU6LzeZbIPxqeg4SDzdtQoC0/FO.4r2wlNYcw1DUzvTy', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-28 00:37:27', '2025-01-28 00:37:27', NULL, NULL, NULL, NULL, NULL),
(53, 'Laura Davis', NULL, 'laura.davis@example.com', NULL, '1', '5550123456', '$2y$12$/7apOx.EIAvlunDIdAlBg.twSxlmA42FheP5tNoROGZnrJrJkVBcy', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-28 00:38:15', '2025-01-28 00:38:15', NULL, NULL, NULL, NULL, NULL),
(54, 'Riyan Prasetyo', 'riyan.prasetyo', 'riyan.prasetyo@example.com', NULL, '61', '81234567890', NULL, 624, 1, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-28 03:10:33', '2025-01-28 03:22:31', NULL, NULL, '[{\"lat\": -1.3119705387570564, \"lng\": 36.90288910995129}]', NULL, NULL),
(55, 'Salma Mahmoud', 'salmamahmoud', 'salma.mahmoud@example.com', NULL, '20', '1012345678', '$2y$12$qFzmGX/wzlnzKAIrsRYhAu4repxFIGIVbc8ylNcwfRs8VPIIC7efy', 600, 1, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-01-28 03:22:20', '2025-01-28 03:22:30', NULL, NULL, '[{\"lat\": 30.02380500042726, \"lng\": 31.25235697030022}]', NULL, NULL),
(57, 'Joe Dispatch', 'dispatcher', 'dispatcher@example.com', NULL, '1', '9876543210', '$2y$12$BO0yJVnsJGGwA8oCkLToaeSGowW9YAWlydwVBMGYJTDw35KHosnzS', NULL, 0, 1, NULL, 'V9FAoXmfJZ', NULL, NULL, 57, 1, NULL, NULL, '2025-03-17 05:08:19', '2025-03-17 06:37:46', NULL, NULL, NULL, NULL, NULL),
(59, 'John Doe', NULL, 'john.doe@fleetmanager.com', NULL, '1', '2356897413', '$2y$12$u3tdtXjwk9cZ3I5TwmLtG.EhUITC7Sn7D93rGPwqw6IG9jTXfYqvW', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-04-28 07:41:09', '2025-04-28 07:41:09', NULL, NULL, NULL, NULL, NULL),
(60, 'Jane Smith', NULL, 'jane.smith@fleetmanager.com', NULL, '1', '7539518624', '$2y$12$qm/5d4hYKfh6CfVFitZlDOr6N85UBoOoYDg7nb.lJ6M1Tlo69mW9G', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-04-28 07:43:23', '2025-04-28 07:43:23', NULL, NULL, NULL, NULL, NULL),
(61, 'Robert Brown', NULL, 'robert.brown@fleetmanager.com', NULL, '1', '122334455', '$2y$12$70V/zskFvPEVjGt0RtiYjuwKQNir62O3rV6k3gPdjRNbdIFEseZne', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-04-28 07:44:26', '2025-04-28 07:44:26', NULL, NULL, NULL, NULL, NULL),
(62, 'Emily White', NULL, 'emily.white@fleetmanager.com', NULL, '1', '098765432', '$2y$12$OLA7AwMZom36fq3z.qRyCeUP8eJ0IPtB.kGgS9IHMj0o3rrmDCbrm', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-04-28 07:45:21', '2025-04-28 07:45:21', NULL, NULL, NULL, NULL, NULL),
(63, 'Sarah Blue', NULL, 'sarah.blue@fleetmanager.com', NULL, '1', '567890123', '$2y$12$SQ1QHkdaV2yIPaH065lwIeolG2PHP53v9JgB135dRyR54q6SanL3.', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-04-28 07:46:30', '2025-04-28 07:46:30', NULL, NULL, NULL, NULL, NULL),
(64, 'Fleet Manager', NULL, 'fleet@example.com', NULL, '1', '4321098765', '$2y$12$5gcg0SDxi2hCUGxaVU2eFu0tHhr326x398C1gxHIqfhqISvCG323e', NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '2025-04-28 07:49:24', '2025-04-28 07:49:24', NULL, NULL, NULL, NULL, NULL),
(65, 'Martin Rojas', 'martin_rojas', 'martin.rojas@example.com', NULL, '1', '6235559876', '$2y$12$d0DaQt6NT66dhco5tmeane44GdkfxQZ7Aj0XK0pemqPOa1VN3bmdu', 44, 1, 1, 64, NULL, NULL, NULL, 65, 0, NULL, NULL, '2025-04-29 03:57:13', '2025-04-29 23:42:11', 1, 0, '[{\"lat\": 27.5224849, \"lng\": -82.7315769}]', 4, NULL),
(66, 'David Cruz', 'david_cruz', 'david.cruz@example.com', NULL, '1', '5551234567', '$2y$12$blFoAdSPzS7UQD.cuLRU4enyHYbpslQSQ6158GLDK3IoWqZ.h0TVe', 66, 1, 1, 64, NULL, NULL, NULL, 66, 0, NULL, NULL, '2025-04-29 04:04:53', '2025-04-29 23:31:27', 1, 0, '[{\"lat\": 40.6611272, \"lng\": -73.94927109999999}]', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `vehicle_type_id` bigint UNSIGNED NOT NULL,
  `service_category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`id`, `vehicle_type_id`, `service_category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(48, 2, 1, NULL, NULL, NULL),
(49, 2, 4, NULL, NULL, NULL),
(50, 3, 1, NULL, NULL, NULL),
(51, 3, 2, NULL, NULL, NULL),
(52, 3, 3, NULL, NULL, NULL),
(53, 3, 4, NULL, NULL, NULL),
(54, 3, 5, NULL, NULL, NULL),
(55, 1, 1, NULL, NULL, NULL),
(56, 1, 2, NULL, NULL, NULL),
(57, 1, 3, NULL, NULL, NULL),
(58, 1, 4, NULL, NULL, NULL),
(59, 1, 5, NULL, NULL, NULL),
(60, 6, 6, NULL, NULL, NULL),
(61, 6, 7, NULL, NULL, NULL),
(62, 6, 8, NULL, NULL, NULL),
(63, 7, 6, NULL, NULL, NULL),
(64, 7, 7, NULL, NULL, NULL),
(65, 7, 8, NULL, NULL, NULL),
(66, 10, 9, NULL, NULL, NULL),
(67, 10, 10, NULL, NULL, NULL),
(68, 10, 11, NULL, NULL, NULL),
(72, 9, 9, NULL, NULL, NULL),
(73, 9, 10, NULL, NULL, NULL),
(74, 9, 11, NULL, NULL, NULL),
(75, 4, 1, NULL, NULL, NULL),
(76, 4, 2, NULL, NULL, NULL),
(77, 4, 3, NULL, NULL, NULL),
(78, 4, 4, NULL, NULL, NULL),
(79, 4, 5, NULL, NULL, NULL),
(80, 5, 6, NULL, NULL, NULL),
(81, 5, 7, NULL, NULL, NULL),
(82, 5, 8, NULL, NULL, NULL),
(83, 8, 9, NULL, NULL, NULL),
(84, 8, 10, NULL, NULL, NULL),
(85, 8, 11, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_images`
--

CREATE TABLE `vehicle_images` (
  `id` bigint UNSIGNED NOT NULL,
  `vehicle_image_id` bigint UNSIGNED DEFAULT NULL,
  `attachment_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_info`
--

CREATE TABLE `vehicle_info` (
  `id` bigint UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amb_per_dist_fees` double DEFAULT NULL,
  `plate_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seat` int DEFAULT NULL,
  `vehicle_type_id` bigint UNSIGNED DEFAULT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_info`
--

INSERT INTO `vehicle_info` (`id`, `name`, `description`, `amb_per_dist_fees`, `plate_number`, `color`, `model`, `seat`, `vehicle_type_id`, `driver_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, NULL, NULL, 'CA01AB1234', 'White', 'Corolla', 4, 3, 17, '2025-01-23 01:21:12', '2025-01-23 01:21:12', NULL),
(2, NULL, NULL, NULL, 'TX02CD5678', 'Black', 'Yamaha MT-15', 2, 1, 18, '2025-01-23 01:23:04', '2025-01-23 01:23:04', NULL),
(3, NULL, NULL, NULL, 'FL03EF9012', 'Yellow', 'Honda City', 3, 3, 19, '2025-01-23 01:29:18', '2025-01-24 05:39:19', NULL),
(4, NULL, NULL, NULL, 'NY04GH3456', 'Blue', 'Ford Transit', 8, 5, 20, '2025-01-23 01:31:45', '2025-01-23 01:31:45', NULL),
(5, NULL, NULL, NULL, 'IL05IJ7890', 'Black', 'Mercedes E-Class', 4, 4, 21, '2025-01-23 01:33:56', '2025-01-23 01:33:56', NULL),
(6, NULL, NULL, NULL, 'CA06JK2345', 'Red', 'Honda Civic', 4, 3, 22, '2025-01-23 01:35:43', '2025-01-23 01:35:43', NULL),
(7, NULL, NULL, NULL, 'TX07KL3456', 'Yellow', 'Tata Magic', 7, 6, 23, '2025-01-23 01:39:09', '2025-01-28 02:19:31', NULL),
(8, NULL, NULL, NULL, 'FL08LM4567', 'Green', 'Bajaj RE', 3, 2, 24, '2025-01-23 01:41:05', '2025-01-23 01:41:05', NULL),
(9, NULL, NULL, NULL, 'CA09MN6789', 'Blue', 'Ford Focus', 4, 3, 25, '2025-01-23 01:43:01', '2025-01-23 01:43:01', NULL),
(10, NULL, NULL, NULL, 'NV10OP2345', 'Silver', 'Mercedes Sprinter', 8, 3, 26, '2025-01-23 01:44:40', '2025-01-29 06:53:53', NULL),
(11, NULL, NULL, NULL, 'CA11QR1234', 'Gray', 'Hyundai Elantra', 4, 4, 27, '2025-01-23 01:50:03', '2025-01-28 02:06:55', NULL),
(12, NULL, NULL, NULL, 'TX12UV6789', 'Red', 'Mahindra Bolero', 7, 6, 28, '2025-01-23 01:52:02', '2025-01-23 01:52:02', NULL),
(13, NULL, NULL, NULL, 'OH14XY1234', 'Yellow', 'Tata Ace', 2, 8, 29, '2025-01-23 01:57:52', '2025-01-23 01:57:52', NULL),
(14, NULL, NULL, NULL, 'NY16UR2345', 'Blue', 'Volvo VNL', 2, 3, 30, '2025-01-23 02:01:19', '2025-01-28 02:03:01', NULL),
(15, NULL, NULL, NULL, 'MI15ZT6789', 'White', 'Suzuki Maza', 2, 3, 31, '2025-01-23 02:02:04', '2025-01-24 20:07:14', NULL),
(16, NULL, NULL, NULL, 'GA17PR3456', 'Black', 'Mahindra Bolero', 7, 6, 32, '2025-01-23 02:08:48', '2025-01-23 02:08:48', NULL),
(17, NULL, NULL, NULL, 'CO18JK2345', 'Green', 'Mack Anthem', 2, 9, 33, '2025-01-23 02:11:55', '2025-01-23 22:21:39', '2025-01-23 22:21:39'),
(18, NULL, NULL, NULL, 'IL19QW1234', 'Yellow', 'Tata Magic', 5, 1, 34, '2025-01-23 02:16:34', '2025-01-28 01:57:11', NULL),
(19, NULL, NULL, NULL, 'NY21FG6789', 'White', 'Peterbilt 389', 2, 10, 35, '2025-01-23 02:20:23', '2025-01-23 02:20:23', NULL),
(20, NULL, NULL, NULL, 'KA05AB6789', 'Black', 'Royal Enfield Classic 350', 2, 1, 36, '2025-01-23 02:23:49', '2025-01-28 01:53:01', NULL),
(21, NULL, NULL, NULL, 'CO18JK2345', 'Green', 'Mack Anthem', 2, 9, 33, '2025-01-23 22:37:43', '2025-01-24 05:38:51', NULL),
(22, NULL, NULL, NULL, 'ID01AT6543', 'Yellow', 'Tata Ace', 2, 7, 54, '2025-01-28 03:10:33', '2025-01-28 03:10:33', NULL),
(23, NULL, NULL, NULL, 'EG01BI9876', 'Red', 'Vespa LX125', 2, 1, 55, '2025-01-28 03:22:20', '2025-01-28 03:22:20', NULL),
(24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, '2025-04-29 03:57:13', '2025-04-29 03:57:13', NULL),
(25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66, '2025-04-29 04:04:53', '2025-04-29 04:04:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_services`
--

CREATE TABLE `vehicle_services` (
  `id` bigint UNSIGNED NOT NULL,
  `vehicle_type_id` bigint UNSIGNED NOT NULL,
  `service_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_services`
--

INSERT INTO `vehicle_services` (`id`, `vehicle_type_id`, `service_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 3, 2),
(5, 3, 3),
(6, 4, 1),
(7, 4, 3),
(9, 5, 3),
(10, 6, 2),
(11, 6, 3),
(12, 7, 2),
(13, 7, 3),
(14, 8, 2),
(15, 8, 3),
(16, 9, 2),
(17, 9, 3),
(18, 10, 2),
(19, 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_surge_prices`
--

CREATE TABLE `vehicle_surge_prices` (
  `id` bigint UNSIGNED NOT NULL,
  `vehicle_type_id` bigint UNSIGNED NOT NULL,
  `zone_id` bigint UNSIGNED NOT NULL,
  `surge_price_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(8,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_surge_prices`
--

INSERT INTO `vehicle_surge_prices` (`id`, `vehicle_type_id`, `zone_id`, `surge_price_id`, `amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 2.00, '2025-07-17 03:12:32', '2025-07-17 03:12:32', NULL),
(2, 1, 1, 2, 2.50, '2025-07-17 03:12:33', '2025-07-17 03:12:33', NULL),
(3, 1, 1, 3, 1.75, '2025-07-17 03:12:33', '2025-07-17 03:12:33', NULL),
(4, 1, 1, 4, 3.00, '2025-07-17 03:12:33', '2025-07-17 03:12:33', NULL),
(5, 1, 1, 5, 2.80, '2025-07-17 03:12:33', '2025-07-17 03:12:33', NULL),
(6, 2, 1, 1, 3.00, '2025-07-17 03:13:04', '2025-07-17 03:13:04', NULL),
(7, 2, 1, 2, 3.50, '2025-07-17 03:13:04', '2025-07-17 03:13:04', NULL),
(8, 2, 1, 3, 2.50, '2025-07-17 03:13:04', '2025-07-17 03:13:04', NULL),
(9, 2, 1, 4, 4.00, '2025-07-17 03:13:04', '2025-07-17 03:13:04', NULL),
(10, 2, 1, 5, 3.80, '2025-07-17 03:13:04', '2025-07-17 03:13:04', NULL),
(11, 3, 1, 1, 3.00, '2025-07-17 03:14:29', '2025-07-17 03:14:29', NULL),
(12, 3, 1, 2, 3.50, '2025-07-17 03:14:29', '2025-07-17 03:14:29', NULL),
(13, 3, 1, 3, 2.50, '2025-07-17 03:14:29', '2025-07-17 03:14:29', NULL),
(14, 3, 1, 4, 4.00, '2025-07-17 03:14:30', '2025-07-17 03:14:30', NULL),
(15, 3, 1, 5, 3.80, '2025-07-17 03:14:30', '2025-07-17 03:14:30', NULL),
(16, 4, 1, 1, 3.80, '2025-07-17 03:15:10', '2025-07-17 03:15:10', NULL),
(17, 4, 1, 2, 4.30, '2025-07-17 03:15:10', '2025-07-17 03:15:10', NULL),
(18, 4, 1, 3, 3.20, '2025-07-17 03:15:10', '2025-07-17 03:15:10', NULL),
(19, 4, 1, 4, 4.80, '2025-07-17 03:15:10', '2025-07-17 03:15:10', NULL),
(20, 4, 1, 5, 4.50, '2025-07-17 03:15:10', '2025-07-17 03:15:10', NULL),
(21, 5, 1, 1, 3.50, '2025-07-17 03:15:38', '2025-07-17 03:15:38', NULL),
(22, 5, 1, 2, 4.00, '2025-07-17 03:15:38', '2025-07-17 03:15:38', NULL),
(23, 5, 1, 3, 3.00, '2025-07-17 03:15:38', '2025-07-17 03:15:38', NULL),
(24, 5, 1, 4, 4.50, '2025-07-17 03:15:38', '2025-07-17 03:15:38', NULL),
(25, 5, 1, 5, 4.20, '2025-07-17 03:15:38', '2025-07-17 03:15:38', NULL),
(26, 6, 1, 1, 4.00, '2025-07-17 03:16:04', '2025-07-17 03:16:04', NULL),
(27, 6, 1, 2, 4.50, '2025-07-17 03:16:04', '2025-07-17 03:16:04', NULL),
(28, 6, 1, 3, 3.50, '2025-07-17 03:16:04', '2025-07-17 03:16:04', NULL),
(29, 6, 1, 4, 5.00, '2025-07-17 03:16:04', '2025-07-17 03:16:04', NULL),
(30, 6, 1, 5, 4.80, '2025-07-17 03:16:04', '2025-07-17 03:16:04', NULL),
(31, 7, 1, 1, 3.75, '2025-07-17 03:16:35', '2025-07-17 03:16:35', NULL),
(32, 7, 1, 2, 4.25, '2025-07-17 03:16:35', '2025-07-17 03:16:35', NULL),
(33, 7, 1, 3, 3.25, '2025-07-17 03:16:35', '2025-07-17 03:16:35', NULL),
(34, 7, 1, 4, 4.75, '2025-07-17 03:16:35', '2025-07-17 03:16:35', NULL),
(35, 7, 1, 5, 4.50, '2025-07-17 03:16:35', '2025-07-17 03:16:35', NULL),
(36, 9, 1, 1, 4.50, '2025-07-17 03:18:06', '2025-07-17 03:18:06', NULL),
(37, 9, 1, 2, 5.00, '2025-07-17 03:18:06', '2025-07-17 03:18:06', NULL),
(38, 9, 1, 3, 4.00, '2025-07-17 03:18:06', '2025-07-17 03:18:06', NULL),
(39, 9, 1, 4, 5.50, '2025-07-17 03:18:06', '2025-07-17 03:18:06', NULL),
(40, 9, 1, 5, 5.30, '2025-07-17 03:18:06', '2025-07-17 03:18:06', NULL),
(41, 8, 1, 1, 3.20, '2025-07-17 03:18:43', '2025-07-17 03:18:43', NULL),
(42, 8, 1, 2, 3.70, '2025-07-17 03:18:43', '2025-07-17 03:18:43', NULL),
(43, 8, 1, 3, 2.90, '2025-07-17 03:18:43', '2025-07-17 03:18:43', NULL),
(44, 8, 1, 4, 4.20, '2025-07-17 03:18:44', '2025-07-17 03:18:44', NULL),
(45, 8, 1, 5, 4.00, '2025-07-17 03:18:44', '2025-07-17 03:18:44', NULL),
(46, 10, 1, 1, 5.00, '2025-07-17 03:19:38', '2025-07-17 03:19:38', NULL),
(47, 10, 1, 2, 5.50, '2025-07-17 03:19:38', '2025-07-17 03:19:38', NULL),
(48, 10, 1, 3, 4.50, '2025-07-17 03:19:38', '2025-07-17 03:19:38', NULL),
(49, 10, 1, 4, 6.00, '2025-07-17 03:19:39', '2025-07-17 03:19:39', NULL),
(50, 10, 1, 5, 5.80, '2025-07-17 03:19:39', '2025-07-17 03:19:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_types`
--

CREATE TABLE `vehicle_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_all_zones` int DEFAULT '0',
  `service_id` int DEFAULT NULL,
  `vehicle_image_id` bigint UNSIGNED DEFAULT NULL,
  `vehicle_map_icon_id` bigint UNSIGNED DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_seat` int DEFAULT NULL,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `tax_id` bigint UNSIGNED DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_types`
--

INSERT INTO `vehicle_types` (`id`, `name`, `is_all_zones`, `service_id`, `vehicle_image_id`, `vehicle_map_icon_id`, `slug`, `max_seat`, `created_by_id`, `tax_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"Bike\",\"fr\":\"Vélo\",\"de\":\"Fahrrad\",\"ar\":\"دراجة\"}', 0, 1, 9, 829, 'bike', 1, 1, 1, 1, '2025-01-22 12:43:08', '2025-07-16 23:08:02', NULL),
(2, '{\"en\":\"Auto\",\"ar\":\"سيارة آلية\",\"de\":\"Auto\",\"fr\":\"Voiture\"}', 0, 1, 6, 825, 'auto', 3, 1, 1, 1, '2025-01-22 12:43:08', '2025-07-16 23:00:30', NULL),
(3, '{\"en\":\"Car\",\"ar\":\"سيارة\",\"de\":\"Auto\",\"fr\":\"Voiture\"}', 0, 1, 10, 827, 'car', 4, 1, 1, 1, '2025-01-22 12:43:08', '2025-07-16 23:05:11', NULL),
(4, '{\"en\":\"Prime Car\",\"de\":\"Erstklassiges Auto\",\"ar\":\"سيارة برايم\",\"fr\":\"Voiture principale\"}', 0, 1, 29, 837, 'prime-car', 4, 1, 1, 1, '2025-01-22 12:43:08', '2025-07-17 00:30:11', NULL),
(5, '{\"en\":\"Van\"}', 0, 2, 12, 841, 'van', 7, 1, 1, 1, '2025-01-22 12:43:08', '2025-07-17 00:42:26', NULL),
(6, '{\"en\":\"Seater SUV\",\"fr\":\"Boléro\",\"de\":\"Bolero\",\"ar\":\"بوليرو\"}', 0, 2, 18, 833, 'seater-suv', 8, 1, 1, 1, '2025-01-22 12:43:08', '2025-07-17 00:11:56', NULL),
(7, '{\"en\":\"Ace Truck\",\"ar\":\"شوتا هاثي\",\"de\":\"Chhota-hathi\",\"fr\":\"Chhota-hathi\"}', 0, 2, 20, 831, 'ace-truck', 4, 1, 1, 1, '2025-01-22 12:43:08', '2025-07-17 00:12:21', NULL),
(8, '{\"en\":\"Mini Truck\",\"fr\":\"Tempo\",\"ar\":\"وتيرة\",\"de\":\"Tempo\"}', 0, 3, 26, 843, 'mini-truck', 2, 1, 1, 1, '2025-01-22 12:43:08', '2025-07-17 00:43:08', NULL),
(9, '{\"en\":\"Truck\",\"de\":\"LKW\",\"ar\":\"شاحنة\",\"fr\":\"Camion\"}', 1, 3, 28, 835, 'truck', 2, 1, 1, 1, '2025-01-22 12:43:08', '2025-07-17 00:27:53', NULL),
(10, '{\"en\":\"Big Truck\",\"fr\":\"Gros camion\",\"de\":\"Großer LKW\",\"ar\":\"شاحنة كبيرة\"}', 0, 3, 24, 839, 'big-truck', 3, 1, 1, 1, '2025-01-22 12:43:08', '2025-07-17 00:21:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_type_hourly_packages`
--

CREATE TABLE `vehicle_type_hourly_packages` (
  `id` bigint UNSIGNED NOT NULL,
  `vehicle_type_id` bigint UNSIGNED DEFAULT NULL,
  `hourly_package_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_type_hourly_packages`
--

INSERT INTO `vehicle_type_hourly_packages` (`id`, `vehicle_type_id`, `hourly_package_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 3, 1, NULL, NULL, NULL),
(3, 4, 1, NULL, NULL, NULL),
(4, 1, 2, NULL, NULL, NULL),
(5, 3, 2, NULL, NULL, NULL),
(6, 4, 2, NULL, NULL, NULL),
(7, 1, 3, NULL, NULL, NULL),
(8, 3, 3, NULL, NULL, NULL),
(9, 4, 3, NULL, NULL, NULL),
(10, 1, 4, NULL, NULL, NULL),
(11, 3, 4, NULL, NULL, NULL),
(12, 4, 4, NULL, NULL, NULL),
(13, 1, 5, NULL, NULL, NULL),
(14, 3, 5, NULL, NULL, NULL),
(15, 4, 5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_type_zones`
--

CREATE TABLE `vehicle_type_zones` (
  `id` bigint UNSIGNED NOT NULL,
  `vehicle_type_id` bigint UNSIGNED NOT NULL,
  `zone_id` bigint UNSIGNED NOT NULL,
  `base_fare_charge` decimal(15,2) DEFAULT '0.00',
  `base_distance` decimal(15,2) DEFAULT '0.00',
  `is_allow_tax` decimal(15,2) DEFAULT '0.00',
  `tax_id` bigint UNSIGNED DEFAULT NULL,
  `per_distance_charge` decimal(15,2) DEFAULT '0.00',
  `per_minute_charge` decimal(15,2) DEFAULT '0.00',
  `per_weight_charge` decimal(15,2) DEFAULT '0.00',
  `is_unlimited` int DEFAULT '1',
  `waiting_charge` decimal(15,2) DEFAULT '0.00',
  `free_waiting_time_before_start_ride` decimal(15,2) DEFAULT '0.00',
  `free_waiting_time_after_start_ride` decimal(15,2) DEFAULT '0.00',
  `is_allow_airport_charge` decimal(15,2) DEFAULT '0.00',
  `cancellation_charge_for_rider` decimal(15,2) DEFAULT '0.00',
  `cancellation_charge_for_driver` decimal(15,2) DEFAULT '0.00',
  `charge_goes_to` enum('rider','driver','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `commission_type` enum('fixed','percentage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'fixed',
  `commission_rate` decimal(15,2) DEFAULT '0.00',
  `airport_charge_rate` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_type_zones`
--

INSERT INTO `vehicle_type_zones` (`id`, `vehicle_type_id`, `zone_id`, `base_fare_charge`, `base_distance`, `is_allow_tax`, `tax_id`, `per_distance_charge`, `per_minute_charge`, `per_weight_charge`, `is_unlimited`, `waiting_charge`, `free_waiting_time_before_start_ride`, `free_waiting_time_after_start_ride`, `is_allow_airport_charge`, `cancellation_charge_for_rider`, `cancellation_charge_for_driver`, `charge_goes_to`, `commission_type`, `commission_rate`, `airport_charge_rate`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 30.00, 2.50, 1.00, 1, 7.00, 1.20, 0.00, 1, 0.80, NULL, NULL, 1.00, 0.00, 15.00, 'admin', 'fixed', 8.00, 10.00, NULL, '2025-07-17 02:51:02', NULL),
(2, 3, 1, 50.00, 3.00, 1.00, 1, 10.00, 2.00, 0.00, 1, 1.00, NULL, NULL, 1.00, 0.00, 20.00, 'admin', 'percentage', 15.00, 25.00, NULL, '2025-07-17 02:51:50', NULL),
(3, 1, 1, 20.00, 2.00, 1.00, 1, 5.00, 1.00, 0.00, 1, 0.50, NULL, NULL, 1.00, 10.00, 5.00, 'rider', 'fixed', 10.00, 0.00, NULL, '2025-07-17 02:50:02', NULL),
(4, 6, 1, 90.00, 3.50, 1.00, 1, 17.00, 3.50, 0.00, 1, 1.50, 3.00, 5.00, 0.00, 0.00, 0.00, 'admin', 'percentage', 18.00, 45.00, NULL, '2025-07-17 02:59:09', NULL),
(5, 7, 1, 110.00, 5.00, 1.00, 1, 20.00, 4.00, 0.00, 1, 2.50, 3.00, 5.00, 1.00, 40.00, 20.00, 'admin', 'fixed', 20.00, 70.00, NULL, '2025-07-17 03:00:17', NULL),
(6, 10, 1, 200.00, 8.00, 1.00, 1, 30.00, 6.00, 4.00, 1, 3.00, 1.00, 1.00, 1.00, 60.00, 30.00, 'admin', 'fixed', 30.00, 100.00, NULL, '2025-07-17 03:03:13', NULL),
(8, 9, 1, 150.00, 6.00, 1.00, 1, 25.00, 5.00, 3.00, 1, 3.00, 1.00, 1.00, 1.00, 50.00, 25.00, 'admin', 'fixed', 25.00, 75.00, NULL, '2025-07-17 03:02:12', NULL),
(9, 4, 1, 80.00, 4.00, 1.00, 1, 15.00, 3.00, 0.00, 1, 1.50, 1.00, 1.00, 1.00, 30.00, 0.00, 'admin', 'percentage', 18.00, 35.00, NULL, '2025-07-17 02:52:38', NULL),
(10, 5, 1, 120.00, 4.50, 0.00, NULL, 20.00, 4.50, 2.00, 1, 2.00, 1.00, 1.00, 1.00, 35.00, 18.00, 'admin', 'percentage', 10.00, 60.00, NULL, '2025-07-17 02:54:14', NULL),
(11, 8, 1, 100.00, 5.00, 1.00, 1, 18.00, 4.00, 2.00, 1, 2.00, 2.00, 2.00, 1.00, 40.00, 20.00, 'admin', 'fixed', 20.00, 50.00, NULL, '2025-07-17 03:01:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `amount` decimal(8,2) DEFAULT '0.00',
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `driver_wallet_id` bigint UNSIGNED DEFAULT NULL,
  `payment_type` enum('paypal','bank') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'bank',
  `is_used` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_requests`
--

INSERT INTO `withdraw_requests` (`id`, `amount`, `message`, `status`, `driver_id`, `driver_wallet_id`, `payment_type`, `is_used`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 500.00, 'Pay', 'pending', 31, 3, 'bank', 0, '2025-01-25 01:56:14', '2025-01-25 01:56:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_points` geometry DEFAULT NULL,
  `locations` json DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT '0.00',
  `status` int DEFAULT '1',
  `weight_unit` enum('kilogram','pound') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'kilogram',
  `distance_type` enum('mile','km') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'mile',
  `currency_id` bigint UNSIGNED DEFAULT NULL,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `payment_method` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `name`, `place_points`, `locations`, `amount`, `status`, `weight_unit`, `distance_type`, `currency_id`, `created_by_id`, `payment_method`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"en\":\"World\"}', 0x000000000103000000010000002700000099130f83f8e664c0c099d3e83d93544032271e06f1415fc0033a16998dd6544032271e06f1d156c0dcfe3f9e9819554032271e06f18b51c05629d55198075540ca9c7818c4cf3ec05629d551980755409dcc8987417cf4bff2ba93f3e3ea54409bb1c3f31ddc45405629d55198075540ced8e1f90e8856405629d55198075540ced8e1f90e9e5e4030a1776bb1f4544067ecf07c07796240f2ba93f3e3ea544067ecf07c070e64402b79481c2353544067ecf07c07ef6440bc0522ff2683534067ecf07c075766404a7ae417a587514099130f83f87b66c043f0aae8f77a504067ecf07c07496540626f44d265c04d4067ecf07c075a63400b5a28e70f83454067ecf07c070e6440552005888cb4414067ecf07c07956440b17c217bcee2354067ecf07c074965401bb2a69bd3ff054067ecf07c07fd654012bbbedc835e33c067ecf07c07a365407a68f1c3d95242c067ecf07c07ef6440f4a8e1abf34b4cc067ecf07c073b6440f5a8fb6dd9c550c067ecf07c07d362404a75f7e29bba53c067ecf07c076b61400f3225f9bf6154c0ced8e1f90ec05a4033471ac21d8854c09bb1c3f31d5842406ae296b0c8ab54c0654e3c0ce2cf40c06ae296b0c8ab54c032271e06f18557c00f3225f9bf6154c099130f83f8db60c06e92bba418a953c099130f83f85163c0306678d16aa250c099130f83f83264c0ffddd908339840c099130f83f83264c0e4dddce1060036c099130f83f88160c081de1012ef1a11c099130f83f8e961c0c1f540079d78384099130f83f81365c0bddcde60ff384a4099130f83f8ab63c0c83ae5a890fc514099130f83f85f64c02ba7b2fcf2da534099130f83f8e664c0c099d3e83d935440, '[{\"lat\": 82.3006536547103, \"lng\": -167.21783593125}, {\"lat\": 83.35239245577358, \"lng\": -125.03033593125}, {\"lat\": 84.39994007348645, \"lng\": -91.28033593125}, {\"lat\": 84.11867185417698, \"lng\": -70.18658593125001}, {\"lat\": 84.11867185417698, \"lng\": -30.811585931250008}, {\"lat\": 83.67016305376829, \"lng\": -1.2803359312500096}, {\"lat\": 84.11867185417698, \"lng\": 43.71966406874999}, {\"lat\": 84.11867185417698, \"lng\": 90.12591406875}, {\"lat\": 83.82332884485751, \"lng\": 122.46966406875}, {\"lat\": 83.67016305376829, \"lng\": 147.78216406874998}, {\"lat\": 81.29901797368541, \"lng\": 160.43841406874998}, {\"lat\": 78.04925516436063, \"lng\": 167.46966406874998}, {\"lat\": 70.11945149719531, \"lng\": 178.71966406874998}, {\"lat\": 65.92138115590265, \"lng\": -179.87408593125002}, {\"lat\": 59.50310734120882, \"lng\": 170.28216406874998}, {\"lat\": 43.02392281980772, \"lng\": 154.81341406874998}, {\"lat\": 35.410538675787976, \"lng\": 160.43841406874998}, {\"lat\": 21.885963149715263, \"lng\": 164.65716406874998}, {\"lat\": 2.74991532900299, \"lng\": 170.28216406874998}, {\"lat\": -19.369199558797025, \"lng\": 175.90716406874998}, {\"lat\": -36.647270672678765, \"lng\": 173.09466406874998}, {\"lat\": -56.593373761353526, \"lng\": 167.46966406874998}, {\"lat\": -67.09139585090772, \"lng\": 161.84466406874998}, {\"lat\": -78.91576456228131, \"lng\": 150.59466406874998}, {\"lat\": -81.52734211571091, \"lng\": 139.34466406874998}, {\"lat\": -82.12681629720913, \"lng\": 107.00091406875}, {\"lat\": -82.68412413344174, \"lng\": 36.68841406874999}, {\"lat\": -82.68412413344174, \"lng\": -33.62408593125001}, {\"lat\": -81.52734211571091, \"lng\": -94.09283593125}, {\"lat\": -78.64212911908683, \"lng\": -134.87408593125}, {\"lat\": -66.53776966817566, \"lng\": -154.56158593125}, {\"lat\": -33.189057451610786, \"lng\": -161.59283593125}, {\"lat\": -22.000105015204056, \"lng\": -161.59283593125}, {\"lat\": -4.276302606849308, \"lng\": -132.06158593125}, {\"lat\": 24.471146062239654, \"lng\": -143.31158593125}, {\"lat\": 52.445293530291835, \"lng\": -168.62408593125}, {\"lat\": 71.94632933030817, \"lng\": -157.37408593125}, {\"lat\": 79.42108075567765, \"lng\": -162.99908593125}, {\"lat\": 82.3006536547103, \"lng\": -167.21783593125}]', NULL, 1, 'kilogram', 'km', 1, 1, '[\"cash\", \"paypal\", \"stripe\", \"mollie\", \"razorpay\", \"flutterWave\", \"midtrans\", \"instamojo\", \"iyzico\", \"paystack\", \"sslcommerz\", \"ccavenue\"]', '2025-05-15 00:57:38', '2025-07-17 03:36:26', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`),
  ADD KEY `addresses_country_id_foreign` (`country_id`);

--
-- Indexes for table `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `airports_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `ambulances`
--
ALTER TABLE `ambulances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ambulances_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `assigned_tickets`
--
ALTER TABLE `assigned_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_tickets_user_id_foreign` (`user_id`),
  ADD KEY `assigned_tickets_ticket_id_foreign` (`ticket_id`);

--
-- Indexes for table `backup_logs`
--
ALTER TABLE `backup_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`),
  ADD KEY `banners_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `banner_services`
--
ALTER TABLE `banner_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banner_services_banner_id_foreign` (`banner_id`),
  ADD KEY `banner_services_service_id_foreign` (`service_id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bids_ride_id_foreign` (`ride_id`),
  ADD KEY `bids_driver_id_foreign` (`driver_id`),
  ADD KEY `bids_ride_request_id_foreign` (`ride_request_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`),
  ADD KEY `blogs_blog_thumbnail_id_foreign` (`blog_thumbnail_id`),
  ADD KEY `blogs_blog_meta_image_id_foreign` (`blog_meta_image_id`),
  ADD KEY `blogs_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_categories_blog_id_foreign` (`blog_id`),
  ADD KEY `blog_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_tags_blog_id_foreign` (`blog_id`),
  ADD KEY `blog_tags_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `cab_commission_histories`
--
ALTER TABLE `cab_commission_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cab_commission_histories_ride_id_foreign` (`ride_id`),
  ADD KEY `cab_commission_histories_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cancellation_reasons`
--
ALTER TABLE `cancellation_reasons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cancellation_reasons_slug_unique` (`slug`),
  ADD KEY `cancellation_reasons_created_by_id_foreign` (`created_by_id`),
  ADD KEY `cancellation_reasons_icon_image_id_foreign` (`icon_image_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_category_image_id_foreign` (`category_image_id`),
  ADD KEY `categories_category_meta_image_id_foreign` (`category_meta_image_id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `categories_services`
--
ALTER TABLE `categories_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_services_service_category_id_foreign` (`service_category_id`),
  ADD KEY `categories_services_service_id_foreign` (`service_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_name_index` (`name`),
  ADD KEY `countries_currency_code_index` (`currency_code`),
  ADD KEY `countries_calling_code_index` (`calling_code`),
  ADD KEY `countries_flag_index` (`flag`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `coupon_riders`
--
ALTER TABLE `coupon_riders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_riders_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupon_riders_rider_id_foreign` (`rider_id`);

--
-- Indexes for table `coupon_service`
--
ALTER TABLE `coupon_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_service_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupon_service_service_id_foreign` (`service_id`);

--
-- Indexes for table `coupon_vehicle_types`
--
ALTER TABLE `coupon_vehicle_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_vehicle_types_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupon_vehicle_types_vehicle_type_id_foreign` (`vehicle_type_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currencies_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `customizations`
--
ALTER TABLE `customizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_slug_unique` (`slug`),
  ADD KEY `departments_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `department_users`
--
ALTER TABLE `department_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_users_user_id_foreign` (`user_id`),
  ADD KEY `department_users_department_id_foreign` (`department_id`);

--
-- Indexes for table `dispatcher_zones`
--
ALTER TABLE `dispatcher_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispatcher_zones_zone_id_foreign` (`zone_id`),
  ADD KEY `dispatcher_zones_dispatcher_id_foreign` (`dispatcher_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `driver_documents`
--
ALTER TABLE `driver_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_documents_driver_id_foreign` (`driver_id`),
  ADD KEY `driver_documents_document_id_foreign` (`document_id`),
  ADD KEY `driver_documents_document_image_id_foreign` (`document_image_id`),
  ADD KEY `driver_documents_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `driver_reviews`
--
ALTER TABLE `driver_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_reviews_ride_id_foreign` (`ride_id`),
  ADD KEY `driver_reviews_service_id_foreign` (`service_id`),
  ADD KEY `driver_reviews_service_category_id_foreign` (`service_category_id`),
  ADD KEY `driver_reviews_driver_id_foreign` (`driver_id`),
  ADD KEY `driver_reviews_rider_id_foreign` (`rider_id`);

--
-- Indexes for table `driver_rules`
--
ALTER TABLE `driver_rules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `driver_rules_slug_unique` (`slug`),
  ADD KEY `driver_rules_created_by_id_foreign` (`created_by_id`),
  ADD KEY `driver_rules_rule_image_id_foreign` (`rule_image_id`);

--
-- Indexes for table `driver_subscriptions`
--
ALTER TABLE `driver_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_subscriptions_plan_id_foreign` (`plan_id`),
  ADD KEY `driver_subscriptions_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `driver_vehicle_types`
--
ALTER TABLE `driver_vehicle_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_vehicle_types_driver_rule_id_foreign` (`driver_rule_id`),
  ADD KEY `driver_vehicle_types_vehicle_type_id_foreign` (`vehicle_type_id`);

--
-- Indexes for table `driver_wallets`
--
ALTER TABLE `driver_wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_wallets_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `driver_wallet_histories`
--
ALTER TABLE `driver_wallet_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_wallet_histories_driver_wallet_id_foreign` (`driver_wallet_id`),
  ADD KEY `driver_wallet_histories_from_user_id_foreign` (`from_user_id`);

--
-- Indexes for table `driver_zones`
--
ALTER TABLE `driver_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_zones_driver_id_foreign` (`driver_id`),
  ADD KEY `driver_zones_zone_id_foreign` (`zone_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_charges`
--
ALTER TABLE `extra_charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extra_charges_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `fleet_manager_wallets`
--
ALTER TABLE `fleet_manager_wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fleet_manager_wallets_fleet_manager_id_foreign` (`fleet_manager_id`);

--
-- Indexes for table `fleet_wallet_histories`
--
ALTER TABLE `fleet_wallet_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fleet_wallet_histories_fleet_wallet_id_foreign` (`fleet_wallet_id`),
  ADD KEY `fleet_wallet_histories_from_user_id_foreign` (`from_user_id`);

--
-- Indexes for table `fleet_withdraw_requests`
--
ALTER TABLE `fleet_withdraw_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fleet_withdraw_requests_fleet_wallet_id_foreign` (`fleet_wallet_id`),
  ADD KEY `fleet_withdraw_requests_fleet_manager_id_foreign` (`fleet_manager_id`);

--
-- Indexes for table `form_fields`
--
ALTER TABLE `form_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_fields_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `hourly_packages`
--
ALTER TABLE `hourly_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hourly_packages_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `knowledge_bases`
--
ALTER TABLE `knowledge_bases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `knowledge_bases_slug_unique` (`slug`),
  ADD KEY `knowledge_bases_knowledge_thumbnail_id_foreign` (`knowledge_thumbnail_id`),
  ADD KEY `knowledge_bases_knowledge_meta_image_id_foreign` (`knowledge_meta_image_id`),
  ADD KEY `knowledge_bases_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `knowledge_base_categories`
--
ALTER TABLE `knowledge_base_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowledge_base_categories_category_image_id_foreign` (`category_image_id`),
  ADD KEY `knowledge_base_categories_category_meta_image_id_foreign` (`category_meta_image_id`),
  ADD KEY `knowledge_base_categories_parent_id_foreign` (`parent_id`),
  ADD KEY `knowledge_base_categories_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `knowledge_base_tags`
--
ALTER TABLE `knowledge_base_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowledge_base_tags_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `knowledge_categories`
--
ALTER TABLE `knowledge_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowledge_categories_knowledge_id_foreign` (`knowledge_id`),
  ADD KEY `knowledge_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `knowledge_tags`
--
ALTER TABLE `knowledge_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowledge_tags_knowledge_id_foreign` (`knowledge_id`),
  ADD KEY `knowledge_tags_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `landing_pages`
--
ALTER TABLE `landing_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `languages_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_rider_id_foreign` (`rider_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_created_by_id_foreign` (`created_by_id`),
  ADD KEY `media_order_column_index` (`order_column`),
  ADD KEY `media_name_index` (`name`),
  ADD KEY `media_model_id_index` (`model_id`),
  ADD KEY `media_model_type_index` (`model_type`),
  ADD KEY `media_collection_name_index` (`collection_name`),
  ADD KEY `media_file_name_index` (`file_name`),
  ADD KEY `media_disk_index` (`disk`),
  ADD KEY `media_mime_type_index` (`mime_type`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_items_slug_unique` (`slug`),
  ADD KEY `menu_items_menu_foreign` (`menu`),
  ADD KEY `menu_items_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notices_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `notice_drivers`
--
ALTER TABLE `notice_drivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notice_drivers_notice_id_foreign` (`notice_id`),
  ADD KEY `notice_drivers_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `onboardings`
--
ALTER TABLE `onboardings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onboardings_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`),
  ADD KEY `pages_created_by_id_foreign` (`created_by_id`),
  ADD KEY `pages_page_meta_image_id_foreign` (`page_meta_image_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_accounts`
--
ALTER TABLE `payment_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways_transactions`
--
ALTER TABLE `payment_gateways_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_gateways_transactions_transaction_id_unique` (`transaction_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plans_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `plan_service_categories`
--
ALTER TABLE `plan_service_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_service_categories_plan_id_foreign` (`plan_id`),
  ADD KEY `plan_service_categories_service_category_id_foreign` (`service_category_id`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `priorities_slug_unique` (`slug`),
  ADD KEY `priorities_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `push_notifications_user_id_foreign` (`user_id`),
  ADD KEY `push_notifications_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `push_notification_templates`
--
ALTER TABLE `push_notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ratings_user_id_foreign` (`user_id`);

--
-- Indexes for table `rental_vehicles`
--
ALTER TABLE `rental_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rental_vehicles_normal_image_id_foreign` (`normal_image_id`),
  ADD KEY `rental_vehicles_front_view_id_foreign` (`front_view_id`),
  ADD KEY `rental_vehicles_side_view_id_foreign` (`side_view_id`),
  ADD KEY `rental_vehicles_boot_view_id_foreign` (`boot_view_id`),
  ADD KEY `rental_vehicles_registration_image_id_foreign` (`registration_image_id`),
  ADD KEY `rental_vehicles_interior_image_id_foreign` (`interior_image_id`),
  ADD KEY `rental_vehicles_vehicle_type_id_foreign` (`vehicle_type_id`),
  ADD KEY `rental_vehicles_created_by_id_foreign` (`created_by_id`),
  ADD KEY `rental_vehicles_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `rental_vehicle_zones`
--
ALTER TABLE `rental_vehicle_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rental_vehicle_zones_rental_vehicle_id_foreign` (`rental_vehicle_id`),
  ADD KEY `rental_vehicle_zones_zone_id_foreign` (`zone_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rider_reviews`
--
ALTER TABLE `rider_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rider_reviews_ride_id_foreign` (`ride_id`),
  ADD KEY `rider_reviews_service_id_foreign` (`service_id`),
  ADD KEY `rider_reviews_rider_id_foreign` (`rider_id`),
  ADD KEY `rider_reviews_driver_id_foreign` (`driver_id`),
  ADD KEY `rider_reviews_service_category_id_foreign` (`service_category_id`);

--
-- Indexes for table `rider_wallets`
--
ALTER TABLE `rider_wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rider_wallets_rider_id_foreign` (`rider_id`);

--
-- Indexes for table `rider_wallet_histories`
--
ALTER TABLE `rider_wallet_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rider_wallet_histories_rider_wallet_id_foreign` (`rider_wallet_id`),
  ADD KEY `rider_wallet_histories_from_user_id_foreign` (`from_user_id`);

--
-- Indexes for table `rides`
--
ALTER TABLE `rides`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rides_ride_number_unique` (`ride_number`),
  ADD KEY `rides_rider_id_foreign` (`rider_id`),
  ADD KEY `rides_driver_id_foreign` (`driver_id`),
  ADD KEY `rides_coupon_id_foreign` (`coupon_id`),
  ADD KEY `rides_created_by_id_foreign` (`created_by_id`),
  ADD KEY `rides_service_id_foreign` (`service_id`),
  ADD KEY `rides_ride_status_id_foreign` (`ride_status_id`),
  ADD KEY `rides_vehicle_type_id_foreign` (`vehicle_type_id`),
  ADD KEY `rides_rental_vehicle_id_foreign` (`rental_vehicle_id`),
  ADD KEY `rides_cargo_image_id_foreign` (`cargo_image_id`),
  ADD KEY `rides_hourly_package_id_foreign` (`hourly_package_id`),
  ADD KEY `rides_service_category_id_foreign` (`service_category_id`);

--
-- Indexes for table `ride_bids`
--
ALTER TABLE `ride_bids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_bids_ride_id_foreign` (`ride_id`),
  ADD KEY `ride_bids_bid_id_foreign` (`bid_id`);

--
-- Indexes for table `ride_requests`
--
ALTER TABLE `ride_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_requests_rider_id_foreign` (`rider_id`),
  ADD KEY `ride_requests_service_id_foreign` (`service_id`),
  ADD KEY `ride_requests_vehicle_type_id_foreign` (`vehicle_type_id`),
  ADD KEY `ride_requests_rental_vehicle_id_foreign` (`rental_vehicle_id`),
  ADD KEY `ride_requests_service_category_id_foreign` (`service_category_id`),
  ADD KEY `ride_requests_cargo_image_id_foreign` (`cargo_image_id`),
  ADD KEY `ride_requests_hourly_package_id_foreign` (`hourly_package_id`),
  ADD KEY `ride_requests_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `ride_request_drivers`
--
ALTER TABLE `ride_request_drivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_request_drivers_ride_request_id_foreign` (`ride_request_id`),
  ADD KEY `ride_request_drivers_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `ride_request_zones`
--
ALTER TABLE `ride_request_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_request_zones_ride_request_id_foreign` (`ride_request_id`),
  ADD KEY `ride_request_zones_zone_id_foreign` (`zone_id`);

--
-- Indexes for table `ride_status`
--
ALTER TABLE `ride_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_status_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `ride_status_activities`
--
ALTER TABLE `ride_status_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_status_activities_ride_id_foreign` (`ride_id`);

--
-- Indexes for table `ride_zones`
--
ALTER TABLE `ride_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_zones_ride_id_foreign` (`ride_id`),
  ADD KEY `ride_zones_zone_id_foreign` (`zone_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_created_by_id_foreign` (`created_by_id`),
  ADD KEY `services_service_image_id_foreign` (`service_image_id`),
  ADD KEY `services_service_icon_id_foreign` (`service_icon_id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_categories_created_by_id_foreign` (`created_by_id`),
  ADD KEY `service_categories_service_category_image_id_foreign` (`service_category_image_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sos`
--
ALTER TABLE `sos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sos_slug_unique` (`slug`),
  ADD KEY `sos_created_by_id_foreign` (`created_by_id`),
  ADD KEY `sos_sos_image_id_foreign` (`sos_image_id`);

--
-- Indexes for table `sos_alerts`
--
ALTER TABLE `sos_alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sos_alerts_ride_id_foreign` (`ride_id`),
  ADD KEY `sos_alerts_sos_status_id_foreign` (`sos_status_id`),
  ADD KEY `sos_alerts_created_by_id_foreign` (`created_by_id`),
  ADD KEY `sos_alerts_sos_id_foreign` (`sos_id`);

--
-- Indexes for table `sos_statuses`
--
ALTER TABLE `sos_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sos_statuses_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `sos_status_activities`
--
ALTER TABLE `sos_status_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sos_status_activities_sos_alert_id_foreign` (`sos_alert_id`),
  ADD KEY `sos_status_activities_ride_id_foreign` (`ride_id`);

--
-- Indexes for table `sos_zones`
--
ALTER TABLE `sos_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sos_zones_s_o_s_id_foreign` (`s_o_s_id`),
  ADD KEY `sos_zones_zone_id_foreign` (`zone_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `statuses_slug_unique` (`slug`),
  ADD KEY `statuses_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surge_prices`
--
ALTER TABLE `surge_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surge_prices_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxes_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `taxido_settings`
--
ALTER TABLE `taxido_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonials_profile_image_id_foreign` (`profile_image_id`),
  ADD KEY `testimonials_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tickets_slug_unique` (`slug`),
  ADD UNIQUE KEY `tickets_ticket_number_unique` (`ticket_number`),
  ADD KEY `tickets_user_id_foreign` (`user_id`),
  ADD KEY `tickets_department_id_foreign` (`department_id`),
  ADD KEY `tickets_priority_id_foreign` (`priority_id`),
  ADD KEY `tickets_ticket_status_id_foreign` (`ticket_status_id`),
  ADD KEY `tickets_created_by_id_foreign` (`created_by_id`);

--
-- Indexes for table `ticket_settings`
--
ALTER TABLE `ticket_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_referral_code_unique` (`referral_code`),
  ADD KEY `users_created_by_id_foreign` (`created_by_id`),
  ADD KEY `users_referred_by_id_foreign` (`referred_by_id`),
  ADD KEY `users_service_id_foreign` (`service_id`),
  ADD KEY `users_service_category_id_foreign` (`service_category_id`);

--
-- Indexes for table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_categories_vehicle_type_id_foreign` (`vehicle_type_id`),
  ADD KEY `vehicle_categories_service_category_id_foreign` (`service_category_id`);

--
-- Indexes for table `vehicle_images`
--
ALTER TABLE `vehicle_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_images_vehicle_image_id_foreign` (`vehicle_image_id`),
  ADD KEY `vehicle_images_attachment_id_foreign` (`attachment_id`);

--
-- Indexes for table `vehicle_info`
--
ALTER TABLE `vehicle_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_info_vehicle_type_id_foreign` (`vehicle_type_id`),
  ADD KEY `vehicle_info_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `vehicle_services`
--
ALTER TABLE `vehicle_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_services_vehicle_type_id_foreign` (`vehicle_type_id`),
  ADD KEY `vehicle_services_service_id_foreign` (`service_id`);

--
-- Indexes for table `vehicle_surge_prices`
--
ALTER TABLE `vehicle_surge_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_surge_prices_vehicle_type_id_foreign` (`vehicle_type_id`),
  ADD KEY `vehicle_surge_prices_zone_id_foreign` (`zone_id`),
  ADD KEY `vehicle_surge_prices_surge_price_id_foreign` (`surge_price_id`);

--
-- Indexes for table `vehicle_types`
--
ALTER TABLE `vehicle_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vehicle_types_slug_unique` (`slug`),
  ADD KEY `vehicle_types_tax_id_foreign` (`tax_id`),
  ADD KEY `vehicle_types_created_by_id_foreign` (`created_by_id`),
  ADD KEY `vehicle_types_vehicle_image_id_foreign` (`vehicle_image_id`),
  ADD KEY `vehicle_types_vehicle_map_icon_id_foreign` (`vehicle_map_icon_id`);

--
-- Indexes for table `vehicle_type_hourly_packages`
--
ALTER TABLE `vehicle_type_hourly_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_type_hourly_packages_vehicle_type_id_foreign` (`vehicle_type_id`),
  ADD KEY `vehicle_type_hourly_packages_hourly_package_id_foreign` (`hourly_package_id`);

--
-- Indexes for table `vehicle_type_zones`
--
ALTER TABLE `vehicle_type_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_type_zones_zone_id_foreign` (`zone_id`),
  ADD KEY `vehicle_type_zones_tax_id_foreign` (`tax_id`),
  ADD KEY `vehicle_type_zones_vehicle_type_id_foreign` (`vehicle_type_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraw_requests_driver_wallet_id_foreign` (`driver_wallet_id`),
  ADD KEY `withdraw_requests_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`),
  ADD KEY `zones_currency_id_foreign` (`currency_id`),
  ADD KEY `zones_created_by_id_foreign` (`created_by_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `airports`
--
ALTER TABLE `airports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ambulances`
--
ALTER TABLE `ambulances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `assigned_tickets`
--
ALTER TABLE `assigned_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `backup_logs`
--
ALTER TABLE `backup_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `banner_services`
--
ALTER TABLE `banner_services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `cab_commission_histories`
--
ALTER TABLE `cab_commission_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cancellation_reasons`
--
ALTER TABLE `cancellation_reasons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `categories_services`
--
ALTER TABLE `categories_services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=895;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `coupon_riders`
--
ALTER TABLE `coupon_riders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_service`
--
ALTER TABLE `coupon_service`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `coupon_vehicle_types`
--
ALTER TABLE `coupon_vehicle_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customizations`
--
ALTER TABLE `customizations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `department_users`
--
ALTER TABLE `department_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dispatcher_zones`
--
ALTER TABLE `dispatcher_zones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `driver_documents`
--
ALTER TABLE `driver_documents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `driver_reviews`
--
ALTER TABLE `driver_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `driver_rules`
--
ALTER TABLE `driver_rules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `driver_subscriptions`
--
ALTER TABLE `driver_subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_vehicle_types`
--
ALTER TABLE `driver_vehicle_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `driver_wallets`
--
ALTER TABLE `driver_wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `driver_wallet_histories`
--
ALTER TABLE `driver_wallet_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `driver_zones`
--
ALTER TABLE `driver_zones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2688;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `extra_charges`
--
ALTER TABLE `extra_charges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fleet_manager_wallets`
--
ALTER TABLE `fleet_manager_wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fleet_wallet_histories`
--
ALTER TABLE `fleet_wallet_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fleet_withdraw_requests`
--
ALTER TABLE `fleet_withdraw_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_fields`
--
ALTER TABLE `form_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hourly_packages`
--
ALTER TABLE `hourly_packages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `knowledge_bases`
--
ALTER TABLE `knowledge_bases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `knowledge_base_categories`
--
ALTER TABLE `knowledge_base_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `knowledge_base_tags`
--
ALTER TABLE `knowledge_base_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `knowledge_categories`
--
ALTER TABLE `knowledge_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `knowledge_tags`
--
ALTER TABLE `knowledge_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landing_pages`
--
ALTER TABLE `landing_pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=865;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice_drivers`
--
ALTER TABLE `notice_drivers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `onboardings`
--
ALTER TABLE `onboardings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_accounts`
--
ALTER TABLE `payment_accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways_transactions`
--
ALTER TABLE `payment_gateways_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=380;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `plan_service_categories`
--
ALTER TABLE `plan_service_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `push_notifications`
--
ALTER TABLE `push_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `push_notification_templates`
--
ALTER TABLE `push_notification_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rental_vehicles`
--
ALTER TABLE `rental_vehicles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `rental_vehicle_zones`
--
ALTER TABLE `rental_vehicle_zones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rider_reviews`
--
ALTER TABLE `rider_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rider_wallets`
--
ALTER TABLE `rider_wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rider_wallet_histories`
--
ALTER TABLE `rider_wallet_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rides`
--
ALTER TABLE `rides`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ride_bids`
--
ALTER TABLE `ride_bids`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `ride_requests`
--
ALTER TABLE `ride_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `ride_request_drivers`
--
ALTER TABLE `ride_request_drivers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `ride_request_zones`
--
ALTER TABLE `ride_request_zones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `ride_status`
--
ALTER TABLE `ride_status`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ride_status_activities`
--
ALTER TABLE `ride_status_activities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `ride_zones`
--
ALTER TABLE `ride_zones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sos`
--
ALTER TABLE `sos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sos_alerts`
--
ALTER TABLE `sos_alerts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sos_statuses`
--
ALTER TABLE `sos_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sos_status_activities`
--
ALTER TABLE `sos_status_activities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sos_zones`
--
ALTER TABLE `sos_zones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surge_prices`
--
ALTER TABLE `surge_prices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `taxido_settings`
--
ALTER TABLE `taxido_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ticket_settings`
--
ALTER TABLE `ticket_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `vehicle_images`
--
ALTER TABLE `vehicle_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_info`
--
ALTER TABLE `vehicle_info`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `vehicle_services`
--
ALTER TABLE `vehicle_services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `vehicle_surge_prices`
--
ALTER TABLE `vehicle_surge_prices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `vehicle_types`
--
ALTER TABLE `vehicle_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vehicle_type_hourly_packages`
--
ALTER TABLE `vehicle_type_hourly_packages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `vehicle_type_zones`
--
ALTER TABLE `vehicle_type_zones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `airports`
--
ALTER TABLE `airports`
  ADD CONSTRAINT `airports_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ambulances`
--
ALTER TABLE `ambulances`
  ADD CONSTRAINT `ambulances_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assigned_tickets`
--
ALTER TABLE `assigned_tickets`
  ADD CONSTRAINT `assigned_tickets_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assigned_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `banner_services`
--
ALTER TABLE `banner_services`
  ADD CONSTRAINT `banner_services_banner_id_foreign` FOREIGN KEY (`banner_id`) REFERENCES `banners` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banner_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bids_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `rides` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bids_ride_request_id_foreign` FOREIGN KEY (`ride_request_id`) REFERENCES `ride_requests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_blog_meta_image_id_foreign` FOREIGN KEY (`blog_meta_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_blog_thumbnail_id_foreign` FOREIGN KEY (`blog_thumbnail_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD CONSTRAINT `blog_categories_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD CONSTRAINT `blog_tags_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cab_commission_histories`
--
ALTER TABLE `cab_commission_histories`
  ADD CONSTRAINT `cab_commission_histories_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cab_commission_histories_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `rides` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cancellation_reasons`
--
ALTER TABLE `cancellation_reasons`
  ADD CONSTRAINT `cancellation_reasons_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cancellation_reasons_icon_image_id_foreign` FOREIGN KEY (`icon_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_category_image_id_foreign` FOREIGN KEY (`category_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_category_meta_image_id_foreign` FOREIGN KEY (`category_meta_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories_services`
--
ALTER TABLE `categories_services`
  ADD CONSTRAINT `categories_services_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_riders`
--
ALTER TABLE `coupon_riders`
  ADD CONSTRAINT `coupon_riders_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_riders_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_service`
--
ALTER TABLE `coupon_service`
  ADD CONSTRAINT `coupon_service_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_vehicle_types`
--
ALTER TABLE `coupon_vehicle_types`
  ADD CONSTRAINT `coupon_vehicle_types_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_vehicle_types_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `currencies`
--
ALTER TABLE `currencies`
  ADD CONSTRAINT `currencies_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `department_users`
--
ALTER TABLE `department_users`
  ADD CONSTRAINT `department_users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `department_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dispatcher_zones`
--
ALTER TABLE `dispatcher_zones`
  ADD CONSTRAINT `dispatcher_zones_dispatcher_id_foreign` FOREIGN KEY (`dispatcher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dispatcher_zones_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_documents`
--
ALTER TABLE `driver_documents`
  ADD CONSTRAINT `driver_documents_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `driver_documents_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `driver_documents_document_image_id_foreign` FOREIGN KEY (`document_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `driver_documents_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_reviews`
--
ALTER TABLE `driver_reviews`
  ADD CONSTRAINT `driver_reviews_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `driver_reviews_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `rides` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `driver_reviews_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `driver_reviews_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `driver_reviews_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_rules`
--
ALTER TABLE `driver_rules`
  ADD CONSTRAINT `driver_rules_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `driver_rules_rule_image_id_foreign` FOREIGN KEY (`rule_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_subscriptions`
--
ALTER TABLE `driver_subscriptions`
  ADD CONSTRAINT `driver_subscriptions_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `driver_subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_vehicle_types`
--
ALTER TABLE `driver_vehicle_types`
  ADD CONSTRAINT `driver_vehicle_types_driver_rule_id_foreign` FOREIGN KEY (`driver_rule_id`) REFERENCES `driver_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `driver_vehicle_types_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_wallets`
--
ALTER TABLE `driver_wallets`
  ADD CONSTRAINT `driver_wallets_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_wallet_histories`
--
ALTER TABLE `driver_wallet_histories`
  ADD CONSTRAINT `driver_wallet_histories_driver_wallet_id_foreign` FOREIGN KEY (`driver_wallet_id`) REFERENCES `driver_wallets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `driver_wallet_histories_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_zones`
--
ALTER TABLE `driver_zones`
  ADD CONSTRAINT `driver_zones_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `driver_zones_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `extra_charges`
--
ALTER TABLE `extra_charges`
  ADD CONSTRAINT `extra_charges_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fleet_manager_wallets`
--
ALTER TABLE `fleet_manager_wallets`
  ADD CONSTRAINT `fleet_manager_wallets_fleet_manager_id_foreign` FOREIGN KEY (`fleet_manager_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fleet_wallet_histories`
--
ALTER TABLE `fleet_wallet_histories`
  ADD CONSTRAINT `fleet_wallet_histories_fleet_wallet_id_foreign` FOREIGN KEY (`fleet_wallet_id`) REFERENCES `fleet_manager_wallets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fleet_wallet_histories_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fleet_withdraw_requests`
--
ALTER TABLE `fleet_withdraw_requests`
  ADD CONSTRAINT `fleet_withdraw_requests_fleet_manager_id_foreign` FOREIGN KEY (`fleet_manager_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fleet_withdraw_requests_fleet_wallet_id_foreign` FOREIGN KEY (`fleet_wallet_id`) REFERENCES `fleet_manager_wallets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `form_fields`
--
ALTER TABLE `form_fields`
  ADD CONSTRAINT `form_fields_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hourly_packages`
--
ALTER TABLE `hourly_packages`
  ADD CONSTRAINT `hourly_packages_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `knowledge_bases`
--
ALTER TABLE `knowledge_bases`
  ADD CONSTRAINT `knowledge_bases_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `knowledge_bases_knowledge_meta_image_id_foreign` FOREIGN KEY (`knowledge_meta_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `knowledge_bases_knowledge_thumbnail_id_foreign` FOREIGN KEY (`knowledge_thumbnail_id`) REFERENCES `media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `knowledge_base_categories`
--
ALTER TABLE `knowledge_base_categories`
  ADD CONSTRAINT `knowledge_base_categories_category_image_id_foreign` FOREIGN KEY (`category_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `knowledge_base_categories_category_meta_image_id_foreign` FOREIGN KEY (`category_meta_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `knowledge_base_categories_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `knowledge_base_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `knowledge_base_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `knowledge_base_tags`
--
ALTER TABLE `knowledge_base_tags`
  ADD CONSTRAINT `knowledge_base_tags_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `knowledge_categories`
--
ALTER TABLE `knowledge_categories`
  ADD CONSTRAINT `knowledge_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `knowledge_base_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `knowledge_categories_knowledge_id_foreign` FOREIGN KEY (`knowledge_id`) REFERENCES `knowledge_bases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `knowledge_tags`
--
ALTER TABLE `knowledge_tags`
  ADD CONSTRAINT `knowledge_tags_knowledge_id_foreign` FOREIGN KEY (`knowledge_id`) REFERENCES `knowledge_bases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `knowledge_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `knowledge_base_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `languages`
--
ALTER TABLE `languages`
  ADD CONSTRAINT `languages_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_items_menu_foreign` FOREIGN KEY (`menu`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `notices_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notice_drivers`
--
ALTER TABLE `notice_drivers`
  ADD CONSTRAINT `notice_drivers_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notice_drivers_notice_id_foreign` FOREIGN KEY (`notice_id`) REFERENCES `notices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `onboardings`
--
ALTER TABLE `onboardings`
  ADD CONSTRAINT `onboardings_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pages_page_meta_image_id_foreign` FOREIGN KEY (`page_meta_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_accounts`
--
ALTER TABLE `payment_accounts`
  ADD CONSTRAINT `payment_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `plans`
--
ALTER TABLE `plans`
  ADD CONSTRAINT `plans_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `plan_service_categories`
--
ALTER TABLE `plan_service_categories`
  ADD CONSTRAINT `plan_service_categories_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `plan_service_categories_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `priorities`
--
ALTER TABLE `priorities`
  ADD CONSTRAINT `priorities_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD CONSTRAINT `push_notifications_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `push_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rental_vehicles`
--
ALTER TABLE `rental_vehicles`
  ADD CONSTRAINT `rental_vehicles_boot_view_id_foreign` FOREIGN KEY (`boot_view_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rental_vehicles_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rental_vehicles_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rental_vehicles_front_view_id_foreign` FOREIGN KEY (`front_view_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rental_vehicles_interior_image_id_foreign` FOREIGN KEY (`interior_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rental_vehicles_normal_image_id_foreign` FOREIGN KEY (`normal_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rental_vehicles_registration_image_id_foreign` FOREIGN KEY (`registration_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rental_vehicles_side_view_id_foreign` FOREIGN KEY (`side_view_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rental_vehicles_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rental_vehicle_zones`
--
ALTER TABLE `rental_vehicle_zones`
  ADD CONSTRAINT `rental_vehicle_zones_rental_vehicle_id_foreign` FOREIGN KEY (`rental_vehicle_id`) REFERENCES `rental_vehicles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rental_vehicle_zones_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rider_reviews`
--
ALTER TABLE `rider_reviews`
  ADD CONSTRAINT `rider_reviews_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rider_reviews_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `rides` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rider_reviews_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rider_reviews_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rider_reviews_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rider_wallets`
--
ALTER TABLE `rider_wallets`
  ADD CONSTRAINT `rider_wallets_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rider_wallet_histories`
--
ALTER TABLE `rider_wallet_histories`
  ADD CONSTRAINT `rider_wallet_histories_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rider_wallet_histories_rider_wallet_id_foreign` FOREIGN KEY (`rider_wallet_id`) REFERENCES `rider_wallets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rides`
--
ALTER TABLE `rides`
  ADD CONSTRAINT `rides_cargo_image_id_foreign` FOREIGN KEY (`cargo_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rides_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rides_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rides_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rides_hourly_package_id_foreign` FOREIGN KEY (`hourly_package_id`) REFERENCES `hourly_packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rides_rental_vehicle_id_foreign` FOREIGN KEY (`rental_vehicle_id`) REFERENCES `rental_vehicles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rides_ride_status_id_foreign` FOREIGN KEY (`ride_status_id`) REFERENCES `ride_status` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rides_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rides_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rides_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rides_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ride_bids`
--
ALTER TABLE `ride_bids`
  ADD CONSTRAINT `ride_bids_bid_id_foreign` FOREIGN KEY (`bid_id`) REFERENCES `bids` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ride_bids_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `rides` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ride_requests`
--
ALTER TABLE `ride_requests`
  ADD CONSTRAINT `ride_requests_cargo_image_id_foreign` FOREIGN KEY (`cargo_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ride_requests_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ride_requests_hourly_package_id_foreign` FOREIGN KEY (`hourly_package_id`) REFERENCES `hourly_packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ride_requests_rental_vehicle_id_foreign` FOREIGN KEY (`rental_vehicle_id`) REFERENCES `rental_vehicles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ride_requests_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ride_requests_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ride_requests_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ride_requests_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ride_request_drivers`
--
ALTER TABLE `ride_request_drivers`
  ADD CONSTRAINT `ride_request_drivers_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ride_request_drivers_ride_request_id_foreign` FOREIGN KEY (`ride_request_id`) REFERENCES `ride_requests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ride_request_zones`
--
ALTER TABLE `ride_request_zones`
  ADD CONSTRAINT `ride_request_zones_ride_request_id_foreign` FOREIGN KEY (`ride_request_id`) REFERENCES `ride_requests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ride_request_zones_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ride_status`
--
ALTER TABLE `ride_status`
  ADD CONSTRAINT `ride_status_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ride_status_activities`
--
ALTER TABLE `ride_status_activities`
  ADD CONSTRAINT `ride_status_activities_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `rides` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ride_zones`
--
ALTER TABLE `ride_zones`
  ADD CONSTRAINT `ride_zones_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `rides` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ride_zones_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_service_icon_id_foreign` FOREIGN KEY (`service_icon_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_service_image_id_foreign` FOREIGN KEY (`service_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD CONSTRAINT `service_categories_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_categories_service_category_image_id_foreign` FOREIGN KEY (`service_category_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sos`
--
ALTER TABLE `sos`
  ADD CONSTRAINT `sos_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sos_sos_image_id_foreign` FOREIGN KEY (`sos_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sos_alerts`
--
ALTER TABLE `sos_alerts`
  ADD CONSTRAINT `sos_alerts_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sos_alerts_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `rides` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sos_alerts_sos_id_foreign` FOREIGN KEY (`sos_id`) REFERENCES `sos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sos_alerts_sos_status_id_foreign` FOREIGN KEY (`sos_status_id`) REFERENCES `sos_statuses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sos_statuses`
--
ALTER TABLE `sos_statuses`
  ADD CONSTRAINT `sos_statuses_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sos_status_activities`
--
ALTER TABLE `sos_status_activities`
  ADD CONSTRAINT `sos_status_activities_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `rides` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sos_status_activities_sos_alert_id_foreign` FOREIGN KEY (`sos_alert_id`) REFERENCES `sos_alerts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sos_zones`
--
ALTER TABLE `sos_zones`
  ADD CONSTRAINT `sos_zones_s_o_s_id_foreign` FOREIGN KEY (`s_o_s_id`) REFERENCES `sos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sos_zones_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `statuses`
--
ALTER TABLE `statuses`
  ADD CONSTRAINT `statuses_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `surge_prices`
--
ALTER TABLE `surge_prices`
  ADD CONSTRAINT `surge_prices_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taxes`
--
ALTER TABLE `taxes`
  ADD CONSTRAINT `taxes_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD CONSTRAINT `testimonials_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `testimonials_profile_image_id_foreign` FOREIGN KEY (`profile_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_priority_id_foreign` FOREIGN KEY (`priority_id`) REFERENCES `priorities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_ticket_status_id_foreign` FOREIGN KEY (`ticket_status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_referred_by_id_foreign` FOREIGN KEY (`referred_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD CONSTRAINT `vehicle_categories_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_categories_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicle_images`
--
ALTER TABLE `vehicle_images`
  ADD CONSTRAINT `vehicle_images_attachment_id_foreign` FOREIGN KEY (`attachment_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_images_vehicle_image_id_foreign` FOREIGN KEY (`vehicle_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicle_info`
--
ALTER TABLE `vehicle_info`
  ADD CONSTRAINT `vehicle_info_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_info_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicle_services`
--
ALTER TABLE `vehicle_services`
  ADD CONSTRAINT `vehicle_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_services_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicle_surge_prices`
--
ALTER TABLE `vehicle_surge_prices`
  ADD CONSTRAINT `vehicle_surge_prices_surge_price_id_foreign` FOREIGN KEY (`surge_price_id`) REFERENCES `surge_prices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_surge_prices_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_surge_prices_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicle_types`
--
ALTER TABLE `vehicle_types`
  ADD CONSTRAINT `vehicle_types_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_types_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_types_vehicle_image_id_foreign` FOREIGN KEY (`vehicle_image_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_types_vehicle_map_icon_id_foreign` FOREIGN KEY (`vehicle_map_icon_id`) REFERENCES `media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicle_type_hourly_packages`
--
ALTER TABLE `vehicle_type_hourly_packages`
  ADD CONSTRAINT `vehicle_type_hourly_packages_hourly_package_id_foreign` FOREIGN KEY (`hourly_package_id`) REFERENCES `hourly_packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_type_hourly_packages_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicle_type_zones`
--
ALTER TABLE `vehicle_type_zones`
  ADD CONSTRAINT `vehicle_type_zones_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_type_zones_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_type_zones_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD CONSTRAINT `withdraw_requests_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `withdraw_requests_driver_wallet_id_foreign` FOREIGN KEY (`driver_wallet_id`) REFERENCES `driver_wallets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `zones`
--
ALTER TABLE `zones`
  ADD CONSTRAINT `zones_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `zones_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
