drop table if exists stationSchedule;
drop table if exists schedule;
drop table if exists ticket;
drop table if exists train;
drop table if exists trains;
drop table if exists station;
drop table if exists user;
drop table if exists direction;


-- 建立用戶資訊 (身分證字號)
create table if not exists user(
userId int primary key, -- 101
userName varchar(20)-- 身分證字號
);
-- 設置 AUTO_INCREMENT = 101
alter table user auto_increment = 101;


-- 建立站點
create table if not exists station(
stationId int not null primary key,-- 站點代號
stationName varchar(20)-- 站點名稱
);
-- 設置 AUTO_INCREMENT = 501
alter table station auto_increment = 501;


-- 建立火車行車方向
create table if not exists direction(
directionId int primary key,-- 行車方向代號
directionName ENUM('北上', '南下')-- 行車方向名稱
);



-- 建立火車列表
create table if not exists train(
  trainId int not null primary key,
  directionId int,
  FOREIGN KEY (directionId) REFERENCES direction(directionId)
);

-- 設置 AUTO_INCREMENT = 2001
alter table train auto_increment = 2001;

-- 建立站點時刻表
create table if not exists schedule(
  scheduleId int not null primary key ,
  trainId int,
  stationId int,
  arriveTime TIME,
  departTime TIME,
  FOREIGN KEY (trainId) REFERENCES train(trainId),
  FOREIGN KEY (stationId) REFERENCES station(stationId)
);
-- 設置 AUTO_INCREMENT = 10
alter table schedule auto_increment = 10;


-- 建立車票資訊
CREATE TABLE IF NOT EXISTS ticket (
  ticketId INT PRIMARY KEY, -- 車票代碼(自動遞增)
  userId int,-- 使用者身分證字號代碼
  userName VARCHAR(15), -- 使用者身分證字號
  trainId INT, -- 火車代號
  date DATE, -- 乘車日期
  departTime TIME, -- 出發時間
  arrivaTime TIME, -- 抵達時間
  startStationId INT, -- 起始站代號
  endStationId INT, -- 終點站代號
  trainCarId INT, -- 車廂代號   
  seatId VARCHAR(10), -- 座位號碼
  price INT NOT NULL, -- 價格
  bookTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 訂位日期
  FOREIGN KEY (userId) REFERENCES user(userId),
  FOREIGN KEY (trainId) REFERENCES train(trainId),
  FOREIGN KEY (startStationId) REFERENCES station(stationId),
  FOREIGN KEY (endStationId) REFERENCES station(stationId),
  CONSTRAINT unique_userId_and_ticketId UNIQUE (userId, ticketId)
);
-- 設置 AUTO_INCREMENT = 10
alter table ticket auto_increment = 6001;



-- 預設資料

-- 插入用戶資訊
INSERT INTO user (userId,userName) VALUES
(101,'A123456789'),
(102,'B987654321'),
(103,'C111222333');

-- 插入站點
INSERT INTO station (stationId,stationName) VALUES
(501,'台北'),
(502,'台中'),
(503,'高雄');

-- 插入火車行車方向
INSERT INTO direction (directionId, directionName) VALUES
(1, '北上'),
(2, '南下');


-- 插入火車列表
INSERT INTO train (trainId, directionId) VALUES
(2001, '2'),
(2002, '1');


-- 插入站點時刻表
INSERT INTO schedule (scheduleId, trainId, stationId, arriveTime, departTime) VALUES
(10, 2001, 501, '08:00:00', '08:10:00'),
(11, 2001, 502, '09:00:00', '09:10:00'),
(12, 2001, 503, '10:00:00', '10:10:00'),
(13, 2002, 501, '11:00:00', '11:10:00'),
(14, 2002, 502, '10:00:00', '10:10:00'),
(15, 2002, 503, '09:00:00', '09:10:00');


-- 可以繼續插入其他時刻表資料

-- 插入車票資訊
INSERT INTO ticket (ticketId,userId, userName,trainId, date, departTime, arrivaTime, startStationId, endStationId, trainCarId, seatId, price) VALUES
(6001,101,'A123456789', 2001, '2024-01-15', '08:10:00', '10:00:00', 501, 503, 1, 'A01', 1000),
(6002,102,'B987654321', 2002, '2024-01-16', '09:10:00', '10:00:00', 503, 502, 2, 'B02', 500);
