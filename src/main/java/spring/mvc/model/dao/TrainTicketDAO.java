package spring.mvc.model.dao;

import java.util.Optional;

import spring.mvc.model.entity.Schedule;
import spring.mvc.model.entity.Ticket;
import spring.mvc.model.entity.User;



public interface TrainTicketDAO {
//	使用者-User:
	
//	1. 新增使用者
	void addUser(User user);

	
//	火車站點時刻表-Schedule:	
//	1. 根據車次ID新增時刻表資料(後台)	
	void addSchedule(Schedule schedule);
	
//	2. 根據車次ID修改時刻表資料(後台)	
	Boolean updateScheduleByTrainId(Integer trainId, String newSchedule);
	
//	3. 根據車次ID刪除時刻表資料(後台)
	Boolean removeScheduleByTrainId(Integer trainId);
	
//	車票-ticket:	
//	1. 新增車票
	void addTicket(Ticket ticket);
	
//	2. 根據使用者ID與車票ID查找票卷資料
	Optional<Ticket> findTicketByUserIdAndTicketId(Integer userId,Integer ticketId);
	
//	3. 根據使用者ID與車票ID修改票卷資料
	Boolean updateTicketByUserIdAndTicketId(Integer userId,Integer ticketId);
	
//	4. 根據使用者ID與車票ID刪除票卷資料
	Boolean removeTicketByUserIdAndTicketId(Integer userId,Integer ticketId);
}
