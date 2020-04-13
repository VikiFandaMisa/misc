DROP DATABASE IF EXISTS db_BackupService;

CREATE DATABASE db_BackupService CHARACTER SET utf8mb4;

USE db_BackupService;

CREATE TABLE `Computers` (
  `ID` int PRIMARY KEY,
  `Hostname` varchar(256),
  `LastSeen` datetime,
  `IP` varchar(256),
  `MAC` varchar(256) UNIQUE,
  `Status` tinyint NOT NULL
);

CREATE TABLE `Templates` (
  `ID` int PRIMARY KEY,
  `Name` varchar(256) UNIQUE NOT NULL,
  `Period` varchar(256) NOT NULL,
  `Type` int NOT NULL,
  `TargetFileType` bit NOT NULL,
  `Start` datetime,
  `End` datetime,
  `Paused` bit NOT NULL,
  `Retention` int
);

CREATE TABLE `Paths` (
  `ID` int PRIMARY KEY,
  `TemplateID` int NOT NULL,
  `FTP` varchar(256),
  `Source` bit NOT NULL,
  `Directory` varchar(256) NOT NULL
);

CREATE TABLE `Jobs` (
  `ID` int PRIMARY KEY,
  `ComputerID` int NOT NULL,
  `TemplateID` int NOT NULL,
  `Active` bit
);

CREATE TABLE `Log` (
  `ID` int PRIMARY KEY,
  `JobID` int,
  `Type` int NOT NULL,
  `Date` datetime NOT NULL,
  `Message` varchar(256) NOT NULL
);

CREATE TABLE `Accounts` (
  `ID` int PRIMARY KEY,
  `Username` varchar(256) UNIQUE NOT NULL,
  `Password` varchar(256) NOT NULL,
  `Admin` bit NOT NULL,
  `Email` varchar(256),
  `SendReports` bit NOT NULL,
  `ReportPeriod` varchar(256) NOT NULL
);

ALTER TABLE `Paths` ADD FOREIGN KEY (`TemplateID`) REFERENCES `Templates` (`ID`);

ALTER TABLE `Jobs` ADD FOREIGN KEY (`ComputerID`) REFERENCES `Computers` (`ID`);

ALTER TABLE `Jobs` ADD FOREIGN KEY (`TemplateID`) REFERENCES `Templates` (`ID`);

ALTER TABLE `Log` ADD FOREIGN KEY (`JobID`) REFERENCES `Jobs` (`ID`);
