package spring.mvc.model.dao;

import java.sql.Time;
import java.util.List;
import java.util.Optional;

import spring.mvc.model.entity.Schedule;

public interface ScheduleDao {

	// 找出所有時刻表
	List<Schedule> findAllSchedules();
	
	// 依照班次查詢對應的時刻表
	Optional<Schedule> findScheduleByTrainNo(Integer trainNo);
	
	// 依照查詢的起始時間，取得時刻表(邏輯：查詢開始時間 < 離開時間 <查詢結束時間)
	List<Schedule> findAllSchedulesByTime(Time startTime, Time endTime);
	
}
