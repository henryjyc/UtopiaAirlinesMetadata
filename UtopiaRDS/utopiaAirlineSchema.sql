-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: utopiaairlines
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_airports`
--

DROP TABLE IF EXISTS `tbl_airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_airports` (
  `code` char(3) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `idtbl_airports_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_airports`
--

LOCK TABLES `tbl_airports` WRITE;
/*!40000 ALTER TABLE `tbl_airports` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_flights`
--

DROP TABLE IF EXISTS `tbl_flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_flights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departure` char(3) NOT NULL,
  `destination` char(3) NOT NULL,
  `departure_date` datetime NOT NULL,
  `arrival_date` datetime NOT NULL,
  `flight_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idtbl_flights_UNIQUE` (`id`),
  KEY `departure_idx` (`departure`),
  KEY `destination_idx` (`destination`),
  CONSTRAINT `departure` FOREIGN KEY (`departure`) REFERENCES `tbl_airports` (`code`),
  CONSTRAINT `destination` FOREIGN KEY (`destination`) REFERENCES `tbl_airports` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_flights`
--

LOCK TABLES `tbl_flights` WRITE;
/*!40000 ALTER TABLE `tbl_flights` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tickets`
--

DROP TABLE IF EXISTS `tbl_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_tickets` (
  `flight` int(11) NOT NULL,
  `row` int(11) NOT NULL,
  `seat` char(1) NOT NULL,
  `class` int(11) NOT NULL,
  `reserver` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `reservation_timeout` datetime DEFAULT NULL,
  PRIMARY KEY (`flight`,`row`,`seat`),
  KEY `reserver_idx` (`reserver`),
  CONSTRAINT `flight` FOREIGN KEY (`flight`) REFERENCES `tbl_flights` (`id`),
  CONSTRAINT `reserver` FOREIGN KEY (`reserver`) REFERENCES `tbl_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tickets`
--

LOCK TABLES `tbl_tickets` WRITE;
/*!40000 ALTER TABLE `tbl_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `display_name` varchar(45) DEFAULT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-03 17:42:21
