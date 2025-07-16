use demo_ch09_0712;

-- DATE
DROP TABLE test1;
create TABLE test1(a DATE);
INSERT INTO test1(a) values('2018-10-01');
INSERT INTO test1(a) values('20181002');
INSERT INTO test1(a) values(20181003);
INSERT INTO test1(a) values(NULL);
select * from test1;

-- TIME
DROP TABLE test2;
create TABLE test2(a TIME);
INSERT INTO test2(a) values('10:10:35');
INSERT INTO test2(a) values('11:11:35');
INSERT INTO test2(a) values('11:11:35');
INSERT INTO test2(a) values('12:10');
INSERT INTO test2(a) values(121235);
INSERT INTO test2(a) values('14');
select * from test2;

-- YEAR
DROP TABLE test3;
create TABLE test3(a YEAR);
INSERT INTO test3(a) values(1901);
INSERT INTO test3(a) values(2155);
INSERT INTO test3(a) values("1902");
INSERT INTO test3(a) values(70);
INSERT INTO test3(a) values(0);
INSERT INTO test3(a) values("0");
select * from test3;
