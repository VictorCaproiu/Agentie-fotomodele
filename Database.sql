CREATE DATABASE  IF NOT EXISTS `agentie_foto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `agentie_foto`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: agentie_foto
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
-- Table structure for table `angajat`
--

DROP TABLE IF EXISTS `angajat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `angajat` (
  `AngajatID` int NOT NULL AUTO_INCREMENT,
  `DepartamentID` int DEFAULT NULL,
  `Nume` varchar(50) DEFAULT NULL,
  `Prenume` varchar(50) DEFAULT NULL,
  `CNP` char(13) DEFAULT NULL,
  `Strada` varchar(50) DEFAULT NULL,
  `Numar` int DEFAULT NULL,
  `Oras` varchar(50) DEFAULT NULL,
  `Judet` varchar(50) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `DataNasterii` date DEFAULT NULL,
  `DataAngajarii` date DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Telefon` char(10) DEFAULT NULL,
  `Parola` varchar(45) DEFAULT NULL,
  `FotomodelID` int DEFAULT NULL,
  PRIMARY KEY (`AngajatID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `angajat`
--

LOCK TABLES `angajat` WRITE;
/*!40000 ALTER TABLE `angajat` DISABLE KEYS */;
INSERT INTO `angajat` VALUES (1,101,'Popescu','Ana','2950713456789','Strada Principala',15,'Bucuresti','Ilfov','F','1995-03-15','2022-01-10','ana.popescu@email.com','0721123456','1234',101),(2,102,'Ionescu','Mihai','1801216789012','Bulevardul Central',25,'Cluj-Napoca','Cluj','M','1980-12-18','2021-05-20','mihai.ionescu@email.com','0722001122','1234',NULL),(3,102,'Radu','Cristina','2980912345678','Piata Libertatii',8,'Timisoara','Timis','F','1998-09-29','2023-02-28','cristina.radu@email.com','0723344556','1234',NULL),(4,101,'Stoica','Dragos','1760523456789','Aleea Verde',33,'Constanta','Constanta','M','1976-05-17','2022-08-05','dragos.stoica@email.com','0721555666','1234',103),(5,101,'Dumitru','Elena','2830412345678','Bulevardul Independentei',45,'Iasi','Iasi','F','1983-04-28','2021-11-15','elena.dumitru@email.com','0723000111','1234',102),(6,101,'Caproiu','Viktor','1941023456789','Strada Mihai Viteazu',21,'Bucuresti','Sector 5','M','2002-02-18','2023-04-03','victor.caproiu@email.com','0770130049','1212',104),(7,101,'Georgescu','Andreea','2870602345678','Bulevardul Carol I',12,'Brasov','Brasov','F','1987-06-28','2022-06-12','andreea.georgescu@email.com','0723666999','1234',105),(8,103,'Vasilescu','Alexandru','1980306789012','Calea Dorobantilor',78,'Ploiesti','Prahova','M','1998-03-01','2021-09-30','alexandru.vasilescu@email.com','0723111222','1234',NULL),(9,103,'Dragomir','Simona','2931123456789','Strada Traian',5,'Galati','Galati','F','1992-11-29','2023-01-08','simona.dragomir@email.com','0723777888','1234',NULL),(10,104,'Constantin','Gabriel','1770712345678','Bulevardul Unirii',56,'Craiova','Dolj','M','1977-07-17','2022-04-22','gabriel.constantin@email.com','0723444999','1234',NULL),(11,101,'Dumitrescu','Ioana','2850412345678','Calea Victoriei',10,'Bucuresti','Ilfov','F','1985-04-28','2022-01-05','ioana.dumitrescu@email.com','0721333444','1234',106),(12,101,'Negulescu','Ana-Maria','1961206789012','Strada Republicii',22,'Braila','Braila','F','1996-12-19','2021-04-15','ana.negulescu@email.com','0721888222','1234',107),(13,102,'Barbu','Elena','2941102345678','Bulevardul Decebal',18,'Craiova','Dolj','F','1994-11-29','2023-03-10','elena.barbu@email.com','0723444777','1234',NULL),(14,101,'Constantinescu','Andreea','1850813456789','Aleea Frumoasa',30,'Ploiesti','Prahova','F','1985-08-18','2022-07-20','andreea.constantinescu@email.com','0721666888','1234',108),(15,101,'Vasile','Camelia','2910306789012','Strada Unirii',40,'Cluj-Napoca','Cluj','F','1991-03-29','2021-10-05','camelia.vasile@email.com','0723444333','1234',109),(16,101,'Munteanu','Raluca','1750402345678','Piata Mare',14,'Sibiu','Sibiu','F','1975-04-17','2023-04-18','raluca.munteanu@email.com','0723222111','1234',110),(17,101,'Ivan','Adriana','2880623456789','Bulevardul Dacia',7,'Timisoara','Timis','F','1988-06-28','2022-05-12','adriana.ivan@email.com','0723999777','1234',111),(18,103,'Stanescu','Ana-Larisa','1991126789012','Strada Victoriei',25,'Galati','Galati','F','1999-11-19','2021-11-30','ana.stanescu@email.com','0723777666','1234',NULL),(19,101,'Serban','Gabriela','2960802345678','Aleea Florilor',5,'Constanta','Constanta','F','1996-08-29','2023-02-05','gabriela.serban@email.com','0723444222','1234',112),(20,104,'Cojocaru','Madalina','1860713456789','Calea Dorobantilor',17,'Iasi','Iasi','F','1986-07-18','2022-03-15','madalina.cojocaru@email.com','0723444333','1234',NULL);
/*!40000 ALTER TABLE `angajat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `angajateveniment`
--

DROP TABLE IF EXISTS `angajateveniment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `angajateveniment` (
  `EvenimentID` int NOT NULL,
  `AngajatID` int NOT NULL,
  `NrOreLucru` int DEFAULT NULL,
  `Compensatie` int DEFAULT NULL,
  PRIMARY KEY (`EvenimentID`,`AngajatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `angajateveniment`
--

LOCK TABLES `angajateveniment` WRITE;
/*!40000 ALTER TABLE `angajateveniment` DISABLE KEYS */;
INSERT INTO `angajateveniment` VALUES (1,2,8,25),(1,3,9,22),(1,5,8,25),(1,6,9,22),(1,9,7,30),(1,14,6,20),(1,19,5,24),(1,20,5,24),(2,1,8,25),(2,2,8,25),(2,4,7,30),(2,11,6,20),(2,12,6,20),(2,15,8,25),(2,16,9,22),(2,20,5,24),(3,2,8,25),(3,7,6,20),(3,8,7,30),(3,9,7,30),(3,10,6,20),(3,16,5,24),(3,18,9,22),(4,6,6,20),(4,10,7,30),(4,11,9,22),(4,12,7,30),(4,13,8,25),(4,17,5,24),(4,18,5,24);
/*!40000 ALTER TABLE `angajateveniment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienti` (
  `ClientID` int NOT NULL,
  `Denumire` varchar(50) DEFAULT NULL,
  `Sediu` varchar(50) DEFAULT NULL,
  `Telefon` char(10) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `CIF` char(8) DEFAULT NULL,
  PRIMARY KEY (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES (1,'Glamour Events Agency','Bulevardul Fashion nr. 15','0724000444','contact@glamourevents.com','65432109'),(2,'Chic Fashion Productions','Strada Elegantei nr. 30','0725000555','info@chicfashion.com','10987654'),(3,'Trendy Runway Services','Calea Stilului nr. 8','0726000666','trendy@runwayevents.ro','87654321');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departament`
--

DROP TABLE IF EXISTS `departament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departament` (
  `DepartamentID` int NOT NULL,
  `ManagerID` int DEFAULT NULL,
  `NumeDepartament` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DepartamentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departament`
--

LOCK TABLES `departament` WRITE;
/*!40000 ALTER TABLE `departament` DISABLE KEYS */;
INSERT INTO `departament` VALUES (101,12,'Fotomodele'),(102,13,'MakeUp'),(103,9,'Vestimentatie'),(104,10,'HR');
/*!40000 ALTER TABLE `departament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eveniment`
--

DROP TABLE IF EXISTS `eveniment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eveniment` (
  `EvenimentID` int NOT NULL AUTO_INCREMENT,
  `Titlu` varchar(50) DEFAULT NULL,
  `DataEv` datetime DEFAULT NULL,
  `Locatie` varchar(50) DEFAULT NULL,
  `CoordonatorID` int DEFAULT NULL,
  `ClientID` int DEFAULT NULL,
  PRIMARY KEY (`EvenimentID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eveniment`
--

LOCK TABLES `eveniment` WRITE;
/*!40000 ALTER TABLE `eveniment` DISABLE KEYS */;
INSERT INTO `eveniment` VALUES (1,'Fashion Gala 2023','2023-05-15 18:00:00','Palatul Culturii, Iasi',13,1),(2,'Spring Couture Show','2023-03-20 19:30:00','Grand Hotel, Bucuresti',NULL,2),(3,'Trendy Fashion Week','2023-06-10 17:00:00','Romexpo, Bucuresti',8,1),(4,'Chic Runway Festival','2023-04-08 20:00:00','Carol Park, Bucuresti',NULL,3);
/*!40000 ALTER TABLE `eveniment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotomodel`
--

DROP TABLE IF EXISTS `fotomodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotomodel` (
  `FotomodelID` int NOT NULL,
  `CuloareOchi` varchar(20) DEFAULT NULL,
  `CuloarePar` varchar(20) DEFAULT NULL,
  `Inaltime` int DEFAULT NULL,
  `MarimePantofi` int DEFAULT NULL,
  `DiamBust` int DEFAULT NULL,
  `DiamTalie` int DEFAULT NULL,
  `DiamSolduri` int DEFAULT NULL,
  PRIMARY KEY (`FotomodelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotomodel`
--

LOCK TABLES `fotomodel` WRITE;
/*!40000 ALTER TABLE `fotomodel` DISABLE KEYS */;
INSERT INTO `fotomodel` VALUES (101,'Caprui','Brunet',175,39,85,60,90),(102,'Caprui','Blond',170,38,88,62,92),(103,'Verzi','Roscat',165,37,80,58,88),(104,'Albastri','Blond',182,42,75,65,75),(105,'Albastri','Brunet',185,44,95,68,100),(106,'Caprui','Brunet',160,35,78,56,85),(107,'Verzi','Roscat',170,40,86,61,91),(108,'Caprui','Roscat',175,39,87,59,89),(109,'Albastri','Blond',180,41,92,64,94),(110,'Verzi','Roscat',165,36,79,57,87),(111,'Caprui','Brunet',170,38,88,63,93),(112,'Albastri','Brunet',185,43,94,67,99);
/*!40000 ALTER TABLE `fotomodel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-14 19:09:49
