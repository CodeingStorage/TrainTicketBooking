package spring.mvc.model.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import spring.mvc.model.dao.TicketDaoImpl;

public class TicketDaoTest {

	public static void main(String[] args) {

		ApplicationContext ctx = new ClassPathXmlApplicationContext("/WEB-INF/springmvc-servlet.xml");
		
		TicketDaoImpl ticketDaoImpl = ctx.getBean("ticketDaoImpl", TicketDaoImpl.class);

	}

}
