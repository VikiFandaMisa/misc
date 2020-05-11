use db_BackupService;

insert into Templates values (null, "testTemplate", "0 4 * * */1", 1, 1, now(), now(), false, 2);

insert into Paths values (null, 1, null, true, "C:\\Users\\Michal\\Desktop\\test1");
insert into Paths values (null, 1, null, true, "C:\\Users\\Michal\\Desktop\\test2");
insert into Paths values (null, 1, null, false, "C:\\Users\\Michal\\Desktop\\testTarget");

insert into Jobs values (null, 1, 1, true);