drop table if exists ticket;
drop table if exists schedule;
drop table if exists user;

-- 建立用戶資訊 (身分證字號)
create table if not exists user(
userId int auto_increment primary key, -- 101
userName varchar(20) -- 身分證字號
);
-- 設置 AUTO_INCREMENT = 101
alter table user auto_increment = 101;

-- 建立站點時刻表
create table if not exists schedule(
  trainId int auto_increment primary key,
  trainNo varchar(10),
  departStation varchar (10),
  arriveStation varchar (10),
  departTime TIME,
  arriveTime TIME
);
-- 設置 AUTO_INCREMENT = 2001
alter table schedule auto_increment = 501;

-- 建立車票資訊
CREATE TABLE IF NOT EXISTS ticket (
  ticketId INT auto_increment PRIMARY KEY, -- 車票代碼(自動遞增)
  userId int, -- 使用者身分證字號
  trainId INT, -- 火車代號
  date DATE, -- 乘車日期
  trainCarId VARCHAR(10), -- 車廂代號   
  seatId INT not null, -- 座位號碼
  price INT NOT NULL, -- 價格
  bookTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 訂位日期
  FOREIGN KEY (userId) REFERENCES user(userId),
  FOREIGN KEY (trainId) REFERENCES schedule(trainId),
  CONSTRAINT unique_userId_and_ticketId UNIQUE (userId, ticketId)
);
-- 設置 AUTO_INCREMENT = 10
alter table ticket auto_increment = 6001;

-- 未來將把schedule注入ticket中

-- 預設資料

-- 插入用戶資訊
INSERT INTO user (userName) VALUES
('A123456789');


-- 插入站點時刻表
INSERT INTO schedule (trainNo,departStation,arriveStation, departTime, arriveTime) VALUES
(2001,'南港','高雄','08:00:00', '10:10:00');



-- 插入車票資訊
INSERT INTO ticket (userId, trainId, date,  trainCarId, seatId, price)
VALUES 
( 101,501, '2024-01-15', 'A', '12', 500);
