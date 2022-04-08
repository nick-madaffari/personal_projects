-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema numbeo_col
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `numbeo_col` ;

-- -----------------------------------------------------
-- Schema numbeo_col
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `numbeo_col` DEFAULT CHARACTER SET utf8 ;
USE `numbeo_col` ;

-- -----------------------------------------------------
-- Table `numbeo_col`.`cities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `numbeo_col`.`cities` ;

CREATE TABLE IF NOT EXISTS `numbeo_col`.`cities` (
  `city_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `city_name` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `region` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE INDEX `city_id_UNIQUE` (`city_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `numbeo_col`.`updates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `numbeo_col`.`updates` ;

CREATE TABLE IF NOT EXISTS `numbeo_col`.`updates` (
  `update_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `city_id` SMALLINT UNSIGNED NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`update_id`),
  INDEX `fk_updates_cities1_idx` (`city_id` ASC) VISIBLE,
  UNIQUE INDEX `update_id_UNIQUE` (`update_id` ASC) VISIBLE,
  CONSTRAINT `fk_updates_cities`
    FOREIGN KEY (`city_id`)
    REFERENCES `numbeo_col`.`cities` (`city_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `numbeo_col`.`clothing_cost_sets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `numbeo_col`.`clothing_cost_sets` ;

CREATE TABLE IF NOT EXISTS `numbeo_col`.`clothing_cost_sets` (
  `update_id` INT UNSIGNED NOT NULL,
  `pair_of_jeans` DECIMAL(5,2) NULL,
  `summer_dress` DECIMAL(5,2) NULL,
  `nike_running_shoes` DECIMAL(5,2) NULL,
  `leather_business_shoes` DECIMAL(5,2) NULL,
  PRIMARY KEY (`update_id`),
  INDEX `fk_clothing_cost_sets_updates1_idx` (`update_id` ASC) VISIBLE,
  UNIQUE INDEX `update_id_UNIQUE` (`update_id` ASC) VISIBLE,
  CONSTRAINT `fk_clothing_cost_sets_updates`
    FOREIGN KEY (`update_id`)
    REFERENCES `numbeo_col`.`updates` (`update_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `numbeo_col`.`rent_cost_sets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `numbeo_col`.`rent_cost_sets` ;

CREATE TABLE IF NOT EXISTS `numbeo_col`.`rent_cost_sets` (
  `update_id` INT UNSIGNED NOT NULL,
  `apt_one_bdrm_ctr` DECIMAL(7,2) NULL,
  `apt_one_bdrm_out` DECIMAL(7,2) NULL,
  `apt_three_bdrm_ctr` DECIMAL(7,2) NULL,
  `apt_three_bdrm_out` DECIMAL(7,2) NULL,
  INDEX `fk_rent_cost_sets_updates1_idx` (`update_id` ASC) VISIBLE,
  PRIMARY KEY (`update_id`),
  UNIQUE INDEX `update_id_UNIQUE` (`update_id` ASC) VISIBLE,
  CONSTRAINT `fk_rent_cost_sets_updates`
    FOREIGN KEY (`update_id`)
    REFERENCES `numbeo_col`.`updates` (`update_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `numbeo_col`.`utilities_cost_sets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `numbeo_col`.`utilities_cost_sets` ;

CREATE TABLE IF NOT EXISTS `numbeo_col`.`utilities_cost_sets` (
  `update_id` INT UNSIGNED NOT NULL,
  `all_basic` DECIMAL(6,2) NULL,
  `prepaid_mobile_one_min` DECIMAL(4,2) NULL,
  `internet_sixty_mbps` DECIMAL(5,2) NULL,
  PRIMARY KEY (`update_id`),
  UNIQUE INDEX `update_id_UNIQUE` (`update_id` ASC) VISIBLE,
  CONSTRAINT `fk_utilities_cost_sets_updates`
    FOREIGN KEY (`update_id`)
    REFERENCES `numbeo_col`.`updates` (`update_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `numbeo_col`.`leisure_cost_sets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `numbeo_col`.`leisure_cost_sets` ;

CREATE TABLE IF NOT EXISTS `numbeo_col`.`leisure_cost_sets` (
  `update_id` INT UNSIGNED NOT NULL,
  `fit_club_one_month` DECIMAL(5,2) NULL,
  `tennis_court_one_hr` DECIMAL(5,2) NULL,
  `cinema_ticket_one_seat` DECIMAL(4,2) NULL,
  PRIMARY KEY (`update_id`),
  UNIQUE INDEX `update_id_UNIQUE` (`update_id` ASC) VISIBLE,
  CONSTRAINT `fk_leisure_cost_sets_updates`
    FOREIGN KEY (`update_id`)
    REFERENCES `numbeo_col`.`updates` (`update_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `numbeo_col`.`restaurant_cost_sets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `numbeo_col`.`restaurant_cost_sets` ;

CREATE TABLE IF NOT EXISTS `numbeo_col`.`restaurant_cost_sets` (
  `update_id` INT UNSIGNED NOT NULL,
  `cheap_meal_for_one` DECIMAL(5,2) NULL,
  `meal_for_two` DECIMAL(5,2) NULL,
  `mcdonalds_meal` DECIMAL(4,2) NULL,
  `domestic_beer` DECIMAL(4,2) NULL,
  `imported_beer` DECIMAL(4,2) NULL,
  `cappuccino` DECIMAL(4,2) NULL,
  `coke_or_pepsi` DECIMAL(4,2) NULL,
  `water` DECIMAL(4,2) NULL,
  PRIMARY KEY (`update_id`),
  INDEX `fk_restaurant_cost_sets_updates1_idx` (`update_id` ASC) VISIBLE,
  UNIQUE INDEX `update_id_UNIQUE` (`update_id` ASC) VISIBLE,
  CONSTRAINT `fk_restaurant_cost_sets_updates`
    FOREIGN KEY (`update_id`)
    REFERENCES `numbeo_col`.`updates` (`update_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `numbeo_col`.`market_cost_sets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `numbeo_col`.`market_cost_sets` ;

CREATE TABLE IF NOT EXISTS `numbeo_col`.`market_cost_sets` (
  `update_id` INT UNSIGNED NOT NULL,
  `milk_one_liter` DECIMAL(4,2) NULL,
  `bread_loaf` DECIMAL(4,2) NULL,
  `white_rice_one_kg` DECIMAL(4,2) NULL,
  `dozen_eggs` DECIMAL(4,2) NULL,
  `cheese_one_kg` DECIMAL(5,2) NULL,
  `chicken_breast_one_kg` DECIMAL(4,2) NULL,
  `beef_round_one_kg` DECIMAL(4,2) NULL,
  `apples_one_kg` DECIMAL(4,2) NULL,
  `bananas_one_kg` DECIMAL(4,2) NULL,
  `oranges_one_kg` DECIMAL(4,2) NULL,
  `tomatoes_one_kg` DECIMAL(4,2) NULL,
  `potatoes_one_kg` DECIMAL(4,2) NULL,
  `onions_one_kg` DECIMAL(4,2) NULL,
  `lettuce_head` DECIMAL(4,2) NULL,
  `water_one_and_half_liter` DECIMAL(4,2) NULL,
  `wine_mid_range` DECIMAL(5,2) NULL,
  `domestic_beer_half_liter` DECIMAL(4,2) NULL,
  `imported_beer_third_liter` DECIMAL(4,2) NULL,
  `cigarettes_pack` DECIMAL(4,2) NULL,
  PRIMARY KEY (`update_id`),
  INDEX `fk_market_cost_sets_updates1_idx` (`update_id` ASC) VISIBLE,
  UNIQUE INDEX `update_id_UNIQUE` (`update_id` ASC) VISIBLE,
  CONSTRAINT `fk_market_cost_sets_updates`
    FOREIGN KEY (`update_id`)
    REFERENCES `numbeo_col`.`updates` (`update_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `numbeo_col`.`transportation_cost_sets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `numbeo_col`.`transportation_cost_sets` ;

CREATE TABLE IF NOT EXISTS `numbeo_col`.`transportation_cost_sets` (
  `update_id` INT UNSIGNED NOT NULL,
  `local_transit_one_way` DECIMAL(4,2) NULL,
  `monthly_transit_pass` DECIMAL(5,2) NULL,
  `taxi_base_fare` DECIMAL(4,2) NULL,
  `taxi_one_km` DECIMAL(4,2) NULL,
  `taxi_one_hr` DECIMAL(5,2) NULL,
  `gasoline_one_liter` DECIMAL(4,2) NULL,
  `volkswagen_golf` DECIMAL(8,2) NULL,
  `toyota_corolla` DECIMAL(8,2) NULL,
  PRIMARY KEY (`update_id`),
  UNIQUE INDEX `update_id_UNIQUE` (`update_id` ASC) VISIBLE,
  CONSTRAINT `fk_transportation_cost_sets_updates`
    FOREIGN KEY (`update_id`)
    REFERENCES `numbeo_col`.`updates` (`update_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
