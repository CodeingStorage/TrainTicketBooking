package spring.mvc.controller;

import java.sql.Time;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.bean.TrainTime;
import spring.mvc.model.dao.ScheduleDao;
import spring.mvc.model.dao.TicketDao;
import spring.mvc.model.entity.Schedule;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	@Autowired
	private  ScheduleDao scheduleDao;

	@Autowired
	private  TicketDao ticketDao;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	//前往搜尋時刻表頁面(前端)
	@GetMapping("/frontend/schedule_query/schedule_query")
	public String timeTable() {

	return "frontend/schedule_query/schedule_query";
			}

			
		//列車時刻查詢(前端)
		@PostMapping("/schedule_query")
		public String scheduleQuery(@RequestParam("departStation") String departStation,
				@RequestParam("arriveStation") String arriveStation, 
				@RequestParam("departTime") Time departTime, @RequestParam("arriveTime") Time arriveTime,
				Model model)  throws Exception {

			if (departStation.equals(arriveStation)) {

				model.addAttribute("checkingMessage", "起點終點重複");
				System.out.println("起點終點重複");
				return "timetable";
			} 
			
			//List<TrainTime> trainTimes = TimeTableAPI.getTrainTimes(departStation, arriveStation, departTime);
			//model.addAttribute("trainTimes", trainTimes);
			return "timetable";
		}
		
		//列車時刻查詢
		@GetMapping("/frontend/ticket_query/ticket_query")
		public String ticketQueryPage(HttpSession session) {
			return "/frontend/ticket_query/ticket_query";
				
			}
		
		//返回主頁
		
		
		// 找出所有時刻表(後端)
		@GetMapping("/backend/traintable_display/traintable_display")
		public String findAllSchedules(HttpSession session, Model model) {		
			List<Schedule> schedule = scheduleDao.findAllSchedules();
			model.addAttribute("schedule", schedule);
			return "/backend/traintable_display/traintable_display";
		}
		

}
