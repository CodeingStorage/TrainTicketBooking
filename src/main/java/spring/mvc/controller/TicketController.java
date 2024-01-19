package spring.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.model.dao.ScheduleDao;
import spring.mvc.model.dao.TicketDao;

@Controller
@RequestMapping("/TicketController")
public class TicketController {
	
	@Autowired
	private  ScheduleDao scheduleDaoImpl;

	@Autowired
	private  TicketDao ticketDaoImpl;

		
	//前往首頁
	@GetMapping("/frontend/main")
	public String main(HttpSession session) {
		
		return "frontend/main";

	}
}
