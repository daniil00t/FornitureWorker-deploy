/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: colors
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `colors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `color` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 33 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: fillfulment_control_order
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `fillfulment_control_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_fc` int NOT NULL,
  `hash` varchar(255) NOT NULL,
  `week` int NOT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `date_order` varchar(255) DEFAULT NULL,
  `client_phone` varchar(255) NOT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `client_address` varchar(255) DEFAULT NULL,
  `price` float(10, 2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `paid` float(10, 2) DEFAULT NULL,
  `debt` varchar(255) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `year` int DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT '0',
  `assembly` tinyint(1) NOT NULL DEFAULT '0',
  `entering` tinyint(1) NOT NULL DEFAULT '0',
  `assemblyAndEntering` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_price` float(10, 2) DEFAULT '0.00',
  `assembly_price` float(10, 2) DEFAULT '0.00',
  `entering_price` float(10, 2) DEFAULT '0.00',
  `assemblyAndEntering_price` float(10, 2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 46 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: forming_number_order
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `forming_number_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `week` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: invoice_orders
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `invoice_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_fc` int NOT NULL,
  `id_iv` int NOT NULL,
  `hash` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `count` int NOT NULL,
  `week` int NOT NULL,
  `material` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `price` float(10, 2) DEFAULT NULL,
  `allPrice` float(10, 2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 135 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: invoices
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_fc` int NOT NULL,
  `hash` varchar(255) NOT NULL,
  `week` int NOT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `date_order` varchar(255) DEFAULT NULL,
  `client_phone` varchar(255) NOT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `client_address` varchar(255) DEFAULT NULL,
  `price` float(10, 2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `paid` float(10, 2) DEFAULT NULL,
  `deliver_back` tinyint(1) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `year` int DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT '0',
  `assembly` tinyint(1) NOT NULL DEFAULT '0',
  `entering` tinyint(1) NOT NULL DEFAULT '0',
  `assemblyAndEntering` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_price` float(10, 2) DEFAULT '0.00',
  `assembly_price` float(10, 2) DEFAULT '0.00',
  `entering_price` float(10, 2) DEFAULT '0.00',
  `assemblyAndEntering_price` float(10, 2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 46 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: materials
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `materials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `material` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: production_order
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `production_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_fc` int NOT NULL,
  `hash` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `count` int NOT NULL,
  `week` int NOT NULL,
  `material` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `description` text,
  `id_added_user` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 135 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jwt` varchar(512) NOT NULL,
  `login` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_created` date DEFAULT NULL,
  `role` int NOT NULL,
  `description` text,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: colors
# ------------------------------------------------------------

INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (1, 'без покраски');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (2, 'лак ');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (3, 'венге-1');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (4, 'венге-2');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (5, 'венге-3');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (6, 'к-1');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (7, 'к-2');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (8, 'Грецкий-орех');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (9, 'Итальянский-орех');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (10, 'мореный-1');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (11, 'мореный-2');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (12, 'могано-3');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (13, 'белый');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (14, 'слоновая кость');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (15, 'черно-белая патина');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (16, 'белое старение ');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (17, 'грецкий орех старение ');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (18, 'браширование белый+золото');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (19, 'браширование белый +серебро');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (20, 'браширование голубой+ серебро');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (21, 'браширование В2+золото');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (22, 'браширование В2+серебро');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (23, 'Браширование классический орех + серебро ');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (24, 'Браширование мокко + золото');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (25, 'к2+тон');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (26, 'RAL');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (27, 'без покрытия');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (28, 'образец');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (29, 'кофе12');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (30, 'пепел 1');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (31, 'пепел 2');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (32, 'пепел 3');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: fillfulment_control_order
# ------------------------------------------------------------

INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    1,
    4001,
    '_nry4i2p5z-81n6chm0h',
    40,
    'Выберете сайт',
    '9-10 окт',
    '89854418896',
    'Елена Чернолецкая',
    'Москва проезд Соловьиный д4 корп 1 кв230',
    47650.00,
    'В работе',
    0.00,
    '0',
    '2021-08-01',
    2021,
    0,
    0,
    1,
    0,
    0.00,
    0.00,
    900.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    2,
    4002,
    '_yg49bz191-amaiojcvg',
    40,
    'Выберете сайт',
    '9-10 окт',
    '89035095827',
    'Ирина',
    'МО Пушкинский рн п Доровское д77',
    60700.00,
    'В работе',
    0.00,
    '0',
    '2021-08-01',
    2021,
    1,
    0,
    0,
    1,
    1000.00,
    0.00,
    0.00,
    2500.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    3,
    4004,
    '_o87w7jc6k-m9pecukv9',
    40,
    'Выберете сайт',
    '9-10 окт',
    '8164328363',
    'Гузель',
    'Мытищи Октябрьский проспект д10а ',
    16000.00,
    'В работе',
    0.00,
    '0',
    '2021-08-01',
    2021,
    1,
    0,
    0,
    0,
    500.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    4,
    4005,
    '_be54dr8vw-xvfy5w3bb',
    40,
    'мебельизсосны.рф',
    '13 окт',
    '89999993935',
    'ФИОо',
    'Москва Маросейка 101 кв16 3эт',
    155600.00,
    'В работе',
    0.00,
    '0',
    '2021-08-01',
    2021,
    0,
    1,
    0,
    0,
    0.00,
    2100.00,
    1500.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    5,
    4006,
    '_z586dbn1q-4931od8vg',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89152855082',
    'ФИОо',
    'Москва ул Магаданска д1 кв 31 ',
    22250.00,
    'В работе',
    0.00,
    '0',
    '2021-08-01',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    6,
    4007,
    '_k5j9gw22c-chz6vicoy',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89057174361',
    'Алексей ',
    'Солнечногорск СНТ 50 лет победы 245',
    40640.00,
    'В работе',
    0.00,
    '0',
    '2021-08-01',
    2021,
    1,
    0,
    0,
    0,
    2000.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    7,
    4008,
    '_c3y682cr8-y28g62hds',
    40,
    'Krovati-spalni.ru',
    '9-окт',
    '89153074087',
    'Сергей Максименко ',
    'Москва ул недорубова дом 30',
    40000.00,
    'В работе',
    0.00,
    '0',
    '2021-08-01',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    8,
    4009,
    '_caopz8u7y-8fu15hh3c',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89264778356 89152625320',
    '-',
    'Москва ул Башиловская д28 п3 кв 235',
    17900.00,
    'В работе',
    0.00,
    '0',
    '2021-08-01',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    9,
    4010,
    '_te6egicfc-tym0dkq96',
    40,
    'мебельизсосны.рф',
    '13 окт',
    '89055509664',
    'Ольга',
    'Пушкино мкр Клязьма ул андреевская 12 ',
    37960.00,
    'В работе',
    0.00,
    '0',
    '2021-08-01',
    2021,
    1,
    1,
    1,
    0,
    2000.00,
    2000.00,
    1000.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    10,
    4011,
    '_4guf0b0db-78y1dh3c5',
    40,
    'мебельизсосны.рф',
    '9-10 окт ',
    '89255977633',
    '-',
    'Раменский рн д Ждановское дом 277',
    34800.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    1700.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    11,
    4012,
    '_0ca9ji387-r1szzd2iv',
    40,
    'мебельизсосны.рф',
    '13 октября',
    '89251881815',
    'Алексей',
    'Москва, ул.Нагатинская, д.3-а',
    18500.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    12,
    4013,
    '_oa89ujdpq-o0si31m40',
    40,
    'Krovati-spalni.ru',
    '9-10 окт',
    '89161249116',
    'Мила',
    'МО, Щелковский р-он, д. Супонево, ул Озерная, д. 54',
    14900.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    600.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    13,
    4014,
    '_gxn6f7ylq-akn0tipsh',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89035233744',
    'Ирина',
    'г.Москва, Расторгуевский пер-к, д.4-а, кв.3',
    30100.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    300.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    14,
    4016,
    '_sjvamn5p7-fuqw6d5jd',
    40,
    'Выберете сайт',
    '9-10 окт',
    '89037722778',
    'Екатерина',
    'Москва, Теплый стан, д. 9 корп 1, кв. 14',
    19740.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    15,
    4017,
    '_apk50d2zh-bg32s51ob',
    40,
    'мебельизсосны.рф',
    '9 октября',
    '89096552523',
    'Ольга',
    'МО, г.Мытищи, ул.Юбилейная, д.33, к.1, кв.21',
    17200.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    700.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    16,
    4018,
    '_ypf3o293v-fdkv9jfck',
    40,
    'Krovati-spalni.ru',
    '9-10 окт',
    '89915936040',
    '-',
    'Электросталь, проспект Ленина, д 8а',
    31070.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    17,
    4019,
    '_cz6e46w7w-9odbttbl4',
    40,
    'Выберете сайт',
    '9-10 окт',
    '89037658473',
    'Лариса',
    'МО Домодедовский рн СНТ Образцово 101',
    21300.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    1200.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    18,
    4020,
    '_h7n28i7b6-jgqj7flqa',
    40,
    'Выберете сайт',
    '9-10 окт',
    '89031093708',
    'Косинов Юрий',
    'Серпуховский рн ДНТ Лисенки ',
    15500.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    19,
    4021,
    '_03gqh2k9t-s2pn84ssh',
    40,
    'Krovati-spalni.ru',
    '9-10 окт',
    '89168485173',
    'Александра Константиновна',
    'МО, Балашиха, ул. Крупской, д. 11',
    17000.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    1,
    0,
    500.00,
    0.00,
    400.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    20,
    4023,
    '_obh65qzut-rz3jeszu8',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89104280712',
    'Максимова Екатерина',
    'г.Москва, ул.Генерала Тюленева, д.29, к.1, кв.195',
    3250.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    21,
    4022,
    '_frgbxwfm3-nd4i15tzb',
    40,
    'Liman-murom.ru',
    '9-10 окт',
    '89271576660',
    '-',
    'Видное д Петрушино 3 улица д118',
    41020.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    500.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    22,
    4025,
    '_25dh7pn6g-41g9zkg2i',
    40,
    'Krovati-spalni.ru',
    '9-10 окт',
    '89104318981',
    'Артём',
    'МО, Одинцовский г. о., село Немчиновка, СНТ Дружба, уч. 11',
    10400.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    500.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    23,
    4026,
    '_behe14m9e-kamdr12gt',
    40,
    'Выберете сайт',
    '13 окт',
    '89999033290',
    'Павел',
    'Жуковский ул чкалова 2 кв60',
    28340.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    600.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    24,
    4027,
    '_bevux7chw-xkeyz0c8a',
    40,
    'Krovati-spalni.ru',
    '9-10 окт',
    '89637707775',
    'Мария Котрелева',
    'МО, Раменский р-он, д Кратово, ул. Карла Маркса, д. 56',
    40810.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    1200.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    25,
    4028,
    '_z8oing1h2-85khhip9f',
    40,
    'Выберете сайт',
    '9-10 окт',
    '89037434173',
    '-',
    'Истринский рн д Рожново ул Прудовская д35',
    183020.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    1,
    0,
    1400.00,
    0.00,
    250.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    26,
    4024,
    '_i0zcoa3i3-rj0nueaes',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89161950220',
    'Ирина',
    'МО, Химки, ул.Молодежная 78, кв.979, п.6, эт.6',
    5400.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    1,
    0,
    0.00,
    0.00,
    300.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    27,
    4030,
    '_wxdwu941t-neq7t03t4',
    40,
    'Liman-murom.ru',
    '9-окт',
    '89153041298',
    'Александр Аниканов',
    'Москва ул Академика Волгина 31 ',
    45070.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    28,
    4032,
    '_69m5uaodd-j300zc98u',
    40,
    'Krovati-spalni.ru',
    '9-10 окт',
    '89165161806',
    '-',
    'Москва ул Новочеремушкинская д16 4 под',
    164580.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    29,
    4033,
    '_8z6ymavoz-b30xqoffz',
    40,
    'Krovati-spalni.ru',
    '9-окт',
    '89161421093',
    'Татьяна ',
    'г Звенигород ул Саввинская д5 кв 17 ',
    21900.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    1,
    0,
    1200.00,
    0.00,
    300.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    30,
    4035,
    '_24kqt878m-fviwad31j',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89167509173',
    '-',
    'мкр Железнодорожный ул Пионерская 12б ',
    159980.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    1,
    0,
    700.00,
    0.00,
    400.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    31,
    4037,
    '_mw7tdnvbb-st698eihr',
    40,
    'Krovati-spalni.ru',
    '9-10 окт',
    '89130183337',
    '-',
    'Дзержинский, ул. Академика Жукова, д. 38',
    19800.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    500.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    32,
    4038,
    '_evloskxb7-rmkylf4wf',
    40,
    'Liman-murom.ru',
    '9-10 окт',
    '89629209497',
    '-',
    'гХотьково днт Кудринские узоры 5 линия 72уч',
    143680.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    1,
    1,
    0,
    1860.00,
    9180.00,
    700.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    33,
    4039,
    '_9mf62ltmc-hgq2xx1gx',
    40,
    'Krovati-spalni.ru',
    '13 окт',
    '89055466012',
    '-',
    'Москва ул Трофимова дом 24 корп2 ',
    19000.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    1,
    0,
    0.00,
    0.00,
    450.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    34,
    4040,
    '_edi0ff8nz-gja26y6jm',
    40,
    'Выберете сайт',
    '9-10 окт',
    'Людмила Генадевна',
    '89037193966',
    'Ногинский рн днп Зимгородок уч 16 ',
    42000.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    500.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    35,
    4041,
    '_1lx3sj8m5-jcfujb6k4',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89265489409',
    '-',
    'МО, г.Люберцы, пр-т Победы, 11/2',
    22300.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    700.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    36,
    4042,
    '_ltvmgl3ey-45o13kfuh',
    40,
    'мебельизсосны.рф',
    '',
    '89167741184',
    'Кротова Елена',
    'Москва, ул.Левобережная, д.4, к.24, кв.127',
    15800.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    1,
    1,
    0,
    0.00,
    1000.00,
    400.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    37,
    4043,
    '_ifqkgkfke-00xilk7pp',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89263569978 89266598034',
    'Вера Ушакова ',
    'Красногорск Опалиха ул Чапаева 59',
    38300.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    900.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    38,
    4044,
    '_ju4itwlm2-lcpnu4bc0',
    40,
    'мебельизсосны.рф',
    '9-10 окт    ТЕРМИНАЛ',
    '89167198933',
    'Красильникова Татьяна Ивановна',
    'Москва, Рубцовская набережная, д.4, к.3, кв.93, эт.14 (код домоф.93)',
    15500.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    39,
    4045,
    '_v11z0elhq-8litsexib',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89269322292',
    'Синявкин Дмитрий',
    'Москва, ул.Планерная 16, к.4, п.5, домоф.93В',
    21900.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    40,
    4046,
    '_kigo9uuqi-te0i2x8tq',
    40,
    'Liman-murom.ru',
    '9-10 окт',
    '89161612747',
    '-',
    'Москва, ул. Чечулина, д. 4, кв. 272, 8 под., 6 эт.',
    53170.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    41,
    4047,
    '_2wgds3pkv-ilyuc9595',
    40,
    'Выберете сайт',
    '9-10 окт',
    '89154606475',
    'Игорь Юрьевич ',
    'Балашиха мкр салтыковка ул Лесной поселок',
    22800.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    700.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    42,
    4048,
    '_xzdigkn9r-t48b28i8z',
    40,
    'Выберете сайт',
    '9-окт',
    '89503518266',
    'Юлия',
    'Щелково 1й советский переулок д16 кв99',
    26000.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    0,
    1,
    0,
    1500.00,
    0.00,
    400.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    43,
    4049,
    '_eh1ossvgk-332o0bw9i',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89168844929',
    '-',
    'Москва ул Широка д3 корп 4 п4',
    8300.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    1,
    0,
    0.00,
    0.00,
    300.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    44,
    4050,
    '_m5lipknik-ok7bldy9l',
    40,
    'Выберете сайт',
    '9-окт',
    '89859501086',
    '-',
    'Москва ул Абрамцевская дом 8а',
    10300.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    0,
    0,
    1,
    0,
    0.00,
    0.00,
    300.00,
    0.00
  );
INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `debt`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    45,
    4051,
    '_mduudo2oc-adsk66s63',
    40,
    'Liman-murom.ru',
    '9-10 окт',
    '89165000164',
    '-',
    'Солнечногорский рн д Сырково снт шмель д35',
    204124.00,
    'В работе',
    0.00,
    '0',
    '2021-08-02',
    2021,
    1,
    1,
    1,
    0,
    2500.00,
    5000.00,
    2000.00,
    0.00
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: forming_number_order
# ------------------------------------------------------------

INSERT INTO
  `forming_number_order` (`id`, `week`, `count`, `year`)
VALUES
  (1, 40, 51, 2021);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: invoice_orders
# ------------------------------------------------------------

INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    1,
    4001,
    1,
    '_cb5q4tvoj-2fpei29vl',
    'ручки дерево',
    15,
    40,
    'undefined',
    'undefined',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    2,
    4001,
    1,
    '_fv1hckqxd-3tk9kpvi4',
    'буфет из дерева №5',
    1,
    40,
    'сосна ',
    'венге-3',
    28900.00,
    28900.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    3,
    4001,
    1,
    '_07ntokm7k-vkivvwk4c',
    'шкаф для дачи витязь 109',
    1,
    40,
    'сосна ',
    'венге-3',
    18750.00,
    18750.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    4,
    4002,
    2,
    '_mk09k3tnm-1a1eo9i3c',
    'стол письменный Верди 119',
    1,
    40,
    'сосна ',
    'Итальянский-орех',
    21700.00,
    21700.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    5,
    4002,
    2,
    '_prtxv0jtb-c2vp9evp1',
    'буфет верди 111',
    1,
    40,
    'сосна ',
    'Итальянский-орех',
    39000.00,
    39000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    6,
    4004,
    3,
    '_zi0r2wjzq-o0bzdk1m6',
    'буфет 10.1',
    1,
    40,
    'сосна ',
    'венге-2',
    16000.00,
    16000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    7,
    4004,
    3,
    '_zd9xpvy5o-z2ltx39xe',
    'ручки  дерево',
    4,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    8,
    4005,
    4,
    '_c8t4qi7sm-fbbc14g8c',
    'прихожая пм 112 кожа №4',
    1,
    40,
    'дуб ',
    'белый',
    155600.00,
    155600.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    9,
    4006,
    5,
    '_wtelped5v-qfnyjb5rv',
    'шкаф 2 витязь 126 ',
    1,
    40,
    'сосна ',
    'лак ',
    22250.00,
    22250.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    10,
    4006,
    5,
    '_jmr38zwgl-huh1s73ri',
    'ручки скоба золото',
    6,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    11,
    4006,
    5,
    '_bzqaeb6si-fy1ld8l19',
    'образцы к1 к2 м1 м2 пепел1 в1',
    1,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    12,
    4007,
    6,
    '_lacn8xh9u-rkxjt0ggo',
    'тумба веста 4 ',
    1,
    40,
    'сосна ',
    'без покраски',
    3140.00,
    3140.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    13,
    4007,
    6,
    '_fuzwo5ifk-dhvxm9n1d',
    'кровать дана 2 90*190',
    1,
    40,
    'сосна ',
    'без покраски',
    10000.00,
    10000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    14,
    4007,
    6,
    '_7btb8usqk-rp90g1xy0',
    '2 малых ящика ',
    2,
    40,
    '-',
    'без покраски',
    2000.00,
    4000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    15,
    4007,
    6,
    '_au3br9r91-xhbablivc',
    'матрас кокос 90*190',
    1,
    40,
    '-',
    '-',
    5600.00,
    5600.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    16,
    4007,
    6,
    '_6vf4ryqru-f9rncmoge',
    'шкаф для дачи витязь 104',
    1,
    40,
    'сосна ',
    'без покраски',
    17900.00,
    17900.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    17,
    4007,
    6,
    '_nbv5um6uc-4g6dpbpoq',
    'ручки дерево',
    4,
    40,
    'сосна ',
    'без покраски',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    18,
    4008,
    7,
    '_pd5v7it1q-r0uojtvvo',
    'матрас элит н 120х200',
    1,
    40,
    '-',
    '-',
    10600.00,
    10600.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    19,
    4008,
    7,
    '_ovt1s30y7-euk97dxdb',
    'кровать дана 2',
    1,
    40,
    'сосна ',
    'к-2',
    11500.00,
    11500.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    20,
    4008,
    7,
    '_ff99krg8z-aywi3jx00',
    'шкаф стеллаж кантри 49 ',
    1,
    40,
    'сосна ',
    'к-2',
    17900.00,
    17900.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    21,
    4009,
    8,
    '_7vhxvbdry-r83tt2cmf',
    'шкаф 1 витязь 129 ',
    1,
    40,
    'сосна ',
    'могано-3',
    17900.00,
    17900.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    22,
    4009,
    8,
    '_2zm6hdyj7-pstr648d5',
    'ручка дерево ',
    5,
    40,
    '-',
    'могано-3',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    23,
    4010,
    9,
    '_bd5wjwlm2-26bcs8b9c',
    'шкаф верди 1070',
    1,
    40,
    'сосна ',
    'слоновая кость',
    29640.00,
    29640.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    24,
    4010,
    9,
    '_jydq2skei-eaoybgdea',
    'тумба верди 320 ',
    1,
    40,
    'сосна ',
    'слоновая кость',
    8320.00,
    8320.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    25,
    4010,
    9,
    '_z263k8nzx-lqni13xln',
    'ручка дерево ',
    7,
    40,
    'сосна ',
    'слоновая кость',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    26,
    4011,
    10,
    '_bljhmpdkw-c30xbvw50',
    'стол журнальный кантри 30',
    1,
    40,
    'сосна ',
    'лак ',
    15300.00,
    15300.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    27,
    4011,
    10,
    '_jridxzna1-ru53vqidx',
    'обувница 101 ',
    1,
    40,
    'сосна ',
    'лак ',
    11400.00,
    11400.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    28,
    4011,
    10,
    '_1lpelntpj-gzhy6qrwi',
    'обувница 121 ',
    1,
    40,
    'сосна ',
    'лак ',
    8100.00,
    8100.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    29,
    4011,
    10,
    '_m1dqam7zf-ggxh0klxr',
    'ручки дерево',
    14,
    40,
    'сосна ',
    'лак ',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    30,
    4012,
    11,
    '_e8yocdfet-op8yg5cl7',
    'Комод Витязь кд-163',
    1,
    40,
    'сосна ',
    'лак ',
    18500.00,
    18500.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    31,
    4012,
    11,
    '_m5sjtpa27-zr2i3sppa',
    'Ручки дерево',
    10,
    40,
    'сосна ',
    'лак ',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    32,
    4013,
    12,
    '_1xcqorkpg-nnhywz4hm',
    'Ручка ск бронза',
    0,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    33,
    4013,
    12,
    '_e30g2d5om-i0qpy01rd',
    'тумба мальта 2',
    2,
    40,
    'сосна ',
    'венге-2',
    5500.00,
    11000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    34,
    4013,
    12,
    '_44s02fm37-38k8afqs0',
    'тумба кт 110',
    1,
    40,
    'сосна ',
    'лак ',
    3900.00,
    3900.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    35,
    4014,
    13,
    '_e6qvn39tf-pa3vuov01',
    'Стол письменный Паола-1 (тумба справа)',
    1,
    40,
    'сосна ',
    'венге-2',
    30100.00,
    30100.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    36,
    4014,
    13,
    '_vh9kqff3n-rlcw5fwpt',
    'Ручки скоба шампань',
    6,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    37,
    4016,
    14,
    '_10hioiceq-v44igadwa',
    'Комод Витязь КД-114',
    1,
    40,
    'сосна ',
    'браширование белый +серебро',
    19740.00,
    19740.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    38,
    4016,
    14,
    '_1pj9ijiw4-4af631isz',
    'Ручки дерево',
    0,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    41,
    4017,
    15,
    '_7ased1nbf-lv7s3ahel',
    'Комод Витязь Кд-127 (в РАЗБОРЕ !!!)',
    1,
    40,
    'сосна ',
    'без покраски',
    17200.00,
    17200.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    42,
    4017,
    15,
    '_sy6o9rd6u-y7s6ntkxg',
    'Ручки дерево',
    6,
    40,
    'сосна ',
    'без покраски',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    43,
    4018,
    16,
    '_rpldoo27o-m8kwo9qod',
    'Комод Приано 4',
    1,
    40,
    'сосна ',
    'слоновая кость',
    24570.00,
    24570.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    44,
    4018,
    16,
    '_wfdmxsx2i-2txrhngnd',
    'Тумба Приано 1',
    1,
    40,
    'сосна ',
    'слоновая кость',
    6500.00,
    6500.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    45,
    4018,
    16,
    '_ebhotrcws-4fwu18ecj',
    'Ручка ск бронза',
    0,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    46,
    4019,
    17,
    '_npad1360i-ad2vz78uw',
    'тумба тв по эскизу ',
    1,
    40,
    'берёза ',
    'венге-2',
    21300.00,
    21300.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    47,
    4019,
    17,
    '_dri3shmav-epw4ly1hw',
    'ручка скоба шампань ',
    2,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    48,
    4020,
    18,
    '_e860kd608-eexpuo6z9',
    'комод Витязь кд 113 ',
    1,
    40,
    'сосна ',
    'лак ',
    15500.00,
    15500.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    49,
    4020,
    18,
    '_z79u7d92g-ypkl7u0d2',
    'ручка скоба бронза ',
    1,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    50,
    4021,
    19,
    '_0fkrq0bg4-vzehgvbf4',
    'Комод Витязь КД-127',
    1,
    40,
    'сосна ',
    'без покраски',
    17000.00,
    17000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    51,
    4021,
    19,
    '_2839np2p5-vxesqlryi',
    'Ручки дерево',
    0,
    40,
    '-',
    'без покраски',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    52,
    4023,
    20,
    '_fadpig6eo-gwhcssq6b',
    'Тумба 2 Икея',
    1,
    40,
    'сосна ',
    'мореный-2',
    3250.00,
    3250.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    53,
    4022,
    21,
    '_g2l99qqxi-dzyge43qk',
    'тумба милан  540 ',
    1,
    40,
    'сосна ',
    'образец',
    40320.00,
    40320.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    54,
    4022,
    21,
    '_f9wyq41aw-y212pxkgt',
    'ручка №16 ',
    2,
    40,
    '-',
    '-',
    350.00,
    700.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    55,
    4025,
    22,
    '_e1ielvprd-5k7g48crz',
    'Комод ЛФ-200',
    1,
    40,
    'сосна ',
    'лак ',
    10400.00,
    10400.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    56,
    4026,
    23,
    '_by2j5v8ek-s0azo5y4v',
    'стол письменный двухтумбовый №3 ',
    1,
    40,
    'сосна ',
    'белое старение ',
    28340.00,
    28340.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    57,
    4026,
    23,
    '_jsszcnrog-9lzz63j01',
    'ручка скоба бронза ',
    5,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    58,
    4027,
    24,
    '_4mqinc35k-p9w8pvbzs',
    'Комод Икея',
    1,
    40,
    'берёза ',
    'венге-1',
    14210.00,
    14210.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    59,
    4027,
    24,
    '_fadtpmlus-v9vzcdzfe',
    'Комод Икея',
    1,
    40,
    'берёза ',
    'венге-3',
    14210.00,
    14210.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    60,
    4027,
    24,
    '_0tjwc9zzv-2y9xwpv0i',
    'Кровать Весна 85*195',
    1,
    40,
    'берёза ',
    'к-2',
    12390.00,
    12390.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    61,
    4028,
    25,
    '_jpb82zxpv-czmmbteby',
    'стол письменный пс 43',
    1,
    40,
    'сосна ',
    'образец',
    38640.00,
    38640.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    62,
    4028,
    25,
    '_3mpptr00z-ek38ax9k1',
    'ручка №38',
    2,
    40,
    '-',
    '-',
    350.00,
    700.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    63,
    4029,
    25,
    '_l1h0nsy3t-npzc1j86l',
    'Шкаф Верди 110 по эскизу',
    1,
    40,
    'сосна ',
    'RAL',
    111000.00,
    111000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    64,
    4029,
    25,
    '_c8osneodo-s7tn3ms4p',
    'Кровать Верди тахта по эскизу',
    1,
    40,
    'сосна ',
    'RAL',
    20580.00,
    20580.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    65,
    4029,
    25,
    '_5wsx037ol-gowwhlbt3',
    'Тумба Верди 320 (по эскизу)',
    1,
    40,
    'сосна ',
    'RAL',
    10000.00,
    10000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    66,
    4029,
    25,
    '_ski9x0rhu-hacy2r85j',
    'Ручка № 12',
    6,
    40,
    '-',
    '-',
    350.00,
    2100.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    67,
    4024,
    26,
    '_gyam4qt11-1fwu7wy8a',
    'Тумба Приано-2',
    1,
    40,
    'сосна ',
    'мореный-2',
    5400.00,
    5400.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    68,
    4024,
    26,
    '_b83bonoc0-4zofdzav8',
    'Ручка ск золото',
    2,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    69,
    4024,
    26,
    '_td36bmn72-ldvxg6r7v',
    'Штанга железная (к з-зу №3361)',
    1,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    70,
    4030,
    27,
    '_ip72zjwac-7lobge1sk',
    'стол письменный однотумбовый №4 ',
    1,
    40,
    'сосна ',
    'лак ',
    14950.00,
    14950.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    71,
    4030,
    27,
    '_3yj7hckfk-djq9zj081',
    'ручка №47 ',
    1,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    72,
    4030,
    27,
    '_pgd416qy1-qd7uzh6vd',
    'кровать кантри 107 90х190 ',
    1,
    40,
    'берёза ',
    'слоновая кость',
    29120.00,
    29120.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    73,
    4030,
    27,
    '_rl07nvaco-eccvlfu34',
    'орт ламели ',
    1,
    40,
    '-',
    '-',
    1000.00,
    1000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    74,
    4030,
    27,
    '_3l98ok42n-gny9z4fl5',
    'образцы на березе Венги2 Гр орех ',
    1,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    75,
    4032,
    28,
    '_rmje8dcwr-1plfhxg1i',
    'стол письменный однотумбовый №2 ',
    1,
    40,
    'сосна ',
    'к-2',
    14900.00,
    14900.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    76,
    4032,
    28,
    '_y9ykk7v4v-6ubkm7knt',
    'матрас 80х200 идеал ',
    1,
    40,
    '-',
    '-',
    6000.00,
    6000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    77,
    4031,
    28,
    '_il6n8kqmn-qdnlypt8l',
    'Шкаф Верди 110 (по эскизу)',
    1,
    40,
    'сосна ',
    'образец',
    111000.00,
    111000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    78,
    4031,
    28,
    '_k5zoc8fpe-za7wvl37x',
    'Кровать Верди тахта 120*200 (по эскизу)',
    1,
    40,
    'сосна ',
    'образец',
    20580.00,
    20580.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    79,
    4031,
    28,
    '_7gqtokz5g-bu2wqi34w',
    'Тумба Верди 320 ( по эскизу)',
    1,
    40,
    '-',
    'образец',
    10000.00,
    10000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    80,
    4031,
    28,
    '_xc82wtjy1-6bdivmljr',
    'Ручка № 12',
    6,
    40,
    '-',
    '-',
    350.00,
    2100.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    81,
    4033,
    29,
    '_lx16c22z5-vjgl6d8ow',
    'стол обеденный №12 ',
    1,
    40,
    'сосна ',
    'без покраски',
    21900.00,
    21900.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    82,
    4034,
    29,
    '_2dfu9mp0u-wd3wt3aeq',
    'Шкаф Верди 110 (по эскизу)',
    1,
    40,
    'сосна ',
    'образец',
    111000.00,
    111000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    83,
    4034,
    29,
    '_5ua4jqym4-d60i6z9vm',
    'Кровать Верди тахта 120*200 (по эскизу)',
    1,
    40,
    'сосна ',
    'образец',
    20580.00,
    20580.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    84,
    4034,
    29,
    '_fn1z95yfa-rf9837n95',
    'Тумба Верди 320 (по эскизу)',
    1,
    40,
    'сосна ',
    'образец',
    10000.00,
    10000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    85,
    4034,
    29,
    '_ai8onz9mf-4ptpkikf3',
    'Ручка № 12',
    6,
    40,
    '-',
    '-',
    350.00,
    2100.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    86,
    4035,
    30,
    '_6sd9nupo2-eq45ps8hg',
    'стол письменый резной 3 ',
    1,
    40,
    'сосна ',
    'кофе12',
    16300.00,
    16300.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    87,
    4035,
    30,
    '_af3qwxytu-anho1i2jc',
    'ручка дерево',
    3,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    88,
    4036,
    30,
    '_4cb4zwxju-qs5gu7w0c',
    'Шкаф Верди 110 по эскизу',
    1,
    40,
    'сосна ',
    'RAL',
    111000.00,
    111000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    89,
    4036,
    30,
    '_gmdftrqi4-ir7nmyln9',
    'Кровать Верди тахта 120*200 по эскизу',
    1,
    40,
    'сосна ',
    'RAL',
    20580.00,
    20580.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    90,
    4036,
    30,
    '_uvd558ydh-bve34z68u',
    'Тумба Верди 320 по эскизу',
    1,
    40,
    'сосна ',
    'RAL',
    10000.00,
    10000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    91,
    4036,
    30,
    '_w4lnx6le6-qf3d8zjpl',
    'Ручка № 12',
    6,
    40,
    '-',
    '-',
    350.00,
    2100.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    92,
    4037,
    31,
    '_t5mnuiqkn-zoikqb365',
    'Стол письменный Верди 119',
    1,
    40,
    'сосна ',
    'к2+тон',
    19800.00,
    19800.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    93,
    4037,
    31,
    '_chycskuer-91hmyg2do',
    'Ручка ск бронза',
    0,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    94,
    4038,
    32,
    '_wycxla747-fve8hywms',
    'кровать верди тахта по эскизу 120х200',
    1,
    40,
    'сосна ',
    'образец',
    20580.00,
    20580.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    95,
    4038,
    32,
    '_xxrkz32x3-cnx1ssmvl',
    'тумба верди 320 ',
    1,
    40,
    'сосна ',
    'образец',
    10000.00,
    10000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    96,
    4038,
    32,
    '_v3l3tnfnv-fsol1x367',
    'шкаф верди 110 ',
    1,
    40,
    'сосна ',
    'образец',
    111000.00,
    111000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    97,
    4038,
    32,
    '_kw7aczq69-oln7fh39j',
    'ручки №12',
    6,
    40,
    '-',
    '-',
    350.00,
    2100.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    98,
    4039,
    33,
    '_7rq4ht93s-eu6r2bhki',
    'стол письменный №7 ',
    1,
    40,
    'сосна ',
    'Итальянский-орех',
    19000.00,
    19000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    99,
    4039,
    33,
    '_ugxlx9gt2-bvkxl4yvc',
    'ручка скоба бронза ',
    5,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    100,
    4040,
    34,
    '_qptigebsz-ftjp2fp24',
    'комод кд 132',
    1,
    40,
    '-',
    'пепел 2',
    12300.00,
    12300.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    101,
    4040,
    34,
    '_2ue18hp78-k6i8c75fp',
    'тумба филенка 2 ящика ниша ',
    3,
    40,
    'сосна ',
    'пепел 2',
    2900.00,
    8700.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    102,
    4040,
    34,
    '_frtylmc41-u2ysu3or8',
    'шкаф для дачи витязь 102 ',
    1,
    40,
    'берёза ',
    'пепел 2',
    21000.00,
    21000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    103,
    4040,
    34,
    '_jcc133icc-55tbayi5q',
    'ручки дерево',
    10,
    40,
    '-',
    'пепел 2',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    104,
    4041,
    35,
    '_32ds2fs42-1uijqo67z',
    'Комод Верди 190',
    1,
    40,
    'сосна ',
    'образец',
    22300.00,
    22300.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    105,
    4041,
    35,
    '_5c45o290s-5l46sf84o',
    'Ручка ск бронза',
    6,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    106,
    4042,
    36,
    '_x6u1lulu4-3mfcmnu6j',
    'Антресоль трехстворчатая с багетом',
    1,
    40,
    'сосна ',
    'Грецкий-орех',
    12000.00,
    12000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    107,
    4042,
    36,
    '_m790kgop0-pp8b9xs0c',
    'Ручка ск бронза',
    3,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    108,
    4042,
    36,
    '_gta6142n9-p99az8bhv',
    'Банкетка №6 (обивка №73)',
    1,
    40,
    'сосна ',
    'Грецкий-орех',
    3800.00,
    3800.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    109,
    4043,
    37,
    '_ki1k8f0zh-v2gz5tqzy',
    'шкаф приано 3.1 ',
    1,
    40,
    'сосна ',
    'венге-1',
    25150.00,
    25150.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    110,
    4043,
    37,
    '_n7jdiend9-yiinxmvqo',
    'стол письменный 1тумб №4 ',
    1,
    40,
    'сосна ',
    'венге-1',
    13150.00,
    13150.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    111,
    4044,
    38,
    '_xpqqcq1z0-dz7pl0sdy',
    'Комод Витязь Кд-138',
    1,
    40,
    'сосна ',
    'мореный-2',
    15500.00,
    15500.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    112,
    4044,
    38,
    '_3rgix6p69-4pj92zv40',
    'Ручки дерево',
    6,
    40,
    'сосна ',
    'мореный-2',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    113,
    4045,
    39,
    '_y0vqnnq4r-z03dcsntx',
    'Кухонный модуль 1,13',
    3,
    40,
    'сосна ',
    'пепел 1',
    7000.00,
    21000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    114,
    4045,
    39,
    '_5hcr45z5w-ijpoot6n9',
    'Ручка №2',
    3,
    40,
    '-',
    '-',
    300.00,
    900.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    115,
    4046,
    40,
    '_78kquthj0-cp2tjjlto',
    'Комод Верди 210 (8 ящиков)',
    1,
    40,
    'сосна ',
    'слоновая кость',
    23400.00,
    23400.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    116,
    4046,
    40,
    '_dc44n2odv-3u1a71do5',
    'Комод Верди 250',
    1,
    40,
    'сосна ',
    'слоновая кость',
    19500.00,
    19500.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    117,
    4046,
    40,
    '_m17h82a99-9860hqzw0',
    'Зеркало Верди Люкс',
    1,
    40,
    'сосна ',
    'слоновая кость',
    10270.00,
    10270.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    118,
    4046,
    40,
    '_uwg0hwig0-picgt5hux',
    'Ручка ск бронза',
    0,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    119,
    4047,
    41,
    '_egz3wzw01-uyzi97qw8',
    'шкаф верди 1080',
    1,
    40,
    'сосна ',
    'венге-1',
    22800.00,
    22800.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    120,
    4047,
    41,
    '_y7fmohbjh-2vp5mj77n',
    'ручки скоба бронза ',
    4,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    121,
    4048,
    42,
    '_stvsak5pz-az84kliwu',
    'стол письменный 1тумб Валенсия ',
    1,
    40,
    'сосна ',
    'белый',
    26000.00,
    26000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    122,
    4048,
    42,
    '_y0nnt0q1s-ay3yvd6zn',
    'ручки скоба золото',
    6,
    40,
    '-',
    '-',
    0.00,
    0.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    123,
    4049,
    43,
    '_7x8de36r9-lcplzqxjz',
    'кровать бэлли 80х200 ',
    1,
    40,
    'сосна ',
    'мореный-2',
    8300.00,
    8300.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    124,
    4050,
    44,
    '_lc9lq543z-5gzdk5hus',
    'матрас 160х200 Люкс Н ',
    1,
    40,
    '-',
    '-',
    10300.00,
    10300.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    125,
    4051,
    45,
    '_oajunh6t2-l8gwjama8',
    'шкаф паола 210 ',
    1,
    40,
    'берёза ',
    'Итальянский-орех',
    61600.00,
    61600.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    126,
    4051,
    45,
    '_68uh2zlr0-ne7piefav',
    'элбург 350 комод',
    1,
    40,
    'берёза ',
    'лак ',
    19320.00,
    19320.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    127,
    4051,
    45,
    '_mokems9bq-bprbd2164',
    'элбург 300 комод ',
    1,
    40,
    'берёза ',
    'лак ',
    40460.00,
    40460.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    128,
    4051,
    45,
    '_58r19r1le-nwpspeofn',
    'комод гармония 5 ',
    1,
    40,
    'берёза ',
    'лак ',
    19460.00,
    19460.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    129,
    4051,
    45,
    '_wh5o9ugcx-5grd3c83a',
    'обувница кантри ',
    1,
    40,
    'берёза ',
    'лак ',
    10000.00,
    10000.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    130,
    4051,
    45,
    '_eo1rlg8ye-runnbh4bg',
    'стол обеденный №12',
    1,
    40,
    'берёза ',
    'лак ',
    23044.00,
    23044.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    131,
    4051,
    45,
    '_cwqviwh8v-l31oxdbzv',
    'стул береза №10 обивка 74',
    4,
    40,
    'берёза ',
    'лак ',
    5460.00,
    21840.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    132,
    4051,
    45,
    '_pxgsytmpk-xk3jgpjhf',
    'ручки №15 ',
    10,
    40,
    '-',
    '-',
    350.00,
    3500.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    133,
    4051,
    45,
    '_co0js3ht3-ht5gjpi7e',
    'ручка №16',
    6,
    40,
    '-',
    '-',
    350.00,
    2100.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `price`,
    `allPrice`
  )
VALUES
  (
    134,
    4051,
    45,
    '_sjdujke15-dbjtk0vwh',
    'ручка №23',
    8,
    40,
    '-',
    '-',
    350.00,
    2800.00
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: invoices
# ------------------------------------------------------------

INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    1,
    4001,
    '_nry4i2p5z-81n6chm0h',
    40,
    'Выберете сайт',
    '9-10 окт',
    '89854418896',
    'Елена Чернолецкая',
    'Москва проезд Соловьиный д4 корп 1 кв230',
    0.00,
    'undefined',
    0.00,
    0,
    '2021-08-01',
    2021,
    0,
    0,
    1,
    0,
    0.00,
    0.00,
    900.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    2,
    4002,
    '_yg49bz191-amaiojcvg',
    40,
    'Выберете сайт',
    '9-10 окт',
    '89035095827',
    'Ирина',
    'МО Пушкинский рн п Доровское д77',
    60700.00,
    'undefined',
    0.00,
    0,
    '2021-08-01',
    2021,
    1,
    0,
    0,
    1,
    1000.00,
    0.00,
    0.00,
    2500.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    3,
    4004,
    '_o87w7jc6k-m9pecukv9',
    40,
    'Выберете сайт',
    '9-10 окт',
    '8164328363',
    'Гузель',
    'Мытищи Октябрьский проспект д10а ',
    16000.00,
    'undefined',
    0.00,
    0,
    '2021-08-01',
    2021,
    1,
    0,
    0,
    0,
    500.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    4,
    4005,
    '_be54dr8vw-xvfy5w3bb',
    40,
    'мебельизсосны.рф',
    '13 окт',
    '89999993935',
    'ФИОо',
    'Москва Маросейка 101 кв16 3эт',
    0.00,
    'undefined',
    0.00,
    0,
    '2021-08-01',
    2021,
    0,
    1,
    0,
    0,
    0.00,
    2100.00,
    1500.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    5,
    4006,
    '_z586dbn1q-4931od8vg',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89152855082',
    'ФИОо',
    'Москва ул Магаданска д1 кв 31 ',
    22250.00,
    'undefined',
    0.00,
    0,
    '2021-08-01',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    6,
    4007,
    '_k5j9gw22c-chz6vicoy',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89057174361',
    'Алексей ',
    'Солнечногорск СНТ 50 лет победы 245',
    40640.00,
    'undefined',
    0.00,
    0,
    '2021-08-01',
    2021,
    1,
    0,
    0,
    0,
    2000.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    7,
    4008,
    '_c3y682cr8-y28g62hds',
    40,
    'Krovati-spalni.ru',
    '9-окт',
    '89153074087',
    'Сергей Максименко ',
    'Москва ул недорубова дом 30',
    40000.00,
    'undefined',
    0.00,
    0,
    '2021-08-01',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    8,
    4009,
    '_caopz8u7y-8fu15hh3c',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89264778356 89152625320',
    '-',
    'Москва ул Башиловская д28 п3 кв 235',
    17900.00,
    'undefined',
    0.00,
    0,
    '2021-08-01',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    9,
    4010,
    '_te6egicfc-tym0dkq96',
    40,
    'мебельизсосны.рф',
    '13 окт',
    '89055509664',
    'Ольга',
    'Пушкино мкр Клязьма ул андреевская 12 ',
    37960.00,
    'undefined',
    0.00,
    0,
    '2021-08-01',
    2021,
    1,
    1,
    1,
    0,
    2000.00,
    2000.00,
    1000.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    10,
    4011,
    '_4guf0b0db-78y1dh3c5',
    40,
    'мебельизсосны.рф',
    '9-10 окт ',
    '89255977633',
    '-',
    'Раменский рн д Ждановское дом 277',
    34800.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    1700.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    11,
    4012,
    '_0ca9ji387-r1szzd2iv',
    40,
    'мебельизсосны.рф',
    '13 октября',
    '89251881815',
    'Алексей',
    'Москва, ул.Нагатинская, д.3-а',
    18500.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    12,
    4013,
    '_oa89ujdpq-o0si31m40',
    40,
    'Krovati-spalni.ru',
    '9-10 окт',
    '89161249116',
    'Мила',
    'МО, Щелковский р-он, д. Супонево, ул Озерная, д. 54',
    14900.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    600.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    13,
    4014,
    '_gxn6f7ylq-akn0tipsh',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89035233744',
    'Ирина',
    'г.Москва, Расторгуевский пер-к, д.4-а, кв.3',
    30100.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    300.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    14,
    4016,
    '_sjvamn5p7-fuqw6d5jd',
    40,
    'Выберете сайт',
    '9-10 окт',
    '89037722778',
    'Екатерина',
    'Москва, Теплый стан, д. 9 корп 1, кв. 14',
    19740.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    15,
    4017,
    '_apk50d2zh-bg32s51ob',
    40,
    'мебельизсосны.рф',
    '9 октября',
    '89096552523',
    'Ольга',
    'МО, г.Мытищи, ул.Юбилейная, д.33, к.1, кв.21',
    17200.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    1,
    0,
    700.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    16,
    4018,
    '_ypf3o293v-fdkv9jfck',
    40,
    'Krovati-spalni.ru',
    '9-10 окт',
    '89915936040',
    '-',
    'Электросталь, проспект Ленина, д 8а',
    31070.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    17,
    4019,
    '_cz6e46w7w-9odbttbl4',
    40,
    'Выберете сайт',
    '9-10 окт',
    '89037658473',
    'Лариса',
    'МО Домодедовский рн СНТ Образцово 101',
    21300.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    1200.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    18,
    4020,
    '_h7n28i7b6-jgqj7flqa',
    40,
    'Выберете сайт',
    '9-10 окт',
    '89031093708',
    'Косинов Юрий',
    'Серпуховский рн ДНТ Лисенки ',
    15500.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    19,
    4021,
    '_03gqh2k9t-s2pn84ssh',
    40,
    'Krovati-spalni.ru',
    '9-10 окт',
    '89168485173',
    'Александра Константиновна',
    'МО, Балашиха, ул. Крупской, д. 11',
    17000.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    1,
    0,
    500.00,
    0.00,
    400.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    20,
    4023,
    '_obh65qzut-rz3jeszu8',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89104280712',
    'Максимова Екатерина',
    'г.Москва, ул.Генерала Тюленева, д.29, к.1, кв.195',
    3250.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    21,
    4022,
    '_frgbxwfm3-nd4i15tzb',
    40,
    'Liman-murom.ru',
    '9-10 окт',
    '89271576660',
    '-',
    'Видное д Петрушино 3 улица д118',
    41020.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    500.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    22,
    4025,
    '_25dh7pn6g-41g9zkg2i',
    40,
    'Krovati-spalni.ru',
    '9-10 окт',
    '89104318981',
    'Артём',
    'МО, Одинцовский г. о., село Немчиновка, СНТ Дружба, уч. 11',
    10400.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    500.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    23,
    4026,
    '_behe14m9e-kamdr12gt',
    40,
    'Выберете сайт',
    '13 окт',
    '89999033290',
    'Павел',
    'Жуковский ул чкалова 2 кв60',
    28340.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    600.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    24,
    4027,
    '_bevux7chw-xkeyz0c8a',
    40,
    'Krovati-spalni.ru',
    '9-10 окт',
    '89637707775',
    'Мария Котрелева',
    'МО, Раменский р-он, д Кратово, ул. Карла Маркса, д. 56',
    40810.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    1200.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    25,
    4028,
    '_z8oing1h2-85khhip9f',
    40,
    'Выберете сайт',
    '9-10 окт',
    '89037434173',
    '-',
    'Истринский рн д Рожново ул Прудовская д35',
    39340.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    1,
    0,
    1400.00,
    0.00,
    250.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    26,
    4024,
    '_i0zcoa3i3-rj0nueaes',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89161950220',
    'Ирина',
    'МО, Химки, ул.Молодежная 78, кв.979, п.6, эт.6',
    5400.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    1,
    0,
    0.00,
    0.00,
    300.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    27,
    4030,
    '_wxdwu941t-neq7t03t4',
    40,
    'Liman-murom.ru',
    '9-окт',
    '89153041298',
    'Александр Аниканов',
    'Москва ул Академика Волгина 31 ',
    45070.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    28,
    4032,
    '_69m5uaodd-j300zc98u',
    40,
    'Krovati-spalni.ru',
    '9-10 окт',
    '89165161806',
    '-',
    'Москва ул Новочеремушкинская д16 4 под',
    20900.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    29,
    4033,
    '_8z6ymavoz-b30xqoffz',
    40,
    'Krovati-spalni.ru',
    '9-окт',
    '89161421093',
    'Татьяна ',
    'г Звенигород ул Саввинская д5 кв 17 ',
    21900.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    1,
    0,
    1200.00,
    0.00,
    300.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    30,
    4035,
    '_24kqt878m-fviwad31j',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89167509173',
    '-',
    'мкр Железнодорожный ул Пионерская 12б ',
    16300.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    1,
    0,
    700.00,
    0.00,
    400.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    31,
    4037,
    '_mw7tdnvbb-st698eihr',
    40,
    'Krovati-spalni.ru',
    '9-10 окт',
    '89130183337',
    '-',
    'Дзержинский, ул. Академика Жукова, д. 38',
    19800.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    500.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    32,
    4038,
    '_evloskxb7-rmkylf4wf',
    40,
    'Liman-murom.ru',
    '9-10 окт',
    '89629209497',
    '-',
    'гХотьково днт Кудринские узоры 5 линия 72уч',
    143680.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    1,
    1,
    0,
    1860.00,
    9180.00,
    700.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    33,
    4039,
    '_9mf62ltmc-hgq2xx1gx',
    40,
    'Krovati-spalni.ru',
    '13 окт',
    '89055466012',
    '-',
    'Москва ул Трофимова дом 24 корп2 ',
    19000.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    1,
    0,
    0.00,
    0.00,
    450.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    34,
    4040,
    '_edi0ff8nz-gja26y6jm',
    40,
    'Выберете сайт',
    '9-10 окт',
    'Людмила Генадевна',
    '89037193966',
    'Ногинский рн днп Зимгородок уч 16 ',
    42000.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    500.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    35,
    4041,
    '_1lx3sj8m5-jcfujb6k4',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89265489409',
    '-',
    'МО, г.Люберцы, пр-т Победы, 11/2',
    22300.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    700.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    36,
    4042,
    '_ltvmgl3ey-45o13kfuh',
    40,
    'мебельизсосны.рф',
    '',
    '89167741184',
    'Кротова Елена',
    'Москва, ул.Левобережная, д.4, к.24, кв.127',
    15800.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    1,
    1,
    0,
    0.00,
    1000.00,
    400.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    37,
    4043,
    '_ifqkgkfke-00xilk7pp',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89263569978 89266598034',
    'Вера Ушакова ',
    'Красногорск Опалиха ул Чапаева 59',
    38300.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    900.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    38,
    4044,
    '_ju4itwlm2-lcpnu4bc0',
    40,
    'мебельизсосны.рф',
    '9-10 окт    ТЕРМИНАЛ',
    '89167198933',
    'Красильникова Татьяна Ивановна',
    'Москва, Рубцовская набережная, д.4, к.3, кв.93, эт.14 (код домоф.93)',
    15500.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    39,
    4045,
    '_v11z0elhq-8litsexib',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89269322292',
    'Синявкин Дмитрий',
    'Москва, ул.Планерная 16, к.4, п.5, домоф.93В',
    21900.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    0,
    0,
    0.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    40,
    4046,
    '_kigo9uuqi-te0i2x8tq',
    40,
    'Liman-murom.ru',
    '9-10 окт',
    '89161612747',
    '-',
    'Москва, ул. Чечулина, д. 4, кв. 272, 8 под., 6 эт.',
    53170.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    1,
    0,
    0.00,
    0.00,
    2700.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    41,
    4047,
    '_2wgds3pkv-ilyuc9595',
    40,
    'Выберете сайт',
    '9-10 окт',
    '89154606475',
    'Игорь Юрьевич ',
    'Балашиха мкр салтыковка ул Лесной поселок',
    22800.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    700.00,
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    42,
    4048,
    '_xzdigkn9r-t48b28i8z',
    40,
    'Выберете сайт',
    '9-окт',
    '89503518266',
    'Юлия',
    'Щелково 1й советский переулок д16 кв99',
    26000.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    1,
    0,
    1500.00,
    0.00,
    400.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    43,
    4049,
    '_eh1ossvgk-332o0bw9i',
    40,
    'мебельизсосны.рф',
    '9-10 окт',
    '89168844929',
    '-',
    'Москва ул Широка д3 корп 4 п4',
    8300.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    1,
    0,
    0.00,
    0.00,
    300.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    44,
    4050,
    '_m5lipknik-ok7bldy9l',
    40,
    'Выберете сайт',
    '9-окт',
    '89859501086',
    '-',
    'Москва ул Абрамцевская дом 8а',
    10300.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    1,
    0,
    0.00,
    0.00,
    300.00,
    0.00
  );
INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
    `hash`,
    `week`,
    `site_name`,
    `date_order`,
    `client_phone`,
    `client_name`,
    `client_address`,
    `price`,
    `status`,
    `paid`,
    `deliver_back`,
    `date_created`,
    `year`,
    `delivery`,
    `assembly`,
    `entering`,
    `assemblyAndEntering`,
    `delivery_price`,
    `assembly_price`,
    `entering_price`,
    `assemblyAndEntering_price`
  )
VALUES
  (
    45,
    4051,
    '_mduudo2oc-adsk66s63',
    40,
    'Liman-murom.ru',
    '9-10 окт',
    '89165000164',
    '-',
    'Солнечногорский рн д Сырково снт шмель д35',
    204124.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    1,
    1,
    0,
    2500.00,
    5000.00,
    2000.00,
    0.00
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: materials
# ------------------------------------------------------------

INSERT INTO
  `materials` (`id`, `material`)
VALUES
  (1, 'сосна ');
INSERT INTO
  `materials` (`id`, `material`)
VALUES
  (2, 'берёза ');
INSERT INTO
  `materials` (`id`, `material`)
VALUES
  (3, 'бук');
INSERT INTO
  `materials` (`id`, `material`)
VALUES
  (4, 'дуб ');
INSERT INTO
  `materials` (`id`, `material`)
VALUES
  (5, 'ясень');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: production_order
# ------------------------------------------------------------

INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    1,
    4001,
    '_cb5q4tvoj-2fpei29vl',
    'ручки дерево',
    15,
    40,
    'undefined',
    'undefined',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    2,
    4001,
    '_fv1hckqxd-3tk9kpvi4',
    'буфет из дерева №5',
    1,
    40,
    'сосна ',
    'венге-3',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    3,
    4001,
    '_07ntokm7k-vkivvwk4c',
    'шкаф для дачи витязь 109',
    1,
    40,
    'сосна ',
    'венге-3',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    4,
    4002,
    '_mk09k3tnm-1a1eo9i3c',
    'стол письменный Верди 119',
    1,
    40,
    'сосна ',
    'Итальянский-орех',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    5,
    4002,
    '_prtxv0jtb-c2vp9evp1',
    'буфет верди 111',
    1,
    40,
    'сосна ',
    'Итальянский-орех',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    6,
    4004,
    '_zi0r2wjzq-o0bzdk1m6',
    'буфет 10.1',
    1,
    40,
    'сосна ',
    'венге-2',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    7,
    4004,
    '_zd9xpvy5o-z2ltx39xe',
    'ручки  дерево',
    4,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    8,
    4005,
    '_c8t4qi7sm-fbbc14g8c',
    'прихожая пм 112 кожа №4',
    1,
    40,
    'дуб ',
    'белый',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    9,
    4006,
    '_wtelped5v-qfnyjb5rv',
    'шкаф 2 витязь 126 ',
    1,
    40,
    'сосна ',
    'лак ',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    10,
    4006,
    '_jmr38zwgl-huh1s73ri',
    'ручки скоба золото',
    6,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    11,
    4006,
    '_bzqaeb6si-fy1ld8l19',
    'образцы к1 к2 м1 м2 пепел1 в1',
    1,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    12,
    4007,
    '_lacn8xh9u-rkxjt0ggo',
    'тумба веста 4 ',
    1,
    40,
    'сосна ',
    'без покраски',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    13,
    4007,
    '_fuzwo5ifk-dhvxm9n1d',
    'кровать дана 2 90*190',
    1,
    40,
    'сосна ',
    'без покраски',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    14,
    4007,
    '_7btb8usqk-rp90g1xy0',
    '2 малых ящика ',
    2,
    40,
    '-',
    'без покраски',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    15,
    4007,
    '_au3br9r91-xhbablivc',
    'матрас кокос 90*190',
    1,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    16,
    4007,
    '_6vf4ryqru-f9rncmoge',
    'шкаф для дачи витязь 104',
    1,
    40,
    'сосна ',
    'без покраски',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    17,
    4007,
    '_nbv5um6uc-4g6dpbpoq',
    'ручки дерево',
    4,
    40,
    'сосна ',
    'без покраски',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    18,
    4008,
    '_pd5v7it1q-r0uojtvvo',
    'матрас элит н 120х200',
    1,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    19,
    4008,
    '_ovt1s30y7-euk97dxdb',
    'кровать дана 2',
    1,
    40,
    'сосна ',
    'к-2',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    20,
    4008,
    '_ff99krg8z-aywi3jx00',
    'шкаф стеллаж кантри 49 ',
    1,
    40,
    'сосна ',
    'к-2',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    21,
    4009,
    '_7vhxvbdry-r83tt2cmf',
    'шкаф 1 витязь 129 ',
    1,
    40,
    'сосна ',
    'могано-3',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    22,
    4009,
    '_2zm6hdyj7-pstr648d5',
    'ручка дерево ',
    5,
    40,
    '-',
    'могано-3',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    23,
    4010,
    '_bd5wjwlm2-26bcs8b9c',
    'шкаф верди 1070',
    1,
    40,
    'сосна ',
    'слоновая кость',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    24,
    4010,
    '_jydq2skei-eaoybgdea',
    'тумба верди 320 ',
    1,
    40,
    'сосна ',
    'слоновая кость',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    25,
    4010,
    '_z263k8nzx-lqni13xln',
    'ручка дерево ',
    7,
    40,
    'сосна ',
    'слоновая кость',
    2021,
    'В работе',
    '2021-08-01',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    26,
    4011,
    '_bljhmpdkw-c30xbvw50',
    'стол журнальный кантри 30',
    1,
    40,
    'сосна ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    27,
    4011,
    '_jridxzna1-ru53vqidx',
    'обувница 101 ',
    1,
    40,
    'сосна ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    28,
    4011,
    '_1lpelntpj-gzhy6qrwi',
    'обувница 121 ',
    1,
    40,
    'сосна ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    29,
    4011,
    '_m1dqam7zf-ggxh0klxr',
    'ручки дерево',
    14,
    40,
    'сосна ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    30,
    4012,
    '_e8yocdfet-op8yg5cl7',
    'Комод Витязь кд-163',
    1,
    40,
    'сосна ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    31,
    4012,
    '_m5sjtpa27-zr2i3sppa',
    'Ручки дерево',
    10,
    40,
    'сосна ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    32,
    4013,
    '_1xcqorkpg-nnhywz4hm',
    'Ручка ск бронза',
    0,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    33,
    4013,
    '_e30g2d5om-i0qpy01rd',
    'тумба мальта 2',
    2,
    40,
    'сосна ',
    'венге-2',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    1
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    34,
    4013,
    '_44s02fm37-38k8afqs0',
    'тумба кт 110',
    1,
    40,
    'сосна ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    1
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    35,
    4014,
    '_e6qvn39tf-pa3vuov01',
    'Стол письменный Паола-1 (тумба справа)',
    1,
    40,
    'сосна ',
    'венге-2',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    36,
    4014,
    '_vh9kqff3n-rlcw5fwpt',
    'Ручки скоба шампань',
    6,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    37,
    4016,
    '_10hioiceq-v44igadwa',
    'Комод Витязь КД-114',
    1,
    40,
    'сосна ',
    'браширование белый +серебро',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    38,
    4016,
    '_1pj9ijiw4-4af631isz',
    'Ручки дерево',
    0,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    39,
    4016,
    '_ux7qrwvg2-3pgfunxsl',
    '',
    0,
    40,
    'undefined',
    'undefined',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    40,
    4016,
    '_f9ro5be06-0e5frxa66',
    '',
    0,
    40,
    'undefined',
    'undefined',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    41,
    4017,
    '_7ased1nbf-lv7s3ahel',
    'Комод Витязь Кд-127 (в РАЗБОРЕ !!!)',
    1,
    40,
    'сосна ',
    'без покраски',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    42,
    4017,
    '_sy6o9rd6u-y7s6ntkxg',
    'Ручки дерево',
    6,
    40,
    'сосна ',
    'без покраски',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    43,
    4018,
    '_rpldoo27o-m8kwo9qod',
    'Комод Приано 4',
    1,
    40,
    'сосна ',
    'слоновая кость',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    44,
    4018,
    '_wfdmxsx2i-2txrhngnd',
    'Тумба Приано 1',
    1,
    40,
    'сосна ',
    'слоновая кость',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    45,
    4018,
    '_ebhotrcws-4fwu18ecj',
    'Ручка ск бронза',
    0,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    46,
    4019,
    '_npad1360i-ad2vz78uw',
    'тумба тв по эскизу ',
    1,
    40,
    'берёза ',
    'венге-2',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    47,
    4019,
    '_dri3shmav-epw4ly1hw',
    'ручка скоба шампань ',
    2,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    48,
    4020,
    '_e860kd608-eexpuo6z9',
    'комод Витязь кд 113 ',
    1,
    40,
    'сосна ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    49,
    4020,
    '_z79u7d92g-ypkl7u0d2',
    'ручка скоба бронза ',
    1,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    50,
    4021,
    '_0fkrq0bg4-vzehgvbf4',
    'Комод Витязь КД-127',
    1,
    40,
    'сосна ',
    'без покраски',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    51,
    4021,
    '_2839np2p5-vxesqlryi',
    'Ручки дерево',
    0,
    40,
    '-',
    'без покраски',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    52,
    4023,
    '_fadpig6eo-gwhcssq6b',
    'Тумба 2 Икея',
    1,
    40,
    'сосна ',
    'мореный-2',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    53,
    4022,
    '_g2l99qqxi-dzyge43qk',
    'тумба милан  540 ',
    1,
    40,
    'сосна ',
    'образец',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    54,
    4022,
    '_f9wyq41aw-y212pxkgt',
    'ручка №16 ',
    2,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    55,
    4025,
    '_e1ielvprd-5k7g48crz',
    'Комод ЛФ-200',
    1,
    40,
    'сосна ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    56,
    4026,
    '_by2j5v8ek-s0azo5y4v',
    'стол письменный двухтумбовый №3 ',
    1,
    40,
    'сосна ',
    'белое старение ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    57,
    4026,
    '_jsszcnrog-9lzz63j01',
    'ручка скоба бронза ',
    5,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    58,
    4027,
    '_4mqinc35k-p9w8pvbzs',
    'Комод Икея',
    1,
    40,
    'берёза ',
    'венге-1',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    59,
    4027,
    '_fadtpmlus-v9vzcdzfe',
    'Комод Икея',
    1,
    40,
    'берёза ',
    'венге-3',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    60,
    4027,
    '_0tjwc9zzv-2y9xwpv0i',
    'Кровать Весна 85*195',
    1,
    40,
    'берёза ',
    'к-2',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    61,
    4028,
    '_jpb82zxpv-czmmbteby',
    'стол письменный пс 43',
    1,
    40,
    'сосна ',
    'образец',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    62,
    4028,
    '_3mpptr00z-ek38ax9k1',
    'ручка №38',
    2,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    63,
    4029,
    '_l1h0nsy3t-npzc1j86l',
    'Шкаф Верди 110 по эскизу',
    1,
    40,
    'сосна ',
    'RAL',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    64,
    4029,
    '_c8osneodo-s7tn3ms4p',
    'Кровать Верди тахта по эскизу',
    1,
    40,
    'сосна ',
    'RAL',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    65,
    4029,
    '_5wsx037ol-gowwhlbt3',
    'Тумба Верди 320 (по эскизу)',
    1,
    40,
    'сосна ',
    'RAL',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    66,
    4029,
    '_ski9x0rhu-hacy2r85j',
    'Ручка № 12',
    6,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    67,
    4024,
    '_gyam4qt11-1fwu7wy8a',
    'Тумба Приано-2',
    1,
    40,
    'сосна ',
    'мореный-2',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    68,
    4024,
    '_b83bonoc0-4zofdzav8',
    'Ручка ск золото',
    2,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    69,
    4024,
    '_td36bmn72-ldvxg6r7v',
    'Штанга железная (к з-зу №3361)',
    1,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    70,
    4030,
    '_ip72zjwac-7lobge1sk',
    'стол письменный однотумбовый №4 ',
    1,
    40,
    'сосна ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    71,
    4030,
    '_3yj7hckfk-djq9zj081',
    'ручка №47 ',
    1,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    72,
    4030,
    '_pgd416qy1-qd7uzh6vd',
    'кровать кантри 107 90х190 ',
    1,
    40,
    'берёза ',
    'слоновая кость',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    73,
    4030,
    '_rl07nvaco-eccvlfu34',
    'орт ламели ',
    1,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    74,
    4030,
    '_3l98ok42n-gny9z4fl5',
    'образцы на березе Венги2 Гр орех ',
    1,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    75,
    4032,
    '_rmje8dcwr-1plfhxg1i',
    'стол письменный однотумбовый №2 ',
    1,
    40,
    'сосна ',
    'к-2',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    76,
    4032,
    '_y9ykk7v4v-6ubkm7knt',
    'матрас 80х200 идеал ',
    1,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    77,
    4031,
    '_il6n8kqmn-qdnlypt8l',
    'Шкаф Верди 110 (по эскизу)',
    1,
    40,
    'сосна ',
    'образец',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    78,
    4031,
    '_k5zoc8fpe-za7wvl37x',
    'Кровать Верди тахта 120*200 (по эскизу)',
    1,
    40,
    'сосна ',
    'образец',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    79,
    4031,
    '_7gqtokz5g-bu2wqi34w',
    'Тумба Верди 320 ( по эскизу)',
    1,
    40,
    '-',
    'образец',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    80,
    4031,
    '_xc82wtjy1-6bdivmljr',
    'Ручка № 12',
    6,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    81,
    4033,
    '_lx16c22z5-vjgl6d8ow',
    'стол обеденный №12 ',
    1,
    40,
    'сосна ',
    'без покраски',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    82,
    4034,
    '_2dfu9mp0u-wd3wt3aeq',
    'Шкаф Верди 110 (по эскизу)',
    1,
    40,
    'сосна ',
    'образец',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    83,
    4034,
    '_5ua4jqym4-d60i6z9vm',
    'Кровать Верди тахта 120*200 (по эскизу)',
    1,
    40,
    'сосна ',
    'образец',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    84,
    4034,
    '_fn1z95yfa-rf9837n95',
    'Тумба Верди 320 (по эскизу)',
    1,
    40,
    'сосна ',
    'образец',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    85,
    4034,
    '_ai8onz9mf-4ptpkikf3',
    'Ручка № 12',
    6,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    86,
    4035,
    '_6sd9nupo2-eq45ps8hg',
    'стол письменый резной 3 ',
    1,
    40,
    'сосна ',
    'кофе12',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    87,
    4035,
    '_af3qwxytu-anho1i2jc',
    'ручка дерево',
    3,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    88,
    4036,
    '_4cb4zwxju-qs5gu7w0c',
    'Шкаф Верди 110 по эскизу',
    1,
    40,
    'сосна ',
    'RAL',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    89,
    4036,
    '_gmdftrqi4-ir7nmyln9',
    'Кровать Верди тахта 120*200 по эскизу',
    1,
    40,
    'сосна ',
    'RAL',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    90,
    4036,
    '_uvd558ydh-bve34z68u',
    'Тумба Верди 320 по эскизу',
    1,
    40,
    'сосна ',
    'RAL',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    91,
    4036,
    '_w4lnx6le6-qf3d8zjpl',
    'Ручка № 12',
    6,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    92,
    4037,
    '_t5mnuiqkn-zoikqb365',
    'Стол письменный Верди 119',
    1,
    40,
    'сосна ',
    'к2+тон',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    93,
    4037,
    '_chycskuer-91hmyg2do',
    'Ручка ск бронза',
    0,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    94,
    4038,
    '_wycxla747-fve8hywms',
    'кровать верди тахта по эскизу 120х200',
    1,
    40,
    'сосна ',
    'образец',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    95,
    4038,
    '_xxrkz32x3-cnx1ssmvl',
    'тумба верди 320 ',
    1,
    40,
    'сосна ',
    'образец',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    96,
    4038,
    '_v3l3tnfnv-fsol1x367',
    'шкаф верди 110 ',
    1,
    40,
    'сосна ',
    'образец',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    97,
    4038,
    '_kw7aczq69-oln7fh39j',
    'ручки №12',
    6,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    98,
    4039,
    '_7rq4ht93s-eu6r2bhki',
    'стол письменный №7 ',
    1,
    40,
    'сосна ',
    'Итальянский-орех',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    99,
    4039,
    '_ugxlx9gt2-bvkxl4yvc',
    'ручка скоба бронза ',
    5,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    100,
    4040,
    '_qptigebsz-ftjp2fp24',
    'комод кд 132',
    1,
    40,
    '-',
    'пепел 2',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    101,
    4040,
    '_2ue18hp78-k6i8c75fp',
    'тумба филенка 2 ящика ниша ',
    3,
    40,
    'сосна ',
    'пепел 2',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    102,
    4040,
    '_frtylmc41-u2ysu3or8',
    'шкаф для дачи витязь 102 ',
    1,
    40,
    'берёза ',
    'пепел 2',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    103,
    4040,
    '_jcc133icc-55tbayi5q',
    'ручки дерево',
    10,
    40,
    '-',
    'пепел 2',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    104,
    4041,
    '_32ds2fs42-1uijqo67z',
    'Комод Верди 190',
    1,
    40,
    'сосна ',
    'образец',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    105,
    4041,
    '_5c45o290s-5l46sf84o',
    'Ручка ск бронза',
    6,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    106,
    4042,
    '_x6u1lulu4-3mfcmnu6j',
    'Антресоль трехстворчатая с багетом',
    1,
    40,
    'сосна ',
    'Грецкий-орех',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    107,
    4042,
    '_m790kgop0-pp8b9xs0c',
    'Ручка ск бронза',
    3,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    108,
    4042,
    '_gta6142n9-p99az8bhv',
    'Банкетка №6 (обивка №73)',
    1,
    40,
    'сосна ',
    'Грецкий-орех',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    109,
    4043,
    '_ki1k8f0zh-v2gz5tqzy',
    'шкаф приано 3.1 ',
    1,
    40,
    'сосна ',
    'венге-1',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    110,
    4043,
    '_n7jdiend9-yiinxmvqo',
    'стол письменный 1тумб №4 ',
    1,
    40,
    'сосна ',
    'венге-1',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    111,
    4044,
    '_xpqqcq1z0-dz7pl0sdy',
    'Комод Витязь Кд-138',
    1,
    40,
    'сосна ',
    'мореный-2',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    112,
    4044,
    '_3rgix6p69-4pj92zv40',
    'Ручки дерево',
    6,
    40,
    'сосна ',
    'мореный-2',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    113,
    4045,
    '_y0vqnnq4r-z03dcsntx',
    'Кухонный модуль 1,13',
    3,
    40,
    'сосна ',
    'пепел 1',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    114,
    4045,
    '_5hcr45z5w-ijpoot6n9',
    'Ручка №2',
    3,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    115,
    4046,
    '_78kquthj0-cp2tjjlto',
    'Комод Верди 210 (8 ящиков)',
    1,
    40,
    'сосна ',
    'слоновая кость',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    116,
    4046,
    '_dc44n2odv-3u1a71do5',
    'Комод Верди 250',
    1,
    40,
    'сосна ',
    'слоновая кость',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    117,
    4046,
    '_m17h82a99-9860hqzw0',
    'Зеркало Верди Люкс',
    1,
    40,
    'сосна ',
    'слоновая кость',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    118,
    4046,
    '_uwg0hwig0-picgt5hux',
    'Ручка ск бронза',
    0,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    119,
    4047,
    '_egz3wzw01-uyzi97qw8',
    'шкаф верди 1080',
    1,
    40,
    'сосна ',
    'венге-1',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    120,
    4047,
    '_y7fmohbjh-2vp5mj77n',
    'ручки скоба бронза ',
    4,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    121,
    4048,
    '_stvsak5pz-az84kliwu',
    'стол письменный 1тумб Валенсия ',
    1,
    40,
    'сосна ',
    'белый',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    122,
    4048,
    '_y0nnt0q1s-ay3yvd6zn',
    'ручки скоба золото',
    6,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    123,
    4049,
    '_7x8de36r9-lcplzqxjz',
    'кровать бэлли 80х200 ',
    1,
    40,
    'сосна ',
    'мореный-2',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    124,
    4050,
    '_lc9lq543z-5gzdk5hus',
    'матрас 160х200 Люкс Н ',
    1,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    125,
    4051,
    '_oajunh6t2-l8gwjama8',
    'шкаф паола 210 ',
    1,
    40,
    'берёза ',
    'Итальянский-орех',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    126,
    4051,
    '_68uh2zlr0-ne7piefav',
    'элбург 350 комод',
    1,
    40,
    'берёза ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    127,
    4051,
    '_mokems9bq-bprbd2164',
    'элбург 300 комод ',
    1,
    40,
    'берёза ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    128,
    4051,
    '_58r19r1le-nwpspeofn',
    'комод гармония 5 ',
    1,
    40,
    'берёза ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    129,
    4051,
    '_wh5o9ugcx-5grd3c83a',
    'обувница кантри ',
    1,
    40,
    'берёза ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    130,
    4051,
    '_eo1rlg8ye-runnbh4bg',
    'стол обеденный №12',
    1,
    40,
    'берёза ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    131,
    4051,
    '_cwqviwh8v-l31oxdbzv',
    'стул береза №10 обивка 74',
    4,
    40,
    'берёза ',
    'лак ',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    132,
    4051,
    '_pxgsytmpk-xk3jgpjhf',
    'ручки №15 ',
    10,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    133,
    4051,
    '_co0js3ht3-ht5gjpi7e',
    'ручка №16',
    6,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );
INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
    `hash`,
    `name`,
    `count`,
    `week`,
    `material`,
    `color`,
    `year`,
    `status`,
    `date_created`,
    `description`,
    `id_added_user`
  )
VALUES
  (
    134,
    4051,
    '_sjdujke15-dbjtk0vwh',
    'ручка №23',
    8,
    40,
    '-',
    '-',
    2021,
    'В работе',
    '2021-08-02',
    'undefined',
    2
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: users
# ------------------------------------------------------------

INSERT INTO
  `users` (
    `id`,
    `jwt`,
    `login`,
    `name`,
    `date_created`,
    `role`,
    `description`,
    `active`
  )
VALUES
  (
    1,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6InJvb3QiLCJwYXNzd29yZCI6Im1TUjgybndWIiwiaWF0IjoxNjMyNjUxNjUyfQ.SO9pLA3nvWuSvilHnNPeZfKha5UoDEiTNKxZMlu-A9c',
    'root',
    'Администратор',
    '2021-09-26',
    0,
    'undefined',
    1
  );
INSERT INTO
  `users` (
    `id`,
    `jwt`,
    `login`,
    `name`,
    `date_created`,
    `role`,
    `description`,
    `active`
  )
VALUES
  (
    2,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6IklyZW4iLCJwYXNzd29yZCI6IjI2MzU0NDg5IiwiaWF0IjoxNjMyODE0ODM5fQ.MEko6RcpGphse3XW3vKzMQD8XWiRDRLTmosf9xJRkVU',
    'Iren',
    'Ирина',
    '2021-09-28',
    0,
    'undefined',
    1
  );
INSERT INTO
  `users` (
    `id`,
    `jwt`,
    `login`,
    `name`,
    `date_created`,
    `role`,
    `description`,
    `active`
  )
VALUES
  (
    3,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6IkVkaWsiLCJwYXNzd29yZCI6IjI1Mjk3ODIxIiwiaWF0IjoxNjMyODE1MDIwfQ.Vxf6zwu-hzaJgzsV57JFIvybB0lD6jSZPkTqq7aHbQ0',
    'Edik',
    'Эдуард',
    '2021-09-28',
    0,
    'undefined',
    1
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
