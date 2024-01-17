package spring.mvc.model.test;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import spring.mvc.model.dao.TicketDaoImpl;
import spring.mvc.model.entity.Ticket;

public class TicketDaoTest {

	public static void main(String[] args) throws ParseException {

		ApplicationContext ctx = new ClassPathXmlApplicationContext("/WEB-INF/springmvc-servlet.xml");
		
		TicketDaoImpl ticketDaoImpl = ctx.getBean("ticketDaoImpl", TicketDaoImpl.class);
		
		Optional<Ticket> ticOptional = ticketDaoImpl.findTicketByTicketIdAndUserId(6001, "A123456789");
		if(ticOptional.isPresent()) {
			System.out.println(ticOptional.get());
		} else {
			System.out.println("無");}
		
		
	/*	
		Ticket ticket = new Ticket();
        ticket.setUserId("A215559874");
        ticket.setTrainNo("2002");
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = dateFormat.parse("2024-01-15");
        ticket.setDate(date);
        
        ticket.setTrainCarId("B");
        ticket.setSeatId(20);
        ticket.setPrice(500);
        ticket.setBookTime(Timestamp.valueOf("2024-01-14 12:30:00"));

        // 呼叫 DAO 的添加車票方法
        ticketDaoImpl.addTicket(ticket);
		
		System.out.println(ticket);
		*/
		
		
	}

}

