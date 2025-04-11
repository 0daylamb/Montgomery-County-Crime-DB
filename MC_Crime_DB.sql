CREATE DATABASE  IF NOT EXISTS `montgomery_crimedb_2` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `montgomery_crimedb_2`;
-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (x86_64)
--
-- Host: localhost    Database: montgomery_crimedb_2
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency` (
  `agency_id` int NOT NULL AUTO_INCREMENT,
  `police_number` varchar(45) NOT NULL,
  `police_district` varchar(45) NOT NULL,
  `police_agency` varchar(45) NOT NULL,
  PRIMARY KEY (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES (1,'1D','ROCKVILLE','RCPD'),(2,'2D','BETHESDA','MCPD'),(3,'1D','ROCKVILLE','MCPD'),(4,'6D','MONTGOMERY VILLAGE','GPD'),(5,'6D','MONTGOMERY VILLAGE','MCPD'),(6,'3D','SILVER SPRING','MCPD'),(7,'5D','GERMANTOWN','MCPD'),(8,'4D','WHEATON','MCPD'),(9,'3D','SILVER SPRING','MCFM'),(10,'TPPD','TAKOMA PARK','TPPD'),(11,'4D','WHEATON','MCFM');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `average_victims`
--

DROP TABLE IF EXISTS `average_victims`;
/*!50001 DROP VIEW IF EXISTS `average_victims`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `average_victims` AS SELECT 
 1 AS `police_district`,
 1 AS `avg_victims`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `crime`
--

DROP TABLE IF EXISTS `crime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crime` (
  `crime_id` int NOT NULL AUTO_INCREMENT,
  `cr_number` int NOT NULL,
  `victims_num` varchar(45) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_time` date NOT NULL,
  `place_name` varchar(45) DEFAULT NULL,
  `offense_id` int NOT NULL,
  `agency_id` int NOT NULL,
  `NIBRS_id` int NOT NULL,
  `dispatch_id` int NOT NULL,
  PRIMARY KEY (`crime_id`),
  KEY `fk_crime_offense1_idx` (`offense_id`),
  KEY `fk_crime_agency1_idx` (`agency_id`),
  KEY `fk_crime_NIBRS1_idx` (`NIBRS_id`),
  KEY `fk_crime_dispatch1_idx` (`dispatch_id`),
  CONSTRAINT `fk_crime_agency1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`agency_id`),
  CONSTRAINT `fk_crime_dispatch1` FOREIGN KEY (`dispatch_id`) REFERENCES `dispatch` (`dispatch_id`),
  CONSTRAINT `fk_crime_NIBRS1` FOREIGN KEY (`NIBRS_id`) REFERENCES `NIBRS` (`NIBRS_id`),
  CONSTRAINT `fk_crime_offense1` FOREIGN KEY (`offense_id`) REFERENCES `offense` (`offense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crime`
--

LOCK TABLES `crime` WRITE;
/*!40000 ALTER TABLE `crime` DISABLE KEYS */;
INSERT INTO `crime` VALUES (1,230001273,'1','2023-01-09','2023-01-09','Street - Residential',1,1,1,1),(2,230001274,'1','2023-01-08','2023-01-09','Parking Garage - Other',2,2,2,2),(3,230001281,'1','2023-01-08','2023-01-09','Parking Garage - Residential',1,3,1,3),(4,230001276,'1','2022-09-03','2023-01-09','Residence -Townhouse/Duplex',3,4,3,4),(5,230001280,'1','2022-11-01','2022-11-30','Residence -Townhouse/Duplex',4,5,4,5),(6,230001286,'1','2023-01-08','2023-01-09','Restaurant',7,2,6,8),(7,230001278,'1','2022-12-20','2023-01-06','School - Elementary/Secondary',8,8,7,9),(8,230001284,'1','2022-12-07','2022-12-23','Cyberspace',9,8,8,10),(9,230001264,'1','2023-01-09','2023-01-09','Residence - Apartment/Condo',10,1,9,11),(10,230001289,'1','2023-01-08','2023-01-09','Parking Garage - Residential',1,3,1,13),(11,230001301,'1','2021-10-15','2023-01-09','Other/Unknown',11,5,8,14),(12,230001301,'1','2021-10-15','2023-01-09','Parking Lot - Other',2,5,2,15),(13,230001292,'1','2023-01-09','2023-01-09','Gas Station',1,10,1,17),(14,230001298,'1','2023-01-09','2023-01-09','Convenience Store',13,10,11,19),(15,230001266,'1','2023-01-07','2023-01-09','Residence - Apartment/Condo',14,10,6,20),(16,230001066,'1','2023-01-07','2023-01-07','Street - In vehicle',15,6,12,21),(17,230001308,'1','2023-01-09','2023-01-09','Restaurant',16,7,13,23),(18,230001307,'2','2023-01-09','2023-01-09','Street - Residential',16,5,13,25),(19,230001319,'1','2023-01-06','2023-01-08','Parking Garage - Residential',20,3,17,29),(20,230001303,'1','2022-12-01','2023-01-09','Government Building',6,5,5,31),(21,230001309,'1','2023-01-08','2023-01-09','Parking Lot - Residential',18,2,15,32),(22,230001279,'1','2023-01-09','2023-01-09','Street - Bus Stop',24,2,5,37),(23,230001328,'1','2023-01-08','2023-01-09','Street - Residential',18,6,15,39),(24,230001271,'1','2023-01-09','2023-01-09','Street - Residential',2,8,2,42),(25,230001338,'1','2023-01-08','2023-01-09','Parking Lot - Church',1,8,1,44),(26,230001340,'1','2023-01-09','2023-01-09','Residence - Apartment/Condo',16,1,13,45),(27,230001342,'1','2023-01-08','2023-01-09','Street - In vehicle',1,6,1,46),(28,230001337,'1','2023-01-03','2023-01-03','Other/Unknown',20,6,17,48),(29,230001350,'1','2023-01-05','2023-01-06','Street - In vehicle',1,5,1,50),(30,230001354,'1','2023-01-09','2023-01-09','Commercial - Office Building',20,2,17,51),(31,230001357,'1','2023-01-09','2023-01-09','Retail - Beauty/Barber Shop',13,2,11,53),(32,230001365,'1','2022-12-30','2022-12-30','Restaurant',11,8,8,55),(34,230001244,'1','2023-01-08','2023-01-08','Grocery/Supermarket',20,2,17,57),(35,230001386,'1','2023-01-09','2023-01-09','Residence - Single Family',25,8,5,64),(36,230001394,'1','2023-01-06','2023-01-08','Street - In vehicle',1,6,1,68),(37,230001384,'1','2023-01-09','2023-01-09','Street - Residential',21,10,5,69),(38,230001396,'1','2023-01-09','2023-01-09','Street - Residential',32,7,14,75),(39,230001366,'1','2022-03-05','2022-03-20','Other/Unknown',30,6,3,79),(40,230001366,'1','2022-03-05','2022-03-20','Other/Unknown',33,6,21,80),(41,230001378,'1','2023-01-09','2023-01-09','School - Elementary/Secondary',34,1,21,81),(42,230001385,'1','2023-01-09','2023-01-09','Residence - Apartment/Condo',25,2,5,82),(43,230001402,'1','2023-01-09','2023-01-09','Residence - Single Family',35,8,5,85),(44,230001409,'1','2023-01-09','2023-01-09','Hospital/Emergency Care Center',36,1,5,86),(45,230001418,'1','2023-01-03','2023-01-06','Street - Residential',2,6,2,96),(46,230001410,'1','2023-01-08','2023-01-09','Residence - Driveway',1,8,1,104),(47,230001423,'1','2023-01-09','2023-01-09','Residence - Apartment/Condo',22,1,5,108),(48,230001387,'1','2023-01-09','2023-01-09','Street - Commercial',15,8,12,109),(49,230001426,'1','2023-01-04','2023-01-04','Library',37,1,22,110),(50,230001433,'1','2023-01-10','2023-01-10','Street - Other',27,8,5,114),(51,230001430,'1','2023-01-10','2023-01-10','Street - Commercial',26,1,18,120),(52,230001437,'1','2023-01-09','2023-01-10','Parking Lot - Residential',2,8,2,121),(53,230001442,'1','2022-12-20','2022-12-30','Other/Unknown',45,2,25,123),(54,230001439,'1','2023-01-09','2023-01-10','Parking Lot - Residential',2,5,2,124),(55,230001440,'1','2023-01-09','2023-01-10','Parking Lot - Residential',1,8,1,125),(56,230001288,'1','2023-01-08','2023-01-09','Parking Garage - Other',2,2,2,126),(57,230001445,'1','2023-01-09','2023-01-10','Parking Lot - Commercial',18,1,15,130),(58,230001445,'1','2023-01-09','2023-01-10','Parking Lot - Other',34,1,21,131),(60,230001454,'1','2023-01-09','2023-01-09','Other/Unknown',6,8,5,135),(61,220054890,'1','2022-12-08','2022-12-10','Residence - Other',34,6,21,138),(62,230001305,'1','2023-01-09','2023-01-09','School - Elementary/Secondary',16,5,13,139),(63,230001455,'1','2023-01-09','2023-01-10','Parking Lot - Residential',2,6,2,143),(64,230001467,'1','2023-01-02','2023-01-09','Residence - Single Family',20,5,17,145),(65,230001452,'1','2023-01-09','2023-01-10','Residence - Single Family',50,2,6,146),(66,230001330,'1','2023-01-08','2023-01-09','Parking Lot - Residential',41,8,16,147),(67,230001477,'1','2023-01-09','2023-01-10','Parking Lot - Residential',18,6,15,149),(68,230001476,'1','2023-01-09','2023-01-10','Parking Lot - Residential',18,8,15,150),(69,230001457,'1','2023-01-10','2023-01-10','Residence - Single Family',25,8,5,151),(70,230001451,'1','2023-01-09','2023-01-10','Parking Lot - Residential',18,8,15,152),(72,230001486,'1','2023-01-10','2023-01-10','Parking Garage - Residential',41,1,16,157),(73,230001499,'1','2023-01-05','2023-01-09','Residence -Townhouse/Duplex',6,1,5,158),(74,230001508,'1','2023-01-08','2023-01-09','Street - Residential',41,1,16,159),(75,230001371,'1','2023-01-09','2023-01-09','Residence - Single Family',22,7,5,163),(76,230001380,'1','2023-01-07','2023-01-08','Residence -Townhouse/Duplex',41,8,16,166),(77,230001522,'1','2023-01-10','2023-01-10','Street - Other',41,8,16,167),(78,230001521,'1','2023-01-09','2023-01-10','Street - Residential',18,6,15,168),(79,230001533,'1','2022-11-01','2023-01-06','Parking Lot - Commercial',6,2,5,171),(80,230001519,'1','2023-01-10','2023-01-10','Residence - Nursing Home',36,1,5,174),(82,230001538,'1','2022-11-01','2022-12-01','Other/Unknown',33,2,21,177),(83,230001538,'1','2022-11-01','2022-12-01','Other/Unknown',30,2,3,178),(84,230001537,'1','2023-01-09','2023-01-10','Parking Lot - Residential',1,5,1,180),(85,230001553,'1','2022-12-23','2022-12-27','Residence - Apartment/Condo',20,3,17,181),(86,230001555,'1','2022-12-25','2023-01-10','Residence - Single Family',1,6,1,182),(87,230001563,'1','2023-01-05','2023-01-05','Other/Unknown',45,8,25,183),(88,230001567,'1','2023-01-10','2023-01-10','Convenience Store',20,8,17,184),(89,230001570,'1','2022-11-30','2023-01-04','Other/Unknown',45,2,25,185),(90,230001575,'1','2022-10-15','2023-01-10','Other/Unknown',6,5,5,187);
/*!40000 ALTER TABLE `crime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `crime_grouped_by_nibrs`
--

DROP TABLE IF EXISTS `crime_grouped_by_nibrs`;
/*!50001 DROP VIEW IF EXISTS `crime_grouped_by_nibrs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `crime_grouped_by_nibrs` AS SELECT 
 1 AS `nibrs_code`,
 1 AS `total_crimes`,
 1 AS `crime_names`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `crime_location`
--

DROP TABLE IF EXISTS `crime_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crime_location` (
  `crime_id` int NOT NULL,
  `location_id` int NOT NULL,
  PRIMARY KEY (`crime_id`,`location_id`),
  KEY `location_id_idx` (`location_id`),
  CONSTRAINT `crime_id` FOREIGN KEY (`crime_id`) REFERENCES `crime` (`crime_id`),
  CONSTRAINT `location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crime_location`
--

LOCK TABLES `crime_location` WRITE;
/*!40000 ALTER TABLE `crime_location` DISABLE KEYS */;
INSERT INTO `crime_location` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(34,34),(35,35),(36,36),(38,38),(39,39),(40,40),(41,41),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(60,60),(61,61),(63,63),(64,64),(65,65),(66,66),(68,68),(69,69),(70,70),(72,72),(73,73),(74,74),(76,76),(77,77),(78,78),(82,82),(83,83),(84,84),(85,85),(86,86),(87,87),(89,89),(90,90);
/*!40000 ALTER TABLE `crime_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `crimes_location_agency`
--

DROP TABLE IF EXISTS `crimes_location_agency`;
/*!50001 DROP VIEW IF EXISTS `crimes_location_agency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `crimes_location_agency` AS SELECT 
 1 AS `crime_id`,
 1 AS `cr_number`,
 1 AS `city`,
 1 AS `police_district`,
 1 AS `start_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dispatch`
--

DROP TABLE IF EXISTS `dispatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispatch` (
  `dispatch_id` int NOT NULL AUTO_INCREMENT,
  `dispatch_start_time` time NOT NULL,
  `dispatch_end_time` time NOT NULL,
  `dispatch_date` date NOT NULL,
  PRIMARY KEY (`dispatch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatch`
--

LOCK TABLES `dispatch` WRITE;
/*!40000 ALTER TABLE `dispatch` DISABLE KEYS */;
INSERT INTO `dispatch` VALUES (1,'07:45:00','08:30:00','0001-09-23'),(2,'17:45:00','07:30:00','0001-09-23'),(3,'19:00:00','08:30:00','0001-09-23'),(4,'12:00:00','08:15:00','0001-09-23'),(5,'09:00:00','21:00:00','0001-09-23'),(8,'23:30:00','08:55:00','0001-09-23'),(9,'13:00:00','12:30:00','0001-09-23'),(10,'09:00:00','18:00:00','0001-09-23'),(11,'07:03:00','07:15:00','0001-09-23'),(13,'20:00:00','02:00:00','0001-09-23'),(14,'00:00:00','09:00:00','0001-09-23'),(15,'00:00:00','09:00:00','0001-09-23'),(17,'10:05:00','10:14:00','0001-09-23'),(19,'09:00:00','10:59:00','0001-09-23'),(20,'15:30:00','07:00:00','0001-09-23'),(21,'13:15:00','13:30:00','0001-07-23'),(23,'11:20:00','11:37:00','0001-09-23'),(25,'11:00:00','12:00:00','0001-09-23'),(29,'00:00:00','00:00:00','0001-09-23'),(31,'00:00:00','00:00:00','0001-09-23'),(32,'17:00:00','09:00:00','0001-09-23'),(37,'07:00:00','07:30:00','0001-09-23'),(39,'21:00:00','10:00:00','0001-09-23'),(42,'00:30:00','06:30:00','0001-09-23'),(44,'21:00:00','06:40:00','0001-09-23'),(45,'14:00:00','14:19:00','0001-09-23'),(46,'20:00:00','05:00:00','0001-09-23'),(48,'17:30:00','19:30:00','0001-09-23'),(50,'20:00:00','06:00:00','0001-09-23'),(51,'12:45:00','13:45:00','0001-09-23'),(53,'15:18:00','15:27:00','0001-09-23'),(55,'16:38:00','00:00:00','0001-09-23'),(56,'15:15:00','16:00:00','0001-08-23'),(57,'15:15:00','16:00:00','0001-08-23'),(64,'17:44:00','18:00:00','0001-09-23'),(68,'20:00:00','07:00:00','0001-09-23'),(69,'17:59:00','00:00:00','0001-09-23'),(75,'18:17:00','18:30:00','0001-09-23'),(79,'00:00:00','00:00:00','0001-09-23'),(80,'00:00:00','00:00:00','0001-09-23'),(81,'08:45:00','15:30:00','0001-09-23'),(82,'17:40:00','19:30:00','0001-09-23'),(85,'19:54:00','00:00:00','0001-09-23'),(86,'20:28:00','21:30:00','0001-09-23'),(96,'11:00:00','09:00:00','0001-09-23'),(104,'18:00:00','10:00:00','0001-09-23'),(108,'23:52:00','23:00:00','0001-09-23'),(109,'17:36:00','18:57:00','0001-09-23'),(110,'15:00:00','15:00:00','0001-10-23'),(114,'01:10:00','01:17:00','0001-10-23'),(120,'00:24:00','02:30:00','0001-10-23'),(121,'18:00:00','05:00:00','0001-10-23'),(123,'00:00:00','00:00:00','0001-10-23'),(124,'19:30:00','06:25:00','0001-10-23'),(125,'19:00:00','07:00:00','0001-10-23'),(126,'18:00:00','09:30:00','0001-09-23'),(130,'19:30:00','07:00:00','0001-10-23'),(131,'19:30:00','07:00:00','0001-10-23'),(133,'00:00:00','00:00:00','0001-10-23'),(135,'12:00:00','21:00:00','0001-10-23'),(138,'10:00:00','09:00:00','2012-12-22'),(139,'10:08:00','10:40:00','0001-09-23'),(143,'20:30:00','05:00:00','0001-10-23'),(145,'00:00:00','13:30:00','0001-10-23'),(146,'21:30:00','05:30:00','0001-10-23'),(147,'22:00:00','11:00:00','0001-09-23'),(149,'00:00:00','07:00:00','0001-10-23'),(150,'20:00:00','09:20:00','0001-10-23'),(151,'09:28:00','10:04:00','0001-10-23'),(152,'14:00:00','08:30:00','0001-10-23'),(154,'01:00:00','13:00:00','0001-10-23'),(157,'12:05:00','12:15:00','0001-10-23'),(158,'13:05:00','00:00:00','0001-10-23'),(159,'18:00:00','07:00:00','0001-10-23'),(163,'15:45:00','16:00:00','0001-09-23'),(166,'19:00:00','07:00:00','0001-09-23'),(167,'11:20:00','12:30:00','0001-10-23'),(168,'23:40:00','09:00:00','0001-10-23'),(171,'09:00:00','18:00:00','0001-10-23'),(174,'14:33:00','14:45:00','0001-10-23'),(177,'00:00:00','23:59:00','0001-10-23'),(178,'00:00:00','23:59:00','0001-10-23'),(180,'22:00:00','11:20:00','0001-10-23'),(181,'12:30:00','14:30:00','0001-10-23'),(182,'19:00:00','17:15:00','0001-10-23'),(183,'00:00:00','23:59:00','0001-10-23'),(184,'14:00:00','17:00:00','0001-10-23'),(185,'00:00:00','23:59:00','0001-10-23'),(187,'12:00:00','16:30:00','0001-10-23');
/*!40000 ALTER TABLE `dispatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `high_victim_crimes`
--

DROP TABLE IF EXISTS `high_victim_crimes`;
/*!50001 DROP VIEW IF EXISTS `high_victim_crimes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `high_victim_crimes` AS SELECT 
 1 AS `crime_id`,
 1 AS `cr_number`,
 1 AS `victims_num`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zip_code` varchar(45) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'600 BLK  DENHAM RD','ROCKVILLE','MD','20851'),(2,'6700 BLK  DEMOCRACY BLV','BETHESDA','MD','20817'),(3,'1100 BLK  HIGGINS PL','ROCKVILLE','MD','20852'),(4,'500 BLK  RUDBECKIA PL','GAITHERSBURG','MD','20878'),(5,'18700 BLK  BARN SWALLOW TER','GAITHERSBURG','MD','20879'),(6,'8100 BLK  GEORGIA AVE','SILVER SPRING','MD','20910'),(7,'12700 BLK  PUMPKIN SEED CT','GERMANTOWN','MD','20874'),(8,'8300 BLK  GRUBB RD','SILVER SPRING','MD','20910'),(9,'900 BLK  UNIVERSITY BLV','SILVER SPRING','MD','20901'),(10,'500 BLK  RIDGEWELL WAY','SILVER SPRING','MD','20902'),(11,'1100 BLK  HIGGINS PL','ROCKVILLE','MD','20852'),(12,'9600 BLK  WARFIELD RD','GAITHERSBURG','MD','20882'),(13,'5200 BLK  CROSSFIELD CT','ROCKVILLE','MD','20852'),(14,'600 BLK  PERRY PKW','GAITHERSBURG','MD','20877'),(15,'600 BLK  PERRY PKW','GAITHERSBURG','MD','20877'),(16,'10100 BLK  COLESVILLE RD','SILVER SPRING','MD','20901'),(17,'6300 BLK  NEW HAMPSHIRE AVE','TAKOMA PARK','MD','20912'),(18,'8500 BLK  FENTON ST','SILVER SPRING','MD','20910'),(19,'6900 BLK  NEW HAMPSHIRE AVE','TAKOMA PARK','MD','20912'),(20,'1200 BLK  MYRTLE AVE','TAKOMA PARK','MD','20912'),(21,'8100 BLK  GEORGIA AVE','SILVER SPRING','MD','20910'),(22,'1300 BLK  UNIVERSITY BLV','TAKOMA PARK','MD','20912'),(23,'19900 BLK  FREDERICK RD','GERMANTOWN','MD','20876'),(24,'7100 BLK  WOODLAND AVE','TAKOMA PARK','MD','20912'),(25,'17600 BLK  SHADY SPRING TER','GAITHERSBURG','MD','20877'),(26,'1000 BLK  TAFT ST','ROCKVILLE','MD','20850'),(27,'1  BLK  GRAND CORNER AVE','GAITHERSBURG','MD','20878'),(28,'1  BLK  GRAND CORNER AVE','GAITHERSBURG','MD','20878'),(29,'16000 BLK  REDLAND RD','DERWOOD','MD','20855'),(30,'19700 BLK  CRYSTAL ROCK DR','GERMANTOWN','MD','20874'),(31,'7200 BLK  MUNCASTER MILL RD','DERWOOD','MD','20855'),(32,'5200 BLK  TUCKERMAN LA','ROCKVILLE','MD','20852'),(33,'4800 BLK  RUGBY AVE','BETHESDA','MD','20814'),(34,'9700 BLK  HELLINGLY PL','MONTGOMERY VILLAGE','MD','20886'),(35,'14300 BLK  GEORGIA AVE','SILVER SPRING','MD','20906'),(36,'14300 BLK  GEORGIA AVE','SILVER SPRING','MD','20906'),(38,'1100 BLK  BONIFANT ST','SILVER SPRING','MD','20910'),(39,'800 BLK  GREGORIO DR','SILVER SPRING','MD','20901'),(40,'3800 BLK  UNDERWOOD ST','CHEVY CHASE','MD','20815'),(41,'8500 BLK  FENTON ST','SILVER SPRING','MD','20910'),(43,'11100 BLK  KORMAN DR','POTOMAC','MD','20854'),(44,'4100 BLK  NORBECK RD','ROCKVILLE','MD','20853'),(45,'1000 BLK  ROCKVILLE PIK','ROCKVILLE','MD','20852'),(46,'1  BLK  LEATHERWOOD CT','BURTONSVILLE','MD','20866'),(47,'8900 BLK  MAINE AVE','SILVER SPRING','MD','20910'),(48,'8100 BLK  GEORGIA AVE','SILVER SPRING','MD','20910'),(49,'4600 BLK N PARK AVE','CHEVY CHASE','MD','20815'),(50,'200 BLK  COMMUNITY CENTER AVE','GAITHERSBURG','MD','20878'),(51,'10200 BLK  FERNWOOD RD','BETHESDA','MD','20817'),(52,'19800 BLK  OBSERVATION DR','GERMANTOWN','MD','20876'),(53,'5300 BLK  WESTERN AVE','CHEVY CHASE','MD','20815'),(54,'13900 BLK  CASTLE BLV','SILVER SPRING','MD','20904'),(55,'13500 BLK  GRENOBLE DR','ROCKVILLE','MD','20853'),(56,'10200 BLK  OLD GEORGETOWN RD','BETHESDA','MD','20814'),(57,'10200 BLK  OLD GEORGETOWN RD','BETHESDA','MD','20814'),(58,'1200 BLK E WEST HWY','SILVER SPRING','MD','20910'),(59,'8400 BLK  GEORGIA AVE','SILVER SPRING','MD','20910'),(60,'20900 BLK  FREDERICK RD','GERMANTOWN','MD','20876'),(61,'8700 BLK  FLOWER AVE','SILVER SPRING','MD','20901'),(63,'14300 BLK  GEORGIA AVE','SILVER SPRING','MD','20906'),(64,'18000 BLK  EDNOR VIEW TER','ASHTON','MD','20861'),(65,'1000 BLK  MILESTONE DR','SILVER SPRING','MD','20904'),(66,'800 BLK  CLOPPER RD','GAITHERSBURG','MD','20878'),(68,'9100 BLK  WARREN ST','SILVER SPRING','MD','20910'),(69,'1200 BLK  HOLTON LA','TAKOMA PARK','MD','20912'),(70,'9900 BLK  MEDICAL CENTER DR','ROCKVILLE','MD','20850'),(72,'10900 BLK  BUCKNELL DR','SILVER SPRING','MD','20902'),(73,'1600 BLK  PARHAM RD','SILVER SPRING','MD','20903'),(74,'12700 BLK  GOODHILL RD','SILVER SPRING','MD','20906'),(76,'15000 BLK  BROSCHART RD','ROCKVILLE','MD','20850'),(77,'10100 BLK  RIVER RD','POTOMAC','MD','20854'),(78,'10100 BLK  RIVER RD','POTOMAC','MD','20854'),(81,'400 BLK  BEALL AVE','ROCKVILLE','MD','20850'),(82,'5200 BLK  POOKS HILL RD','BETHESDA','MD','20814'),(83,'3100 BLK  BEAVERWOOD LA','SILVER SPRING','MD','20906'),(84,'3100 BLK  BEAVERWOOD LA','SILVER SPRING','MD','20906'),(85,'4500 BLK  BAYNE ST','ROCKVILLE','MD','20853'),(86,'1300 BLK  PICCARD DR','ROCKVILLE','MD','20850'),(87,'9500 BLK  EMORY GROVE RD','GAITHERSBURG','MD','20877'),(89,'300 BLK  COMMUNITY CENTER AVE','GAITHERSBURG','MD','20878'),(90,'13900 BLK  NEW HAMPSHIRE AVE','SILVER SPRING','MD','20904'),(91,'4800 BLK  RUGBY AVE','BETHESDA','MD','20814'),(92,'16000 BLK  WALLINGFORD RD','SILVER SPRING','MD','20906'),(93,'300 BLK  UNIVERSITY BLV','SILVER SPRING','MD','20901'),(94,'4100 BLK  SAMPSON RD','SILVER SPRING','MD','20906'),(95,'1  BLK  ORCHARD DR','GAITHERSBURG','MD','20878'),(97,'8400 BLK  COLESVILLE RD','SILVER SPRING','MD','20910'),(98,'11100 BLK  VEIRS MILL RD','SILVER SPRING','MD','20902'),(99,'300 BLK  UNIVERSITY BLV','SILVER SPRING','MD','20901'),(100,'14200 BLK  GEORGIA AVE','SILVER SPRING','MD','20906'),(101,'700 BLK  QUINCE ORCHARD BLV','GAITHERSBURG','MD','20878'),(102,'1  BLK  GRAND CORNER AVE','GAITHERSBURG','MD','20878'),(103,'8400 BLK  FENTON ST','SILVER SPRING','MD','20910'),(104,'14400 BLK  CLAY ROCK LA','SILVER SPRING','MD','20906'),(105,'2500 BLK  GLENALLAN AVE','SILVER SPRING','MD','20906'),(106,'7600 BLK  NEW HAMPSHIRE AVE','TAKOMA PARK','MD','20912'),(107,'1100 BLK  RIPLEY ST','SILVER SPRING','MD','20910'),(108,'600 BLK  BLANDFORD ST','ROCKVILLE','MD','20850'),(110,'1  BLK  MARYLAND AVE','ROCKVILLE','MD','20850'),(111,'700 BLK  MONROE ST','ROCKVILLE','MD','20850'),(112,'700 BLK  MONROE ST','ROCKVILLE','MD','20850'),(113,'11500 BLK  STEWART LA','SILVER SPRING','MD','20904'),(115,'11800 BLK  ROCKVILLE PIK','ROCKVILLE','MD','20852'),(116,'11800 BLK  ROCKVILLE PIK','ROCKVILLE','MD','20852'),(117,'11800 BLK  ROCKVILLE PIK','ROCKVILLE','MD','20852'),(118,'11800 BLK  ROCKVILLE PIK','ROCKVILLE','MD','20852'),(120,'600 BLK  BLANDFORD ST','ROCKVILLE','MD','20850'),(121,'3800 BLK  BEL PRE RD','SILVER SPRING','MD','20906'),(122,'9300 BLK  HARVEY RD','SILVER SPRING','MD','20910'),(123,'5600 BLK  ONTARIO CIR','BETHESDA','MD','20816'),(124,'10100 BLK  REPRISE DR','ROCKVILLE','MD','20850'),(125,'2300 BLK  GLENMONT CIR','SILVER SPRING','MD','20902'),(126,'6700 BLK  DEMOCRACY BLV','BETHESDA','MD','20817'),(127,'8500 BLK  COLESVILLE RD','SILVER SPRING','MD','20910'),(128,'2900 BLK  UNIVERSITY BLV','KENSINGTON','MD','20895'),(129,'1900 BLK  OLIVINE CT','SILVER SPRING','MD','20904'),(130,'600 BLK  SOUTHLAWN LA','ROCKVILLE','MD','20850'),(131,'600 BLK  SOUTHLAWN LA','ROCKVILLE','MD','20850'),(132,'9900 BLK  RIDGELINE DR','MONTGOMERY VILLAGE','MD','20886'),(133,'16000 BLK  INDUSTRIAL DR','GAITHERSBURG','MD','20877'),(134,'10200 BLK  KENSINGTON PKW','KENSINGTON','MD','20895'),(135,'4300 BLK  FERRARA DR','SILVER SPRING','MD','20906'),(136,'3500 BLK  NAPIER ST','SILVER SPRING','MD','20906'),(137,'19200 BLK  THOMAS FARM RD','MONTGOMERY VILLAGE','MD','20886'),(138,'8300 BLK  DRAPER LA','SILVER SPRING','MD','20910'),(139,'19300 BLK  WATKINS MILL RD','MONTGOMERY VILLAGE','MD','20886'),(140,'300 BLK  NORMANDY DR','SILVER SPRING','MD','20901'),(141,'19400 BLK  CRYSTAL ROCK DR','GERMANTOWN','MD','20874'),(142,'5400 BLK  WISCONSIN AVE','CHEVY CHASE','MD','20815'),(143,'13600 BLK  ROBEY RD','SILVER SPRING','MD','20904'),(144,'1100 BLK  WAYNE AVE','SILVER SPRING','MD','20910'),(145,'9600 BLK  TALL OAKS RD','MONTGOMERY VILLAGE','MD','20886'),(146,'4700 BLK  DORSET AVE','CHEVY CHASE','MD','20815'),(147,'2500 BLK  GLENALLAN AVE','SILVER SPRING','MD','20906'),(148,'7600 BLK  LAYTONIA DR','GAITHERSBURG','MD','20877'),(149,'3900 BLK  BLACKBURN LA','BURTONSVILLE','MD','20866'),(150,'2300 BLK  GLENALLAN AVE','SILVER SPRING','MD','20906'),(151,'4400 BLK  SKYMIST TER','OLNEY','MD','20832'),(152,'2300 BLK  GLENALLAN AVE','SILVER SPRING','MD','20906'),(153,'7200 BLK  13TH AVE','TAKOMA PARK','MD','20912'),(154,'700 BLK  MONROE ST','ROCKVILLE','MD','20850'),(155,'7400 BLK  JACKSON AVE','TAKOMA PARK','MD','20912'),(156,'7200 BLK  13TH AVE','TAKOMA PARK','MD','20912'),(157,'1  BLK  MONROE ST','ROCKVILLE','MD','20850'),(158,'200 BLK  HALPINE WALK CT','ROCKVILLE','MD','20851'),(159,'1800 BLK  YALE PL','ROCKVILLE','MD','20850'),(160,'19000 BLK  PARTRIDGE WOOD DR','GERMANTOWN','MD','20874'),(161,'15300 BLK  DURANT ST','SILVER SPRING','MD','20905'),(163,'1  BLK  SCOTTSBURY CT','GERMANTOWN','MD','20876'),(164,'1300 BLK  PICCARD DR','ROCKVILLE','MD','20850'),(165,'7000 BLK  ARLINGTON RD','BETHESDA','MD','20814'),(166,'1000 BLK  WINDRUSH LA','SANDY SPRING','MD','20860'),(169,'7400 BLK  BALTIMORE AVE','TAKOMA PARK','MD','20912'),(170,'7700 BLK  MAPLE AVE','TAKOMA PARK','MD','20912'),(171,'6700 BLK  WISCONSIN AVE','CHEVY CHASE','MD','20815'),(172,'6500 BLK  POPLAR AVE','TAKOMA PARK','MD','20912'),(173,'11200 BLK  NEW HAMPSHIRE AVE','SILVER SPRING','MD','20904'),(174,'1200 BLK  POTOMAC VALLEY RD','ROCKVILLE','MD','20850'),(175,'1000 BLK  MILESTONE DR','SILVER SPRING','MD','20904'),(176,'11600 BLK  STEWART LA','SILVER SPRING','MD','20904'),(179,'800 BLK  UNIVERSITY BLV','SILVER SPRING','MD','20903'),(180,'17200 BLK  KING JAMES WAY','GAITHERSBURG','MD','20877'),(181,'8000 BLK  GRAMERCY BLV','DERWOOD','MD','20855'),(182,'13200 BLK  AUTUMN DR','SILVER SPRING','MD','20904'),(183,'14900 BLK  CLEESE CT','SILVER SPRING','MD','20906'),(184,'11300 BLK  FERN ST','SILVER SPRING','MD','20902'),(185,'100 BLK  QUINCY ST','CHEVY CHASE','MD','20815'),(186,'11200 BLK  OAK LEAF DR','SILVER SPRING','MD','20901'),(187,'400 BLK  CLAYHALL ST','GAITHERSBURG','MD','20878'),(188,'400 BLK  CAROUSEL CT','GAITHERSBURG','MD','20877'),(189,'19500 BLK  WATERS RD','GERMANTOWN','MD','20874'),(190,'800 BLK  ELLSWORTH DR','SILVER SPRING','MD','20910'),(191,'4800 BLK  WELLINGTON DR','CHEVY CHASE','MD','20815'),(192,'11000 BLK  VEIRS MILL RD','SILVER SPRING','MD','20902'),(193,'900 BLK  PHEASANT RUN DR','GAITHERSBURG','MD','20878'),(194,'800 BLK  WAYNE AVE','SILVER SPRING','MD','20910'),(195,'7100 BLK  WILLOW AVE','TAKOMA PARK','MD','20912'),(196,'3700 BLK  BRIGHTVIEW ST','SILVER SPRING','MD','20902'),(197,'8500 BLK  GEORGIA AVE','SILVER SPRING','MD','20910'),(198,'6300 BLK  GREENTREE RD','BETHESDA','MD','20817'),(199,'4900 BLK  FAIRMONT AVE','BETHESDA','MD','20814'),(200,'6300 BLK  TILDEN LA','ROCKVILLE','MD','20852');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NIBRS`
--

DROP TABLE IF EXISTS `NIBRS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NIBRS` (
  `NIBRS_id` int NOT NULL AUTO_INCREMENT,
  `NIBRS_code` varchar(45) NOT NULL,
  PRIMARY KEY (`NIBRS_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NIBRS`
--

LOCK TABLES `NIBRS` WRITE;
/*!40000 ALTER TABLE `NIBRS` DISABLE KEYS */;
INSERT INTO `NIBRS` VALUES (1,'23F'),(2,'240'),(3,'250'),(4,'11D'),(5,'90Z'),(6,'220'),(7,'35A'),(8,'26A'),(9,'90J'),(10,'200'),(11,'23C'),(12,'90D'),(13,'13B'),(14,'120'),(15,'23G'),(16,'290'),(17,'23D'),(18,'13A'),(19,'26B'),(20,'36B'),(21,'23H'),(22,'90I'),(23,'11A'),(24,'90C'),(25,'26F'),(26,'370'),(27,'23B');
/*!40000 ALTER TABLE `NIBRS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offense`
--

DROP TABLE IF EXISTS `offense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offense` (
  `offense_id` int NOT NULL AUTO_INCREMENT,
  `offense_code` varchar(45) NOT NULL,
  `crime_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`offense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offense`
--

LOCK TABLES `offense` WRITE;
/*!40000 ALTER TABLE `offense` DISABLE KEYS */;
INSERT INTO `offense` VALUES (1,'2305','Crime Against Property | Theft From Motor Vehicle | LARCENY - FROM AUTO'),(2,'2404','Crime Against Property | Motor Vehicle Theft | AUTO THEFT - VEHICLE THEFT'),(3,'2589','Crime Against Property | Counterfeiting/Forgery | FORGERY (DESCRIBE OFFENSE)'),(4,'1117','Crime Against Person | Forcible Fondling | SEX ASSAULT - CARNAL ABUSE'),(5,'9107','Other | All Other Offenses | MISSING PERSON'),(6,'9105','Other | All Other Offenses | LOST PROPERTY'),(7,'2203','Crime Against Property | Burglary/Breaking and Entering | BURGLARY - FORCED ENTRY-NONRESIDENTIAL'),(8,'3562','Crime Against Society | Drug/Narcotic Violations | DRUGS - MARIJUANA - POSSESS'),(9,'2602','Crime Against Property | False Pretenses/Swindle/Confidence Game | FRAUD - SWINDLE'),(10,'5707','Crime Against Society | Trespass of Real Property | TRESPASSING'),(11,'2699','Crime Against Property | False Pretenses/Swindle/Confidence Game | FRAUD (DESCRIBE OFFENSE)'),(12,'2007','Crime Against Property | Arson | ARSON - BURNING OF - (IDENTIFY OBJECT)'),(13,'2303','Crime Against Property | Shoplifting | LARCENY - SHOPLIFTING'),(14,'2202','Crime Against Property | Burglary/Breaking and Entering | BURGLARY - FORCED ENTRY-RESIDENTIAL'),(15,'5404','Crime Against Society | Driving Under the Influence | DRIVING UNDER THE INFLUENCE LIQUOR'),(16,'1399','Crime Against Person | Simple Assault | ASSAULT - 2ND DEGREE'),(17,'1207','Crime Against Property | Robbery | ROBBERY - RESIDENTIAL-GUN'),(18,'2304','Crime Against Property | Theft of Motor Vehicle Parts or Accessories | LARCENY - AUTO PARTS'),(19,'2901','Crime Against Property | Destruction/Damage/Vandalism of Property | DAMAGE PROPERTY - BUSINESS'),(20,'2308','Crime Against Property | Theft from Building | LARCENY - FROM BLDG'),(21,'9109','Other | All Other Offenses | RECOVERED PROPERTY - OTHER'),(22,'9199','Other | All Other Offenses | POLICE INFORMATION'),(23,'2006','Crime Against Property | Arson | ARSON - RESIDENTIAL'),(24,'5309','Crime Against Society | All Other Offenses | PUBLIC PEACE - HARASSING COMMUNICATION'),(25,'9101','Other | All Other Offenses | SUDDEN DEATH'),(26,'1314','Crime Against Person | Aggravated Assault | ASSAULT - AGGRAVATED - GUN'),(27,'9113','Other | All Other Offenses | MENTAL ILLNESS - EMERGENCY PETITION'),(29,'9108','Other | All Other Offenses | RECOVERED PROPERTY - MONT CO.'),(30,'2501','Crime Against Property | Counterfeiting/Forgery | FORGERY OF CHECKS'),(31,'1116','Crime Against Person | Statuory Rape | STATUTORY RAPE - NO FORCE'),(32,'1206','Crime Against Property | Robbery | ROBBERY - STREET-STRONG-ARM'),(33,'2316','Crime Against Property | All other Larceny | LARCENY - POSTAL'),(34,'2399','Crime Against Property | All other Larceny | LARCENY (DESCRIBE OFFENSE)'),(35,'9201','Other | All Other Offenses | OVERDOSE'),(36,'9112','Other | All Other Offenses | MENTAL TRANSPORT - ONLY'),(37,'9021','Not a Crime | Runaway | JUVENILE - RUNAWAY'),(38,'5016','Crime Against Society | All Other Offenses | OBSTRUCT GOVT - VIOLATION OF A COURT ORDER'),(39,'1103','Crime Against Person | Forcible Rape | RAPE - STRONG-ARM'),(40,'1313','Crime Against Person | Simple Assault | ASSAULT - SIMPLE'),(41,'2902','Crime Against Property | Destruction/Damage/Vandalism of Property | DAMAGE PROPERTY - PRIVATE'),(42,'4801','Crime Against Society | All Other Offenses | OBSTRUCT POLICE - RESISTING OFFICER'),(43,'5311','Crime Against Society | Disorderly Conduct | PUBLIC PEACE - DISORDERLY CONDUCT'),(44,'2411','Crime Against Society | All Other Offenses | UNAUTHORIZED USE OF VEHICLE (INCLUDES JOY RIDING)'),(45,'2610','Crime Against Property | Identity Theft | IDENTITY THEFT'),(46,'1305','Crime Against Person | Aggravated Assault | ASSAULT - AGGRAVATED - NON-FAMILY-OTHER WEAPON'),(47,'3700','Crime Against Society | Pornography/Obscene Material | OBSCENE MATERIAL'),(48,'2499','Crime Against Property | Motor Vehicle Theft | STOLEN VEHICLE (DESCRIBE OFFENSE)'),(49,'1214','Crime Against Property | Robbery | ROBBERY - KNIFE'),(50,'2204','Crime Against Property | Burglary/Breaking and Entering | BURGLARY - NO FORCED ENTRY-RESIDENTIAL'),(52,'2601','Crime Against Property | False Pretenses/Swindle/Confidence Game | FRAUD - CONFIDENCE GAME'),(53,'2205','Crime Against Property | Burglary/Breaking and Entering | BURGLARY - NO FORCED ENTRY-NONRESIDENTIAL'),(54,'1212','Crime Against Property | Robbery | ROBBERY - CARJACKING - ARMED'),(55,'2302','Crime Against Property | Purse-snatching | LARCENY - PURSE SNATCHING - NO FORCE'),(56,'5499','Other | NOT NIBRS CODE | TRAFFIC OFFENSES (DESCRIBE OFFENSE)');
/*!40000 ALTER TABLE `offense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `total_crimes_by_city`
--

DROP TABLE IF EXISTS `total_crimes_by_city`;
/*!50001 DROP VIEW IF EXISTS `total_crimes_by_city`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_crimes_by_city` AS SELECT 
 1 AS `city`,
 1 AS `total_crimes`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `average_victims`
--

/*!50001 DROP VIEW IF EXISTS `average_victims`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `average_victims` AS select `a`.`police_district` AS `police_district`,avg(`c`.`victims_num`) AS `avg_victims` from (`agency` `a` join `crime` `c` on((`a`.`agency_id` = `c`.`agency_id`))) group by `a`.`police_district` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `crime_grouped_by_nibrs`
--

/*!50001 DROP VIEW IF EXISTS `crime_grouped_by_nibrs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `crime_grouped_by_nibrs` AS select `n`.`NIBRS_code` AS `nibrs_code`,count(`c`.`crime_id`) AS `total_crimes`,group_concat(`o`.`crime_name` order by `o`.`crime_name` ASC separator ',') AS `crime_names` from ((`crime` `c` join `nibrs` `n` on((`c`.`NIBRS_id` = `n`.`NIBRS_id`))) join `offense` `o` on((`c`.`offense_id` = `o`.`offense_id`))) group by `n`.`NIBRS_code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `crimes_location_agency`
--

/*!50001 DROP VIEW IF EXISTS `crimes_location_agency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `crimes_location_agency` AS select `c`.`crime_id` AS `crime_id`,`c`.`cr_number` AS `cr_number`,`l`.`city` AS `city`,`a`.`police_district` AS `police_district`,`c`.`start_date` AS `start_date` from (((`crime` `c` join `crime_location` `cl` on((`c`.`crime_id` = `cl`.`crime_id`))) join `location` `l` on((`cl`.`location_id` = `l`.`location_id`))) join `agency` `a` on((`c`.`agency_id` = `a`.`agency_id`))) where (`l`.`city` = 'Bethesda') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `high_victim_crimes`
--

/*!50001 DROP VIEW IF EXISTS `high_victim_crimes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `high_victim_crimes` AS select `c`.`crime_id` AS `crime_id`,`c`.`cr_number` AS `cr_number`,`c`.`victims_num` AS `victims_num` from `crime` `c` where (`c`.`victims_num` > (select avg(`crime`.`victims_num`) from `crime`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_crimes_by_city`
--

/*!50001 DROP VIEW IF EXISTS `total_crimes_by_city`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_crimes_by_city` AS select `l`.`city` AS `city`,count(`c`.`crime_id`) AS `total_crimes` from ((`location` `l` join `crime_location` `cl` on((`l`.`location_id` = `cl`.`location_id`))) join `crime` `c` on((`cl`.`crime_id` = `c`.`crime_id`))) group by `l`.`city` having (count(`c`.`crime_id`) > 5) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-10  0:10:22
