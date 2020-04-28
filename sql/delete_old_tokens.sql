use db_BackupService;

delete from TokenBlacklist where Expires < now();