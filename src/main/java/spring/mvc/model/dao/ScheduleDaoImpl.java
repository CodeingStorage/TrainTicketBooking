package spring.mvc.model.dao;

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
	public List<Schedule> findSchedulesByStation(String departStation, String arriveStation) {
		String sql = "SELECT trainNo, departStation, arriveStation, departTime, arriveTime FROM trainticket.schedule WHERE departStation = ? AND arriveStation = ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Schedule.class),departStation,arriveStation);
	}
	
	@Override
	public List<Schedule> findSchedulesByStationAndTime(String departStation, String arriveStation,String departTime) {
		String sql = "SELECT trainNo, departStation, arriveStation, departTime, arriveTime FROM trainticket.schedule WHERE departStation = ? AND arriveStation = ? AND departTime >= TIME(?)";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Schedule.class),departStation,arriveStation,departTime);
	}

	@Override
	public void addSchedule(Schedule schedule) {
		String sql = "INSERT INTO schedule (trainNo, departStation, arriveStation, departTime, arriveTime) values(?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, schedule.getTrainNo(), schedule.getDepartStation(), schedule.getArriveStation(), schedule.getDepartTime(), schedule.getArriveTime());
		
	}

	@Override
	public Boolean cancelScheduleByTrainNo(String trainNo) {
		String sql = "DELETE FROM SCHEDULE WHERE trainNo = ?";
	    return jdbcTemplate.update(sql, trainNo) == 1;
	}
	
	

	

}
