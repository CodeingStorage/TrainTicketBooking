drop table if exists train;
drop table if exists stationschedule;
drop table if exists ticket;
drop table if exists station;
drop table if exists user;
drop table if exists traintable;
drop table if exists direction;
-- 建立用戶資訊 (身分證字號)
create table if not exists user(
user_Id varchar(20) primary key-- 身分證字號
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
create table if not exists stationschedule(
  schedule_Id int not null primary key,
  train_Id int,
  station_Id int,
  arrive_Time TIME,
  depart_Time TIME,
  FOREIGN KEY (train_Id) REFERENCES traintable(train_Id),
  FOREIGN KEY (station_Id) REFERENCES station(station_Id)
);



-- 建立車票資訊
CREATE TABLE IF NOT EXISTS ticket (
  ticket_Id INT PRIMARY KEY AUTO_INCREMENT, -- 車票代碼(自動遞增)
  user_Id VARCHAR(15), -- 使用者ID
  train_Id INT, -- 火車代號
  date DATE, -- 乘車日期
  departure_Time TIME, -- 出發時間
  arrival_Time TIME, -- 抵達時間
  start_Station_Id INT, -- 起始站代號
  end_Station_Id INT, -- 終點站代號
  train_Car_Id INT, -- 車廂代號   
  seat_Id VARCHAR(10), -- 座位號碼
  price INT NOT NULL, -- 價格
  book_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 訂位日期
  FOREIGN KEY (user_Id) REFERENCES user(user_Id),
  FOREIGN KEY (train_Id) REFERENCES traintable(train_Id),
  FOREIGN KEY (start_Station_Id) REFERENCES station(station_Id),
  FOREIGN KEY (end_Station_Id) REFERENCES station(station_Id),
  CONSTRAINT unique_userId_and_ticketId UNIQUE (user_Id, ticket_Id)
);



-- 預設資料

-- 插入用戶資訊
INSERT INTO user (user_Id) VALUES
('A123456789'),
('B987654321'),
('C111222333');

-- 插入站點
INSERT INTO station (station_Name) VALUES
('台北'),
('台中'),
('高雄');

-- 插入火車行車方向
INSERT INTO direction (direction_Id, direction_Name) VALUES
('N', '北'),
('S', '南');


-- 插入火車時刻表
INSERT INTO traintable (train_Id, direction_Id) VALUES
(1001, 'N'),
(1002, 'S'),
(1003, 'S');

-- 插入站點時刻表
INSERT INTO stationschedule (schedule_Id, train_Id, station_Id, arrive_Time, depart_Time) VALUES
(1, 1001, 1, '08:00:00', '08:10:00'),
(2, 1001, 2, '09:30:00', '09:40:00'),
(3, 1001, 3, '11:30:00', '11:40:00');
-- 可以繼續插入其他時刻表資料

-- 插入車票資訊
INSERT INTO ticket (user_Id, train_Id, date, departure_Time, arrival_Time, start_Station_Id, end_Station_Id, train_Car_Id, seat_Id, price) VALUES
('A123456789', 1001, '2024-01-15', '08:00:00', '11:40:00', 1, 3, 1, 'A01', 1000),
('B987654321', 1002, '2024-01-16', '10:00:00', '13:40:00', 3, 1, 2, 'B02', 1000),
('C111222333', 1003, '2024-01-17', '12:00:00', '15:40:00', 3, 2, 2, 'B03', 500);