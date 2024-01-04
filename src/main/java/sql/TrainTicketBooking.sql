
-- STILL WIP

drop table if exists station;
drop table if exists traveldays;
drop table if exists traintable;
drop table if exists ticket;
drop table if exists user;

-- 建立用戶資訊 (身分證字號)
create table if not exists user(
userId varchar(15)primary key
);

-- 建立站點
create table if not exists station(
stationId int not null primary key,
stationName varchar(20)
);

-- 建立行駛日
create table if not exists traveldays(
travelDaysId int not null unique,
travelDaysName varchar(10)
);

-- 建立火車時刻表
create table if not exists traintable(
trainId varchar(10) primary key,
travelDaysId int not null unique,
travelDaysName varchar(10),
stationId int not null,
stationName varchar(20), 
arriveTime TIME
);


-- 建立車票資訊
create table if not exists ticket(
userId varchar(15)primary key,
trainId varchar(10) unique,
date TIMESTAMP,
departureTime TIME,
arrivalTime TIME,
startStationId int not null,
startStationName varchar(20),
endStationId int not null,
endStationName varchar(20),
trainCarId int not null,
seatId varchar(10),
price int not null,
bookTime datetime default current_timestamp,
foreign key (userId) references user (userId),
foreign key (trainId) references traintable (trainId)
);


-- 預設資料

-- user 用戶資訊
INSERT INTO user (userId) values('A88951435');

-- stations 站點
INSERT INTO station(stationId,stationName) values(1,'南港');
INSERT INTO station(stationId,stationName) values(2,'台北');
INSERT INTO station(stationId,stationName) values(3,'板橋');
INSERT INTO station(stationId,stationName) values(4,'桃園');

-- traveldays 行駛日
INSERT INTO travelDays(travelDaysId,travelDaysName) values(0,'每日行駛');
INSERT INTO travelDays(travelDaysId,travelDaysName) values(1,'平日行駛');
INSERT INTO travelDays(travelDaysId,travelDaysName) values(2,'假日行駛');

-- traintable 時刻表
INSERT INTO traintable(trainId,travelDaysId,travelDaysName,stationId,stationName,arriveTime) values('B502',0,'每日',1,'南港站','9:30:00');

-- ticket 車票資訊
INSERT INTO ticket (userId, trainId, date,departureTime,arrivalTime,startStationId,startStationName,endStationId,endStationName,trainCarId,seatId,price,bookTime) 
			  value('A88951435','B502','9:30:00')
