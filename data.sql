CREATE DATABASE  IF NOT EXISTS `webproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `webproject`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: webproject
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (3,'engineer'),(2,'supervisors'),(1,'weavers');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add employee',8,'add_employee'),(30,'Can change employee',8,'change_employee'),(31,'Can delete employee',8,'delete_employee'),(32,'Can view employee',8,'view_employee'),(33,'Can add machine',9,'add_machine'),(34,'Can change machine',9,'change_machine'),(35,'Can delete machine',9,'delete_machine'),(36,'Can view machine',9,'view_machine'),(37,'Can add machine_ part',10,'add_machine_part'),(38,'Can change machine_ part',10,'change_machine_part'),(39,'Can delete machine_ part',10,'delete_machine_part'),(40,'Can view machine_ part',10,'view_machine_part'),(41,'Can add maintenance',11,'add_maintenance'),(42,'Can change maintenance',11,'change_maintenance'),(43,'Can delete maintenance',11,'delete_maintenance'),(44,'Can view maintenance',11,'view_maintenance'),(45,'Can add part',12,'add_part'),(46,'Can change part',12,'change_part'),(47,'Can delete part',12,'delete_part'),(48,'Can view part',12,'view_part'),(49,'Can add engineer',13,'add_engineer'),(50,'Can change engineer',13,'change_engineer'),(51,'Can delete engineer',13,'delete_engineer'),(52,'Can view engineer',13,'view_engineer'),(53,'Can add maintenance_ machine_ part',14,'add_maintenance_machine_part'),(54,'Can change maintenance_ machine_ part',14,'change_maintenance_machine_part'),(55,'Can delete maintenance_ machine_ part',14,'delete_maintenance_machine_part'),(56,'Can view maintenance_ machine_ part',14,'view_maintenance_machine_part'),(57,'Can add category_ part',15,'add_category_part'),(58,'Can change category_ part',15,'change_category_part'),(59,'Can delete category_ part',15,'delete_category_part'),(60,'Can view category_ part',15,'view_category_part'),(61,'Can add order',16,'add_order'),(62,'Can change order',16,'change_order'),(63,'Can delete order',16,'delete_order'),(64,'Can view order',16,'view_order'),(65,'Can add cart',17,'add_cart'),(66,'Can change cart',17,'change_cart'),(67,'Can delete cart',17,'delete_cart'),(68,'Can view cart',17,'view_cart'),(69,'Can add machine_ category',18,'add_machine_category'),(70,'Can change machine_ category',18,'change_machine_category'),(71,'Can delete machine_ category',18,'delete_machine_category'),(72,'Can view machine_ category',18,'view_machine_category');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$WcQeIpHsvW79$9PeRxkdIAPAfSFxaQN6mMAproQt2kKLNVUuadyrd/g4=','2019-05-03 06:42:27.689411',1,'admin','','','admin@admin.com',1,1,'2019-05-03 06:41:46.620310'),(2,'pbkdf2_sha256$150000$e7yIuKu8Em3Q$vdu2TUknYPpXLF8iQEhG8/6ZRRlY7w+Jl3/8ZNzmUIQ=','2019-05-03 12:15:02.640630',0,'user1','peerapol','onhan','fluke_onhan@hotmail.com',0,1,'2019-05-03 06:44:01.148231'),(3,'pbkdf2_sha256$150000$m2ozWIV3qThw$cH+kpptsMMseGEsYRmqIXWW2x8gehsQ9qiqkpNOhXlc=','2019-05-03 12:15:18.545667',0,'user2','peerapol','onhan','fluke_onhan@hotmail.com',0,1,'2019-05-03 06:47:10.124595'),(4,'pbkdf2_sha256$150000$3t6bGJK3966b$lXU7fzZ2L7vJ/USkmfWcJCZcKzWmHHTxIN+OJxQ5Rq4=','2019-05-03 12:15:38.219373',0,'user3','peerapol','onhan','fluke_onhan@hotmail.com',0,1,'2019-05-03 06:47:48.071975');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1),(2,3,2),(3,4,3);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-05-03 06:43:12.678761','1','weavers',1,'[{\"added\": {}}]',3,1),(2,'2019-05-03 06:43:26.220580','2','supervisors',1,'[{\"added\": {}}]',3,1),(3,'2019-05-03 06:43:34.718924','3','engineer',1,'[{\"added\": {}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(17,'reports','cart'),(7,'reports','category'),(15,'reports','category_part'),(8,'reports','employee'),(13,'reports','engineer'),(9,'reports','machine'),(18,'reports','machine_category'),(10,'reports','machine_part'),(11,'reports','maintenance'),(14,'reports','maintenance_machine_part'),(16,'reports','order'),(12,'reports','part'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-05-03 06:40:20.286601'),(2,'auth','0001_initial','2019-05-03 06:40:20.471524'),(3,'admin','0001_initial','2019-05-03 06:40:21.073063'),(4,'admin','0002_logentry_remove_auto_add','2019-05-03 06:40:21.204580'),(5,'admin','0003_logentry_add_action_flag_choices','2019-05-03 06:40:21.220202'),(6,'contenttypes','0002_remove_content_type_name','2019-05-03 06:40:21.351706'),(7,'auth','0002_alter_permission_name_max_length','2019-05-03 06:40:21.420698'),(8,'auth','0003_alter_user_email_max_length','2019-05-03 06:40:21.451968'),(9,'auth','0004_alter_user_username_opts','2019-05-03 06:40:21.467587'),(10,'auth','0005_alter_user_last_login_null','2019-05-03 06:40:21.536582'),(11,'auth','0006_require_contenttypes_0002','2019-05-03 06:40:21.536582'),(12,'auth','0007_alter_validators_add_error_messages','2019-05-03 06:40:21.536582'),(13,'auth','0008_alter_user_username_max_length','2019-05-03 06:40:21.636912'),(14,'auth','0009_alter_user_last_name_max_length','2019-05-03 06:40:21.721575'),(15,'auth','0010_alter_group_name_max_length','2019-05-03 06:40:21.737188'),(16,'auth','0011_update_proxy_permissions','2019-05-03 06:40:21.752841'),(17,'reports','0001_initial','2019-05-03 06:40:22.176097'),(18,'sessions','0001_initial','2019-05-03 06:40:22.877855'),(19,'reports','0002_cart_order','2019-05-03 09:34:05.096268'),(20,'reports','0003_machine_category','2019-05-03 11:17:41.004570'),(21,'reports','0004_auto_20190503_1934','2019-05-03 12:34:13.075705');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bhvtc4w15lmy5wlk4vbncvjpku2mfxzp','ZGEyMjMzNGE1MGFkYWIyNGU4NWFkZDI4OWFmNTNlNmYxNGZlZTA4Yzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYjBjZWU0MzQzZTZkZGM4YWYxMGJjOGVlYmM1NDZhZWE2ZmU5ODI1In0=','2019-05-17 12:15:38.223735');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_cart`
--

DROP TABLE IF EXISTS `reports_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `for_machine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_cart_employee_id_1e377db0_fk_reports_e` (`employee_id`),
  KEY `reports_cart_part_id_5013c495_fk_reports_part_id` (`part_id`),
  KEY `reports_cart_for_machine_id_602f3961_fk_reports_machine_mac_id` (`for_machine_id`),
  CONSTRAINT `reports_cart_employee_id_1e377db0_fk_reports_e` FOREIGN KEY (`employee_id`) REFERENCES `reports_employee` (`employee_id`),
  CONSTRAINT `reports_cart_for_machine_id_602f3961_fk_reports_machine_mac_id` FOREIGN KEY (`for_machine_id`) REFERENCES `reports_machine` (`mac_id`),
  CONSTRAINT `reports_cart_part_id_5013c495_fk_reports_part_id` FOREIGN KEY (`part_id`) REFERENCES `reports_part` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_cart`
--

LOCK TABLES `reports_cart` WRITE;
/*!40000 ALTER TABLE `reports_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_category`
--

DROP TABLE IF EXISTS `reports_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_code` varchar(255) NOT NULL,
  `c_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_category`
--

LOCK TABLES `reports_category` WRITE;
/*!40000 ALTER TABLE `reports_category` DISABLE KEYS */;
INSERT INTO `reports_category` VALUES (1,'A-1','TEST'),(2,'A-2','AAAA');
/*!40000 ALTER TABLE `reports_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_category_part`
--

DROP TABLE IF EXISTS `reports_category_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_category_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_category_part_c_id_e9c66199_fk_reports_category_id` (`c_id`),
  KEY `reports_category_part_p_id_2efa367c_fk_reports_part_id` (`p_id`),
  CONSTRAINT `reports_category_part_c_id_e9c66199_fk_reports_category_id` FOREIGN KEY (`c_id`) REFERENCES `reports_category` (`id`),
  CONSTRAINT `reports_category_part_p_id_2efa367c_fk_reports_part_id` FOREIGN KEY (`p_id`) REFERENCES `reports_part` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_category_part`
--

LOCK TABLES `reports_category_part` WRITE;
/*!40000 ALTER TABLE `reports_category_part` DISABLE KEYS */;
INSERT INTO `reports_category_part` VALUES (1,1,1),(2,1,2),(3,2,1);
/*!40000 ALTER TABLE `reports_category_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_employee`
--

DROP TABLE IF EXISTS `reports_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_employee` (
  `employee_id` int(11) NOT NULL,
  `emp_fname` varchar(255) NOT NULL,
  `emp_lname` varchar(255) NOT NULL,
  `emp_phone` varchar(10) NOT NULL,
  `emp_email` varchar(255) NOT NULL,
  `emp_address` longtext NOT NULL,
  `type` varchar(3) NOT NULL,
  `emp_salary` decimal(8,2) NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `reports_employee_employee_id_524f7415_fk_auth_user_id` FOREIGN KEY (`employee_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_employee`
--

LOCK TABLES `reports_employee` WRITE;
/*!40000 ALTER TABLE `reports_employee` DISABLE KEYS */;
INSERT INTO `reports_employee` VALUES (2,'peerapol','onhan','0837199785','fluke_onhan@hotmail.com','123','01',10000.00),(3,'peerapol','onhan','0837199785','fluke_onhan@hotmail.com','123','02',10000.00),(4,'peerapol','onhan','0837199785','fluke_onhan@hotmail.com','123','03',10000.00);
/*!40000 ALTER TABLE `reports_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_engineer`
--

DROP TABLE IF EXISTS `reports_engineer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_engineer` (
  `employee_id` int(11) NOT NULL,
  `eng_type` varchar(255) NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `reports_engineer_employee_id_eb112d48_fk_reports_e` FOREIGN KEY (`employee_id`) REFERENCES `reports_employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_engineer`
--

LOCK TABLES `reports_engineer` WRITE;
/*!40000 ALTER TABLE `reports_engineer` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_engineer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_machine`
--

DROP TABLE IF EXISTS `reports_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_machine` (
  `mac_id` int(11) NOT NULL AUTO_INCREMENT,
  `mac_name` varchar(255) NOT NULL,
  `mac_sum` varchar(255) NOT NULL,
  `mac_desc` longtext NOT NULL,
  PRIMARY KEY (`mac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_machine`
--

LOCK TABLES `reports_machine` WRITE;
/*!40000 ALTER TABLE `reports_machine` DISABLE KEYS */;
INSERT INTO `reports_machine` VALUES (1,'G-1','test','test'),(2,'G-2','TEEST','test');
/*!40000 ALTER TABLE `reports_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_machine_category`
--

DROP TABLE IF EXISTS `reports_machine_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_machine_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `machine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_machine_cate_category_id_a2b6b63d_fk_reports_c` (`category_id`),
  KEY `reports_machine_cate_machine_id_370b907f_fk_reports_m` (`machine_id`),
  CONSTRAINT `reports_machine_cate_category_id_a2b6b63d_fk_reports_c` FOREIGN KEY (`category_id`) REFERENCES `reports_category` (`id`),
  CONSTRAINT `reports_machine_cate_machine_id_370b907f_fk_reports_m` FOREIGN KEY (`machine_id`) REFERENCES `reports_machine` (`mac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_machine_category`
--

LOCK TABLES `reports_machine_category` WRITE;
/*!40000 ALTER TABLE `reports_machine_category` DISABLE KEYS */;
INSERT INTO `reports_machine_category` VALUES (1,1,1),(2,2,1),(3,1,2);
/*!40000 ALTER TABLE `reports_machine_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_machine_part`
--

DROP TABLE IF EXISTS `reports_machine_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_machine_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` int(11) NOT NULL,
  `machine_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `machine_id` (`machine_id`),
  UNIQUE KEY `part_id` (`part_id`),
  UNIQUE KEY `reports_machine_part_part_id_machine_id_724e3fb7_uniq` (`part_id`,`machine_id`),
  CONSTRAINT `reports_machine_part_machine_id_ddd1185d_fk_reports_m` FOREIGN KEY (`machine_id`) REFERENCES `reports_machine` (`mac_id`),
  CONSTRAINT `reports_machine_part_part_id_d0bd684f_fk_reports_part_id` FOREIGN KEY (`part_id`) REFERENCES `reports_part` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_machine_part`
--

LOCK TABLES `reports_machine_part` WRITE;
/*!40000 ALTER TABLE `reports_machine_part` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_machine_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_maintenance`
--

DROP TABLE IF EXISTS `reports_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_maintenance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime(6) NOT NULL,
  `state` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `employee_id` int(11) NOT NULL,
  `machine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_maintenance_employee_id_58ac3da3_fk_reports_e` (`employee_id`),
  KEY `reports_maintenance_machine_id_85268193_fk_reports_m` (`machine_id`),
  CONSTRAINT `reports_maintenance_employee_id_58ac3da3_fk_reports_e` FOREIGN KEY (`employee_id`) REFERENCES `reports_employee` (`employee_id`),
  CONSTRAINT `reports_maintenance_machine_id_85268193_fk_reports_m` FOREIGN KEY (`machine_id`) REFERENCES `reports_machine` (`mac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_maintenance`
--

LOCK TABLES `reports_maintenance` WRITE;
/*!40000 ALTER TABLE `reports_maintenance` DISABLE KEYS */;
INSERT INTO `reports_maintenance` VALUES (2,'2019-05-03 13:49:10.023122','Pending','จอฟ้า',2,1),(3,'2019-05-03 19:15:30.537708','Inprogress','ระเบิด',3,2);
/*!40000 ALTER TABLE `reports_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_maintenance_machine_part`
--

DROP TABLE IF EXISTS `reports_maintenance_machine_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_maintenance_machine_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `machine_part_id` int(11) NOT NULL,
  `maintenance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_maintenance__machine_part_id_40792e21_fk_reports_m` (`machine_part_id`),
  KEY `reports_maintenance__maintenance_id_b57f8c31_fk_reports_m` (`maintenance_id`),
  CONSTRAINT `reports_maintenance__machine_part_id_40792e21_fk_reports_m` FOREIGN KEY (`machine_part_id`) REFERENCES `reports_machine_part` (`id`),
  CONSTRAINT `reports_maintenance__maintenance_id_b57f8c31_fk_reports_m` FOREIGN KEY (`maintenance_id`) REFERENCES `reports_maintenance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_maintenance_machine_part`
--

LOCK TABLES `reports_maintenance_machine_part` WRITE;
/*!40000 ALTER TABLE `reports_maintenance_machine_part` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_maintenance_machine_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_order`
--

DROP TABLE IF EXISTS `reports_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `for_machine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_order_employee_id_9a7411d9_fk_reports_e` (`employee_id`),
  KEY `reports_order_part_id_38f3efb0_fk_reports_part_id` (`part_id`),
  KEY `reports_order_for_machine_id_c91eacdb_fk_reports_machine_mac_id` (`for_machine_id`),
  CONSTRAINT `reports_order_employee_id_9a7411d9_fk_reports_e` FOREIGN KEY (`employee_id`) REFERENCES `reports_employee` (`employee_id`),
  CONSTRAINT `reports_order_for_machine_id_c91eacdb_fk_reports_machine_mac_id` FOREIGN KEY (`for_machine_id`) REFERENCES `reports_machine` (`mac_id`),
  CONSTRAINT `reports_order_part_id_38f3efb0_fk_reports_part_id` FOREIGN KEY (`part_id`) REFERENCES `reports_part` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_order`
--

LOCK TABLES `reports_order` WRITE;
/*!40000 ALTER TABLE `reports_order` DISABLE KEYS */;
INSERT INTO `reports_order` VALUES (1,4,'2019-05-03 17:22:55.791209',2,1,1),(2,6,'2019-05-03 17:22:55.797578',2,2,1),(3,4,'2019-05-03 17:24:13.965465',2,1,1),(4,6,'2019-05-03 17:24:13.989336',2,2,1),(5,4,'2019-05-03 17:24:55.511655',2,2,1),(6,3,'2019-05-03 17:32:41.873186',2,2,1),(7,1,'2019-05-03 17:48:35.366343',4,2,1),(8,1,'2019-05-03 17:49:00.427453',4,1,1),(9,2,'2019-05-03 17:54:14.657969',4,2,1),(10,1,'2019-05-03 17:54:19.992881',4,2,1),(11,1,'2019-05-03 17:54:24.969625',4,2,1),(12,10,'2019-05-03 18:56:27.361510',4,1,1),(13,10,'2019-05-03 19:02:52.340534',4,1,1),(14,5,'2019-05-03 19:16:16.444299',4,2,1),(15,1,'2019-05-03 19:22:11.690194',4,1,1),(16,1,'2019-05-03 19:22:11.696205',4,2,1),(17,12,'2019-05-03 19:41:38.482205',4,1,1),(18,2,'2019-05-03 19:41:38.505140',4,2,1),(19,1,'2019-05-03 19:41:38.508126',4,1,2),(20,1,'2019-05-03 19:59:26.669701',4,2,2),(21,1,'2019-05-03 19:59:26.680696',4,2,1);
/*!40000 ALTER TABLE `reports_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_part`
--

DROP TABLE IF EXISTS `reports_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_name` varchar(255) NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `part_desc` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `minimum_stock` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_part`
--

LOCK TABLES `reports_part` WRITE;
/*!40000 ALTER TABLE `reports_part` DISABLE KEYS */;
INSERT INTO `reports_part` VALUES (1,'น็อต',10.00,'-',16,5),(2,'เชือก',100.00,'-',0,10);
/*!40000 ALTER TABLE `reports_part` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-03 20:01:42
