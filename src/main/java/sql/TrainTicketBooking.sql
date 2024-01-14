drop table if exists station;
drop table if exists train;
drop table if exists traintablenorthbound;
drop table if exists trainnorthbound;
drop table if exists traintablesouthbound;
drop table if exists trainsouthbound;
drop table if exists ticket;
drop table if exists traintable;
drop table if exists direction;
drop table if exists user;

-- 建立用戶資訊 (身分證字號)
create table if not exists user(
userId varchar(15) PRIMARY KEY-- 身分證字號
);


-- 建立站點
create table if not exists station(
stationId int not null primary key,-- 站點代號
stationName varchar(20)-- 站點名稱
);

-- 設置 station AUTO_INCREMENT = 01
alter table station auto_increment = 01;


-- 建立火車行車方向
create table if not exists direction(
directionId varchar(5) primary key,
directionName varchar(10)
);



-- 建立火車時刻表
create table if not exists traintable(
trainId int not null,  -- 火車代號(4碼
directionId varchar(5),
station01departTime TIME,-- 台北站出發時間
station02departTime TIME,-- 台中站出發時間
station03departTime TIME-- 高雄站出發時間
);



-- 建立車票資訊
create table if not exists ticket(
ticketId int primary key,-- 車票代碼(亂數隨機 8碼)
userId varchar(15),-- 使用者ID
trainId int unique,-- 火車代號
date TIMESTAMP,-- 乘車日期
departureTime TIME,-- 出發時間
arrivalTime TIME,-- 抵達時間
startStationId int not null,-- 起始站代號
startStationName varchar(20),-- 起始站名稱
endStationId int not null,-- 終點站代號
endStationName varchar(20),-- 終點站名稱
trainCarId int not null, -- 車廂代號   
seatId varchar(10),-- 座位號碼
price int not null,-- 價格
bookTime datetime default current_timestamp,-- 定位日期
foreign key (userId) references user (userId)
);



-- 預設資料

-- user 用戶資訊
INSERT INTO user (userId) values('A88951435');
INSERT INTO user (userId) values('F77458966');


-- stations 站點
INSERT INTO station(stationId,stationName) values(01,'台北');
INSERT INTO station(stationId,stationName) values(02,'台中');
INSERT INTO station(stationId,stationName) values(03,'高雄');

-- direction行車方向
INSERT INTO direction(directionId,directionName) values('N','北上');
INSERT INTO direction(directionId,directionName) values('S','南下');

-- traintable火車時刻表
INSERT INTO traintable ( trainId, directionId, station01departTime, station02departTime, station03departTime ) VALUES ( 1001, 'S', '08:00:00', '10:00:00', '12:00:00' );
INSERT INTO traintable ( trainId, directionId, station01departTime, station02departTime, station03departTime ) VALUES ( 1002, 'N', '15:00:00', '14:00:00', '13:00:00' );

-- ticket 車票資訊(南下)
INSERT INTO ticket ( ticketId, userId, trainId, date, departureTime, arrivalTime, startStationId, startStationName, endStationId, endStationName, trainCarId, seatId, price, bookTime ) VALUES (
                    023456789,'A88951435',1001,'2023-12-20','12:00:00','13:00:00',03,'高雄',02,'台中',02,'A20',150,'2023-12-10 18:00:00');
-- ticket 車票資訊(北上)                 
                    INSERT INTO ticket ( ticketId, userId, trainId, date, departureTime, arrivalTime, startStationId, startStationName, endStationId, endStationName, trainCarId, seatId, price, bookTime ) VALUES (
                    01234567,'F77458966',0001,'2023-12-31','09:00:00','10:00:00',01,'台北',02,'台中',01,'A12',150,'2023-12-15 14:30:00')