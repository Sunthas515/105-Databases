-- Task 1

-- Structure for 'Supplier_Database
CREATE DATABASE  IF NOT EXISTS `Supplier_Database` /*!40100 DEFAULT CHARACTER SET utf8 */; 
USE `Supplier_Database`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Table structure for 'supplier' table

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
	`supplierNr` int(11) NOT NULL DEFAULT '0',
	`supplierName` varchar(255) NOT NULL,
    `countryLocation` varchar(255) NOT NULL,
    `[faxNr]` varchar(255),
    PRIMARY KEY (`supplierNr`),
    KEY `[faxNr]` (`[faxNr]`),
    KEY `supplierName` (`supplierName`),
    CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`supplierNr`) REFERENCES `supply` (`supplierNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for 'supply' table

DROP TABLE IF EXISTS `supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supply` (
	`supplierNr` int(11) NOT NULL DEFAULT '0',
    `itemNr` int(11) NOT NULL DEFAULT '0',
    `quantity` int(11) NOT NULL,
    PRIMARY KEY (`supplierNr`, `itemNr`),
    KEY `supplierNr` (`supplierNr`),
    KEY `itemNr` (`itemNr`),
    CONSTRAINT `supply_ibfk_1` FOREIGN KEY (`supplierNr`) REFERENCES `supplier` (`supplierNr`),
    CONSTRAINT `supply_ifbk_2` FOREIGN KEY (`itemNr`) REFERENCES `item` (`itemNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for 'item' table

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
	`itemNr` int(11) NOT NULL DEFAULT '0',
    `itemName` varchar(255) NOT NULL,
    `[countryMade]` varchar(255),
    PRIMARY KEY `itemNr` (`itemNr`),
    KEY `itemName` (`itemName`),
    CONSTRAINT `item_ibfk_1` FOREIGN KEY (`itemNr`) REFERENCES `supply` (`itemNr`),
    CONSTRAINT `item_ibfk_2` FOREIGN KEY (`itemNr`) REFERENCES `usage` (`itemNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for 'usage' table

DROP TABLE IF EXISTS `usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage` (
	`itemNr` int(11) NOT NULL DEFAULT '0',
    `deptCode` varchar(3),
    PRIMARY KEY (`itemNr`, `deptCode`),
    KEY `deptCode` (`deptCode`),
    CONSTRAINT `usage_ibfk_1` FOREIGN KEY (`itemNr`) REFERENCES `item` (`itemNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;