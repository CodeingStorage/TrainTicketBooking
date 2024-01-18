/*package spring.mvc.model.test;

import java.sql.Time;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.model.dao.ScheduleDao;
import spring.mvc.model.dao.ScheduleDaoImpl;
import spring.mvc.model.dao.TicketDao;
import spring.mvc.model.entity.Schedule;

@Controller
@RequestMapping("/find")
public class ScheduleDaoTest {
	
	@Autowired
	private  ScheduleDao scheduleDaoImpl;

	@Autowired
	private  TicketDao ticketDaoImpl;

		
	
		//ApplicationContext ctx = new ClassPathXmlApplicationContext("/WEB-INF/springmvc-servlet.xml");
		
		//ScheduleDaoImpl scheduleDaoImpl = ctx.getBean("scheduleDaoImpl", ScheduleDaoImpl.class);
		
	
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
		//Optional<Schedule> schOptional = scheduleDaoImpl.findScheduleByTranNo(2001);
		//if(schOptional.isPresent()) {
		//	System.out.println(schOptional.get());
		//} else {
		//	System.out.println("無");
		//}
		
		Time startTime = Time.valueOf("09:00:00");
		Time endTime = Time.valueOf("12:00:00");
		List<Schedule> schedules = scheduleDaoImpl.findAllSchedulesByTime(startTime, endTime);
		System.out.println(schedules);
		
	}
*/
