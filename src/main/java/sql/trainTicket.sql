CREATE DATABASE  IF NOT EXISTS `trainticket` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trainticket`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: trainticket
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `trainNo` varchar(10) NOT NULL,
  `departStation` varchar(100) DEFAULT NULL,
  `arriveStation` varchar(100) DEFAULT NULL,
  `departTime` time DEFAULT NULL,
  `arriveTime` time DEFAULT NULL,
  PRIMARY KEY (`trainNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES ('2001','南港','左營','08:00:00','10:10:00'),('2002','台北','桃園','09:00:00','09:30:00'),('2003','台南','台中','12:30:00','13:30:00'),('2004','嘉義','苗栗','15:00:00','16:10:00'),('2005','台北','苗栗','15:00:00','16:10:00'),('2006','南港','左營','10:00:00','12:10:00'),('2007','南港','左營','13:30:00','15:20:00'),('2008','台南','苗栗','17:30:00','18:10:00');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticketId` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(12) DEFAULT NULL,
  `trainNo` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `trainCarId` varchar(10) DEFAULT NULL,
  `seatId` int NOT NULL,
  `price` int NOT NULL,
  `bookTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ticketId`),
  UNIQUE KEY `date` (`date`,`trainNo`,`trainCarId`,`seatId`),
  KEY `trainNo` (`trainNo`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`trainNo`) REFERENCES `schedule` (`trainNo`)
) ENGINE=InnoDB AUTO_INCREMENT=6003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (6001,'A123456789','2001','2024-01-17','A',12,1200,'2024-01-17 07:40:21'),(6002,'A234567891','2002','2024-01-17','C',20,40,'2024-01-18 07:50:21'),(6003,'A345678912','2003','2024-01-20','B',25,1200,'2023-12-05 12:40:35'),(6004,'A123456789','2007','2024-02-20','C',10,1200,'2024-01-20 08:50:21'),(6005,'A345678912','2005','2024-03-20','A',25,450,'2023-11-15 15:20:35');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-17 15:44:40
