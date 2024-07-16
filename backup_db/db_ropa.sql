-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: db_ropa
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `detalles_ropa`
--

DROP TABLE IF EXISTS `detalles_ropa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_ropa` (
  `id_ropa` int(11) NOT NULL,
  `img_ropa` varchar(255) NOT NULL,
  `nombre_ropa` varchar(255) NOT NULL,
  `precio_ropa` int(11) NOT NULL,
  PRIMARY KEY (`id_ropa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_ropa`
--

LOCK TABLES `detalles_ropa` WRITE;
/*!40000 ALTER TABLE `detalles_ropa` DISABLE KEYS */;
INSERT INTO `detalles_ropa` VALUES (1,'../imagenes/ropa/gorras/g-001.png','Gorra Negra Underarmor',1500),(2,'../imagenes/ropa/gorras/g-002.png','Gorra Negra Since 2005',1200),(3,'../imagenes/ropa/gorras/g-003.png','Gorra Verde ESTD 1973',1350),(4,'../imagenes/ropa/remeras/rem-ah-001.webp','Remera Argentina',2500),(5,'../imagenes/ropa/remeras/rem-ah-002.jpg','Remera New York',2130),(6,'../imagenes/ropa/remeras/rem-ah-003.jpg','Remera Onda Street',2130),(7,'../imagenes/ropa/remeras/rem-ah-004.webp','Remera Negra',1800),(8,'../imagenes/ropa/remeras/rem-ah-005.jpg','Marvel Thor',1960),(9,'../imagenes/ropa/remeras/rem-am-001.png','Dream Alive',1985),(10,'../imagenes/ropa/remeras/rem-am-002.webp','Calavera Rosa',2200),(11,'../imagenes/ropa/remeras/rem-am-003.jpg','Girl Things',1750),(12,'../imagenes/ropa/remeras/rem-am-004.jpg','Musculosa Lilo',2130),(13,'../imagenes/ropa/remeras/rem-h-001.webp','Remera Azul',1760),(14,'../imagenes/ropa/remeras/rem-h-002.webp','Remera Naranja',1840),(15,'../imagenes/ropa/remeras/rem-h-003.webp','Remera Mountain',2000),(16,'../imagenes/ropa/remeras/rem-h-004.webp','Remera Roja',1760),(17,'../imagenes/ropa/remeras/rem-h-005.webp','Remera Blanca',1760),(18,'../imagenes/ropa/remeras/rem-m-001.jpg','Remera Negra Estampada',2250),(19,'../imagenes/ropa/remeras/rem-m-002.jpg','Remera Roja Deportiva',1950),(20,'../imagenes/ropa/remeras/rem-m-003.jpg','Remera Gris con Rayas',2080),(21,'../imagenes/ropa/remeras/rem-m-004.jpg','Blusa Blanca',2400);
/*!40000 ALTER TABLE `detalles_ropa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_talles`
--

DROP TABLE IF EXISTS `detalles_talles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_talles` (
  `id_detalles_talles` int(11) NOT NULL,
  `id_ropa` int(11) NOT NULL,
  `id_talles` int(11) NOT NULL,
  `validacion_talle` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_detalles_talles`),
  KEY `detalles_talles_ibfk_1` (`id_ropa`),
  KEY `detalles_talles_ibfk_2` (`id_talles`),
  CONSTRAINT `detalles_talles_ibfk_1` FOREIGN KEY (`id_ropa`) REFERENCES `detalles_ropa` (`id_ropa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detalles_talles_ibfk_2` FOREIGN KEY (`id_talles`) REFERENCES `talles_ropa` (`id_talles`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_talles`
--

LOCK TABLES `detalles_talles` WRITE;
/*!40000 ALTER TABLE `detalles_talles` DISABLE KEYS */;
INSERT INTO `detalles_talles` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,4,1),(5,1,5,1),(6,1,6,1),(7,2,1,1),(8,2,2,1),(9,2,3,1),(10,2,4,1),(11,2,5,1),(12,2,6,1),(13,3,1,1),(14,3,2,1),(15,3,3,1),(16,3,4,1),(17,3,5,1),(18,3,6,1),(19,4,1,0),(20,4,2,0),(21,4,3,1),(22,4,4,1),(23,4,5,1),(24,4,6,1),(25,5,1,0),(26,5,2,1),(27,5,3,1),(28,5,4,1),(29,5,5,1),(30,5,6,0),(31,6,1,1),(32,6,2,1),(33,6,3,1),(34,6,4,1),(35,6,5,0),(36,6,6,0),(37,7,1,0),(38,7,2,1),(39,7,3,1),(40,7,4,1),(41,7,5,1),(42,7,6,1),(43,8,1,0),(44,8,2,1),(45,8,3,1),(46,8,4,1),(47,8,5,1),(48,8,6,0),(49,9,1,1),(50,9,2,1),(51,9,3,1),(52,9,4,1),(53,9,5,0),(54,9,6,0),(55,10,1,1),(56,10,2,1),(57,10,3,1),(58,10,4,1),(59,10,5,1),(60,10,6,1),(61,11,1,1),(62,11,2,1),(63,11,3,1),(64,11,4,1),(65,11,5,1),(66,11,6,0),(67,12,1,0),(68,12,2,1),(69,12,3,1),(70,12,4,1),(71,12,5,1),(72,12,6,1),(73,13,1,0),(74,13,2,0),(75,13,3,1),(76,13,4,1),(77,13,5,1),(78,13,6,1),(79,14,1,0),(80,14,2,1),(81,14,3,1),(82,14,4,1),(83,14,5,1),(84,14,6,1),(85,15,1,0),(86,15,2,1),(87,15,3,1),(88,15,4,1),(89,15,5,1),(90,15,6,1),(91,16,1,1),(92,16,2,1),(93,16,3,1),(94,16,4,1),(95,16,5,1),(96,16,6,0),(97,17,1,1),(98,17,2,1),(99,17,3,1),(100,17,4,1),(101,17,5,1),(102,17,6,1),(103,18,1,1),(104,18,2,1),(105,18,3,1),(106,18,4,1),(107,18,5,1),(108,18,6,0),(109,19,1,1),(110,19,2,1),(111,19,3,1),(112,19,4,1),(113,19,5,1),(114,19,6,1),(115,20,1,0),(116,20,2,0),(117,20,3,1),(118,20,4,1),(119,20,5,1),(120,20,6,1),(121,21,1,0),(122,21,2,1),(123,21,3,1),(124,21,4,1),(125,21,5,1),(126,21,6,0);
/*!40000 ALTER TABLE `detalles_talles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_tipo`
--

DROP TABLE IF EXISTS `detalles_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_tipo` (
  `id_detalles_tipo` int(11) NOT NULL,
  `id_ropa` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  PRIMARY KEY (`id_detalles_tipo`),
  KEY `detalles_tipo_ibfk_1` (`id_ropa`),
  KEY `detalles_tipo_ibfk_2` (`id_tipo`),
  CONSTRAINT `detalles_tipo_ibfk_1` FOREIGN KEY (`id_ropa`) REFERENCES `detalles_ropa` (`id_ropa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detalles_tipo_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_ropa` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_tipo`
--

LOCK TABLES `detalles_tipo` WRITE;
/*!40000 ALTER TABLE `detalles_tipo` DISABLE KEYS */;
INSERT INTO `detalles_tipo` VALUES (1,1,4),(2,2,4),(3,3,4),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,3),(14,14,3),(15,15,3),(16,16,3),(17,17,3),(18,18,2),(19,19,2),(20,20,2),(21,21,2);
/*!40000 ALTER TABLE `detalles_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img_exposicion_ropa`
--

DROP TABLE IF EXISTS `img_exposicion_ropa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `img_exposicion_ropa` (
  `id_exp` int(11) NOT NULL AUTO_INCREMENT,
  `img_exp` varchar(180) NOT NULL,
  `alt_exp` varchar(100) NOT NULL,
  PRIMARY KEY (`id_exp`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img_exposicion_ropa`
--

LOCK TABLES `img_exposicion_ropa` WRITE;
/*!40000 ALTER TABLE `img_exposicion_ropa` DISABLE KEYS */;
INSERT INTO `img_exposicion_ropa` VALUES (1,'./imagenes/exposicion/exp-001.jpeg','mujer con conjunto de jean y remera blanca'),(2,'./imagenes/exposicion/exp-002.jpeg','hombre con jeans, gorra y remera negra'),(3,'./imagenes/exposicion/exp-003.jpeg','hombre con pantalon de vestir, camisa a cuadros'),(4,'./imagenes/exposicion/exp-004.jpeg','mujer con buzo y calza'),(5,'./imagenes/exposicion/exp-005.jpeg','mujer con camisa con lunares y pantalon negro'),(6,'./imagenes/exposicion/exp-006.jpeg','hombre con jeans, camisa y remera'),(7,'./imagenes/exposicion/exp-007.jpeg','hombre con conjunto deportivo'),(8,'./imagenes/exposicion/exp-008.jpeg','hombre con jeans, campera negra y remera'),(9,'./imagenes/exposicion/exp-009.jpeg','mujer con vestido negro corto'),(10,'./imagenes/exposicion/exp-010.jpeg','mujer con remera y falda de jean'),(11,'./imagenes/exposicion/exp-011.jpeg','hombre con pantalones cortos y remera deportiva'),(12,'./imagenes/exposicion/exp-012.jpeg','hombre con jeans, gorra y remera negra'),(13,'./imagenes/exposicion/exp-013.jpeg','mujer con conjunto de jean y remera blanca'),(14,'./imagenes/exposicion/exp-014.jpeg','mujer con buzo y calza');
/*!40000 ALTER TABLE `img_exposicion_ropa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talles_ropa`
--

DROP TABLE IF EXISTS `talles_ropa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talles_ropa` (
  `id_talles` int(11) NOT NULL AUTO_INCREMENT,
  `talle_ropa` varchar(100) NOT NULL,
  PRIMARY KEY (`id_talles`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talles_ropa`
--

LOCK TABLES `talles_ropa` WRITE;
/*!40000 ALTER TABLE `talles_ropa` DISABLE KEYS */;
INSERT INTO `talles_ropa` VALUES (1,'xs'),(2,'s'),(3,'m'),(4,'l'),(5,'xl'),(6,'xxl');
/*!40000 ALTER TABLE `talles_ropa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_ropa`
--

DROP TABLE IF EXISTS `tipo_ropa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_ropa` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `ropa_para` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_ropa`
--

LOCK TABLES `tipo_ropa` WRITE;
/*!40000 ALTER TABLE `tipo_ropa` DISABLE KEYS */;
INSERT INTO `tipo_ropa` VALUES (1,'adolecente'),(2,'mujer'),(3,'hombre'),(4,'gorras');
/*!40000 ALTER TABLE `tipo_ropa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-16 20:13:16
