
-- STILL WIP

drop table if exists station;
drop table if exists traintable;
drop table if exists train;
drop table if exists ticket;
drop table if exists user;

-- 建立用戶資訊 (身分證字號)
create table if not exists user(
userId varchar(15)--身分證字號
);


-- 建立站點
create table if not exists station(
stationId int not null primary key,--站點代號
stationName varchar(20)--站點名稱
);

-- 設置 station AUTO_INCREMENT = 01
alter table station auto_increment = 01;


--建立火車(南下)
create table if not exists trainsouthbound(
trainIdS int primary key
);
-- 設置 trainsouthbound AUTO_INCREMENT = 0001
alter table trainsouthbound auto_increment = 0001;

-- 建立火車時刻表(南下)
create table if not exists traintablesouthbound(
trainId int not null --火車代號(4碼)
station01departTime TIME,--台北站出發時間
station02departTime TIME,--台中站出發時間
station03departTime TIME,--桃園站出發時間
foreign key (trainId) references trainsouthbound (trainId)
);


--建立火車(北上)
create table if not exists trainnorthbound(
trainIdN int primary key
);
-- 設置 trainsouthbound AUTO_INCREMENT = 1001
alter table trainnorthbound auto_increment = 1001;

-- 建立火車時刻表(北上)
create table if not exists traintablenorthbound(
trainId int not null --火車代號(4碼)
station03departTime TIME,--台北站出發時間
station02departTime TIME,--台中站出發時間
station01departTime TIME,--桃園站出發時間
foreign key (trainId) references trainnorthbound (trainId)
);



-- 建立車票資訊
create table if not exists ticket(
ticketId int primary key,--車票代碼(亂數隨機 8碼)
userId varchar(15),--使用者ID
trainId int unique,--火車代號
date TIMESTAMP,--乘車日期
departureTime TIME,--出發時間
arrivalTime TIME,--抵達時間
startStationId int not null,--起始站代號
startStationName varchar(20),--起始站名稱
endStationId int not null,--終點站代號
endStationName varchar(20),--終點站名稱
trainCarId int not null, --車廂代號   
seatId varchar(10),--座位號碼
price int not null,-- 價格
bookTime datetime default current_timestamp,--定位日期
foreign key (userId) references user (userId),
foreign key (trainId) references train (trainId)
);




--預設資料

-- user 用戶資訊
INSERT INTO user (userId) values('A88951435');
INSERT INTO user (userId) values('F77458966');


-- stations 站點
INSERT INTO station(stationId,stationName) values(01,'台北');
INSERT INTO station(stationId,stationName) values(02,'台中');
INSERT INTO station(stationId,stationName) values(03,'高雄');

--火車代號
INSERT INTO train(trainId) values(0001);
INSERT INTO train(trainId) values(1001);

-- traintable 時刻表(南下)
INSERT INTO traintable(trainId,station01Time,station02Time,station03Time) values(0001,'9:00','10:00','11:00');

-- traintable 時刻表(北上)
INSERT INTO traintable(trainId,station03Time,station02Time,station01Time) values(1001,'12:00','13:00','14:00');


-- ticket 車票資訊(南下)
INSERT INTO ticket ( ticketId, userId, trainId, date, departureTime, arrivalTime, startStationId, startStationName, endStationId, endStationName, trainCarId, seatId, price, bookTime ) VALUES (
                    023456789,'A88951435',1001,'2023-12-20','12:00:00','13:00:00',03,'高雄',02,'台中',02,'A20',150,'2023-12-10 18:00:00')
                    
                    INSERT INTO ticket ( ticketId, userId, trainId, date, departureTime, arrivalTime, startStationId, startStationName, endStationId, endStationName, trainCarId, seatId, price, bookTime ) VALUES (
                    01234567,'F77458966',0001,'2023-12-31','09:00:00','10:00:00',01,'台北',02,'台中',01,'A12',150,'2023-12-15 14:30:00')
