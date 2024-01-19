package spring.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import spring.mvc.model.dao.ScheduleDao;
import spring.mvc.model.dao.TicketDao;

@Controller
@RequestMapping("/ticket")
public class TicketController {
	
	@Autowired
	private  ScheduleDao scheduleDaoImpl;

	@Autowired
	private  TicketDao ticketDaoImpl;

		
	//前往首頁
	@GetMapping("/frontend/main")
	public String main(HttpSession session) {
		
		return "/frontend/main";

	}
	
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
		return departDate; 	
		
	}
	
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
