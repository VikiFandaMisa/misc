DROP DATABASE IF EXISTS db_BackupService;

CREATE DATABASE db_BackupService CHARACTER SET utf8mb4;

USE db_BackupService;

CREATE TABLE `Computers` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `Hostname` varchar(256),
  `Password` varchar(256),
  `LastSeen` datetime,
  `IP` varchar(256),
  `MAC` varchar(256) UNIQUE,
  `Status` enum('pending', 'approved', 'denied') NOT NULL
);

CREATE TABLE `Templates` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(256) UNIQUE NOT NULL,
  `Period` json NOT NULL,
  `Type` enum('full', 'differential', 'incremental') NOT NULL,
  `TargetFileType` enum('plain', 'zip') NOT NULL,
  `Start` datetime,
  `End` datetime,
  `Paused` bit NOT NULL,
  `Retention` int
);

CREATE TABLE `Paths` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `TemplateID` int NOT NULL,
  `Network` json,
  `Source` bit NOT NULL,
  `Directory` varchar(256) NOT NULL
);

CREATE TABLE `Jobs` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `ComputerID` int NOT NULL,
  `TemplateID` int NOT NULL,
  `Active` bit
);

CREATE TABLE `Log` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `JobID` int,
  `Type` enum('error', 'info', 'job') NOT NULL,
  `Date` datetime NOT NULL,
  `Message` varchar(256) NOT NULL
);

CREATE TABLE `Accounts` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `Username` varchar(256) UNIQUE NOT NULL,
  `Password` varchar(256) NOT NULL,
  `Admin` bit NOT NULL,
  `Email` varchar(256),
  `SendReports` bit NOT NULL
);

CREATE TABLE `TokenBlacklist` (
  `Token` varchar(256) PRIMARY KEY,
  `Expires` datetime NOT NULL
);

ALTER TABLE `Paths` ADD FOREIGN KEY (`TemplateID`) REFERENCES `Templates` (`ID`);

ALTER TABLE `Jobs` ADD FOREIGN KEY (`ComputerID`) REFERENCES `Computers` (`ID`);

ALTER TABLE `Jobs` ADD FOREIGN KEY (`TemplateID`) REFERENCES `Templates` (`ID`);

ALTER TABLE `Jobs` ADD UNIQUE `unique_index_Computer-Template`(`ComputerID`, `TemplateID`);

ALTER TABLE `Log` ADD FOREIGN KEY (`JobID`) REFERENCES `Jobs` (`ID`);