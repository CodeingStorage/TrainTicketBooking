package spring.mvc.model.dao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.mvc.model.entity.Ticket;

@Repository
public class TicketDaoImpl implements TicketDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void addTicket(Ticket ticket) {
		String sql = "INSERT INTO ticket (userId, trainNo, date, trainCarId, seatId, price, bookTime) VALUES (?, ?, ?, ?, ?, ?, ?)";
           jdbcTemplate.update(sql, ticket.getUserId(), ticket.getTrainNo(), ticket.getDate(), ticket.getTrainCarId(), ticket.getSeatId(), ticket.getPrice(), ticket.getBookTime());     
                
	
	}
	@Override
	public Optional<Ticket> findTicketByTicketIdAndUserId(Integer ticketId, String userId) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

		

	@Override
	public void updateTicketByTicketIdAndUserId(Integer ticketId, String UserId, Ticket ticket) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void cancelTicket(Integer ticketId, String userId) {
		// TODO Auto-generated method stub
		
	}

	

	

}
