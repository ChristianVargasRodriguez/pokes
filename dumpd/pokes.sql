CREATE DATABASE  IF NOT EXISTS `poke` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `poke`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: poke
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `poke`
--

DROP TABLE IF EXISTS `poke`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poke` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `poked_by_user_id` int NOT NULL,
  `poked_user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_poke_user1_idx` (`poked_by_user_id`),
  KEY `fk_poke_user2_idx` (`poked_user_id`),
  CONSTRAINT `fk_poke_user1` FOREIGN KEY (`poked_by_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_poke_user2` FOREIGN KEY (`poked_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poke`
--

LOCK TABLES `poke` WRITE;
/*!40000 ALTER TABLE `poke` DISABLE KEYS */;
INSERT INTO `poke` VALUES (1,'2023-03-13 20:39:21','2023-03-13 20:39:21',1,2),(2,'2023-03-13 20:39:43','2023-03-13 20:39:43',2,1),(3,'2023-03-13 22:07:52','2023-03-13 22:07:52',1,2),(4,'2023-03-13 22:26:00','2023-03-13 22:26:00',1,2),(5,'2023-03-13 22:26:40','2023-03-13 22:26:40',2,1),(6,'2023-03-13 22:26:46','2023-03-13 22:26:46',2,1),(7,'2023-03-13 22:29:46','2023-03-13 22:29:46',2,1),(8,'2023-03-13 22:31:27','2023-03-13 22:31:27',3,1),(9,'2023-03-13 22:31:34','2023-03-13 22:31:34',3,2),(10,'2023-03-13 22:31:34','2023-03-13 22:31:34',3,2),(11,'2023-03-13 23:21:15','2023-03-13 23:21:15',3,1),(12,'2023-03-13 23:21:15','2023-03-13 23:21:15',3,1),(13,'2023-03-13 23:21:16','2023-03-13 23:21:16',3,1),(14,'2023-03-13 23:21:16','2023-03-13 23:21:16',3,1),(15,'2023-03-13 23:21:16','2023-03-13 23:21:16',3,1),(16,'2023-03-13 23:21:16','2023-03-13 23:21:16',3,1),(17,'2023-03-13 23:21:59','2023-03-13 23:21:59',1,3),(18,'2023-03-13 23:22:04','2023-03-13 23:22:04',1,3),(19,'2023-03-13 23:29:54','2023-03-13 23:29:54',4,5),(20,'2023-03-13 23:29:56','2023-03-13 23:29:56',4,6),(21,'2023-03-13 23:29:58','2023-03-13 23:29:58',4,7),(22,'2023-03-13 23:29:59','2023-03-13 23:29:59',4,7),(23,'2023-03-13 23:30:00','2023-03-13 23:30:00',4,6),(24,'2023-03-13 23:30:01','2023-03-13 23:30:01',4,5),(25,'2023-03-13 23:30:02','2023-03-13 23:30:02',4,5),(26,'2023-03-13 23:30:05','2023-03-13 23:30:05',4,10),(27,'2023-03-13 23:30:06','2023-03-13 23:30:06',4,6),(28,'2023-03-13 23:30:08','2023-03-13 23:30:08',4,9),(29,'2023-03-13 23:30:10','2023-03-13 23:30:10',4,9),(30,'2023-03-13 23:30:11','2023-03-13 23:30:11',4,8),(31,'2023-03-13 23:30:11','2023-03-13 23:30:11',4,8),(32,'2023-03-13 23:30:14','2023-03-13 23:30:14',4,8),(33,'2023-03-13 23:30:14','2023-03-13 23:30:14',4,8);
/*!40000 ALTER TABLE `poke` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'name1','name11','name1@mail.com','$2b$12$fYeZAGErwpDIS7DPoQR6xOxVGxOBn3E07TOyxTn9gyI3ITT49Snf6','1980-01-01','2023-03-13 19:58:58','2023-03-13 19:58:58'),(2,'name2','name23','name2@mail.com','$2b$12$CCcWa0CVQxpfFPcJgAndje5aL7UX20WnrhOa1Hospl0jvMlRf4AXy','2001-03-01','2023-03-13 19:59:45','2023-03-13 19:59:45'),(3,'name3','name33','name3@mail.com','$2b$12$9ljmUlZyuAR3DnJBy/Mwpebpz5rV2FeufhvK6BVPVTxdxyeYDr93a','1988-03-03','2023-03-13 22:30:51','2023-03-13 22:30:51'),(4,'name4','name44','name4@mail.com','$2b$12$ZECKiuYcvGJxKkpKKPK8SuKARnZiiGOcdQt7NnOJUPVsnfQKJkgdC','1997-03-23','2023-03-13 23:26:40','2023-03-13 23:26:40'),(5,'name5','name55','name5@mail.com','$2b$12$TGy677I5gcYOOVSIevvOuOsPNx66yJojPIRJRPBB858YHVrnZ4WIO','1970-03-28','2023-03-13 23:27:11','2023-03-13 23:27:11'),(6,'name6','name66','name6@mail.com','$2b$12$4S5ykakxP4LPb3rIxAtDSu25dMVAGGe7FervHRRKegzJU/.n8zBhS','1995-03-08','2023-03-13 23:27:38','2023-03-13 23:27:38'),(7,'name7','name77','name7@mail.com','$2b$12$NZpVpBdYWtU1YXZZCOJA8uOREK44BhMSnIuCi9lOQevd.FtTz6u6m','1990-03-09','2023-03-13 23:28:06','2023-03-13 23:28:06'),(8,'name8','name88','name8@mail.com','$2b$12$kDQKb/WshXLqiit3x9ZHEeeQW1iggzustE3pNOgq8.gycCuVQEoGu','1991-02-03','2023-03-13 23:28:31','2023-03-13 23:28:31'),(9,'name9','name99','name9@mail.com','$2b$12$wKOZ05THgovvrhjFipoWm.naB4kaedSyd1MHYV7JbDuG39S/aOQIy','1995-08-24','2023-03-13 23:29:06','2023-03-13 23:29:06'),(10,'name10','name1010','name10@mail.com','$2b$12$vnUtvsZaNyC4wCo7DmyB2OwWbtRIBE1u9NHZarCV46/Jo2AkNOfim','1999-09-25','2023-03-13 23:29:35','2023-03-13 23:29:35');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-13 23:35:58
