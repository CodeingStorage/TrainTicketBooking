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
user_Id varchar(15) PRIMARY KEY-- 身分證字號
);


-- 建立站點
create table if not exists station(
station_Id int not null primary key,-- 站點代號
station_Name varchar(20)-- 站點名稱
);



-- 建立火車行車方向
create table if not exists direction(
direction_Id varchar(5) primary key,-- 行車方向代號
direction_Name varchar(10)-- 行車方向名稱
);



-- 建立火車時刻表
create table if not exists traintable(
train_Id int not null primary key,  -- 火車代號(4碼
direction_Id varchar(5),-- 行車方向
station_01_Arrive_Time TIME,-- 台北站抵達時間
station_01_Depart_Time TIME,-- 台北站出發時間
station_02_Arrive_Time TIME,-- 台中站抵達時間
station_02_Depart_Time TIME,-- 台中站出發時間
station_03_Arrive_Time TIME,-- 高雄站抵達時間
station_03_Depart_Time TIME-- 高雄站出發時間
);



-- 建立車票資訊
create table if not exists ticket(
ticket_Id int primary key,-- 車票代碼(亂數隨機 8碼)
user_Id varchar(15),-- 使用者ID
train_Id int unique,-- 火車代號
date TIMESTAMP,-- 乘車日期
departure_Time TIME,-- 出發時間
arrival_Time TIME,-- 抵達時間
start_Station_Id int not null,-- 起始站代號
start_Station_Name varchar(20),-- 起始站名稱
end_Station_Id int not null,-- 終點站代號
end_Station_Name varchar(20),-- 終點站名稱
train_Car_Id int not null, -- 車廂代號   
seat_Id varchar(10),-- 座位號碼
price int not null,-- 價格
book_Time datetime default current_timestamp,-- 訂位日期
foreign key (userId) references user (userId)
);



-- 預設資料

-- user 用戶資訊
INSERT INTO user (userId) values('A88951435');
INSERT INTO user (userId) values('F77458966');


-- stations 站點
INSERT INTO station(stationId,stationName) values(1,'台北');
INSERT INTO station(stationId,stationName) values(2,'台中');
INSERT INTO station(stationId,stationName) values(3,'高雄');

-- direction行車方向
INSERT INTO direction(directionId,directionName) values('N','北上');
INSERT INTO direction(directionId,directionName) values('S','南下');

-- traintable火車時刻表
INSERT INTO traintable ( trainId, directionId, station01departTime, station02departTime, station03departTime ) VALUES ( 1001, 'S', '08:00:00', '10:00:00', '12:00:00' );
INSERT INTO traintable ( trainId, directionId, station01departTime, station02departTime, station03departTime ) VALUES ( 1002, 'S', '10:00:00', '11:00:00', '12:00:00' );
INSERT INTO traintable ( trainId, directionId, station01departTime, station02departTime, station03departTime ) VALUES ( 1003, 'N', '15:00:00', '14:00:00', '13:00:00' );
INSERT INTO traintable ( trainId, directionId, station01departTime, station02departTime, station03departTime ) VALUES ( 1004, 'N', '18:00:00', '17:00:00', '16:00:00' );

-- ticket 車票資訊
INSERT INTO ticket ( ticketId, userId, trainId, date, departureTime, arrivalTime, startStationId, startStationName, endStationId, endStationName, trainCarId, seatId, price, bookTime ) VALUES (
                    023456789,'A88951435',1001,'2023-12-20','12:00:00','13:00:00',03,'高雄',02,'台中',02,'A20',150,'2023-12-10 18:00:00');
-- ticket 車票資訊                
                    INSERT INTO ticket ( ticketId, userId, trainId, date, departureTime, arrivalTime, startStationId, startStationName, endStationId, endStationName, trainCarId, seatId, price, bookTime ) VALUES (
                    01234567,'F77458966',0001,'2023-12-31','09:00:00','10:00:00',01,'台北',02,'台中',01,'A12',150,'2023-12-15 14:30:00')