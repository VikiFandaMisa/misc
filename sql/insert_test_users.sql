use db_BackupService;

DELETE FROM Accounts WHERE Username = "test_admin";

INSERT INTO Accounts (ID, Username, Password, Admin, Email, SendReports, ReportPeriod)
VALUES (NULL, "test_admin", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", true, "test_admin@test.test", false, "");


DELETE FROM Accounts WHERE Username = "test" ;

INSERT INTO Accounts (ID, Username, Password, Admin, Email, SendReports, ReportPeriod)
VALUES (NULL, "test", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", false, "test@test.test", false, "");