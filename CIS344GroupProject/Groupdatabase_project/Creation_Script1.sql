-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Hotel_Reservation_Sys
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Hotel_Reservation_Sys
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hotel_Reservation_Sys` DEFAULT CHARACTER SET utf8 ;
USE `Hotel_Reservation_Sys` ;

-- -----------------------------------------------------
-- Table `Hotel_Reservation_Sys`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel_Reservation_Sys`.`Employee` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `SSN` VARCHAR(45) NOT NULL,
  `Position` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Sex` VARCHAR(5) NULL,
  `Birthday` DATETIME NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE INDEX `SSN_UNIQUE` (`SSN` ASC) VISIBLE)

ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel_Reservation_Sys`.`Manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel_Reservation_Sys`.`Manager` (
  `Manger_ID` INT NOT NULL AUTO_INCREMENT,
  `EmpID` INT NOT NULL,
  PRIMARY KEY (`Manger_ID`),
FOREIGN KEY (`EmpID`) REFERENCES Employee (`EmployeeID`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel_Reservation_Sys`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel_Reservation_Sys`.`Staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `EmpID` INT NOT NULL,
  PRIMARY KEY (`StaffID`),
FOREIGN KEY (`EmpID`) REFERENCES Employee (`EmployeeID`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel_Reservation_Sys`.`Guest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel_Reservation_Sys`.`Guest` (
  `GuestID` INT NOT NULL AUTO_INCREMENT,
  `ResvID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NULL,
`Phone_Num` VARCHAR(10),
  PRIMARY KEY (`GuestID`),
FOREIGN KEY (`ResvID`) REFERENCES Reservations (`ResevID`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel_Reservation_Sys`.`Reservations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel_Reservation_Sys`.`Reservations` (
  `ResevID` INT NOT NULL AUTO_INCREMENT,
  `GuestID` INT NOT NULL,
  `Room_num` INT NOT NULL,
  `Check_IN` DATETIME NULL,
  `Check_Out` DATETIME NULL,
  `Trans_num` INT NOT NULL,
  PRIMARY KEY (`ResevID`),
FOREIGN KEY (`GuestID`) REFERENCES Guest (`GuestID`),
FOREIGN KEY (`Trans_num`) REFERENCES Transactions (`Trans_ID`)

)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel_Reservation_Sys`.`Transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel_Reservation_Sys`.`Transactions` (
  `Trans_ID` INT NOT NULL AUTO_INCREMENT,
  `GuestID` INT NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `Payment_Method` VARCHAR(45) NULL,
  `Date` DATETIME NOT NULL,
  PRIMARY KEY (`Trans_ID`),
FOREIGN KEY (`GuestID`) REFERENCES Guest (`GuestID`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel_Reservation_Sys`.`Rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel_Reservation_Sys`.`Rooms` (
  `RoomID` INT NOT NULL AUTO_INCREMENT,
  `GuestID` INT NOT NULL,
  `ResvID` INT NOT NULL,
  PRIMARY KEY (`RoomID`),
FOREIGN KEY (`GuestID`) REFERENCES Guest (`GuestID`),
FOREIGN KEY (`ResvID`) REFERENCES Reservations (`ResevID`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel_Reservation_Sys`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel_Reservation_Sys`.`Bookings` (
  `GuestID` INT NOT NULL,
  `ResvID` INT NOT NULL,
  PRIMARY KEY (`GuestID`, `ResvID`),
FOREIGN KEY (`GuestID`) REFERENCES Guest (`GuestID`),
FOREIGN KEY (`ResvID`) REFERENCES Reservations (`ResevID`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel_Reservation_Sys`.`Charges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel_Reservation_Sys`.`Charges` (
  `GuestID` INT NOT NULL,
  `TransID` INT NOT NULL,
  PRIMARY KEY (`GuestID`, `TransID`),
FOREIGN KEY (`GuestID`) REFERENCES Guest (`GuestID`),
FOREIGN KEY (`TransID`) REFERENCES Transactions (`Trans_ID`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel_Reservation_Sys`.`Room_Assignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel_Reservation_Sys`.`Room_Assignment` (
  `Room_Num` INT NOT NULL,
  `ResvID` INT NOT NULL,
  PRIMARY KEY (`Room_Num`, `ResvID`),
FOREIGN KEY (`Room_Num`) REFERENCES Rooms (`RoomID`),
FOREIGN KEY (`ResvID`) REFERENCES Reservations (`ResevID`)
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
