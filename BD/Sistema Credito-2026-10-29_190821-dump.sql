-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: sistema_credito
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `analise_credito`
--

DROP TABLE IF EXISTS `analise_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analise_credito` (
  `id_analise` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitacao` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data_analise` date DEFAULT NULL,
  `parecer` varchar(500) DEFAULT NULL,
  `limite_aprovado` decimal(12,2) DEFAULT NULL,
  `resultado` varchar(30) DEFAULT 'Em análise',
  PRIMARY KEY (`id_analise`),
  KEY `id_solicitacao` (`id_solicitacao`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `analise_credito_ibfk_1` FOREIGN KEY (`id_solicitacao`) REFERENCES `solicitacao_credito` (`id_solicitacao`),
  CONSTRAINT `analise_credito_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analise_credito`
--

LOCK TABLES `analise_credito` WRITE;
/*!40000 ALTER TABLE `analise_credito` DISABLE KEYS */;
INSERT INTO `analise_credito` VALUES (1,1,1,'2026-09-08','Credito aprovado apos analise.',150000.00,'Aprovado');
/*!40000 ALTER TABLE `analise_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(150) NOT NULL,
  `nome_fantasia` varchar(150) DEFAULT NULL,
  `cnpj` varchar(18) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `nome_contato` varchar(100) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'Ativo',
  `cep` varchar(10) DEFAULT NULL,
  `logradouro` varchar(150) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Agro Forte Ltda','Agro Forte','12.345.678/0001-00','contato@agroforte.com','11999999999','www.agroforte.com.br','Joao Silva','Materiais Agricolas','Ativo','13000-000','Rua das Fazendas','100',NULL,'Centro','Campinas','SP'),(4,'Empresa Teste LTDA','Empresa Teste','12.345.678/0001-90','teste@empresa.com','11999999999',NULL,NULL,NULL,'Ativo',NULL,NULL,NULL,NULL,NULL,'São Paulo','sp'),(7,'Monalisa Incret LTDA','Monalisa Incr','11.345.678/0001-60','monalisa@empresa.com','11999998888',NULL,NULL,NULL,'Ativo',NULL,NULL,NULL,NULL,NULL,'São Paulo','sp');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_credito`
--

DROP TABLE IF EXISTS `solicitacao_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_credito` (
  `id_solicitacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `valor_solicitado` decimal(12,2) NOT NULL,
  `data_solicitacao` date NOT NULL,
  `finalidade` varchar(255) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'Pendente',
  PRIMARY KEY (`id_solicitacao`),
  KEY `id_empresa` (`id_empresa`),
  CONSTRAINT `solicitacao_credito_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_credito`
--

LOCK TABLES `solicitacao_credito` WRITE;
/*!40000 ALTER TABLE `solicitacao_credito` DISABLE KEYS */;
INSERT INTO `solicitacao_credito` VALUES (1,1,150000.00,'2026-09-07','Compra de materiais agrícolas','Aprovado');
/*!40000 ALTER TABLE `solicitacao_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo_usuario` varchar(50) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'Ativo',
  `id_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `id_empresa` (`id_empresa`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Joao Silva','joao@agroforte.com','123456','Cliente','Ativo',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-29 19:08:21
