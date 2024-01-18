package spring.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.model.dao.ScheduleDao;
import spring.mvc.model.dao.TicketDao;
import spring.mvc.model.entity.Schedule;

@Controller
@RequestMapping("/find")
public class TicketBookingController {
	
	@Autowired
	private  ScheduleDao scheduleDaoImpl;

	@Autowired
	private  TicketDao ticketDaoImpl;

		
	
		
	
	@GetMapping("/")
	@ResponseBody
	private List<Schedule> findSch() {
		List<Schedule> schedules = scheduleDaoImpl.findAllSchedules();
		System.out.println(schedules);
		
		return schedules ;
		}
	
	@GetMapping("/123")
	private String  findSch1(Model model) {
		List<Schedule> schedules = scheduleDaoImpl.findAllSchedules();
		
		model.addAttribute("schedules",schedules);
		return "123";
	}
}
