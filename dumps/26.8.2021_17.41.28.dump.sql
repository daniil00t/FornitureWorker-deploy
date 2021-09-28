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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: forming_number_order
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `forming_number_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `week` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: fillfulment_control_order
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: forming_number_order
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: invoice_orders
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: invoices
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: materials
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: production_order
# ------------------------------------------------------------


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
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6InJvb3QiLCJwYXNzd29yZCI6Im1TUjgybndWIiwiaWF0IjoxNjMyNjQ5OTY2fQ.lZGB951WkQCxKpCMeC8Xxo6PbnLHGDnJKbGqz76OAB0',
    'root',
    'sflksdf',
    '2021-08-00',
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
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6ImFkbWluIiwicGFzc3dvcmQiOiJyb290MTIzNCIsImlhdCI6MTYzMjY1MDk5Mn0.bIt4k57eBq-GczN99JeIA2olxfCDWvZjS32G-z48tdY',
    'admin',
    'jsflksjfdf',
    '2021-09-26',
    1,
    'undefined',
    0
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
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6InJvb3QxIiwicGFzc3dvcmQiOiJtU1I4Mm53ViIsImlhdCI6MTYzMjY1MTE2NX0.bHV3xslWwJtscDDq1_ZpNQKPLfmnFZvEVm69a7GAypM',
    'root1',
    'adasdasd',
    '2021-09-26',
    1,
    'undefined',
    0
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
