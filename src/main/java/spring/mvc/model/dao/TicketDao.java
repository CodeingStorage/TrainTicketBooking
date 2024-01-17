package spring.mvc.model.dao;

import java.util.Optional;

import spring.mvc.model.entity.Ticket;

public interface TicketDao {

	
	//新增車票
	void addTicket(Ticket ticket);
	
	//根據車票ID與userId查找車票資訊
	Optional<Ticket>findTicketByTicketIdAndUserId(Integer ticketId, String userId);
	
	//根據車票ID與userId更新車票資訊
	Boolean updateTicketByTicketIdAndUserId(Integer ticketId, String userId,Ticket newTicket);
	
	//根據車票ID與userId刪除車票
	Boolean cancelTicket(Integer ticketId,String userId);
	
	
}
