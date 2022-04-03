CREATE DATABASE `iqair_api`; 
USE `iqair_api`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

CREATE TABLE `pollution` (
  `record_id` int unsigned NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `us_aqi` smallint DEFAULT NULL,
  `cn_aqi` smallint DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `weather` (
  `record_id` int unsigned NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `temperature` tinyint DEFAULT NULL,
  `pressure` smallint DEFAULT NULL,
  `humidity` tinyint unsigned DEFAULT NULL,
  `wind_speed` decimal(4,2) DEFAULT NULL,
  `wind_direction` smallint DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
