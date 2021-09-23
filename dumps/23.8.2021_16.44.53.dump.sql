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
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
  `debt` float(10, 2) DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: forming_number_order
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `forming_number_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `week` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: materials
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `materials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `material` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: colors
# ------------------------------------------------------------

INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (1, 'Венге');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (2, 'Лак-1');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (3, 'Лак-2');
INSERT INTO
  `colors` (`id`, `color`)
VALUES
  (4, 'Лак-3');

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
    100,
    '_woilkv0qy-ouef4ynqy',
    1,
    'Krovati-spalni.ru',
    'Завтра пж',
    '9 843 234 13 12',
    'Иванов ИИ',
    'Москва',
    12000.00,
    'В работе',
    0.00,
    0.00,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    1,
    100.00,
    0.00,
    0.00,
    1000.00
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
    101,
    '_u7fmjwexh-c7tf9cpgv',
    1,
    'Liman-murom.ru',
    'завтра пж',
    '8 294 344 14 45',
    'Абоба или нет',
    'Москва или нет',
    13444.00,
    'В работе',
    0.00,
    0.00,
    '2021-08-02',
    2021,
    0,
    0,
    0,
    1,
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
    3,
    3900,
    '_sjr7jb043-ikk04vfzf',
    39,
    'Krovati-spalni.ru',
    '1 ноября',
    '8 920 754 48 41',
    'Иванов Иван Андреевич',
    'Москва, ул. Садовников, 23',
    38000.00,
    'В работе',
    0.00,
    0.00,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    1,
    0.00,
    0.00,
    0.00,
    1200.00
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
    102,
    '_ql03yf1bt-v9neszx5b',
    1,
    'Liman-murom.ru',
    'завьра',
    '8 293 2394 249',
    'Новый клиент',
    'вадлоывдалофдвла',
    8001.00,
    'В работе',
    0.00,
    0.00,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    1000.00,
    0.00,
    0.00,
    0.00
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: forming_number_order
# ------------------------------------------------------------

INSERT INTO
  `forming_number_order` (`id`, `week`, `count`, `year`)
VALUES
  (1, 1, 2, 2021);
INSERT INTO
  `forming_number_order` (`id`, `week`, `count`, `year`)
VALUES
  (2, 39, 0, 2021);

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
    101,
    2,
    '_lssjk24xx-bx7xyiomo',
    'стул #',
    34,
    1,
    '-',
    'Лак-1',
    13444.00,
    457096.00
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
    3900,
    3,
    '_uxl6fcbc5-8s1w20htk',
    'Тумба №234',
    1,
    39,
    'Береза',
    'Венге',
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
    3,
    3900,
    3,
    '_uxl6fcbc5-8s1w20htk',
    'Стол на трех ножках',
    1,
    39,
    'Сосна',
    'Венге',
    130000.00,
    130000.00
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
    102,
    4,
    '_or6s0exd4-fhyb8au9u',
    'Стул',
    2,
    1,
    'Береза',
    'Лак-1',
    1000.00,
    2000.00
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
    102,
    4,
    '_or6s0exd4-fhyb8au9u',
    'Стол',
    3,
    1,
    'Сосна',
    'Лак-1',
    2000.00,
    6000.00
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
    100,
    '_woilkv0qy-ouef4ynqy',
    1,
    'Krovati-spalni.ru',
    'Завтра пж',
    '9 843 234 13 12',
    'Иванов ИИ',
    'Москва',
    12000.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    1,
    100.00,
    0.00,
    0.00,
    1000.00
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
    101,
    '_u7fmjwexh-c7tf9cpgv',
    1,
    'Liman-murom.ru',
    'завтра пж',
    '8 294 344 14 45',
    'Абоба или нет',
    'Москва или нет',
    13444.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    0,
    1,
    0.00,
    0.00,
    0.00,
    1000.00
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
    3900,
    '_sjr7jb043-ikk04vfzf',
    39,
    'Krovati-spalni.ru',
    '1 ноября',
    '8 920 754 48 41',
    'Иванов Иван Андреевич',
    'Москва, ул. Садовников, 23',
    38000.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    0,
    0,
    0,
    1,
    0.00,
    0.00,
    0.00,
    1200.00
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
    102,
    '_ql03yf1bt-v9neszx5b',
    1,
    'Liman-murom.ru',
    'завьра',
    '8 293 2394 249',
    'Новый клиент',
    'вадлоывдалофдвла',
    8001.00,
    'undefined',
    0.00,
    0,
    '2021-08-02',
    2021,
    1,
    0,
    0,
    0,
    1000.00,
    0.00,
    0.00,
    0.00
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: materials
# ------------------------------------------------------------

INSERT INTO
  `materials` (`id`, `material`)
VALUES
  (1, 'Береза');
INSERT INTO
  `materials` (`id`, `material`)
VALUES
  (2, 'Сосна');
INSERT INTO
  `materials` (`id`, `material`)
VALUES
  (3, 'Клен');
INSERT INTO
  `materials` (`id`, `material`)
VALUES
  (4, 'Еще сосна ');

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
    100,
    '_axubgtopw-jv08asf3d',
    'Стул с ножками 1',
    1,
    1,
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
    2,
    101,
    '_lssjk24xx-bx7xyiomo',
    'стул #',
    34,
    1,
    '-',
    'Лак-1',
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
    3,
    3900,
    '_uxl6fcbc5-8s1w20htk',
    'Тумба №234',
    1,
    39,
    'Сосна',
    'Венге',
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
    4,
    3900,
    '_uxl6fcbc5-8s1w20htk',
    'Стол на трех ножках',
    1,
    39,
    'Сосна',
    'Венге',
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
    5,
    102,
    '_or6s0exd4-fhyb8au9u',
    'Стул',
    2,
    1,
    'Береза',
    'Лак-1',
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
    6,
    102,
    '_or6s0exd4-fhyb8au9u',
    'Стол',
    3,
    1,
    'Сосна',
    'Лак-1',
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
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6ImFkbWluIiwicGFzc3dvcmQiOiJhZG1pbjEyMzQiLCJpYXQiOjE2MzIyMjkxNTJ9.1_52yiwdpuC9BSKKvznqRzAbEU5Nd80B0wx2RfHwraA',
    'admin',
    'Данилутик ',
    '2021-08-02',
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
