package spring.mvc.model.dao;

import java.util.List;
import java.util.Optional;

import spring.mvc.model.entity.Ticket;

public interface TicketDao {

	
	//新增車票0
	 void addTicket(Ticket ticket);
	
	//找出所有車票
	 List<Ticket>findAllTickets();
	
	//根據車票ID與userId查找車票資訊0
	Optional<Ticket>findTicketByTicketIdAndUserId(Integer ticketId, String userId);
	
	//根據車票ID與userId修改車票資訊0
	Boolean updateTicketByTicketIdAndUserId(Integer ticketId, String userId,Ticket newTicket);
	
	//根據車票ID與userId刪除車票0
	Boolean cancelTicket(Integer ticketId,String userId);
	
	//根據車票ID刪除車票0
	Boolean cancelTicketByTicketId(Integer ticketId);
	
	
}
