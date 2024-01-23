package spring.mvc.model.test;

import java.sql.Time;
import java.text.ParseException;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import spring.mvc.model.dao.ScheduleDaoImpl;
import spring.mvc.model.entity.Schedule;

public class SchDaoTest2 {

	public static void main(String[] args) throws ParseException {

		ApplicationContext ctx = new ClassPathXmlApplicationContext("springmvc-servlet.xml");
		
		
		ScheduleDaoImpl scheduleDaoImpl = ctx.getBean("scheduleDaoImpl", ScheduleDaoImpl.class);
		
		Schedule newSchedule = new Schedule();		
		newSchedule.setDepartStation("台北");
		newSchedule.setArriveStation("雲林");
		newSchedule.setDepartTime(Time.valueOf("13:00:00"));
		newSchedule.setArriveTime(Time.valueOf("14:30:00"));
       	
        // 呼叫 DAO 的更新車票方法
        Boolean result = scheduleDaoImpl.updateScheduleByTrainNo("2001", newSchedule);
        
        if (result) {
            System.out.println(newSchedule);
        } else {
            System.out.println("更新失敗!");
		
        }
		
		
	}
		
}



