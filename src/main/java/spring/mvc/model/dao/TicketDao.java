package spring.mvc.model.dao;

import java.util.Optional;

import spring.mvc.model.entity.Ticket;

public interface TicketDao {

	
	//根據車票ID與userId查找車票資訊
	Optional<Ticket>findTicketByTicketIdAndUserId(Integer ticketId, String userId);
	
	//更新車票資訊
	
	//刪除車票
	
	
	
}
