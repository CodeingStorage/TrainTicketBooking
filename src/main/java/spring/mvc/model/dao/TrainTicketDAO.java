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
	
//1. 根據站點ID查找站點名稱
	
//2. 根據站點ID修改站點名稱
	
	
	
//  行車方向-direction:
//1. 根據行車方向ID查找行車方向名稱	
	
//  火車車次-Train:
//1.  新增車次ID(後台)
//2. 根據車次ID修改車次(後台)
//3. 根據車次ID刪除車次(後台)
//4. 根據行車方向ID查找同一行徑方向的火車資訊
	
//1. 新增車次ID(後台)
//2. 根據車次ID修改車次(後台)
//3. 根據車次ID刪除車次(後台)
//4. 根據行車方向ID查找同一行徑方向的火車資訊

	
	
//	站點時刻表-Schedule:	
//	車票-ticket:	
	
	
}
