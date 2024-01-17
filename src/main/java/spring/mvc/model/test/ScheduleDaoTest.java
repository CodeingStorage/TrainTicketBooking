package spring.mvc.model.test;

import java.sql.Time;
import java.util.List;
import java.util.Optional;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import spring.mvc.model.dao.ScheduleDaoImpl;
import spring.mvc.model.entity.Schedule;

public class ScheduleDaoTest {

	public static void main(String[] args) {
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/WEB-INF/springmvc-servlet.xml");
		
		ScheduleDaoImpl scheduleDaoImpl = ctx.getBean("scheduleDaoImpl", ScheduleDaoImpl.class);
		
		//List<Schedule> schedules = scheduleDaoImpl.findAllSchedules();
		//System.out.println(schedules);
		
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

}
