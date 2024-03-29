package spring.mvc.model.dao;

import java.sql.Time;
import java.util.List;
import java.util.Optional;

import spring.mvc.model.entity.Schedule;

public interface ScheduleDao {

	// 找出所有時刻表
	List<Schedule> findAllSchedules();
	
	// 依照班次查詢對應的時刻表
	Optional<Schedule> findScheduleByTrainNo(String trainNo);
	
	//根據車次ID修改時刻表資料(後台)	
	Boolean updateScheduleByTrainNo(String trainNo, Schedule newSchedule);
	
	// 依照查詢的起始時間，取得時刻表(邏輯：查詢開始時間 < 離開時間 <查詢結束時間)
	List<Schedule> findAllSchedulesByTime(Time startTime, Time endTime);
	
	//新增列車資訊
	 void addSchedule(Schedule schedule);
	
	//根據起始與到達站點搜尋時刻表
	 List<Schedule> findSchedulesByStation(String departStation, String arriveStation);

//注意 : 把departTime從Time改成String
	List<Schedule> findSchedulesByStationAndTime(String departStation, String arriveStation, String departTime);
		
	//根據車次刪除時刻表
	Boolean cancelScheduleByTrainNo(String trainNo);
	
}
