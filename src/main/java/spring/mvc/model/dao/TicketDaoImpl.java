package spring.mvc.model.dao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.mvc.model.entity.Schedule;
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
		String sql ="SELECT userId, trainNo, date, trainCarId, seatId, price, bookTime FROM trainticket.ticket where ticketId=?, userId=?";
		try {
			Ticket ticket = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Ticket.class),ticketId,userId);
			return Optional.of(ticket);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Optional.ofNullable(null);
	}
		

	public Boolean updateTicketByTicketIdAndUserId(Integer ticketId, String userId, Ticket newTicket) {
	    String sql = "UPDATE ticket SET userId = ?, trainNo = ?, date = ?, trainCarId = ?, seatId = ?, price = ?, bookTime = ? WHERE ticketId = ? AND userId = ?";
	    
	    int rowcount = jdbcTemplate.update(
	        sql,
	        newTicket.getUserId(),
	        newTicket.getTrainNo(),
	        newTicket.getDate(),
	        newTicket.getTrainCarId(),
	        newTicket.getSeatId(),
	        newTicket.getPrice(),
	        newTicket.getBookTime(),
	        ticketId,
	        userId
	    );
	    
	    // 根據 rowcount 判斷更新是否成功
	    return rowcount > 0;
	}

	@Override
	public Boolean cancelTicket(Integer ticketId, String userId) {
	    String sql = "DELETE FROM TICKET WHERE ticketId = ? AND userId = ?";
	    try {
	        int rowCount = jdbcTemplate.update(sql, ticketId, userId);
	        return rowCount == 1;
	    } catch (DataAccessException e) {
	        // 可以在這裡添加日誌或其他處理
	        return false;
	    }
	}

	

	

}
