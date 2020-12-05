-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: db_faculdade
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `RA` int NOT NULL AUTO_INCREMENT,
  `Nome_Aluno` varchar(20) NOT NULL,
  `Sobrenome_Aluno` varchar(20) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `Status_Aluno` tinyint NOT NULL,
  `Cod_Turma` int DEFAULT NULL,
  `Sexo` varchar(1) DEFAULT NULL,
  `Cod_Curso` int DEFAULT NULL,
  `Nome_Pai` varchar(50) NOT NULL,
  `Nome_Mae` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Whatsapp` varchar(20) NOT NULL,
  PRIMARY KEY (`RA`),
  KEY `fk_Cod_Turma_Aluno` (`Cod_Turma`),
  KEY `fk_Cod_Curso_Aluno` (`Cod_Curso`),
  CONSTRAINT `fk_Cod_Curso_Aluno` FOREIGN KEY (`Cod_Curso`) REFERENCES `curso` (`Cod_Curso`),
  CONSTRAINT `fk_Cod_Turma_Aluno` FOREIGN KEY (`Cod_Turma`) REFERENCES `turma` (`Cod_Turma`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Marcos','Aurelio Martins','14278914536',1,2,'M',3,'Marcio Aurelio','Maria Aparecida','marcosaurelio@gmail.com','946231249'),(2,'Gabriel','Fernando de Almeida','14470954536',1,1,'M',1,'Adão Almeida','Fernanda Almeida','gabrielalmeida@yahoo.com','941741247'),(3,'Beatriz','Sonia Meneguel','1520984537',1,3,'F',3,'Samuel Meneguel','Gabriella Meneguel','batrizmene@hotmail.com','945781412'),(4,'Jorge','Soares','14223651562',1,3,'M',4,'João Soares','Maria Richter','jorgesoares@gmail.com','925637857'),(5,'Ana Paula','Ferretti','32968914522',1,3,'F',5,'Marcio Ferretti','Ana Hoffbahn','anapaulaferretti@hotmail.com','974267423'),(6,'Mônica','Yamaguti','32988914510',1,2,'F',6,'Wilson Oliveira','Fernanda Yamaguti','monyamaguti@outlook.com','932619560');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_disc`
--

DROP TABLE IF EXISTS `aluno_disc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_disc` (
  `RA` int NOT NULL,
  `Cod_Disciplina` int NOT NULL,
  PRIMARY KEY (`RA`,`Cod_Disciplina`),
  KEY `fk_Cod_Disciplina_Aluno` (`Cod_Disciplina`),
  CONSTRAINT `fk_Cod_Disciplina_Aluno` FOREIGN KEY (`Cod_Disciplina`) REFERENCES `disciplina` (`Cod_Disciplina`),
  CONSTRAINT `fk_RA_Aluno` FOREIGN KEY (`RA`) REFERENCES `aluno` (`RA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_disc`
--

LOCK TABLES `aluno_disc` WRITE;
/*!40000 ALTER TABLE `aluno_disc` DISABLE KEYS */;
INSERT INTO `aluno_disc` VALUES (3,1),(6,1),(1,2),(2,3),(4,3),(5,4);
/*!40000 ALTER TABLE `aluno_disc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `Cod_Curso` int NOT NULL AUTO_INCREMENT,
  `Nome_Curso` varchar(30) DEFAULT NULL,
  `Cod_Departamento` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Curso`),
  KEY `fk_Cod_Departamento` (`Cod_Departamento`),
  CONSTRAINT `fk_Cod_Departamento` FOREIGN KEY (`Cod_Departamento`) REFERENCES `departamento` (`Cod_Departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Matemática',2),(2,'Psicologia',1),(3,'Análise de Sistemas',2),(4,'Biologia',3),(5,'História',1),(6,'Engenharia',2);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_disciplina`
--

DROP TABLE IF EXISTS `curso_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_disciplina` (
  `Cod_Curso` int NOT NULL,
  `Cod_Disciplina` int NOT NULL,
  PRIMARY KEY (`Cod_Curso`,`Cod_Disciplina`),
  KEY `fk_Cod_Disciplina_Disci` (`Cod_Disciplina`),
  CONSTRAINT `fk_Cod_Curso_Disci` FOREIGN KEY (`Cod_Curso`) REFERENCES `curso` (`Cod_Curso`),
  CONSTRAINT `fk_Cod_Disciplina_Disci` FOREIGN KEY (`Cod_Disciplina`) REFERENCES `disciplina` (`Cod_Disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_disciplina`
--

LOCK TABLES `curso_disciplina` WRITE;
/*!40000 ALTER TABLE `curso_disciplina` DISABLE KEYS */;
INSERT INTO `curso_disciplina` VALUES (1,1),(2,2),(3,3),(6,4);
/*!40000 ALTER TABLE `curso_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `Cod_Departamento` int NOT NULL AUTO_INCREMENT,
  `Nome_departamento` varchar(20) NOT NULL,
  PRIMARY KEY (`Cod_Departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Ciências Humanas'),(2,'Matemática'),(3,'Biológicas'),(4,'Estágio');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disc_hist`
--

DROP TABLE IF EXISTS `disc_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disc_hist` (
  `Cod_Historico` int NOT NULL,
  `Cod_Disciplina` int NOT NULL,
  `Nota` float(4,2) DEFAULT NULL,
  `Frequência` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Historico`,`Cod_Disciplina`),
  KEY `fk_Cod_Disciplina_Hist` (`Cod_Disciplina`),
  CONSTRAINT `fk_Cod_Disciplina_Hist` FOREIGN KEY (`Cod_Disciplina`) REFERENCES `disciplina` (`Cod_Disciplina`),
  CONSTRAINT `fk_Cod_Historico` FOREIGN KEY (`Cod_Historico`) REFERENCES `historico` (`Cod_Historico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disc_hist`
--

LOCK TABLES `disc_hist` WRITE;
/*!40000 ALTER TABLE `disc_hist` DISABLE KEYS */;
INSERT INTO `disc_hist` VALUES (1,2,7.00,6),(2,3,8.50,2),(3,1,6.80,8);
/*!40000 ALTER TABLE `disc_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `Cod_Disciplina` int NOT NULL AUTO_INCREMENT,
  `Cod_Disciplina_Depende` int DEFAULT NULL,
  `Nome_Disciplina` varchar(30) DEFAULT NULL,
  `Cod_Departamento` int NOT NULL,
  `Carga_Horaria` int NOT NULL,
  `Descrição` varchar(80) DEFAULT NULL,
  `Num_Alunos` int NOT NULL,
  PRIMARY KEY (`Cod_Disciplina`),
  KEY `fk_Cod_Departamento_Disciplina` (`Cod_Departamento`),
  KEY `fk_Cod_Disciplina` (`Cod_Disciplina_Depende`),
  CONSTRAINT `fk_Cod_Departamento_Disciplina` FOREIGN KEY (`Cod_Departamento`) REFERENCES `departamento` (`Cod_Departamento`),
  CONSTRAINT `fk_Cod_Disciplina` FOREIGN KEY (`Cod_Disciplina_Depende`) REFERENCES `disciplina` (`Cod_Disciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,NULL,'Raciocínio Lógico',2,1200,'Desenvolver o raciocínio lógico',50),(2,NULL,'Psicologia Cognitiva',1,1400,'Entender o funcionamento do aprendizado',30),(3,NULL,'Programação em C',2,1200,'Aprender uma linguagem de programação',20),(4,NULL,'Eletrônica Digital',2,300,'Funcionamento de circuitos digitais',30);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_aluno`
--

DROP TABLE IF EXISTS `endereco_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_aluno` (
  `Cod_Endereco_Aluno` int NOT NULL AUTO_INCREMENT,
  `RA` int NOT NULL,
  `Cod_Tipo_Logradouro` int NOT NULL,
  `Nome_Rua` varchar(50) NOT NULL,
  `Num_Rua` int NOT NULL,
  `Complemento` varchar(20) DEFAULT NULL,
  `CEP` varchar(8) NOT NULL,
  PRIMARY KEY (`Cod_Endereco_Aluno`),
  KEY `fk_Cod_RA_End` (`RA`),
  KEY `fk_Cod_Tipo_Lougradouro` (`Cod_Tipo_Logradouro`),
  CONSTRAINT `fk_Cod_RA_End` FOREIGN KEY (`RA`) REFERENCES `aluno` (`RA`),
  CONSTRAINT `fk_Cod_Tipo_Lougradouro` FOREIGN KEY (`Cod_Tipo_Logradouro`) REFERENCES `tipo_logradouro` (`Cod_Tipo_Logradouro`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_aluno`
--

LOCK TABLES `endereco_aluno` WRITE;
/*!40000 ALTER TABLE `endereco_aluno` DISABLE KEYS */;
INSERT INTO `endereco_aluno` VALUES (1,2,1,'das Giestas',255,'Casa 02','2854000'),(2,3,3,'Lorena',10,'Apto 15','2945000'),(3,1,2,'do Cursino',1248,'','851040'),(4,4,1,'das Heras',495,'','3563142'),(5,5,3,'Santos',1856,'','4523963'),(6,6,4,'Matão',206,'','4213650');
/*!40000 ALTER TABLE `endereco_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico` (
  `Cod_Historico` int NOT NULL AUTO_INCREMENT,
  `RA` int NOT NULL,
  `Data_Inicio` date NOT NULL,
  `Data_Final` date DEFAULT NULL,
  PRIMARY KEY (`Cod_Historico`),
  KEY `fk_Cod_RA` (`RA`),
  CONSTRAINT `fk_Cod_RA` FOREIGN KEY (`RA`) REFERENCES `aluno` (`RA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` VALUES (1,2,'2016-05-12','2017-10-15'),(2,3,'2014-05-12','2020-03-05'),(3,1,'2010-05-12','2012-05-10');
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prof_disciplina`
--

DROP TABLE IF EXISTS `prof_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prof_disciplina` (
  `Cod_Professor` int NOT NULL,
  `Cod_Disciplina` int NOT NULL,
  PRIMARY KEY (`Cod_Professor`,`Cod_Disciplina`),
  KEY `fk_Cod_Disciplina_Prof` (`Cod_Disciplina`),
  CONSTRAINT `fk_Cod_Disciplina_Prof` FOREIGN KEY (`Cod_Disciplina`) REFERENCES `disciplina` (`Cod_Disciplina`),
  CONSTRAINT `fk_Cod_Professor_Prof` FOREIGN KEY (`Cod_Professor`) REFERENCES `professor` (`Cod_Professor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prof_disciplina`
--

LOCK TABLES `prof_disciplina` WRITE;
/*!40000 ALTER TABLE `prof_disciplina` DISABLE KEYS */;
INSERT INTO `prof_disciplina` VALUES (2,1),(1,2),(3,3),(2,4);
/*!40000 ALTER TABLE `prof_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `Cod_Professor` int NOT NULL AUTO_INCREMENT,
  `Nome_Professor` varchar(20) NOT NULL,
  `Sobrenome_Professor` varchar(50) NOT NULL,
  `Status_Professor` tinyint DEFAULT NULL,
  `Cod_Departamento` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Professor`),
  KEY `fk_Codigo_departamento` (`Cod_Departamento`),
  CONSTRAINT `fk_Codigo_departamento` FOREIGN KEY (`Cod_Departamento`) REFERENCES `departamento` (`Cod_Departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Fábio','dos Reis',0,2),(2,'Sophie','Allemand',1,1),(3,'Monica','Barroso',1,3);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefones_aluno`
--

DROP TABLE IF EXISTS `telefones_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefones_aluno` (
  `Cod_Telefones_Aluno` int NOT NULL AUTO_INCREMENT,
  `RA` int NOT NULL,
  `Cod_Tipo_Telefone` int NOT NULL,
  `Num_Telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`Cod_Telefones_Aluno`),
  KEY `fk_Cod_RA_Tel` (`RA`),
  KEY `fk_Cod_Tipo_Telefone` (`Cod_Tipo_Telefone`),
  CONSTRAINT `fk_Cod_RA_Tel` FOREIGN KEY (`RA`) REFERENCES `aluno` (`RA`),
  CONSTRAINT `fk_Cod_Tipo_Telefone` FOREIGN KEY (`Cod_Tipo_Telefone`) REFERENCES `tipo_telefone` (`Cod_Tipo_Telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefones_aluno`
--

LOCK TABLES `telefones_aluno` WRITE;
/*!40000 ALTER TABLE `telefones_aluno` DISABLE KEYS */;
INSERT INTO `telefones_aluno` VALUES (1,1,1,'28467853'),(2,2,1,'24653298'),(3,2,3,'996324521'),(4,3,1,'36549875'),(5,3,3,'994532165'),(6,4,1,'21956345'),(7,4,3,'986321452'),(8,5,1,'24569832'),(9,5,2,'23854696'),(10,6,1,'27698753');
/*!40000 ALTER TABLE `telefones_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_logradouro`
--

DROP TABLE IF EXISTS `tipo_logradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_logradouro` (
  `Cod_Tipo_Logradouro` int NOT NULL AUTO_INCREMENT,
  `Tipo_Logradouro` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`Cod_Tipo_Logradouro`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_logradouro`
--

LOCK TABLES `tipo_logradouro` WRITE;
/*!40000 ALTER TABLE `tipo_logradouro` DISABLE KEYS */;
INSERT INTO `tipo_logradouro` VALUES (1,'Rua'),(2,'Avenida'),(3,'Alameda'),(4,'Travessa');
/*!40000 ALTER TABLE `tipo_logradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_telefone`
--

DROP TABLE IF EXISTS `tipo_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_telefone` (
  `Cod_Tipo_Telefone` int NOT NULL AUTO_INCREMENT,
  `Tipo_Telefone` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Cod_Tipo_Telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_telefone`
--

LOCK TABLES `tipo_telefone` WRITE;
/*!40000 ALTER TABLE `tipo_telefone` DISABLE KEYS */;
INSERT INTO `tipo_telefone` VALUES (1,'Res'),(2,'Com'),(3,'Cel'),(4,'Rec');
/*!40000 ALTER TABLE `tipo_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turma` (
  `Cod_Turma` int NOT NULL AUTO_INCREMENT,
  `Cod_Curso` int DEFAULT NULL,
  `Periodo` varchar(8) DEFAULT NULL,
  `Num_Alunos` int DEFAULT NULL,
  `Data_Inicio` date DEFAULT NULL,
  `Data_Fim` date DEFAULT NULL,
  PRIMARY KEY (`Cod_Turma`),
  KEY `fk_Cod_Curso` (`Cod_Curso`),
  CONSTRAINT `fk_Cod_Curso` FOREIGN KEY (`Cod_Curso`) REFERENCES `curso` (`Cod_Curso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (1,2,'Manhã',20,'2016-05-12','2017-10-15'),(2,1,'Noite',10,'2014-05-12','2020-03-05'),(3,3,'Tarde',15,'2012-05-12','2014-05-10');
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-04 17:10:00
