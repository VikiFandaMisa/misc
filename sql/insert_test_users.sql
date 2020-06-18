use db_BackupService;

DELETE FROM Accounts WHERE Username = "test_admin";

INSERT INTO Accounts (ID, Username, Password, Admin, Email, SendReports)
VALUES (NULL, "test_admin", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", true, "cernymichal@sssvt.cz", false);

DELETE FROM Accounts WHERE Username = "test" ;

INSERT INTO Accounts (ID, Username, Password, Admin, Email, SendReports)
VALUES (NULL, "test", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", false, "frantisekkriz@sssvt.cz", false);

DELETE FROM Accounts WHERE Username = "test_victor" ;

INSERT INTO Accounts (ID, Username, Password, Admin, Email, SendReports)
VALUES (NULL, "test_victor", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", true, "smithvictormaxim@sssvt.cz", true);