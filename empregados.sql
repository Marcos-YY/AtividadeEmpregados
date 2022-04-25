-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: empregados
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_inicio` date NOT NULL,
  `data_fim` date DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `id_empregado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_empregado` (`id_empregado`),
  CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`id_empregado`) REFERENCES `empregado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (1,'2020-04-03','2024-04-03',NULL,1),(2,'2021-07-01',NULL,1265,2),(3,'2019-01-12',NULL,1850.7,3),(4,'2022-03-07',NULL,2500,4),(5,'2020-05-05','2022-05-05',3000,5),(6,'2019-10-01',NULL,NULL,6),(7,'2020-04-03','2024-04-03',4500,7),(8,'2021-08-04',NULL,2000,8),(9,'2016-01-05',NULL,1450,9),(10,'2020-12-14',NULL,1350,10);
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'administracao'),(2,'atendimento ao cliente'),(3,'marketing'),(4,'financeiro'),(5,'logistica'),(6,'Tecnologia da informacao'),(7,'estrategia'),(8,'recursos humanos'),(9,'auditoria'),(10,'servicos gerais');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc`
--

DROP TABLE IF EXISTS `doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc` (
  `id_empregado` int(11) NOT NULL,
  `rg` int(11) NOT NULL,
  `cpf` bigint(20) NOT NULL,
  `cnpj` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_empregado`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `cnpj` (`cnpj`),
  CONSTRAINT `doc_ibfk_1` FOREIGN KEY (`id_empregado`) REFERENCES `empregado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc`
--

LOCK TABLES `doc` WRITE;
/*!40000 ALTER TABLE `doc` DISABLE KEYS */;
INSERT INTO `doc` VALUES (1,2548965,15985212364,2258336000185),(2,4348521,45678925936,NULL),(3,5463978,95621536578,NULL),(4,4568526,68547122645,NULL),(5,5826478,36928547158,4369789000185),(6,8483697,25848952136,45249368000197),(7,2487893,22636978915,63147654000199),(8,4885632,78925845625,NULL),(9,5582635,58214736989,NULL),(10,3058456,4568416578,NULL);
/*!40000 ALTER TABLE `doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empregado`
--

DROP TABLE IF EXISTS `empregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empregado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_nasc` date NOT NULL,
  `nome` varchar(40) NOT NULL,
  `sobrenome` varchar(40) NOT NULL,
  `genero` varchar(1) NOT NULL,
  `id_funcao` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_funcao` (`id_funcao`),
  CONSTRAINT `empregado_ibfk_1` FOREIGN KEY (`id_funcao`) REFERENCES `funcao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empregado`
--

LOCK TABLES `empregado` WRITE;
/*!40000 ALTER TABLE `empregado` DISABLE KEYS */;
INSERT INTO `empregado` VALUES (1,'1999-09-07','Marcos','Willian','M',1),(2,'2001-04-03','Pedro','souza','M',3),(3,'1997-07-22','Leticia','Barboza','F',6),(4,'1999-08-09','Gabriel','Lopes','M',7),(5,'1989-02-13','Paulo','Cezar','M',10),(6,'1985-09-23','Israel','Rodrigues','M',12),(7,'1990-01-30','Thiago','Santos','M',14),(8,'1999-02-11','Thais','Ribeiro','F',17),(9,'1973-07-31','Luzia','Silva','F',19),(10,'2000-03-17','Natalia','Santana','F',21);
/*!40000 ALTER TABLE `empregado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `logradouro` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` char(2) NOT NULL,
  `id_empregado` int(11) NOT NULL,
  PRIMARY KEY (`id_empregado`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`id_empregado`) REFERENCES `empregado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES ('chacara 129 condominio alvorada','24a','rua 8','vicente pires','DF',1),('qnn 25 conjunto e','36','ceilandia norte','ceilandia','DF',2),('qng 32 conjunto f','45','taguatinga norte','taguatinga','DF',3),('qi 6 conjunto m','4','lago norte','brasilia','DF',4),('qi 12 conjunto l','8','lago sul','brasilia','DF',5),('qi 6 conjunto m','16','lago norte','brasilia','DF',6),('EQN 504/507 conjunto m','45','asa norte','brasilia','DF',7),('EQS 701/702 conjunto d','11','asa sul','brasilia','DF',8),('rua quatorze','15','quadra 33','Aguas lindas','GO',9),('rua 18','28','rua caite','valparaiso de goias','GO',10);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcao`
--

DROP TABLE IF EXISTS `funcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(100) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `funcao_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcao`
--

LOCK TABLES `funcao` WRITE;
/*!40000 ALTER TABLE `funcao` DISABLE KEYS */;
INSERT INTO `funcao` VALUES (1,'presidente',1),(2,'vice-presidente',1),(3,'helpdesk',2),(4,'telemarketing',2),(5,'designer',3),(6,'midias sociais',3),(7,'contabil',4),(8,'auditor fiscal',4),(9,'gerente de logistica',5),(10,'coordenador de comercio',5),(11,'gerente de projeto',6),(12,'analista senior',6),(13,'desenvolvedor',6),(14,'CEO',7),(15,'CIO',7),(16,'recrutador',8),(17,'departamento pessoal',8),(18,'analista de testes',9),(19,'limpeza',10),(20,'seguranca',10),(21,'secretaria',10);
/*!40000 ALTER TABLE `funcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone` (
  `id_empregado` int(11) NOT NULL,
  `ddd` smallint(3) NOT NULL,
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`id_empregado`),
  CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`id_empregado`) REFERENCES `empregado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` VALUES (1,61,991075845),(2,61,986542587),(3,61,994265481),(4,61,986548796),(5,61,984258721),(6,61,991075845),(7,61,994965835),(8,61,981584795),(9,62,991670055),(10,62,991250775);
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-24 23:07:16
