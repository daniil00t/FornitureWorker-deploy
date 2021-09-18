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
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: fillfulment_control_order
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `fillfulment_control_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_fc` int NOT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
  `name` varchar(255) DEFAULT NULL,
  `count` int NOT NULL,
  `week` int NOT NULL,
  `material` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `price` float(10, 2) DEFAULT NULL,
  `allPrice` float(10, 2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: invoices
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_fc` int NOT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: materials
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `materials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `material` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: production_order
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `production_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_fc` int NOT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
  (1, 'лак1234');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: fillfulment_control_order
# ------------------------------------------------------------

INSERT INTO
  `fillfulment_control_order` (
    `id`,
    `id_fc`,
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
    1,
    'Krovati-spalni.ru',
    'завтра пж',
    '9 8234 203492384',
    'Абоба!!!',
    'Москва',
    2333.00,
    'В работе',
    0.00,
    0.00,
    '2021-08-06',
    2021,
    1,
    0,
    0,
    1,
    0.00,
    0.00,
    0.00,
    3443.00
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: forming_number_order
# ------------------------------------------------------------

INSERT INTO
  `forming_number_order` (`id`, `week`, `count`, `year`)
VALUES
  (1, 1, 0, 2021);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: invoice_orders
# ------------------------------------------------------------

INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
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
    100,
    1,
    'стул лол',
    1,
    1,
    'Береза',
    'Венге-1',
    2333.00,
    2333.00
  );
INSERT INTO
  `invoice_orders` (
    `id`,
    `id_fc`,
    `id_iv`,
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
    100,
    1,
    'привет!',
    23,
    1,
    'Береза',
    'Венге-1',
    233.00,
    5359.00
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: invoices
# ------------------------------------------------------------

INSERT INTO
  `invoices` (
    `id`,
    `id_fc`,
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
    1,
    'Krovati-spalni.ru',
    'завтра пж',
    '9 8234 203492384',
    'Абоба!!!',
    'Москва',
    2333.00,
    'undefined',
    0.00,
    0,
    '2021-08-06',
    2021,
    1,
    0,
    0,
    1,
    0.00,
    0.00,
    0.00,
    3443.00
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: materials
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: production_order
# ------------------------------------------------------------

INSERT INTO
  `production_order` (
    `id`,
    `id_fc`,
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
    'стул лол',
    1,
    1,
    'Береза',
    'Венге-1',
    2021,
    'В работе',
    '2021-08-06',
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
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6ImFkbWluIiwicGFzc3dvcmQiOiJhZG1pbiIsImlhdCI6MTYzMTk4MDM4NX0.a6-tBF7UN0qq7jRV-BytSzgglb4Ws1_GLCa-SpVAfcM',
    'admin',
    'Данилутик',
    '2021-08-06',
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
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6InJvb3QiLCJwYXNzd29yZCI6InJvb3QiLCJpYXQiOjE2MzE5ODEwNDF9.-LUwWb1o73bGto1uBM7BqDFHrIS__bDMOQtJsV675t8',
    'root',
    'Root',
    '2021-08-06',
    1,
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
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6ImFkZCIsInBhc3N3b3JkIjoiYWRkIiwiaWF0IjoxNjMxOTg5MDc0fQ.XmeIOx8r6715USE2cYlcZs4r0v_g4yGlCXNlodhsPVI',
    'add',
    'sfdsadf saf ',
    '2021-08-06',
    1,
    'undefined',
    1
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
