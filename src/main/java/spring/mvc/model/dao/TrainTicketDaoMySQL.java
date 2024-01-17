package spring.mvc.model.dao;

import java.util.Optional;

import org.springframework.stereotype.Repository;

import spring.mvc.model.entity.Schedule;
import spring.mvc.model.entity.Ticket;

@Repository
public class TrainTicketDaoMySQL implements TrainTicketDao {

	@Override
	public void addSchedule(Schedule schedule) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Boolean removeScheduleByTrainId(Integer trainId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean updateScheduleByTrainId(Integer trainId, String newSchedule) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addTicket(Ticket ticket) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Optional<Ticket> findTicketByUTicketId(Integer ticketId) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public Boolean updateTicketByUserIdAndTicketId(Integer userId, Integer ticketId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean removeTicketByUserIdAndTicketId(Integer userId, Integer ticketId) {
		// TODO Auto-generated method stub
		return null;
	}

}
