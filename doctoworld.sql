-- MySQL dump 10.13  Distrib 8.0.22, for osx10.16 (x86_64)
--
-- Host: localhost    Database: doctoworld
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `appointee_id` int NOT NULL,
  `appointee_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointer_id` int DEFAULT NULL,
  `appointer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `amount` decimal(9,2) NOT NULL DEFAULT '0.00',
  `amount_meta` json DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_meta` json DEFAULT NULL,
  `longitude` decimal(15,7) NOT NULL,
  `latitude` decimal(15,7) NOT NULL,
  `date` date NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `meta` json DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'{\"en\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"}','{\"scope\": \"ecommerce\"}',1,'2021-02-15 14:12:10','2021-02-15 14:12:10'),(2,'{\"en\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"}','{\"scope\": \"ecommerce\"}',2,'2021-02-15 14:12:11','2021-02-15 14:12:11'),(3,'{\"en\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"}','{\"scope\": \"doctor\"}',1,'2021-02-15 14:12:12','2021-02-15 14:12:12'),(4,'{\"en\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"}','{\"scope\": \"doctor\"}',2,'2021-02-15 14:12:14','2021-02-15 14:12:14'),(5,'{\"en\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"}','{\"scope\": \"hospital\"}',1,'2021-02-15 14:12:15','2021-02-15 14:12:15'),(6,'{\"en\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"}','{\"scope\": \"hospital\"}',2,'2021-02-15 14:12:16','2021-02-15 14:12:16');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` json NOT NULL,
  `meta` json DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '1',
  `parent_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'personal-care','{\"en\": \"Personal Care\"}','{\"scope\": \"ecommerce\"}',1,NULL,'2021-02-15 14:12:07','2021-02-15 14:12:07'),(2,'skin-care','{\"en\": \"Skin Care\"}','{\"scope\": \"ecommerce\"}',1,1,'2021-02-15 14:12:08','2021-02-15 14:12:08'),(3,'baby-care','{\"en\": \"Baby Care\"}','{\"scope\": \"ecommerce\"}',2,1,'2021-02-15 14:12:08','2021-02-15 14:12:08'),(4,'hair-care','{\"en\": \"Hair Care\"}','{\"scope\": \"ecommerce\"}',3,1,'2021-02-15 14:12:08','2021-02-15 14:12:08'),(5,'otc-medicines','{\"en\": \"OTC Medicines\"}','{\"scope\": \"ecommerce\"}',1,NULL,'2021-02-15 14:12:08','2021-02-15 14:12:08'),(6,'first-aid','{\"en\": \"First Aid\"}','{\"scope\": \"ecommerce\"}',1,5,'2021-02-15 14:12:10','2021-02-15 14:12:10'),(7,'fever','{\"en\": \"Fever\"}','{\"scope\": \"ecommerce\"}',2,5,'2021-02-15 14:12:10','2021-02-15 14:12:10'),(8,'pain','{\"en\": \"Pain\"}','{\"scope\": \"ecommerce\"}',3,5,'2021-02-15 14:12:10','2021-02-15 14:12:10'),(9,'mbbs','{\"en\": \"MBBS\"}','{\"scope\": \"degree\"}',1,NULL,'2021-02-15 14:12:10','2021-02-15 14:12:10'),(10,'hypertension-treatment','{\"en\": \"Hypertension Treatment\"}','{\"scope\": \"services\"}',1,NULL,'2021-02-15 14:12:10','2021-02-15 14:12:10'),(11,'diabetes-treatment','{\"en\": \"Diabetes Treatment\"}','{\"scope\": \"services\"}',1,NULL,'2021-02-15 14:12:10','2021-02-15 14:12:10'),(12,'general-physician','{\"en\": \"General Physician\"}','{\"scope\": \"specializations\"}',1,NULL,'2021-02-15 14:12:10','2021-02-15 14:12:10'),(13,'cardialogist','{\"en\": \"Cardialogist\"}','{\"scope\": \"specializations\"}',1,NULL,'2021-02-15 14:12:10','2021-02-15 14:12:10'),(14,'doctor','{\"en\": \"Doctor\"}','{\"scope\": \"type\"}',1,NULL,'2021-02-15 14:12:10','2021-02-15 14:12:10'),(15,'dentist','{\"en\": \"Dentist\"}','{\"scope\": \"type\"}',1,NULL,'2021-02-15 14:12:10','2021-02-15 14:12:10');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_availabilities`
--

DROP TABLE IF EXISTS `doctor_availabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_availabilities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `days` enum('sun','mon','tue','wed','thu','fri','sat') COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  `doctor_profile_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_availabilities_doctor_profile_id_foreign` (`doctor_profile_id`),
  CONSTRAINT `doctor_availabilities_doctor_profile_id_foreign` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_availabilities`
--

LOCK TABLES `doctor_availabilities` WRITE;
/*!40000 ALTER TABLE `doctor_availabilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_availabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_hospital_availabilities`
--

DROP TABLE IF EXISTS `doctor_hospital_availabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_hospital_availabilities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `days` enum('sun','mon','tue','wed','thu','fri','sat') COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_hospital_availabilities_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `doctor_hospital_availabilities_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `doctor_hospitals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_hospital_availabilities`
--

LOCK TABLES `doctor_hospital_availabilities` WRITE;
/*!40000 ALTER TABLE `doctor_hospital_availabilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_hospital_availabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_hospital_services`
--

DROP TABLE IF EXISTS `doctor_hospital_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_hospital_services` (
  `hospital_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `doctor_hospital_services_hospital_id_foreign` (`hospital_id`),
  KEY `doctor_hospital_services_category_id_foreign` (`category_id`),
  CONSTRAINT `doctor_hospital_services_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_hospital_services_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `doctor_hospitals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_hospital_services`
--

LOCK TABLES `doctor_hospital_services` WRITE;
/*!40000 ALTER TABLE `doctor_hospital_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_hospital_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_hospitals`
--

DROP TABLE IF EXISTS `doctor_hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_hospitals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` json NOT NULL,
  `tagline` json DEFAULT NULL,
  `details` json DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `latitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `sort_order` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_hospitals`
--

LOCK TABLES `doctor_hospitals` WRITE;
/*!40000 ALTER TABLE `doctor_hospitals` DISABLE KEYS */;
INSERT INTO `doctor_hospitals` VALUES (1,'apollo-hospitals','{\"en\": \"Apollo Hospitals\"}','{\"en\": \"Apollo Hospitals Tagline\"}','{\"en\": \"Apollo Hospitals Details\"}',NULL,'Test Address',0.0000000,0.0000000,1,'2021-02-15 14:12:10','2021-02-15 14:12:10'),(2,'max-hospitals','{\"en\": \"Max Hospitals\"}','{\"en\": \"Max Hospitals Tagline\"}','{\"en\": \"Max Hospitals Details\"}',NULL,'Test Address',0.0000000,0.0000000,1,'2021-02-15 14:12:10','2021-02-15 14:12:10');
/*!40000 ALTER TABLE `doctor_hospitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_profiles`
--

DROP TABLE IF EXISTS `doctor_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_profiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` json DEFAULT NULL,
  `tagline` json DEFAULT NULL,
  `details` json DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `experience_years` int NOT NULL DEFAULT '0',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `latitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `is_verified` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `doctor_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_profiles`
--

LOCK TABLES `doctor_profiles` WRITE;
/*!40000 ALTER TABLE `doctor_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_profiles_degrees`
--

DROP TABLE IF EXISTS `doctor_profiles_degrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_profiles_degrees` (
  `doctor_profile_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `doctor_profiles_degrees_doctor_profile_id_foreign` (`doctor_profile_id`),
  KEY `doctor_profiles_degrees_category_id_foreign` (`category_id`),
  CONSTRAINT `doctor_profiles_degrees_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_profiles_degrees_doctor_profile_id_foreign` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_profiles_degrees`
--

LOCK TABLES `doctor_profiles_degrees` WRITE;
/*!40000 ALTER TABLE `doctor_profiles_degrees` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_profiles_degrees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_profiles_hospitals`
--

DROP TABLE IF EXISTS `doctor_profiles_hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_profiles_hospitals` (
  `fee` decimal(8,2) unsigned NOT NULL,
  `doctor_profile_id` int unsigned NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  KEY `doctor_profiles_hospitals_doctor_profile_id_foreign` (`doctor_profile_id`),
  KEY `doctor_profiles_hospitals_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `doctor_profiles_hospitals_doctor_profile_id_foreign` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profiles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_profiles_hospitals_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `doctor_hospitals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_profiles_hospitals`
--

LOCK TABLES `doctor_profiles_hospitals` WRITE;
/*!40000 ALTER TABLE `doctor_profiles_hospitals` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_profiles_hospitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_profiles_services`
--

DROP TABLE IF EXISTS `doctor_profiles_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_profiles_services` (
  `doctor_profile_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `doctor_profiles_services_doctor_profile_id_foreign` (`doctor_profile_id`),
  KEY `doctor_profiles_services_category_id_foreign` (`category_id`),
  CONSTRAINT `doctor_profiles_services_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_profiles_services_doctor_profile_id_foreign` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_profiles_services`
--

LOCK TABLES `doctor_profiles_services` WRITE;
/*!40000 ALTER TABLE `doctor_profiles_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_profiles_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_profiles_specializations`
--

DROP TABLE IF EXISTS `doctor_profiles_specializations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_profiles_specializations` (
  `doctor_profile_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `doctor_profiles_specializations_doctor_profile_id_foreign` (`doctor_profile_id`),
  KEY `doctor_profiles_specializations_category_id_foreign` (`category_id`),
  CONSTRAINT `doctor_profiles_specializations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_profiles_specializations_doctor_profile_id_foreign` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_profiles_specializations`
--

LOCK TABLES `doctor_profiles_specializations` WRITE;
/*!40000 ALTER TABLE `doctor_profiles_specializations` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_profiles_specializations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_profiles_types`
--

DROP TABLE IF EXISTS `doctor_profiles_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_profiles_types` (
  `doctor_profile_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `doctor_profiles_types_doctor_profile_id_foreign` (`doctor_profile_id`),
  KEY `doctor_profiles_types_category_id_foreign` (`category_id`),
  CONSTRAINT `doctor_profiles_types_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doctor_profiles_types_doctor_profile_id_foreign` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_profiles_types`
--

LOCK TABLES `doctor_profiles_types` WRITE;
/*!40000 ALTER TABLE `doctor_profiles_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_profiles_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_addresses`
--

DROP TABLE IF EXISTS `ecommerce_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` json DEFAULT NULL,
  `formatted_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `latitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `ecommerce_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_addresses`
--

LOCK TABLES `ecommerce_addresses` WRITE;
/*!40000 ALTER TABLE `ecommerce_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_attribute_terms`
--

DROP TABLE IF EXISTS `ecommerce_attribute_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_attribute_terms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_attribute_terms_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `ecommerce_attribute_terms_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `ecommerce_attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_attribute_terms`
--

LOCK TABLES `ecommerce_attribute_terms` WRITE;
/*!40000 ALTER TABLE `ecommerce_attribute_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_attribute_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_attributes`
--

DROP TABLE IF EXISTS `ecommerce_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_attributes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_attributes`
--

LOCK TABLES `ecommerce_attributes` WRITE;
/*!40000 ALTER TABLE `ecommerce_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_coupons`
--

DROP TABLE IF EXISTS `ecommerce_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` json DEFAULT NULL,
  `detail` json DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reward` int NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ecommerce_coupons_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_coupons`
--

LOCK TABLES `ecommerce_coupons` WRITE;
/*!40000 ALTER TABLE `ecommerce_coupons` DISABLE KEYS */;
INSERT INTO `ecommerce_coupons` VALUES (1,'{\"en\": \"Test Coupon\"}','{\"en\": \"Test Coupon Details\"}',NULL,'TEST100',10,'percent','2020-12-31','2021-02-15 14:12:10','2021-02-15 14:12:10'),(2,'{\"en\": \"Test Coupon 2\"}','{\"en\": \"Test Coupon 2 Details\"}',NULL,'TEST200',20,'percent','2020-12-31','2021-02-15 14:12:10','2021-02-15 14:12:10'),(3,'{\"en\": \"Test Coupon 3\"}','{\"en\": \"Test Coupon 3 Details\"}',NULL,'TEST300',30,'percent','2020-12-31','2021-02-15 14:12:10','2021-02-15 14:12:10');
/*!40000 ALTER TABLE `ecommerce_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_coupons_users`
--

DROP TABLE IF EXISTS `ecommerce_coupons_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_coupons_users` (
  `user_id` int unsigned NOT NULL,
  `coupon_id` int unsigned NOT NULL,
  `used_at` timestamp NOT NULL,
  PRIMARY KEY (`user_id`,`coupon_id`),
  KEY `ecommerce_coupons_users_coupon_id_foreign` (`coupon_id`),
  CONSTRAINT `ecommerce_coupons_users_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `ecommerce_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_coupons_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_coupons_users`
--

LOCK TABLES `ecommerce_coupons_users` WRITE;
/*!40000 ALTER TABLE `ecommerce_coupons_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_coupons_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_delivery_order_requests`
--

DROP TABLE IF EXISTS `ecommerce_delivery_order_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_delivery_order_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `meta` json DEFAULT NULL,
  `delivery_profile_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_delivery_profile_order` (`delivery_profile_id`,`order_id`),
  KEY `ecommerce_delivery_order_requests_order_id_foreign` (`order_id`),
  CONSTRAINT `ecommerce_delivery_order_requests_delivery_profile_id_foreign` FOREIGN KEY (`delivery_profile_id`) REFERENCES `ecommerce_delivery_profiles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_delivery_order_requests_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `ecommerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_delivery_order_requests`
--

LOCK TABLES `ecommerce_delivery_order_requests` WRITE;
/*!40000 ALTER TABLE `ecommerce_delivery_order_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_delivery_order_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_delivery_profiles`
--

DROP TABLE IF EXISTS `ecommerce_delivery_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_delivery_profiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `meta` json DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '1',
  `is_online` tinyint(1) NOT NULL DEFAULT '0',
  `assigned` tinyint(1) NOT NULL DEFAULT '0',
  `longitude` decimal(15,7) DEFAULT NULL,
  `latitude` decimal(15,7) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_delivery_profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `ecommerce_delivery_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_delivery_profiles`
--

LOCK TABLES `ecommerce_delivery_profiles` WRITE;
/*!40000 ALTER TABLE `ecommerce_delivery_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_delivery_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_order_addresses`
--

DROP TABLE IF EXISTS `ecommerce_order_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_order_addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formatted_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` decimal(15,7) NOT NULL,
  `latitude` decimal(15,7) NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_order_addresses_order_id_foreign` (`order_id`),
  CONSTRAINT `ecommerce_order_addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `ecommerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_order_addresses`
--

LOCK TABLES `ecommerce_order_addresses` WRITE;
/*!40000 ALTER TABLE `ecommerce_order_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_order_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_order_conditions`
--

DROP TABLE IF EXISTS `ecommerce_order_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_order_conditions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_order_conditions`
--

LOCK TABLES `ecommerce_order_conditions` WRITE;
/*!40000 ALTER TABLE `ecommerce_order_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_order_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_order_deliveries`
--

DROP TABLE IF EXISTS `ecommerce_order_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_order_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `delivery_profile_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_order_deliveries_order_id_foreign` (`order_id`),
  KEY `ecommerce_order_deliveries_delivery_profile_id_foreign` (`delivery_profile_id`),
  CONSTRAINT `ecommerce_order_deliveries_delivery_profile_id_foreign` FOREIGN KEY (`delivery_profile_id`) REFERENCES `ecommerce_delivery_profiles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_order_deliveries_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `ecommerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_order_deliveries`
--

LOCK TABLES `ecommerce_order_deliveries` WRITE;
/*!40000 ALTER TABLE `ecommerce_order_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_order_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_order_product_addons`
--

DROP TABLE IF EXISTS `ecommerce_order_product_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_order_product_addons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `total` decimal(8,2) NOT NULL,
  `product_addon_choice_id` int unsigned NOT NULL,
  `order_product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_order_product_addons_product_addon_choice_id_foreign` (`product_addon_choice_id`),
  KEY `ecommerce_order_product_addons_order_product_id_foreign` (`order_product_id`),
  CONSTRAINT `ecommerce_order_product_addons_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `ecommerce_order_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_order_product_addons_product_addon_choice_id_foreign` FOREIGN KEY (`product_addon_choice_id`) REFERENCES `ecommerce_product_addon_choices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_order_product_addons`
--

LOCK TABLES `ecommerce_order_product_addons` WRITE;
/*!40000 ALTER TABLE `ecommerce_order_product_addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_order_product_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_order_products`
--

DROP TABLE IF EXISTS `ecommerce_order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_order_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `order_id` int unsigned NOT NULL,
  `vendor_product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_order_products_order_id_foreign` (`order_id`),
  KEY `ecommerce_order_products_vendor_product_id_foreign` (`vendor_product_id`),
  CONSTRAINT `ecommerce_order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `ecommerce_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_order_products_vendor_product_id_foreign` FOREIGN KEY (`vendor_product_id`) REFERENCES `ecommerce_vendor_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_order_products`
--

LOCK TABLES `ecommerce_order_products` WRITE;
/*!40000 ALTER TABLE `ecommerce_order_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_orders`
--

DROP TABLE IF EXISTS `ecommerce_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` double(8,2) NOT NULL,
  `taxes` double(8,2) NOT NULL,
  `delivery_fee` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `type` enum('ASAP','LATER') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ASAP',
  `scheduled_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `vendor_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `distance_travelled` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ecommerce_orders_vendor_id_foreign` (`vendor_id`),
  KEY `ecommerce_orders_user_id_foreign` (`user_id`),
  CONSTRAINT `ecommerce_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_orders_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `ecommerce_vendors` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_orders`
--

LOCK TABLES `ecommerce_orders` WRITE;
/*!40000 ALTER TABLE `ecommerce_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_product_addon_choices`
--

DROP TABLE IF EXISTS `ecommerce_product_addon_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_product_addon_choices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `price` double(8,2) NOT NULL,
  `product_addon_group_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_product_addon_choices_product_addon_group_id_foreign` (`product_addon_group_id`),
  CONSTRAINT `ecommerce_product_addon_choices_product_addon_group_id_foreign` FOREIGN KEY (`product_addon_group_id`) REFERENCES `ecommerce_product_addon_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_product_addon_choices`
--

LOCK TABLES `ecommerce_product_addon_choices` WRITE;
/*!40000 ALTER TABLE `ecommerce_product_addon_choices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_product_addon_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_product_addon_groups`
--

DROP TABLE IF EXISTS `ecommerce_product_addon_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_product_addon_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `max_choices` int unsigned NOT NULL,
  `min_choices` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_product_addon_groups_product_id_foreign` (`product_id`),
  CONSTRAINT `ecommerce_product_addon_groups_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ecommerce_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_product_addon_groups`
--

LOCK TABLES `ecommerce_product_addon_groups` WRITE;
/*!40000 ALTER TABLE `ecommerce_product_addon_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_product_addon_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_product_categories`
--

DROP TABLE IF EXISTS `ecommerce_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_product_categories` (
  `product_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  UNIQUE KEY `ecommerce_product_categories_product_id_category_id_unique` (`product_id`,`category_id`),
  KEY `ecommerce_product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `ecommerce_product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ecommerce_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_product_categories`
--

LOCK TABLES `ecommerce_product_categories` WRITE;
/*!40000 ALTER TABLE `ecommerce_product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_products`
--

DROP TABLE IF EXISTS `ecommerce_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` json DEFAULT NULL,
  `detail` json DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `owner` enum('admin','vendor') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'vendor',
  `parent_id` int unsigned DEFAULT NULL,
  `attribute_term_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sells_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ecommerce_products_attribute_term_id_foreign` (`attribute_term_id`),
  CONSTRAINT `ecommerce_products_attribute_term_id_foreign` FOREIGN KEY (`attribute_term_id`) REFERENCES `ecommerce_attribute_terms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_products`
--

LOCK TABLES `ecommerce_products` WRITE;
/*!40000 ALTER TABLE `ecommerce_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_vendor_categories`
--

DROP TABLE IF EXISTS `ecommerce_vendor_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_vendor_categories` (
  `vendor_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `ecommerce_vendor_categories_vendor_id_foreign` (`vendor_id`),
  KEY `ecommerce_vendor_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `ecommerce_vendor_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_vendor_categories_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `ecommerce_vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_vendor_categories`
--

LOCK TABLES `ecommerce_vendor_categories` WRITE;
/*!40000 ALTER TABLE `ecommerce_vendor_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_vendor_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_vendor_product_categories`
--

DROP TABLE IF EXISTS `ecommerce_vendor_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_vendor_product_categories` (
  `vendor_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  KEY `ecommerce_vendor_product_categories_vendor_id_foreign` (`vendor_id`),
  KEY `ecommerce_vendor_product_categories_category_id_foreign` (`category_id`),
  KEY `ecommerce_vendor_product_categories_product_id_foreign` (`product_id`),
  CONSTRAINT `ecommerce_vendor_product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_vendor_product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ecommerce_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_vendor_product_categories_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `ecommerce_vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_vendor_product_categories`
--

LOCK TABLES `ecommerce_vendor_product_categories` WRITE;
/*!40000 ALTER TABLE `ecommerce_vendor_product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_vendor_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_vendor_products`
--

DROP TABLE IF EXISTS `ecommerce_vendor_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_vendor_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` double(8,2) NOT NULL,
  `sale_price` double(8,2) DEFAULT NULL,
  `sale_price_from` date DEFAULT NULL,
  `sale_price_to` date DEFAULT NULL,
  `stock_quantity` int NOT NULL DEFAULT '-1',
  `stock_low_threshold` int NOT NULL DEFAULT '0',
  `vendor_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_vendor_products_vendor_id_foreign` (`vendor_id`),
  KEY `ecommerce_vendor_products_product_id_foreign` (`product_id`),
  CONSTRAINT `ecommerce_vendor_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ecommerce_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ecommerce_vendor_products_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `ecommerce_vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_vendor_products`
--

LOCK TABLES `ecommerce_vendor_products` WRITE;
/*!40000 ALTER TABLE `ecommerce_vendor_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_vendor_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_vendors`
--

DROP TABLE IF EXISTS `ecommerce_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_vendors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` json DEFAULT NULL,
  `tagline` json DEFAULT NULL,
  `details` json DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `minimum_order` int unsigned NOT NULL DEFAULT '0',
  `delivery_fee` int unsigned NOT NULL DEFAULT '0',
  `area` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `latitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `is_verified` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_vendors_user_id_foreign` (`user_id`),
  CONSTRAINT `ecommerce_vendors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_vendors`
--

LOCK TABLES `ecommerce_vendors` WRITE;
/*!40000 ALTER TABLE `ecommerce_vendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'Lorem ipsum','Lorem ipsum dolor sit amet.','Lorem ipsum dolor sit amet, consectetur adipiscing elit.',NULL,'2021-02-15 14:12:10','2021-02-15 14:12:10'),(2,'Lorem dolor','Lorem dolor ipsum dolor sit amet.','Lorem dolor ipsum sit amet, consectetur adipiscing elit.',NULL,'2021-02-15 14:12:10','2021-02-15 14:12:10');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `user_id` int unsigned NOT NULL,
  `favoriteable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favoriteable_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`favoriteable_id`,`favoriteable_type`),
  KEY `favorites_favoriteable_type_favoriteable_id_index` (`favoriteable_type`,`favoriteable_id`),
  KEY `favorites_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `likeable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likeable_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_likeable_type_likeable_id_index` (`likeable_type`,`likeable_id`),
  KEY `likes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltm_translations`
--

DROP TABLE IF EXISTS `ltm_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltm_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `key` text COLLATE utf8mb4_bin NOT NULL,
  `value` text COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltm_translations`
--

LOCK TABLES `ltm_translations` WRITE;
/*!40000 ALTER TABLE `ltm_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ltm_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'Vtlabs\\Category\\Models\\Category',1,'images','200','200.png','image/png','public',781,'[]','{\"generated_conversions\": {\"thumb\": true}}','[]',1,'2021-02-15 14:12:08','2021-02-15 14:12:08'),(2,'Vtlabs\\Category\\Models\\Category',5,'images','200','200.png','image/png','public',781,'[]','{\"generated_conversions\": {\"thumb\": true}}','[]',2,'2021-02-15 14:12:10','2021-02-15 14:12:10'),(3,'Vtlabs\\Banner\\Models\\Banner',1,'images','200','200.png','image/png','public',781,'[]','{\"generated_conversions\": {\"thumb\": true}}','[]',3,'2021-02-15 14:12:11','2021-02-15 14:12:11'),(4,'Vtlabs\\Banner\\Models\\Banner',2,'images','200','200.png','image/png','public',781,'[]','{\"generated_conversions\": {\"thumb\": true}}','[]',4,'2021-02-15 14:12:12','2021-02-15 14:12:12'),(5,'Vtlabs\\Banner\\Models\\Banner',3,'images','200','200.png','image/png','public',781,'[]','{\"generated_conversions\": {\"thumb\": true}}','[]',5,'2021-02-15 14:12:14','2021-02-15 14:12:14'),(6,'Vtlabs\\Banner\\Models\\Banner',4,'images','200','200.png','image/png','public',781,'[]','{\"generated_conversions\": {\"thumb\": true}}','[]',6,'2021-02-15 14:12:15','2021-02-15 14:12:15'),(7,'Vtlabs\\Banner\\Models\\Banner',5,'images','200','200.png','image/png','public',781,'[]','{\"generated_conversions\": {\"thumb\": true}}','[]',7,'2021-02-15 14:12:16','2021-02-15 14:12:16'),(8,'Vtlabs\\Banner\\Models\\Banner',6,'images','200','200.png','image/png','public',781,'[]','{\"generated_conversions\": {\"thumb\": true}}','[]',8,'2021-02-15 14:12:17','2021-02-15 14:12:17');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_04_02_193005_create_translations_table',1),(2,'2016_06_01_000001_create_oauth_auth_codes_table',1),(3,'2016_06_01_000002_create_oauth_access_tokens_table',1),(4,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(5,'2016_06_01_000004_create_oauth_clients_table',1),(6,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(7,'2018_07_14_183253_create_table_appointments',1),(8,'2018_07_14_183253_payment_methods',1),(9,'2018_07_14_183253_payments',1),(10,'2018_07_14_183253_ratings',1),(11,'2018_07_14_183254_alter_payment_methods',1),(12,'2018_08_08_100000_create_telescope_entries_table',1),(13,'2018_12_14_000000_create_likes_table',1),(14,'2020_04_04_000000_create_user_follower_table',1),(15,'2020_05_02_000545_create_permission_tables',1),(16,'2020_05_05_002400_create_statuses_table',1),(17,'2020_05_05_122859_create_media_table',1),(18,'2020_07_04_142129_create_favorites_table',1),(19,'2020_07_09_150356_create_banners_table',1),(20,'2020_07_09_150356_create_faqs_table',1),(21,'2020_07_09_150356_create_supports_table',1),(22,'2050_01_01_000005_create_users_table',1),(23,'2050_01_01_000010_create_password_resets_table',1),(24,'2050_01_01_000015_create_settings_table',1),(25,'2050_01_01_000020_create_activity_logs_table',1),(26,'2051_01_01_000010_create_addresses_table',1),(27,'2051_01_01_000020_create_categories_table',1),(28,'2051_01_01_000030_create_vendors_table',1),(29,'2051_01_01_000035_create_delivery_profiles_table',1),(30,'2051_01_01_000038_create_attributes_table',1),(31,'2051_01_01_000040_create_products_table',1),(32,'2051_01_01_000042_create_vendor_products_table',1),(33,'2051_01_01_000044_create_vendor_product_categories_table',1),(34,'2051_01_01_000050_create_order_conditions_table',1),(35,'2051_01_01_000060_create_orders_table',1),(36,'2051_01_01_000070_create_order_deliveries_table',1),(37,'2051_01_01_000080_create_order_addresses_table',1),(38,'2051_01_01_000100_create_order_products_table',1),(39,'2051_01_01_000110_create_order_product_addons_table',1),(40,'2051_01_01_000120_create_coupons_table',1),(41,'2051_01_01_000130_create_delivery_order_requests_table',1),(42,'2051_01_01_000200_create_hospitals_table',1),(43,'2051_01_01_000210_create_doctors_table',1),(44,'2051_01_01_000215_create_availabilities_table',1),(45,'2051_01_01_000220_create_doctors_types_table',1),(46,'2051_01_01_000225_create_hospital_services_table',1),(47,'2051_01_01_000230_create_hospital_availabilities_table',1),(48,'2051_01_01_000510_alter_orders_add_distance_travelled_table',1),(49,'2051_01_01_000550_alter_products_add_sells_count',1),(50,'2052_02_20_113000_create_wallets_table',1),(51,'2052_02_20_113500_create_wallet_transactions_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'Vtlabs\\Core\\Models\\User\\User',1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Doctoworld Personal Access Client','xMJ5KICufU5Qp7EuW7YmbUD7NmqtSdkLe2dPyT42','http://localhost',1,0,0,'2021-02-15 14:12:24','2021-02-15 14:12:24'),(2,NULL,'Doctoworld Password Grant Client','XT6XriGJSvVWdRHGrfVBV7HqzpU46s7eOye4wUDU','http://localhost',0,1,0,'2021-02-15 14:12:24','2021-02-15 14:12:24');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2021-02-15 14:12:24','2021-02-15 14:12:24');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` json NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `type` enum('prepaid','postpaid') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_methods_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,'cod','{\"en\": \"Cash On Delivery\"}',1,'postpaid','2021-02-15 14:12:10','2021-02-15 14:12:10',NULL);
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payable_id` int NOT NULL,
  `payable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_id` int DEFAULT NULL,
  `payer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(9,2) NOT NULL,
  `payment_method_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_payment_method_id_foreign` (`payment_method_id`),
  CONSTRAINT `payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rateable_id` int NOT NULL,
  `rateable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rater_id` int DEFAULT NULL,
  `rater_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` double(9,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','api','2021-02-15 14:12:07','2021-02-15 14:12:07'),(2,'customer','api','2021-02-15 14:12:07','2021-02-15 14:12:07'),(3,'vendor','api','2021-02-15 14:12:07','2021-02-15 14:12:07'),(4,'doctor','api','2021-02-15 14:12:07','2021-02-15 14:12:07'),(5,'delivery','api','2021-02-15 14:12:07','2021-02-15 14:12:07');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('string','text','json','numeric','boolean') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'currency_code','USD','string'),(2,'currency_icon','$','string'),(3,'tax_in_percent','10','string'),(4,'support_email','admin@example.com','string'),(5,'support_phone','8181818118','string'),(6,'delivery_fee','25','string'),(7,'delivery_fee_set_by','admin','string'),(8,'delivery_fee_per_km_charge','5','string'),(9,'distance_metric','KM','string'),(10,'refer_amount','50','string'),(11,'privacy_policy','Demo privacy policy','string'),(12,'about_us','Demo privacy policy','string'),(13,'terms','Demo Terms and Condition','string'),(14,'admin_commision_value','10','string');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `statuses_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supports`
--

DROP TABLE IF EXISTS `supports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supports`
--

LOCK TABLES `supports` WRITE;
/*!40000 ALTER TABLE `supports` DISABLE KEYS */;
/*!40000 ALTER TABLE `supports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_entries`
--

DROP TABLE IF EXISTS `telescope_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries` (
  `sequence` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_family_hash_index` (`family_hash`),
  KEY `telescope_entries_created_at_index` (`created_at`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_entries`
--

LOCK TABLES `telescope_entries` WRITE;
/*!40000 ALTER TABLE `telescope_entries` DISABLE KEYS */;
INSERT INTO `telescope_entries` VALUES (1,'92bd516f-551e-463f-acef-39d543b157af','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `users` (`active`, `created_at`, `email`, `mobile_number`, `mobile_verified`, `name`, `password`, `updated_at`) values (1, \'2021-02-15 19:42:07\', \'admin@example.com\', \'8888888888\', 1, \'Admin\', \'y$klqZy3AqvoniDu4Y2cpX7.o6ChvwRJVGw7nsJPSTK4IUgu\\/kXI\\/cm\', \'2021-02-15 19:42:07\')\",\"time\":\"2.11\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":33,\"hash\":\"e748379f562b94becb4e10588106a72e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(2,'92bd516f-59ba-4ea0-ac52-c4cfb22b3b48','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'admin\' and `guard_name` = \'api\' limit 1\",\"time\":\"1.79\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":36,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(3,'92bd516f-5aa1-40b2-a5d8-ba00f02e4e58','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `roles` (`name`, `guard_name`, `updated_at`, `created_at`) values (\'admin\', \'api\', \'2021-02-15 19:42:07\', \'2021-02-15 19:42:07\')\",\"time\":\"1.00\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":36,\"hash\":\"2ff04aa60d5cad24fd0a1fad61c9656d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(4,'92bd516f-5adb-48f8-a308-ae06aee73c48','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'customer\' and `guard_name` = \'api\' limit 1\",\"time\":\"0.25\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":37,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(5,'92bd516f-5b2f-4f8e-83e5-f12abc4a0210','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `roles` (`name`, `guard_name`, `updated_at`, `created_at`) values (\'customer\', \'api\', \'2021-02-15 19:42:07\', \'2021-02-15 19:42:07\')\",\"time\":\"0.46\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":37,\"hash\":\"2ff04aa60d5cad24fd0a1fad61c9656d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(6,'92bd516f-5b67-417f-94ba-9b745c9f45ef','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'vendor\' and `guard_name` = \'api\' limit 1\",\"time\":\"0.27\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":38,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(7,'92bd516f-5bdb-4e15-b0c2-c9348115f7f6','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `roles` (`name`, `guard_name`, `updated_at`, `created_at`) values (\'vendor\', \'api\', \'2021-02-15 19:42:07\', \'2021-02-15 19:42:07\')\",\"time\":\"0.80\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":38,\"hash\":\"2ff04aa60d5cad24fd0a1fad61c9656d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(8,'92bd516f-5c1e-42c1-be68-07c975badecb','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'doctor\' and `guard_name` = \'api\' limit 1\",\"time\":\"0.32\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":39,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(9,'92bd516f-5c79-4f91-bad8-1bcdba43f367','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `roles` (`name`, `guard_name`, `updated_at`, `created_at`) values (\'doctor\', \'api\', \'2021-02-15 19:42:07\', \'2021-02-15 19:42:07\')\",\"time\":\"0.51\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":39,\"hash\":\"2ff04aa60d5cad24fd0a1fad61c9656d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(10,'92bd516f-5cb5-44fe-8ee8-1639f0bf5c0e','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'delivery\' and `guard_name` = \'api\' limit 1\",\"time\":\"0.27\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":40,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(11,'92bd516f-5d10-4473-9cbf-7d8b34ee4477','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `roles` (`name`, `guard_name`, `updated_at`, `created_at`) values (\'delivery\', \'api\', \'2021-02-15 19:42:07\', \'2021-02-15 19:42:07\')\",\"time\":\"0.51\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":40,\"hash\":\"2ff04aa60d5cad24fd0a1fad61c9656d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(12,'92bd516f-5f5d-4503-b056-60f58fbd8e88','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `email` = \'admin@example.com\' limit 1\",\"time\":\"0.91\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":48,\"hash\":\"747ef04de752900539e8a3a1aee036ac\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(13,'92bd516f-600f-40d7-87f0-f945e40145da','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'admin\' and `guard_name` = \'api\' limit 1\",\"time\":\"0.88\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":54,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(14,'92bd516f-620d-4c50-a809-dc9caaf81317','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `model_has_roles` where `model_id` = 1 and `model_type` = \'Vtlabs\\\\Core\\\\Models\\\\User\\\\User\'\",\"time\":\"1.09\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":54,\"hash\":\"315dae4108fd5856c15b3460495ca602\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(15,'92bd516f-62f4-4977-887b-ca0eaf6a674c','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `model_has_roles` (`model_id`, `model_type`, `role_id`) values (1, \'Vtlabs\\\\Core\\\\Models\\\\User\\\\User\', 1)\",\"time\":\"2.00\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":54,\"hash\":\"b40636c8a9886b7fb107e3eb7dd2c0eb\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(16,'92bd516f-642f-4007-9d52-e27c09aaa861','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `roles`.*, `model_has_roles`.`model_id` as `pivot_model_id`, `model_has_roles`.`role_id` as `pivot_role_id`, `model_has_roles`.`model_type` as `pivot_model_type` from `roles` inner join `model_has_roles` on `roles`.`id` = `model_has_roles`.`role_id` where `model_has_roles`.`model_id` in (1) and `model_has_roles`.`model_type` = \'Vtlabs\\\\Core\\\\Models\\\\User\\\\User\'\",\"time\":\"2.26\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":54,\"hash\":\"30e651e0e2d06e58b62d2416b9bec300\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(17,'92bd516f-65a3-4128-a8fc-acb7d45e931b','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `settings` (`key`, `value`) values (\'currency_code\', \'USD\'), (\'currency_icon\', \'$\'), (\'tax_in_percent\', \'10\'), (\'support_email\', \'admin@example.com\'), (\'support_phone\', \'8181818118\'), (\'delivery_fee\', \'25\'), (\'delivery_fee_set_by\', \'admin\'), (\'delivery_fee_per_km_charge\', \'5\'), (\'distance_metric\', \'KM\'), (\'refer_amount\', \'50\'), (\'privacy_policy\', \'Demo privacy policy\'), (\'about_us\', \'Demo privacy policy\'), (\'terms\', \'Demo Terms and Condition\'), (\'admin_commision_value\', \'10\')\",\"time\":\"1.11\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/SettingTableSeeder.php\",\"line\":17,\"hash\":\"0869b711f292e8052393e408c23540a0\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(18,'92bd516f-6ffc-4799-89af-2d2c4dc0b309','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Personal Care\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(19,'92bd516f-7225-4e00-8143-6f551c2b0ece','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'personal-care\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Personal Care\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 1, \'2021-02-15 19:42:07\', \'2021-02-15 19:42:07\')\",\"time\":\"4.21\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":44,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:07'),(20,'92bd5171-5b46-4c58-9503-fa76f2b3924a','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"0.80\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":48,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:08'),(21,'92bd5171-5c1a-4c02-9663-e676a7a5a9c9','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 1, \'Vtlabs\\\\Category\\\\Models\\\\Category\', 1, \'2021-02-15 19:42:08\', \'2021-02-15 19:42:08\')\",\"time\":\"1.62\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":48,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:08'),(22,'92bd5171-626d-49b6-8f43-3e686baf21ce','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:1\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:08'),(23,'92bd5171-6aeb-4ada-9b82-01a559a677c3','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`id` = 1 limit 1\",\"time\":\"0.59\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":48,\"hash\":\"5da2958cdd5f200cd165ef93ed172f98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:08'),(24,'92bd5171-6f3e-4122-a5be-77d54377db2b','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionWillStart\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:1\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]},\"copiedOriginalFile\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/storage\\/medialibrary\\/temp\\/ZYlGSKhUUsmUu1gJjeDmHquxhzco96zN\\/UUG5Sz3ULNwWhz7j.png\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:08'),(25,'92bd5171-8ddb-4ab1-b05b-4ad79a1f3284','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"update `media` set `custom_properties` = \'{\\\\\\\"generated_conversions\\\\\\\":{\\\\\\\"thumb\\\\\\\":true}}\', `media`.`updated_at` = \'2021-02-15 19:42:08\' where `id` = 1\",\"time\":\"2.25\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":48,\"hash\":\"6a86d84784d7cb96b7413e8f87f2ed70\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:08'),(26,'92bd5171-8e1d-4df3-bf88-e8190c4ff90a','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionHasBeenCompleted\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:1\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]}},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:08'),(27,'92bd5171-903b-4d20-bb97-e862c6c8c477','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Skin Care\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:08'),(28,'92bd5171-90b8-4ed9-b3a3-4d83ceefa9d2','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`title`, `slug`, `sort_order`, `meta`, `parent_id`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Skin Care\\\\\\\"}\', \'skin-care\', 1, \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 1, \'2021-02-15 19:42:08\', \'2021-02-15 19:42:08\')\",\"time\":\"0.81\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":50,\"hash\":\"eac6e78116221aa03993c274c1a7f063\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:08'),(29,'92bd5171-90ce-43bd-897b-378d7740a621','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Baby Care\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:08'),(30,'92bd5171-912c-4ad6-83e7-27ebbf6c7e16','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`title`, `slug`, `sort_order`, `meta`, `parent_id`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Baby Care\\\\\\\"}\', \'baby-care\', 2, \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 1, \'2021-02-15 19:42:08\', \'2021-02-15 19:42:08\')\",\"time\":\"0.58\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":50,\"hash\":\"eac6e78116221aa03993c274c1a7f063\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:08'),(31,'92bd5171-9142-4bd2-913a-df7b31190180','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Hair Care\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:08'),(32,'92bd5171-91da-4d05-8915-a8fe5b669d4d','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`title`, `slug`, `sort_order`, `meta`, `parent_id`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Hair Care\\\\\\\"}\', \'hair-care\', 3, \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 1, \'2021-02-15 19:42:08\', \'2021-02-15 19:42:08\')\",\"time\":\"1.17\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":50,\"hash\":\"eac6e78116221aa03993c274c1a7f063\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:08'),(33,'92bd5171-91f1-4559-9a3a-5af98de0133a','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"OTC Medicines\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:08'),(34,'92bd5171-9248-496d-8d78-d038b5163513','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'otc-medicines\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"OTC Medicines\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 1, \'2021-02-15 19:42:08\', \'2021-02-15 19:42:08\')\",\"time\":\"0.52\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":44,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:08'),(35,'92bd5173-889d-4477-a876-446f282ce2b4','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"0.40\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":48,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(36,'92bd5173-8916-48e6-b6ec-06f608818636','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 5, \'Vtlabs\\\\Category\\\\Models\\\\Category\', 2, \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"0.83\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":48,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(37,'92bd5173-89d1-4213-acb3-80bdece834a5','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:2\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(38,'92bd5173-8a44-40b6-8525-e9ffe88f04a4','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`id` = 2 limit 1\",\"time\":\"0.38\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":48,\"hash\":\"5da2958cdd5f200cd165ef93ed172f98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(39,'92bd5173-8ab6-49c0-991f-82ba599e6083','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionWillStart\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:2\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]},\"copiedOriginalFile\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/storage\\/medialibrary\\/temp\\/NwGk5PKADcK120kThxd4YusLmfjmCeNu\\/JHIaPotttIZm4XJg.png\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(40,'92bd5173-8fb7-455f-a3bc-b8746c415d7f','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"update `media` set `custom_properties` = \'{\\\\\\\"generated_conversions\\\\\\\":{\\\\\\\"thumb\\\\\\\":true}}\', `media`.`updated_at` = \'2021-02-15 19:42:10\' where `id` = 2\",\"time\":\"0.94\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":48,\"hash\":\"6a86d84784d7cb96b7413e8f87f2ed70\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(41,'92bd5173-8fd6-479a-a2d9-dc1721837a45','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionHasBeenCompleted\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:2\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]}},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(42,'92bd5173-9148-4c2b-bf86-ddc15036b1ce','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"First Aid\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(43,'92bd5173-91cc-4621-ae1e-4a1a2cdc4a25','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`title`, `slug`, `sort_order`, `meta`, `parent_id`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"First Aid\\\\\\\"}\', \'first-aid\', 1, \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 5, \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"0.88\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":50,\"hash\":\"eac6e78116221aa03993c274c1a7f063\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(44,'92bd5173-91e3-4d76-8bb7-666dee05b382','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Fever\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(45,'92bd5173-925b-4df3-b9b1-3b24cc7a299e','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`title`, `slug`, `sort_order`, `meta`, `parent_id`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Fever\\\\\\\"}\', \'fever\', 2, \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 5, \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"0.84\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":50,\"hash\":\"eac6e78116221aa03993c274c1a7f063\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(46,'92bd5173-9270-41c4-9fad-cea8eeaa1017','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Pain\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(47,'92bd5173-92d1-4c8c-b379-e313775946e7','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`title`, `slug`, `sort_order`, `meta`, `parent_id`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Pain\\\\\\\"}\', \'pain\', 3, \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 5, \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"0.61\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":50,\"hash\":\"eac6e78116221aa03993c274c1a7f063\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(48,'92bd5173-92eb-43f2-8078-ab52d38e4136','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"MBBS\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(49,'92bd5173-9342-4852-b6c6-20d514a3638f','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'mbbs\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"MBBS\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"degree\\\\\\\"}\', 1, \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"0.55\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":63,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(50,'92bd5173-9359-48c1-ad0d-e93aaa6dbd64','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Hypertension Treatment\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(51,'92bd5173-93de-4403-9207-66937d8b0109','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'hypertension-treatment\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Hypertension Treatment\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"services\\\\\\\"}\', 1, \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"1.02\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":82,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(52,'92bd5173-93f6-4ad7-919c-2a5b018cc678','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Diabetes Treatment\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(53,'92bd5173-9450-4d78-b92d-a6abb39f2a19','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'diabetes-treatment\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Diabetes Treatment\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"services\\\\\\\"}\', 1, \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"0.56\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":82,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(54,'92bd5173-9467-442f-8a5d-86eda7c68419','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"General Physician\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(55,'92bd5173-94c2-49ea-8251-4217062e062d','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'general-physician\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"General Physician\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"specializations\\\\\\\"}\', 1, \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"0.60\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":101,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(56,'92bd5173-94d8-48f4-a5d6-589fb894a103','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Cardialogist\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(57,'92bd5173-952d-4fce-8a53-ece228483ffe','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'cardialogist\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Cardialogist\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"specializations\\\\\\\"}\', 1, \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"0.53\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":101,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(58,'92bd5173-9545-4fb7-abe7-3b413d134034','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Doctor\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(59,'92bd5173-959a-4d51-8a20-86dbd239bd47','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'doctor\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Doctor\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"type\\\\\\\"}\', 1, \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"0.51\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":120,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(60,'92bd5173-95b0-468a-a75f-9a1b0412a2ef','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Category\\\\Models\\\\Category:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Dentist\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(61,'92bd5173-963b-4f5b-987d-f1ca2b0715fe','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `categories` (`slug`, `title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'dentist\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Dentist\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"type\\\\\\\"}\', 1, \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"1.08\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CategoryTableSeeder.php\",\"line\":120,\"hash\":\"505f8c20c7ae9efcefa357431ea038c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(62,'92bd5173-971c-41e6-a11a-1a507cd836dd','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Doctor\\\\Models\\\\Hospital:\",\"key\":\"name\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Apollo Hospitals\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(63,'92bd5173-9730-4a2c-88fd-097e9acb7488','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Doctor\\\\Models\\\\Hospital:\",\"key\":\"tagline\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Apollo Hospitals Tagline\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(64,'92bd5173-9740-453a-8ad7-b27476e3f49e','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Doctor\\\\Models\\\\Hospital:\",\"key\":\"details\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Apollo Hospitals Details\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(65,'92bd5173-97fd-4e9f-a770-6772d800b8de','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `doctor_hospitals` (`slug`, `name`, `tagline`, `details`, `address`, `sort_order`, `updated_at`, `created_at`) values (\'apollo-hospitals\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Apollo Hospitals\\\\\\\"}\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Apollo Hospitals Tagline\\\\\\\"}\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Apollo Hospitals Details\\\\\\\"}\', \'Test Address\', 1, \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"1.53\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/HospitalTableSeeder.php\",\"line\":33,\"hash\":\"c4b50863e56d3f325c4f730d8d49c1d0\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(66,'92bd5173-981a-4683-b1db-c392cab2a5be','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Doctor\\\\Models\\\\Hospital:\",\"key\":\"name\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Max Hospitals\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(67,'92bd5173-982a-48a0-a295-992fb04a3896','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Doctor\\\\Models\\\\Hospital:\",\"key\":\"tagline\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Max Hospitals Tagline\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(68,'92bd5173-983a-435d-b5bf-783e4d998146','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Doctor\\\\Models\\\\Hospital:\",\"key\":\"details\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Max Hospitals Details\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(69,'92bd5173-9893-4952-819a-a95a3de27423','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `doctor_hospitals` (`slug`, `name`, `tagline`, `details`, `address`, `sort_order`, `updated_at`, `created_at`) values (\'max-hospitals\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Max Hospitals\\\\\\\"}\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Max Hospitals Tagline\\\\\\\"}\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Max Hospitals Details\\\\\\\"}\', \'Test Address\', 1, \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"0.56\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/HospitalTableSeeder.php\",\"line\":33,\"hash\":\"c4b50863e56d3f325c4f730d8d49c1d0\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(70,'92bd5173-9919-49a1-a8ab-fd458246b738','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Payment\\\\Models\\\\PaymentMethod:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Cash On Delivery\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(71,'92bd5173-9980-4580-bdb2-6a7381b19325','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `payment_methods` (`slug`, `title`, `enabled`, `type`, `updated_at`, `created_at`) values (\'cod\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Cash On Delivery\\\\\\\"}\', 1, \'postpaid\', \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"0.66\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/PaymentMethodTableSeeder.php\",\"line\":24,\"hash\":\"db23f33fd19440cd530773c51f78f60e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(72,'92bd5173-9a41-4faf-a65b-ebb961eeff9a','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Ecommerce\\\\Models\\\\Coupon:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Test Coupon\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(73,'92bd5173-9a56-4671-891a-e326d99600f7','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Ecommerce\\\\Models\\\\Coupon:\",\"key\":\"detail\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Test Coupon Details\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(74,'92bd5173-9b10-4938-9495-da5051599538','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `ecommerce_coupons` (`title`, `detail`, `code`, `reward`, `type`, `expires_at`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Test Coupon\\\\\\\"}\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Test Coupon Details\\\\\\\"}\', \'TEST100\', 10, \'percent\', \'2020-12-31\', \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"1.47\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CouponTableSeeder.php\",\"line\":41,\"hash\":\"bbd756391c4a95f5b4632e697f9e3d34\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(75,'92bd5173-9b28-4620-ad3c-100f6038aa15','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Ecommerce\\\\Models\\\\Coupon:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Test Coupon 2\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(76,'92bd5173-9b39-4c81-9f2c-c3ccad278f74','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Ecommerce\\\\Models\\\\Coupon:\",\"key\":\"detail\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Test Coupon 2 Details\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(77,'92bd5173-9b96-46ac-b156-1a46d7f44854','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `ecommerce_coupons` (`title`, `detail`, `code`, `reward`, `type`, `expires_at`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Test Coupon 2\\\\\\\"}\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Test Coupon 2 Details\\\\\\\"}\', \'TEST200\', 20, \'percent\', \'2020-12-31\', \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"0.59\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CouponTableSeeder.php\",\"line\":41,\"hash\":\"bbd756391c4a95f5b4632e697f9e3d34\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(78,'92bd5173-9bac-4950-8df2-1f00733a7e90','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Ecommerce\\\\Models\\\\Coupon:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Test Coupon 3\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(79,'92bd5173-9bbd-4562-87c9-174605c71a7d','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Ecommerce\\\\Models\\\\Coupon:\",\"key\":\"detail\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Test Coupon 3 Details\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(80,'92bd5173-9c13-4b9c-80ce-0ed306a75e0f','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `ecommerce_coupons` (`title`, `detail`, `code`, `reward`, `type`, `expires_at`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Test Coupon 3\\\\\\\"}\', \'{\\\\\\\"en\\\\\\\":\\\\\\\"Test Coupon 3 Details\\\\\\\"}\', \'TEST300\', 30, \'percent\', \'2020-12-31\', \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"0.53\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/CouponTableSeeder.php\",\"line\":41,\"hash\":\"bbd756391c4a95f5b4632e697f9e3d34\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(81,'92bd5173-9da3-4fd8-9013-d2a0aeae333f','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `faqs` (`title`, `short_description`, `description`, `updated_at`, `created_at`) values (\'Lorem ipsum\', \'Lorem ipsum dolor sit amet.\', \'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\', \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"1.56\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/FaqTableSeeder.php\",\"line\":29,\"hash\":\"1155d5a654286fcedefebe1653aa3c98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(82,'92bd5173-9e2e-4135-8fad-5a4fbdc4f5ee','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `faqs` (`title`, `short_description`, `description`, `updated_at`, `created_at`) values (\'Lorem dolor\', \'Lorem dolor ipsum dolor sit amet.\', \'Lorem dolor ipsum sit amet, consectetur adipiscing elit.\', \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"0.79\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/FaqTableSeeder.php\",\"line\":29,\"hash\":\"1155d5a654286fcedefebe1653aa3c98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(83,'92bd5173-9ef0-4fe3-93be-a768c8c25eef','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Banner\\\\Models\\\\Banner:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(84,'92bd5173-9fc0-4b92-b524-736d4705aa40','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `banners` (`title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 1, \'2021-02-15 19:42:10\', \'2021-02-15 19:42:10\')\",\"time\":\"1.58\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":49,\"hash\":\"96ad107124f9feb780ddbe354a4e1c9d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:10'),(85,'92bd5175-bdf5-4503-a9e1-3494bb63cb65','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"0.50\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:11'),(86,'92bd5175-be95-4a8b-83d9-1f6f5a4068cc','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 1, \'Vtlabs\\\\Banner\\\\Models\\\\Banner\', 3, \'2021-02-15 19:42:11\', \'2021-02-15 19:42:11\')\",\"time\":\"1.10\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:11'),(87,'92bd5175-bef7-4050-abf7-40d53e0cb048','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:3\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:11'),(88,'92bd5175-c009-409c-82d3-abdaaa62de98','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`id` = 3 limit 1\",\"time\":\"1.71\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"5da2958cdd5f200cd165ef93ed172f98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:11'),(89,'92bd5175-c0bc-49b5-a78f-9dfa5d0d7a52','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionWillStart\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:3\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]},\"copiedOriginalFile\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/storage\\/medialibrary\\/temp\\/h3H7IEBQkwywUt9uOVg1xMAftfMeoPQ8\\/S2OcxG65tbxx9CQJ.png\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:11'),(90,'92bd5175-c5fa-4310-be1e-4c09dda46483','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"update `media` set `custom_properties` = \'{\\\\\\\"generated_conversions\\\\\\\":{\\\\\\\"thumb\\\\\\\":true}}\', `media`.`updated_at` = \'2021-02-15 19:42:11\' where `id` = 3\",\"time\":\"1.09\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"6a86d84784d7cb96b7413e8f87f2ed70\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:11'),(91,'92bd5175-c61d-4af3-8557-9c82fcda581a','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionHasBeenCompleted\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:3\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]}},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:11'),(92,'92bd5175-c7ca-4709-b0c0-e8b9c6fab22a','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Banner\\\\Models\\\\Banner:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:11'),(93,'92bd5175-c84a-4063-b6b6-9cc62395d7e6','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `banners` (`title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"ecommerce\\\\\\\"}\', 2, \'2021-02-15 19:42:11\', \'2021-02-15 19:42:11\')\",\"time\":\"0.80\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":49,\"hash\":\"96ad107124f9feb780ddbe354a4e1c9d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:11'),(94,'92bd5177-effd-474b-8481-dc4ba6f8ef54','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"0.51\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:12'),(95,'92bd5177-f099-43e4-8758-4485aca862ef','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 2, \'Vtlabs\\\\Banner\\\\Models\\\\Banner\', 4, \'2021-02-15 19:42:12\', \'2021-02-15 19:42:12\')\",\"time\":\"1.06\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:12'),(96,'92bd5177-f0f4-4882-b058-b53114af5a89','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:4\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:12'),(97,'92bd5177-f17f-45a6-894c-4877a3b4f182','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`id` = 4 limit 1\",\"time\":\"0.48\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"5da2958cdd5f200cd165ef93ed172f98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:12'),(98,'92bd5177-f20c-449d-927f-87101be80e3b','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionWillStart\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:4\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]},\"copiedOriginalFile\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/storage\\/medialibrary\\/temp\\/HEF2ks0TINZbtLDptCZeLbFlc0k7wSo4\\/rhrABY84i4TPWo40.png\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:12'),(99,'92bd5177-f751-4059-91e0-1186587da780','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"update `media` set `custom_properties` = \'{\\\\\\\"generated_conversions\\\\\\\":{\\\\\\\"thumb\\\\\\\":true}}\', `media`.`updated_at` = \'2021-02-15 19:42:12\' where `id` = 4\",\"time\":\"1.18\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"6a86d84784d7cb96b7413e8f87f2ed70\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:12'),(100,'92bd5177-f774-4a53-80bc-3ba6aeb66d3c','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionHasBeenCompleted\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:4\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]}},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:12'),(101,'92bd5177-f978-4b34-bfe9-90b5dade0f1a','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Banner\\\\Models\\\\Banner:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:12'),(102,'92bd5177-fa06-445e-9b30-a057d7c18b25','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `banners` (`title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"doctor\\\\\\\"}\', 1, \'2021-02-15 19:42:12\', \'2021-02-15 19:42:12\')\",\"time\":\"0.94\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":49,\"hash\":\"96ad107124f9feb780ddbe354a4e1c9d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:12'),(103,'92bd5179-bd33-40c5-985c-178cae963566','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"0.47\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:14'),(104,'92bd5179-bdca-46db-b966-db3f9ddb2a46','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 3, \'Vtlabs\\\\Banner\\\\Models\\\\Banner\', 5, \'2021-02-15 19:42:14\', \'2021-02-15 19:42:14\')\",\"time\":\"1.03\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:14'),(105,'92bd5179-be95-4207-90b5-f1d6d0393e5b','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:5\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:14'),(106,'92bd5179-bf2d-40dd-8d98-1cb0b8618121','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`id` = 5 limit 1\",\"time\":\"0.58\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"5da2958cdd5f200cd165ef93ed172f98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:14'),(107,'92bd5179-bfba-4bdc-87fa-5650e2104ec1','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionWillStart\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:5\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]},\"copiedOriginalFile\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/storage\\/medialibrary\\/temp\\/zKkBnKpOnQlHj3xIgW1DzXvED8lV8kMS\\/bjxpfK0lgoq5hmAU.png\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:14'),(108,'92bd5179-c57d-41e1-9eda-12b61138a731','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"update `media` set `custom_properties` = \'{\\\\\\\"generated_conversions\\\\\\\":{\\\\\\\"thumb\\\\\\\":true}}\', `media`.`updated_at` = \'2021-02-15 19:42:14\' where `id` = 5\",\"time\":\"1.08\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"6a86d84784d7cb96b7413e8f87f2ed70\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:14'),(109,'92bd5179-c5a2-48a8-aabc-d579180e1a45','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionHasBeenCompleted\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:5\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]}},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:14'),(110,'92bd5179-c756-4bd9-a89c-e802501cb863','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Banner\\\\Models\\\\Banner:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:14'),(111,'92bd5179-c7e3-4486-9ab6-d387f3e2658e','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `banners` (`title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"doctor\\\\\\\"}\', 2, \'2021-02-15 19:42:14\', \'2021-02-15 19:42:14\')\",\"time\":\"0.90\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":49,\"hash\":\"96ad107124f9feb780ddbe354a4e1c9d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:14'),(112,'92bd517b-b046-4638-8a1b-bc66fc93bb05','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"0.44\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:15'),(113,'92bd517b-b0c5-44d5-b36c-7a2204ef5f75','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 4, \'Vtlabs\\\\Banner\\\\Models\\\\Banner\', 6, \'2021-02-15 19:42:15\', \'2021-02-15 19:42:15\')\",\"time\":\"0.86\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:15'),(114,'92bd517b-b115-4cd6-8a07-299ccd25858e','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:6\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:15'),(115,'92bd517b-b196-4f8b-b508-8d154d153788','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`id` = 6 limit 1\",\"time\":\"0.46\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"5da2958cdd5f200cd165ef93ed172f98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:15'),(116,'92bd517b-b215-4da4-a5c7-762ae5c20aab','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionWillStart\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:6\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]},\"copiedOriginalFile\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/storage\\/medialibrary\\/temp\\/NJZtFFDnJ0qzjZQflcQPERHNQyUS22W3\\/IFLVzyCqwHBMO6b2.png\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:15'),(117,'92bd517b-b749-4172-b8fd-d0b8229a51c9','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"update `media` set `custom_properties` = \'{\\\\\\\"generated_conversions\\\\\\\":{\\\\\\\"thumb\\\\\\\":true}}\', `media`.`updated_at` = \'2021-02-15 19:42:15\' where `id` = 6\",\"time\":\"0.99\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"6a86d84784d7cb96b7413e8f87f2ed70\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:15'),(118,'92bd517b-b76d-4d9e-a357-878730686120','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionHasBeenCompleted\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:6\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]}},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:15'),(119,'92bd517b-b8fc-451c-8a23-a0161c45ead8','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Banner\\\\Models\\\\Banner:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:15'),(120,'92bd517b-b97b-4ddd-97b8-0401682f9124','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `banners` (`title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"hospital\\\\\\\"}\', 1, \'2021-02-15 19:42:15\', \'2021-02-15 19:42:15\')\",\"time\":\"0.80\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":49,\"hash\":\"96ad107124f9feb780ddbe354a4e1c9d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:15'),(121,'92bd517d-854c-403e-980c-d35fbd793c13','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"0.44\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:16'),(122,'92bd517d-85cb-4a76-8b21-7fee0056a25c','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 5, \'Vtlabs\\\\Banner\\\\Models\\\\Banner\', 7, \'2021-02-15 19:42:16\', \'2021-02-15 19:42:16\')\",\"time\":\"0.86\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:16'),(123,'92bd517d-866e-4900-ab1e-80a1e2aa1f76','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:7\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:16'),(124,'92bd517d-86fb-4fab-abb9-4d8d89d4d269','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`id` = 7 limit 1\",\"time\":\"0.55\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"5da2958cdd5f200cd165ef93ed172f98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:16'),(125,'92bd517d-877b-4a58-b619-0476d142bbce','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionWillStart\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:7\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]},\"copiedOriginalFile\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/storage\\/medialibrary\\/temp\\/g5k92BDbbCXX9vvC8K8iqmlEIpQjDhQT\\/my3CWPiNJElichGg.png\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:16'),(126,'92bd517d-8d23-4eae-b2e5-deb2fa4a7b22','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"update `media` set `custom_properties` = \'{\\\\\\\"generated_conversions\\\\\\\":{\\\\\\\"thumb\\\\\\\":true}}\', `media`.`updated_at` = \'2021-02-15 19:42:16\' where `id` = 7\",\"time\":\"1.03\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"6a86d84784d7cb96b7413e8f87f2ed70\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:16'),(127,'92bd517d-8d47-415b-b948-080281214d18','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionHasBeenCompleted\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:7\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]}},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:16'),(128,'92bd517d-8f7c-4da7-8aca-175585859d01','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\Translatable\\\\Events\\\\TranslationHasBeenSet\",\"payload\":{\"model\":\"Vtlabs\\\\Banner\\\\Models\\\\Banner:\",\"key\":\"title\",\"locale\":\"en\",\"oldValue\":\"\",\"newValue\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:16'),(129,'92bd517d-900a-4701-8a09-318714762d4a','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `banners` (`title`, `meta`, `sort_order`, `updated_at`, `created_at`) values (\'{\\\\\\\"en\\\\\\\":\\\\\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\\\\\\\"}\', \'{\\\\\\\"scope\\\\\\\":\\\\\\\"hospital\\\\\\\"}\', 2, \'2021-02-15 19:42:16\', \'2021-02-15 19:42:16\')\",\"time\":\"0.93\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":49,\"hash\":\"96ad107124f9feb780ddbe354a4e1c9d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:16'),(130,'92bd517f-7099-4830-84b9-0e1e91f0dc72','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`order_column`) as aggregate from `media`\",\"time\":\"0.55\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7ca353d7601202740301a9e22a2ef124\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:17'),(131,'92bd517f-7139-4dbd-8a1b-3ca1e013c065','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `media` (`name`, `file_name`, `disk`, `collection_name`, `mime_type`, `size`, `custom_properties`, `responsive_images`, `manipulations`, `model_id`, `model_type`, `order_column`, `updated_at`, `created_at`) values (\'200\', \'200.png\', \'public\', \'images\', \'image\\/png\', 781, \'[]\', \'[]\', \'[]\', 6, \'Vtlabs\\\\Banner\\\\Models\\\\Banner\', 8, \'2021-02-15 19:42:17\', \'2021-02-15 19:42:17\')\",\"time\":\"1.11\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"7aea3bdb29139fee47ead42f0844d7b4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:17'),(132,'92bd517f-719e-4ca1-b863-25439298ed74','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\MediaHasBeenAdded\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:8\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:17'),(133,'92bd517f-722e-41a6-ab45-6778a3d19672','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `media` where `media`.`id` = 8 limit 1\",\"time\":\"0.57\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"5da2958cdd5f200cd165ef93ed172f98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:17'),(134,'92bd517f-72b5-418b-ac71-13cc23181378','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionWillStart\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:8\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]},\"copiedOriginalFile\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/storage\\/medialibrary\\/temp\\/csABQQaJXiOIrslZmGyODBhSg3YaV3df\\/CxQYJWeWG4JMk3Cy.png\"},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:17'),(135,'92bd517f-7865-4384-9780-478934d00c1c','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"update `media` set `custom_properties` = \'{\\\\\\\"generated_conversions\\\\\\\":{\\\\\\\"thumb\\\\\\\":true}}\', `media`.`updated_at` = \'2021-02-15 19:42:17\' where `id` = 8\",\"time\":\"0.92\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/database\\/seeds\\/BannerTableSeeder.php\",\"line\":53,\"hash\":\"6a86d84784d7cb96b7413e8f87f2ed70\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:17'),(136,'92bd517f-7891-4d5c-8a41-5d71de13364e','92bd517f-7a4d-4657-9ac3-28fa8fba373e',NULL,1,'event','{\"name\":\"Spatie\\\\MediaLibrary\\\\Events\\\\ConversionHasBeenCompleted\",\"payload\":{\"media\":\"Spatie\\\\MediaLibrary\\\\Models\\\\Media:8\",\"conversion\":{\"class\":\"Spatie\\\\MediaLibrary\\\\Conversion\\\\Conversion\",\"properties\":[]}},\"listeners\":[],\"broadcast\":false,\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:17'),(137,'92bd518a-62d1-4f9b-a5c2-3598fc5f99b4','92bd518a-674e-46de-8c59-507c73c2a617',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `oauth_clients` (`user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `updated_at`, `created_at`) values (null, \'Doctoworld Personal Access Client\', \'xMJ5KICufU5Qp7EuW7YmbUD7NmqtSdkLe2dPyT42\', \'http:\\/\\/localhost\', 1, 0, 0, \'2021-02-15 19:42:24\', \'2021-02-15 19:42:24\')\",\"time\":\"1.07\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"bc77ccc261b03668020fd7c60ae5eebc\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:24'),(138,'92bd518a-6679-4ee8-987c-edd4e926e659','92bd518a-674e-46de-8c59-507c73c2a617',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `oauth_personal_access_clients` (`client_id`, `updated_at`, `created_at`) values (1, \'2021-02-15 19:42:24\', \'2021-02-15 19:42:24\')\",\"time\":\"6.86\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"ebe2f9b5834a09d9cc954abb8c72b92b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:24'),(139,'92bd518a-671a-4939-bac1-60fcb16ec550','92bd518a-674e-46de-8c59-507c73c2a617',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `oauth_clients` (`user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `updated_at`, `created_at`) values (null, \'Doctoworld Password Grant Client\', \'XT6XriGJSvVWdRHGrfVBV7HqzpU46s7eOye4wUDU\', \'http:\\/\\/localhost\', 0, 1, 0, \'2021-02-15 19:42:24\', \'2021-02-15 19:42:24\')\",\"time\":\"0.77\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/doctoworld\\/doctoworld\\/artisan\",\"line\":35,\"hash\":\"bc77ccc261b03668020fd7c60ae5eebc\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-02-15 19:42:24');
/*!40000 ALTER TABLE `telescope_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_entries_tags`
--

DROP TABLE IF EXISTS `telescope_entries_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_entries_tags`
--

LOCK TABLES `telescope_entries_tags` WRITE;
/*!40000 ALTER TABLE `telescope_entries_tags` DISABLE KEYS */;
INSERT INTO `telescope_entries_tags` VALUES ('92bd516f-6ffc-4799-89af-2d2c4dc0b309','Vtlabs\\Category\\Models\\Category:'),('92bd5171-626d-49b6-8f43-3e686baf21ce','Spatie\\MediaLibrary\\Models\\Media:1'),('92bd5171-6f3e-4122-a5be-77d54377db2b','Spatie\\MediaLibrary\\Models\\Media:1'),('92bd5171-8e1d-4df3-bf88-e8190c4ff90a','Spatie\\MediaLibrary\\Models\\Media:1'),('92bd5171-903b-4d20-bb97-e862c6c8c477','Vtlabs\\Category\\Models\\Category:'),('92bd5171-90ce-43bd-897b-378d7740a621','Vtlabs\\Category\\Models\\Category:'),('92bd5171-9142-4bd2-913a-df7b31190180','Vtlabs\\Category\\Models\\Category:'),('92bd5171-91f1-4559-9a3a-5af98de0133a','Vtlabs\\Category\\Models\\Category:'),('92bd5173-89d1-4213-acb3-80bdece834a5','Spatie\\MediaLibrary\\Models\\Media:2'),('92bd5173-8ab6-49c0-991f-82ba599e6083','Spatie\\MediaLibrary\\Models\\Media:2'),('92bd5173-8fd6-479a-a2d9-dc1721837a45','Spatie\\MediaLibrary\\Models\\Media:2'),('92bd5173-9148-4c2b-bf86-ddc15036b1ce','Vtlabs\\Category\\Models\\Category:'),('92bd5173-91e3-4d76-8bb7-666dee05b382','Vtlabs\\Category\\Models\\Category:'),('92bd5173-9270-41c4-9fad-cea8eeaa1017','Vtlabs\\Category\\Models\\Category:'),('92bd5173-92eb-43f2-8078-ab52d38e4136','Vtlabs\\Category\\Models\\Category:'),('92bd5173-9359-48c1-ad0d-e93aaa6dbd64','Vtlabs\\Category\\Models\\Category:'),('92bd5173-93f6-4ad7-919c-2a5b018cc678','Vtlabs\\Category\\Models\\Category:'),('92bd5173-9467-442f-8a5d-86eda7c68419','Vtlabs\\Category\\Models\\Category:'),('92bd5173-94d8-48f4-a5d6-589fb894a103','Vtlabs\\Category\\Models\\Category:'),('92bd5173-9545-4fb7-abe7-3b413d134034','Vtlabs\\Category\\Models\\Category:'),('92bd5173-95b0-468a-a75f-9a1b0412a2ef','Vtlabs\\Category\\Models\\Category:'),('92bd5173-971c-41e6-a11a-1a507cd836dd','Vtlabs\\Doctor\\Models\\Hospital:'),('92bd5173-9730-4a2c-88fd-097e9acb7488','Vtlabs\\Doctor\\Models\\Hospital:'),('92bd5173-9740-453a-8ad7-b27476e3f49e','Vtlabs\\Doctor\\Models\\Hospital:'),('92bd5173-981a-4683-b1db-c392cab2a5be','Vtlabs\\Doctor\\Models\\Hospital:'),('92bd5173-982a-48a0-a295-992fb04a3896','Vtlabs\\Doctor\\Models\\Hospital:'),('92bd5173-983a-435d-b5bf-783e4d998146','Vtlabs\\Doctor\\Models\\Hospital:'),('92bd5173-9919-49a1-a8ab-fd458246b738','Vtlabs\\Payment\\Models\\PaymentMethod:'),('92bd5173-9a41-4faf-a65b-ebb961eeff9a','Vtlabs\\Ecommerce\\Models\\Coupon:'),('92bd5173-9a56-4671-891a-e326d99600f7','Vtlabs\\Ecommerce\\Models\\Coupon:'),('92bd5173-9b28-4620-ad3c-100f6038aa15','Vtlabs\\Ecommerce\\Models\\Coupon:'),('92bd5173-9b39-4c81-9f2c-c3ccad278f74','Vtlabs\\Ecommerce\\Models\\Coupon:'),('92bd5173-9bac-4950-8df2-1f00733a7e90','Vtlabs\\Ecommerce\\Models\\Coupon:'),('92bd5173-9bbd-4562-87c9-174605c71a7d','Vtlabs\\Ecommerce\\Models\\Coupon:'),('92bd5173-9ef0-4fe3-93be-a768c8c25eef','Vtlabs\\Banner\\Models\\Banner:'),('92bd5175-bef7-4050-abf7-40d53e0cb048','Spatie\\MediaLibrary\\Models\\Media:3'),('92bd5175-c0bc-49b5-a78f-9dfa5d0d7a52','Spatie\\MediaLibrary\\Models\\Media:3'),('92bd5175-c61d-4af3-8557-9c82fcda581a','Spatie\\MediaLibrary\\Models\\Media:3'),('92bd5175-c7ca-4709-b0c0-e8b9c6fab22a','Vtlabs\\Banner\\Models\\Banner:'),('92bd5177-f0f4-4882-b058-b53114af5a89','Spatie\\MediaLibrary\\Models\\Media:4'),('92bd5177-f20c-449d-927f-87101be80e3b','Spatie\\MediaLibrary\\Models\\Media:4'),('92bd5177-f774-4a53-80bc-3ba6aeb66d3c','Spatie\\MediaLibrary\\Models\\Media:4'),('92bd5177-f978-4b34-bfe9-90b5dade0f1a','Vtlabs\\Banner\\Models\\Banner:'),('92bd5179-be95-4207-90b5-f1d6d0393e5b','Spatie\\MediaLibrary\\Models\\Media:5'),('92bd5179-bfba-4bdc-87fa-5650e2104ec1','Spatie\\MediaLibrary\\Models\\Media:5'),('92bd5179-c5a2-48a8-aabc-d579180e1a45','Spatie\\MediaLibrary\\Models\\Media:5'),('92bd5179-c756-4bd9-a89c-e802501cb863','Vtlabs\\Banner\\Models\\Banner:'),('92bd517b-b115-4cd6-8a07-299ccd25858e','Spatie\\MediaLibrary\\Models\\Media:6'),('92bd517b-b215-4da4-a5c7-762ae5c20aab','Spatie\\MediaLibrary\\Models\\Media:6'),('92bd517b-b76d-4d9e-a357-878730686120','Spatie\\MediaLibrary\\Models\\Media:6'),('92bd517b-b8fc-451c-8a23-a0161c45ead8','Vtlabs\\Banner\\Models\\Banner:'),('92bd517d-866e-4900-ab1e-80a1e2aa1f76','Spatie\\MediaLibrary\\Models\\Media:7'),('92bd517d-877b-4a58-b619-0476d142bbce','Spatie\\MediaLibrary\\Models\\Media:7'),('92bd517d-8d47-415b-b948-080281214d18','Spatie\\MediaLibrary\\Models\\Media:7'),('92bd517d-8f7c-4da7-8aca-175585859d01','Vtlabs\\Banner\\Models\\Banner:'),('92bd517f-719e-4ca1-b863-25439298ed74','Spatie\\MediaLibrary\\Models\\Media:8'),('92bd517f-72b5-418b-ac71-13cc23181378','Spatie\\MediaLibrary\\Models\\Media:8'),('92bd517f-7891-4d5c-8a41-5d71de13364e','Spatie\\MediaLibrary\\Models\\Media:8');
/*!40000 ALTER TABLE `telescope_entries_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_monitoring`
--

DROP TABLE IF EXISTS `telescope_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_monitoring` (
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_monitoring`
--

LOCK TABLES `telescope_monitoring` WRITE;
/*!40000 ALTER TABLE `telescope_monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope_monitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_follower`
--

DROP TABLE IF EXISTS `user_follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_follower` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `following_id` bigint unsigned NOT NULL,
  `follower_id` bigint unsigned NOT NULL,
  `accepted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_follower_following_id_index` (`following_id`),
  KEY `user_follower_follower_id_index` (`follower_id`),
  KEY `user_follower_accepted_at_index` (`accepted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_follower`
--

LOCK TABLES `user_follower` WRITE;
/*!40000 ALTER TABLE `user_follower` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_follower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_verified` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `notification` json DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_number_unique` (`mobile_number`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@example.com',NULL,'$2y$10$klqZy3AqvoniDu4Y2cpX7.o6ChvwRJVGw7nsJPSTK4IUgu/kXI/cm','8888888888',1,1,'en',NULL,NULL,NULL,'2021-02-15 14:12:07','2021-02-15 14:12:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_transactions`
--

DROP TABLE IF EXISTS `wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `wallet_id` int unsigned NOT NULL,
  `amount` int NOT NULL,
  `hash` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallet_transactions_wallet_id_foreign` (`wallet_id`),
  CONSTRAINT `wallet_transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_transactions`
--

LOCK TABLES `wallet_transactions` WRITE;
/*!40000 ALTER TABLE `wallet_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `balance` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallets_user_id_foreign` (`user_id`),
  CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-16  1:12:50
