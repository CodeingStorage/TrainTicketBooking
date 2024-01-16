package spring.mvc.model.dao;

import java.util.List;
import java.util.Optional;

import spring.mvc.model.entity.User;



public interface TrainTicketDAO {
//	使用者-User:
//	1. 查詢所有使用者(多筆)
	List<User> findAllUsers();
	
//	2. 新增使用者
	void addUser(User user);

//	5. 根據使用者ID查找使用者(單筆)
	Optional<User> findUserById(Integer userId);
	

//	站點-Station:	
//	行車方向-direction:	
//	火車列表-Train:	
//	站點時刻表-Schedule:	
//	車票-ticket:	
	
	
}
