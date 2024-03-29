package spring.mvc.model.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import lombok.Data;
import spring.mvc.model.entity.Schedule;
import spring.mvc.model.entity.Ticket;
@Data
@Repository
public class TicketDaoImpl implements TicketDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	public void addTicket(Ticket ticket) {
		String sql = "INSERT INTO ticket ( userId, trainNo, date, trainCarId, seatId, price) VALUES (?, ?, ?, ?, ?, ?)";
           jdbcTemplate.update(sql, 
        		   ticket.getUserId(), 
        		   ticket.getTrainNo(), 
        		   ticket.getDate(), 
        		   ticket.getTrainCarId(), 
        		   ticket.getSeatId(), 
        		   ticket.getPrice());     
	}
	
	@Override
	public Optional<Ticket>findTicketByTicketIdAndUserId(Integer ticketId, String userId) {
		String sql ="SELECT ticketId, userId, trainNo, date, trainCarId, seatId, price, bookTime FROM trainticket.ticket where ticketId= ? AND userId= ?";
		try {
			Ticket ticket = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Ticket.class),ticketId,userId);
			if (ticket != null) {
				enrichTicketDetails(ticket);
			}
			return Optional.ofNullable(ticket);

		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}
	
		
		
		
	@Override
	public Boolean updateTicketByTicketIdAndUserId(Integer ticketId, String userId, Ticket ticket) {
	    String sql = "UPDATE ticket SET trainNo = ?, date = ?, trainCarId = ?, seatId = ?, price = ?, bookTime = ? WHERE ticketId = ? AND userId = ?";
	    
	    int rowcount = jdbcTemplate.update(
	        sql,	        
	        ticket.getTrainNo(),
	        ticket.getDate(),
	        ticket.getTrainCarId(),
	        ticket.getSeatId(),
	        ticket.getPrice(),
	        ticket.getBookTime(),
	        ticketId,
	        userId
	    );
	    
	    // 根據 rowcount 判斷更新是否成功
	    return rowcount > 0;
	}

	@Override
	public Boolean cancelTicket(Integer ticketId, String userId) {
	    String sql = "DELETE FROM TICKET WHERE ticketId = ? AND userId = ?";
	    return jdbcTemplate.update(sql, ticketId, userId) == 1;
	     
	}
	
	@Override
	public Boolean cancelTicketByTicketId(Integer ticketId) {
	    String sql = "DELETE FROM TICKET WHERE ticketId = ?";
	    return jdbcTemplate.update(sql, ticketId) == 1;
	     
	}

	
	@Override
	public List<Ticket> findAllTickets() {
	    String sql ="SELECT ticketId, userId, trainNo, date, trainCarId, seatId, price, bookTime FROM trainticket.ticket";        
	    List<Ticket> tickets = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Ticket.class));
	    
	    for (Ticket ticket : tickets) {
	        enrichTicketDetails(ticket);
	    }
	    
	    return tickets;
	}

	@Override
	public Optional<Ticket> findLastTicketIdByUserId(String userId) {
		String sql="SELECT * FROM trainticket.ticket where userId = ? order by ticketId desc limit 1";
		try {
			Ticket ticket = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Ticket.class),userId);
			return Optional.of(ticket);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Optional.ofNullable(null);
	}
	
	
	//豐富/將schedule注入ticket
    private void enrichTicketDetails(Ticket ticket) {
    	String sql="SELECT trainNo, departStation, arriveStation, departTime, arriveTime FROM schedule WHERE trainNo=?";
    	Schedule schedule = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Schedule.class), ticket.getTrainNo());
		ticket.setSchedule(schedule);
    }

	

		

}
