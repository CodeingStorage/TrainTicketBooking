package spring.mvc.model.test;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import lombok.Data;
import spring.mvc.model.dao.ScheduleDaoImpl;
import spring.mvc.model.dao.TicketDaoImpl;
import spring.mvc.model.entity.Schedule;
import spring.mvc.model.entity.Ticket;

public class SchDaoTest2 {

	public static void main(String[] args) throws ParseException {

		ApplicationContext ctx = new ClassPathXmlApplicationContext("springmvc-servlet.xml");
		
		
		ScheduleDaoImpl scheduleDaoImpl = ctx.getBean("scheduleDaoImpl", ScheduleDaoImpl.class);
		
		Schedule newSchedule = new Schedule();
		newSchedule.setDepartStation("桃園");
		newSchedule.setArriveStation("雲林");                    
		newSchedule.setDepartTime("13:00:00");
		newSchedule.setArriveTime("15:00:00");
       	
        // 呼叫 DAO 的更新車票方法
        Boolean result = scheduleDaoImpl.updateScheduleByTrainNo("2001", newSchedule);
        
        if (result) {
            System.out.println("result");
        } else {
            System.out.println("更新失敗！");
		
        }
		
		
	}
		
}



