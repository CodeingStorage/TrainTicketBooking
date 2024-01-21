package spring.mvc.model.dao;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.example.entity.Tran;

import lombok.Data;
import spring.mvc.model.entity.Schedule;
import spring.mvc.model.entity.Ticket;
@Data
@Repository
public class TicketDaoImpl implements TicketDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void addTicket(Ticket ticket) {
		String sql = "INSERT INTO ticket ( userId, trainNo, date, trainCarId, seatId, price, bookTime) VALUES (?, ?, ?, ?, ?, ?, ?)";
           jdbcTemplate.update(sql, ticket.getUserId(), ticket.getTrainNo(), ticket.getDate(), ticket.getTrainCarId(), ticket.getSeatId(), ticket.getPrice(), ticket.getBookTime());     
                
	
	}
	@Override
	public Optional<Ticket> findTicketByTicketIdAndUserId(Integer ticketId, String userId) {
		String sql ="SELECT ticketId, userId, trainNo, date, trainCarId, seatId, price, bookTime FROM trainticket.ticket where ticketId=? AND userId=?";
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
	    try {
	        int rowCount = jdbcTemplate.update(sql, ticketId, userId);
	        return rowCount == 1;
	    } catch (DataAccessException e) {
	        // 可以在這裡添加日誌或其他處理
	        return false;
	    }
	     
	}

	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int addTran(Tran tran) {
		String sql = "insert into tran(tran_No, departureStation, arrivalStation, date, departureTime, arrivalTime) values(?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, tran.getTranNo(), tran.getDepartureStation(), tran.getArrivalStation(), tran.getDate(), tran.getDepartureTime(), tran.getArrivalTime());
	

		 KeyHolder keyHolder = new GeneratedKeyHolder();
	     
	     int affectedRows = jdbcTemplate.update(connection -> {
	         PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	         ps.setInt(1, tran.getTranNo());
	         ps.setString(2, tran.getDepartureStation());
	         ps.setString(3, tran.getArrivalStation());
	         ps.setString(4, tran.getDate());
	         ps.setString(5, tran.getDepartureTime());
	         ps.setString(6, tran.getArrivalTime());
	         return ps;
	     }, keyHolder);

	     if (keyHolder.getKey() != null) {
	    	 tran.setTranId(keyHolder.getKey().intValue());
	     }

	     return affectedRows;
		
	}
	
	//豐富/將schedule注入ticket
    private void enrichTicketDetails(Ticket ticket) {
    	String sql="SELECT trainNo, departStation, arriveStation, departTime, arriveTime FROM schedule WHERE trainNo=?";
    	Schedule schedule = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Schedule.class), ticket.getTrainNo());
		ticket.setSchedule(schedule);
    }
	

}
