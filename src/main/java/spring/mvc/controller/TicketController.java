package spring.mvc.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

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
import spring.mvc.model.entity.Ticket;
import com.example.bean.TrainTime;
import com.example.entity.Ticket;
import com.example.entity.Tran;
import com.example.entity.User;
import com.example.util.TimeTableAPI;

import spring.mvc.model.dao.ScheduleDao;
import spring.mvc.model.dao.TicketDao;
import spring.mvc.model.entity.Schedule;

@Controller
@RequestMapping("/ticket")
public class TicketController {
	
	@Autowired
	private  ScheduleDao scheduleDao;

	@Autowired
	private  TicketDao ticketDao;

		
	//前往首頁
	@GetMapping("/frontend/main")
	public String main(HttpSession session) {
		
		return "/frontend/main";

	}
//車票 訂/修/刪除(需要API)----------------------------------------------------------------------------------------------	
	
	//訂票頁面
	@GetMapping("/frontend/booking/booking")
	public String bookPage(HttpSession session, Model model) {
		return "/frontend/booking/booking";
		
	}
	//訂票
	@PostMapping("/frontend/booking/booking")
	public String book(@RequestParam("departStation" )String departStation,
					   @RequestParam("arriveStation" )String arriveStation,					   
					   @RequestParam("departDate" )String departDate, Model model) throws Exception {

		if (departStation.equals(arriveStation)) {
			model.addAttribute("bookingMessage", "起點終點重複");
			return "booking";
		}
		//需要API
		//List<TrainTime> trainTimes = TimeTableAPI.getTrainTimes(departStation, arriveStation, departDate);
		
		//model.addAttribute("trainTimes", trainTimes);		
		
		return "booking"; 	
		
	}
	
	// 訂票結果(需要API)
		@PostMapping("/booking/choosing/result")
		@ResponseBody
		@Transactional(propagation = Propagation.REQUIRED)
		public String result(@RequestBody TrainTime trainTime,
							Model model, HttpSession session) {
						
			//從API獲取資訊(need API)
	        String trainNo = trainTime.getTrainNo();
	        String departStationName = trainTime.getdepartStationName();
	        String arriveStationName = trainTime.getArriveStationName();
	        String departDate = trainTime.getDepartDate();
	        String departTime = trainTime.getDepartTime();
	        String arriveTime = trainTime.getArriveTime();
	        String price = trainTime.getPrice();
	        
	        System.out.println(trainNo);
			
	        //schedule
	     	Schedule schedule = new Schedule();
	     	schedule.getTrainNo();
	     	schedule.setDepartStation(departStationName);
	     	schedule.setArriveStation(arriveStationName);	     	
	     	schedule.setDepartTime(departTime);
	     	schedule.setArriveTime(arriveTime);
	     	
			ScheduleDao.addSchedule(schedule);
			
			
			Ticket ticket = new Ticket();
			
			ticket.setUserId(ticket.getUserId());
			
			ticket.setTrainNo(schedule.getTrainNo());
			
			System.out.println(schedule.getTrainNo());
			
			int i;
			i = (int) (Math.random()*10)+1;
			Integer iInteger = Integer.valueOf(i);
			ticket.setCarNo(iInteger);
			
			Random r = new Random();
			char c = (char)(r.nextInt(5) + 'a');
			String s = Character.toString(c);
			ticket.setSiteNo(s);
			
			ticket.setPrice(Integer.parseInt(price));
			
			TicketDao.addTicket(ticket);
			
			logger.info("訂票成功");
			
			return "success:" + schedule.getTrainNo();
		}
		
		
		// 取消訂票
		@GetMapping("/ticketlist/cancel")
		public String cancelticket(@RequestParam("ticketId") Integer ticketId, @RequestParam("userId") String userId, HttpSession session) {
			ticketDao.cancelTicket(ticketId, userId);
			logger.info("取消訂票");
			return "redirect:/mvc/highrail/ticketlist";
		}
//列車時刻表----------------------------------------------------------------------------------------------	
	//列車時刻查詢
	@GetMapping("/frontend/schedule_query/schedule_query")
	public String trainQueryPage(HttpSession session) {
		return "/frontend/schedule_query/schedule_query";
		
	}
	
	//列車時刻查詢
	@GetMapping("/frontend/ticket_query/ticket_query")
	public String ticketQueryPage(HttpSession session) {
		return "/frontend/ticket_query/ticket_query";
			
		}
	
	//返回主頁
	
}
