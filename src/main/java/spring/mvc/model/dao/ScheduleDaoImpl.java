package spring.mvc.model.dao;

import java.sql.Time;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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
	public Optional<Schedule> findScheduleByTranNo(Integer trainNo) {
		String sql = "SELECT trainNo, departStation, arriveStation, departTime, arriveTime FROM trainticket.schedule where trainNo=?";
		try {
			Schedule schedule = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Schedule.class),trainNo);
			return Optional.of(schedule);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Optional.ofNullable(null);
	}

	/**
	 * SELECT trainNo, departStation, arriveStation, departTime, arriveTime FROM trainticket.schedule WHERE departTime BETWEEN '09:00:00' AND '12:00:00'
	 */
	@Override
	public List<Schedule> findAllSchedulesByTime(Time startTime, Time endTime) {
		String sql = "SELECT trainNo, departStation, arriveStation, departTime, arriveTime FROM trainticket.schedule WHERE departTime BETWEEN ? AND ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Schedule.class),startTime,endTime);
	}

}
