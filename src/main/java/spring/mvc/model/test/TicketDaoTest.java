package spring.mvc.model.test;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import lombok.Data;
import spring.mvc.model.dao.TicketDaoImpl;
import spring.mvc.model.entity.Ticket;

public class TicketDaoTest {

	public static void main(String[] args) throws ParseException {

		ApplicationContext ctx = new ClassPathXmlApplicationContext("springmvc-servlet.xml");
		
		
		TicketDaoImpl ticketDaoImpl = ctx.getBean("ticketDaoImpl", TicketDaoImpl.class);
		
		
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
		
		/*
		Optional<Ticket> ticOptional = ticketDaoImpl.findTicketByTicketIdAndUserId(6003, "F234567891");
		if(ticOptional.isPresent()) {
			System.out.println(ticOptional.get());
		} else {
			System.out.println("無");}
		*/
		
		/*
		 Ticket newTicket = new Ticket();
        newTicket.setUserId("A123456789");
        newTicket.setTrainNo("2002");
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = dateFormat.parse("2024-01-16");
        newTicket.setDate(date);
        
        newTicket.setTrainCarId("C");
        newTicket.setSeatId(5);
        newTicket.setPrice(50);
        newTicket.setBookTime(Timestamp.valueOf("2024-01-15 13:45:00"));

        // 呼叫 DAO 的更新車票方法
        Boolean result = ticketDaoImpl.updateTicketByTicketIdAndUserId(6001, "A123456789", newTicket);
        
        if (result) {
            System.out.println("result");
        } else {
            System.out.println("更新失敗！");
		
        }
		*/
		
		
		
		
		
		
	}

}

