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
user_Id varchar(15) primary key-- 身分證字號
);


-- 建立站點
create table if not exists station(
station_Id int not null primary key AUTO_INCREMENT,-- 站點代號
station_Name varchar(20)-- 站點名稱
);



-- 建立火車行車方向
create table if not exists direction(
direction_Id varchar(5) primary key,-- 行車方向代號
direction_Name varchar(10)-- 行車方向名稱
);



-- 建立火車時刻表
create table if not exists traintable(
  train_Id int not null primary key,
  direction_Id varchar(5),
  FOREIGN KEY (direction_Id) REFERENCES direction(direction_Id)
);

-- 設置 AUTO_INCREMENT = 1001
alter table traintable auto_increment = 1001;

-- 建立站點時刻表
create table if not exists station_schedule(
  schedule_Id int not null primary key,
  train_Id int,
  station_Id int,
  arrive_Time TIME,
  depart_Time TIME,
  FOREIGN KEY (train_Id) REFERENCES traintable(train_Id),
  FOREIGN KEY (station_Id) REFERENCES station(station_Id)
);



-- 建立車票資訊
create table if not exists ticket(
ticket_Id int primary key,-- 車票代碼(亂數隨機 8碼)
user_Id varchar(15),-- 使用者ID
train_Id int,-- 火車代號
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
book_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,-- 訂位日期
foreign key (userId) references user (userId),
constraint unique_userId_and_ticketId unique(userId,ticketId)
);

-- 建立


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

-- 插入火車時刻表範例資料
INSERT INTO traintable (train_Id, direction_Id, station_01_Arrive_Time, station_01_Depart_Time, station_02_Arrive_Time, station_02_Depart_Time, station_03_Arrive_Time, station_03_Depart_Time)
VALUES
(1001, 'N', '08:00:00', '08:10:00', '09:30:00', '09:40:00', '11:30:00', '11:40:00'),
(1002, 'N', '10:00:00', '10:10:00', '11:30:00', '11:40:00', '13:30:00', '13:40:00'),
(1003, 'S', '12:00:00', '12:10:00', '13:30:00', '13:40:00', '15:30:00', '15:40:00');
(1004, 'S', '12:00:00', '12:10:00', '13:30:00', '13:40:00', '15:30:00', '15:40:00');
-- ticket 車票資訊
INSERT INTO ticket ( ticketId, userId, trainId, date, departureTime, arrivalTime, startStationId, startStationName, endStationId, endStationName, trainCarId, seatId, price, bookTime ) VALUES (
                    023456789,'A88951435',1001,'2023-12-20','12:00:00','13:00:00',03,'高雄',02,'台中',02,'A20',150,'2023-12-10 18:00:00');
-- ticket 車票資訊                
                    INSERT INTO ticket ( ticketId, userId, trainId, date, departureTime, arrivalTime, startStationId, startStationName, endStationId, endStationName, trainCarId, seatId, price, bookTime ) VALUES (
                    01234567,'F77458966',0001,'2023-12-31','09:00:00','10:00:00',01,'台北',02,'台中',01,'A12',150,'2023-12-15 14:30:00')