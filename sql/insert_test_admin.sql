use db_BackupService;

INSERT INTO Accounts (ID, Username, Password, Admin, Email, SendReports, ReportPeriod)
SELECT * FROM (SELECT NULL, "test", "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8", true, "test@test.test", false, "") AS tmp
WHERE NOT EXISTS (
    SELECT * FROM Accounts WHERE Username="test"
) LIMIT 1;