
-- STILL WIP

drop table if exists station;
drop table if exists traintable;
drop table if exists ticket;
drop table if exists user;

-- 建立用戶資訊 (身分證字號)
create table if not exists user(
id int auto_increment primary key--為每筆訂單生產相應代號
userId varchar(15)--身分證字號
);
-- 設置 AUTO_INCREMENT = 00000001
alter table user auto_increment = 00000001;

-- 建立站點
create table if not exists station(
stationId int not null primary key,--站點代號
stationName varchar(20)--站點名稱
);


-- 建立火車時刻表
create table if not exists traintable(
trainId int not null primary key--火車代號(4碼)
station01departTime TIME,--台北站出發時間
station02departTime TIME,--台中站出發時間
station03departTime TIME,--桃園站出發時間

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
foreign key (trainId) references traintable (trainId)
);




--預設資料

-- user 用戶資訊
INSERT INTO user (id) values(0135489638);
INSERT INTO user (userId) values('A88951435');

-- stations 站點
INSERT INTO station(stationId,stationName) values(01,'台北');
INSERT INTO station(stationId,stationName) values(02,'台中');
INSERT INTO station(stationId,stationName) values(03,'高雄');

--火車代號

-- traintable 時刻表


-- ticket 車票資訊
INSERT INTO ticket () 
			  value('A88951435','B502','9:00')
