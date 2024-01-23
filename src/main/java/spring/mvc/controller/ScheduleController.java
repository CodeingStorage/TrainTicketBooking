package spring.mvc.controller;

import java.sql.Time;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.model.entity.Schedule;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	// 找出所有時刻表
		List<Schedule> findAllSchedules();
		
		// 依照班次查詢對應的時刻表
		Optional<Schedule> findScheduleByTrainNo(Integer trainNo);
		
		//根據車次ID修改時刻表資料(後台)	
		Boolean updateScheduleByTrainNo(String trainNo, Schedule newSchedule);
		
		// 依照查詢的起始時間，取得時刻表(邏輯：查詢開始時間 < 離開時間 <查詢結束時間)
		List<Schedule> findAllSchedulesByTime(Time startTime, Time endTime);
		
		//新增列車資訊
		static void addSchedule(Schedule schedule) {
			// TODO Auto-generated method stub
			
		}
		

}
