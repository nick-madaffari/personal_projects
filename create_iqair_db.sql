CREATE DATABASE `iqair_api`; 
USE `iqair_api`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

CREATE TABLE `pollution` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `us_aqi` int DEFAULT NULL,
  `cn_aqi` int DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `weather` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `temperature` int DEFAULT NULL,
  `pressure` int DEFAULT NULL,
  `humidity` int DEFAULT NULL,
  `wind_speed` decimal(4,2) DEFAULT NULL,
  `wind_direction` int DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;