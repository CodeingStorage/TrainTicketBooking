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
@RequestMapping("/TrainTicketOrder")
public class TicketBookingController {
	
	@Autowired
	private  ScheduleDao scheduleDaoImpl;

	@Autowired
	private  TicketDao ticketDaoImpl;

		
	//新增車票
	
	
	
	
}
