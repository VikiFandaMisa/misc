use db_BackupService;

insert into Templates values (null, "testTemplate", '{"PeriodMode":true,"Unit":1,"Value":1,"Days":[1],"Time":{"Hours":12,"Minutes":0}}', 1, 1, now(), DATE_ADD(now(), INTERVAL 7 DAY), false, 2);
insert into Templates values (null, "test2Template", '{"PeriodMode":true,"Unit":1,"Value":1,"Days":[1],"Time":{"Hours":12,"Minutes":0}}', 1, 1, now(), DATE_ADD(now(), INTERVAL 7 DAY), false, 2);

insert into Paths values (null, 1, null, true, "C:\\Users\\Michal\\Desktop\\test1");
insert into Paths values (null, 1, null, true, "C:\\Users\\Michal\\Desktop\\test2");
insert into Paths values (null, 1, null, false, "C:\\Users\\Michal\\Desktop\\testTarget");

insert into Computers values (null, "teasdddddst", "password", now(), "ipadresa1", "mac1", 1);

insert into Computers values (null, "asfdg", "password", now(), "ipadresa2", "mac2", 2);

insert into Jobs values (null, 1, 1, true);
insert into Jobs values (null, 1, 2, true);

insert into Log values (null, 1, 1, now(), "ahoj");
insert into Log values (null, 2, 2, DATE_ADD(now(), INTERVAL 7 DAY), "test log2");
