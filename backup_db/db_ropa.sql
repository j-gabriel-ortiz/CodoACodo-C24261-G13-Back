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
  `id_ropa` int(11) NOT NULL AUTO_INCREMENT,
  `img_ropa` varchar(255) NOT NULL,
  `nombre_ropa` varchar(255) NOT NULL,
  `precio_ropa` int(11) NOT NULL,
  PRIMARY KEY (`id_ropa`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_ropa`
--

LOCK TABLES `detalles_ropa` WRITE;
/*!40000 ALTER TABLE `detalles_ropa` DISABLE KEYS */;
INSERT INTO `detalles_ropa` VALUES (1,'../Imagenes/Remeras/RemeraAdolescente/Hombre/Remera-azul-new-york.jpg','New York',600),(2,'../Imagenes/Remeras/RemeraAdolescente/Hombre/Remera-thor.jpg','Thor',750),(3,'../Imagenes/Remeras/RemeraAdolescente/Hombre/Remera-Argentina.webp','Remera de Argentina',1000),(4,'../Imagenes/Remeras/RemeraAdolescente/Hombre/Remera-blanca-negra-amarilla.jpg','Onda Street',500),(5,'../Imagenes/Remeras/RemeraAdolescente/Hombre/Remera-negra.webp','Remera Lisa Negra',350),(6,'../Imagenes/Remeras/RemeraAdolescente/Mujer/calavera-con-flores.png','Dream Alive',500),(7,'../Imagenes/Remeras/RemeraAdolescente/Mujer/lilo.jpg','Lilo',600),(8,'../Imagenes/Remeras/RemeraAdolescente/Mujer/calavera-con-mariposas.webp','Pink Skull',750),(9,'../Imagenes/Remeras/RemeraAdolescente/Mujer/its-girl-things.jpg','Girl Things',1000);
/*!40000 ALTER TABLE `detalles_ropa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_talles`
--

DROP TABLE IF EXISTS `detalles_talles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_talles` (
  `id_detalles_talles` int(11) NOT NULL AUTO_INCREMENT,
  `id_ropa` int(11) NOT NULL,
  `id_talles` int(11) NOT NULL,
  PRIMARY KEY (`id_detalles_talles`),
  KEY `detalles_talles_ibfk_1` (`id_ropa`),
  KEY `detalles_talles_ibfk_2` (`id_talles`),
  CONSTRAINT `detalles_talles_ibfk_1` FOREIGN KEY (`id_ropa`) REFERENCES `detalles_ropa` (`id_ropa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detalles_talles_ibfk_2` FOREIGN KEY (`id_talles`) REFERENCES `talles_ropa` (`id_talles`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_talles`
--

LOCK TABLES `detalles_talles` WRITE;
/*!40000 ALTER TABLE `detalles_talles` DISABLE KEYS */;
INSERT INTO `detalles_talles` VALUES (1,1,2),(2,1,3),(3,1,4),(4,1,5),(5,2,3),(6,2,4),(7,2,5),(8,2,6),(9,3,4),(10,3,5),(11,3,6),(12,4,3),(13,4,4),(14,4,5),(15,4,6),(16,5,2),(17,5,3),(18,5,4),(19,5,5),(20,5,6),(21,6,2),(22,6,3),(23,6,4),(24,7,3),(25,7,4),(26,7,5),(27,7,6),(28,8,2),(29,8,3),(30,8,4),(31,9,2),(32,9,3),(33,9,4),(34,9,5);
/*!40000 ALTER TABLE `detalles_talles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_tipo`
--

DROP TABLE IF EXISTS `detalles_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_tipo` (
  `id_detalles_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `id_ropa` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  PRIMARY KEY (`id_detalles_tipo`),
  KEY `detalles_tipo_ibfk_1` (`id_ropa`),
  KEY `detalles_tipo_ibfk_2` (`id_tipo`),
  CONSTRAINT `detalles_tipo_ibfk_1` FOREIGN KEY (`id_ropa`) REFERENCES `detalles_ropa` (`id_ropa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detalles_tipo_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_ropa` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_tipo`
--

LOCK TABLES `detalles_tipo` WRITE;
/*!40000 ALTER TABLE `detalles_tipo` DISABLE KEYS */;
INSERT INTO `detalles_tipo` VALUES (1,1,3),(2,2,3),(3,3,3),(4,4,3),(5,5,3),(6,6,2),(7,7,2),(8,8,2),(9,9,2);
/*!40000 ALTER TABLE `detalles_tipo` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_ropa`
--

LOCK TABLES `tipo_ropa` WRITE;
/*!40000 ALTER TABLE `tipo_ropa` DISABLE KEYS */;
INSERT INTO `tipo_ropa` VALUES (1,'adolecente'),(2,'mujer'),(3,'hombre');
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

-- Dump completed on 2024-06-30  8:48:42
