package spring.mvc.model.dao;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.Time;
import java.util.List;
import java.util.Optional;
import org.springframework.dao.DataAccessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import spring.mvc.model.entity.Schedule;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Schedule> findAllSchedules() {
		String sql = "SELECT trainNo, departStation, arriveStation, departTime, arriveTime FROM trainticket.schedule";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Schedule.class));
	}

	@Override
	public Optional<Schedule> findScheduleByTrainNo(Integer trainNo) {
		String sql = "SELECT trainNo, departStation, arriveStation, departTime, arriveTime FROM trainticket.schedule where trainNo=?";
		try {
			Schedule schedule = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Schedule.class),trainNo);
			return Optional.of(schedule);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Optional.ofNullable(null);
	}
	
	@Override
	public Boolean updateScheduleByTrainNo(String trainNo, Schedule schedule) {
	    String sql = "UPDATE schedule SET departStation = ?, arriveStation = ?, departTime = ?, arriveTime = ? WHERE trainNo = ?";
	    int rowcount = jdbcTemplate.update(sql, schedule.getDepartStation(), schedule.getArriveStation(), schedule.getDepartTime(), schedule.getArriveTime(), trainNo);
	    
    // 根據 rowcount 判斷更新是否成功
    return rowcount > 0;
}
	
	/**
	 * SELECT trainNo, departStation, arriveStation, departTime, arriveTime FROM trainticket.schedule WHERE departTime BETWEEN '09:00:00' AND '12:00:00'
	 */
	@Override
	public List<Schedule> findAllSchedulesByTime(Time startTime, Time endTime) {
		String sql = "SELECT trainNo, departStation, arriveStation, departTime, arriveTime FROM trainticket.schedule WHERE departTime BETWEEN ? AND ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Schedule.class),startTime,endTime);
	}
	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String addSchedule(Schedule schedule) {
		String sql = "insert into schedule(trainNo, departStation, arriveStation, departTime, arriveTime) values(?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, schedule.getTrainNo(), schedule.getDepartStation(), schedule.getArriveStation(), schedule.getDepartTime(), schedule.getArriveTime());
	

		 KeyHolder keyHolder = new GeneratedKeyHolder();
	     
	     	 jdbcTemplate.update(connection -> {
	         PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	         ps.setString(1, schedule.getTrainNo());
	         ps.setString(2, schedule.getDepartStation());
	         ps.setString(3, schedule.getArriveStation());	  
	         ps.setTime(4, schedule.getDepartTime());
	         ps.setTime(5, schedule.getArriveTime());
	         return ps;
	     }, keyHolder);

	     if (keyHolder.getKey() != null) {
	    	 schedule.setTrainNo(keyHolder.getKey().toString());
	     }

	     return schedule.getTrainNo();
		
	}
	

}
