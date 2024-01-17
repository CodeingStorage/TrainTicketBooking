package spring.mvc.model.dao;

import java.util.Optional;

import org.springframework.stereotype.Repository;

import spring.mvc.model.entity.Ticket;

@Repository
public class TicketDaoImpl implements TicketDao {

	@Override
	public Optional<Ticket> findTicketByTicketIdAndUserId(Integer ticketId, String userId) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}
	

	

}
