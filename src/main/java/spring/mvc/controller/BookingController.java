package spring.mvc.controller;

import java.sql.Time;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.sql.Time;

import spring.mvc.model.entity.Ticket;
import spring.mvc.bean.TrainTime;
import spring.mvc.model.dao.ScheduleDao;
import spring.mvc.model.dao.TicketDao;
import spring.mvc.model.entity.Schedule;

@Controller
@RequestMapping("/ticket")
public class BookingController {
		

	@Autowired
	private  TicketDao ticketDao;
	
	@Autowired
	private  ScheduleDao scheduleDao;

	Logger logger = LoggerFactory.getLogger(getClass());
		
	//前往首頁
	@GetMapping("/frontend/main")
	public String main(HttpSession session) {
		
		return "/frontend/main";

	}
//車票 訂/修/刪除(需要API)--------------------------------------------------------------------
	
	//訂票頁面
	@GetMapping("/booking")
	public String bookPage(HttpSession session, Model model) {
		return "/frontend/booking/booking";
		
	}
	//訂票
	@PostMapping("/booking")
	public String booking(@RequestParam("departStation" )String departStation,
					   @RequestParam("arriveStation" )String arriveStation,					   
					   @RequestParam("departDate" )Date departDate, 
					   @RequestParam("departTime" )Time departTime,Model model) throws Exception {

		if (departStation.equals(arriveStation)) {
			model.addAttribute("bookingMessage", "起點終點重複");
			return "/frontend/booking/booking";
		}
		
		List<Schedule> schedule = scheduleDao.findSchedulesByStationAndTime(departStation, arriveStation, departTime);
		model.addAttribute("schedule",schedule);
		return "frontend/booking/booking_schedule"; 	
		
	}
	//選擇乘車時間
	@GetMapping("/booking_schedule")
	public String chooseSchedulePage() {
	
		return "frontend/booking/booking_schedule";
	}
	
	
	
			
	// 訂票結果
		
		
		
		// 查詢訂票首頁
	    @GetMapping("/ticket_query")
	    public String ticketQuery() {
	        return "frontend/ticket_query/ticket_query";
	    }

	    // 根據 userId 及 ticketId 查詢訂票
	    @GetMapping("/ticket_query_present")
	    public String ticketQueryResult(
	            @RequestParam("ticketId") Integer ticketId,
	            @RequestParam("userId") String userId,
	            Model model){
	     //Optional : 使用.get()取得參數
	        Ticket ticket = ticketDao.findTicketByTicketIdAndUserId(ticketId, userId).get();
	        model.addAttribute("ticket", ticket);

	        return "frontend/ticket_query/ticket_query_present";
	    }
		
		
		// 取消訂票
		@GetMapping("/ticket_query/cancel")
		public String cancelticket(@RequestParam("ticketId") Integer ticketId, @RequestParam("userId") String userId, HttpSession session) {
			ticketDao.cancelTicket(ticketId, userId);
			logger.info("取消訂票");
			return "redirect:/mvc//ticket/frontend/main";
		}
		
//Schedule------------------------------------------------------------------------------------------------------		

		//搜尋時刻表頁面(前端)
		@GetMapping("/schedule_query")
		public String timeTable() {

		return "frontend/schedule_query/schedule_query";
				}

				
			//列車時刻查詢(前端)
			@PostMapping("/schedule_query_present")
			public String scheduleQuery(@RequestParam("departStation") String departStation,
					@RequestParam("arriveStation") String arriveStation,					
					Model model)  throws Exception {

				if (departStation.equals(arriveStation)) {

					model.addAttribute("checkingMessage", "起點終點重複");
					System.out.println("起點終點重複");
					return "frontend/schedule_query/schedule_query";
				} 
				
				List<Schedule> schedule = scheduleDao.findSchedulesByStation(departStation, arriveStation);												
				model.addAttribute("schedule", schedule);
				return "frontend/schedule_query/schedule_query_present";
			}
						
			
			
			//返回主頁
			
			
			// 找出所有時刻表(後端)
			//@GetMapping("/traintable_display")
			//public String findAllSchedules(HttpSession session, Model model) {		
			//	List<Schedule> schedule = scheduleDao.findAllSchedules();
			//	model.addAttribute("schedule", schedule);
			//	return "/backend/traintable_display/traintable_display";
			//}
			
			@GetMapping("/backend/traintable_display")
			public String traintable(HttpSession session) {				
				return "/backend/traintable_display/traintable_display";

			}
}
