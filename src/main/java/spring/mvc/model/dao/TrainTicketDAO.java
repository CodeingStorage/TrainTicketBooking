package spring.mvc.model.dao;

import java.util.List;
import java.util.Optional;

import spring.mvc.model.entity.Direction;
import spring.mvc.model.entity.Station;
import spring.mvc.model.entity.Train;
import spring.mvc.model.entity.User;



public interface TrainTicketDAO {
//	使用者-User:
//	1. 查詢所有使用者名稱(多筆)
	List<User> findAllUserNames();
	
//	2. 新增使用者
	void addUser(User user);

//	5. 根據使用者ID查找使用者(單筆)
	Optional<User> findUserByUserId(Integer userId);
	

//	站點-Station:	
	//1. 根據站點ID查找站點名稱
	Optional<Station> findStationNameByStationId(Integer stationId);
	
//	2. 根據站點ID修改站點名稱
	Boolean updateStationName(Integer stationId, String newStationName);
	
	
//  行車方向-direction:
	
//	1. 根據行車方向ID查找行車方向名稱	
	Optional<Direction> findDirectionNameByDirectionId(Integer userId);

//  火車車次-Train:
//	1. 新增車次ID(後台)
	void addTrain(Train train);
		
//	2. 刪除車次(後台)
	Boolean removeTrainId(Integer trainId);
//	3. 根據行車方向ID查找同一行徑方向的火車資訊
	Optional<Train> findTrainIdByDirectionId(Integer trainId);
	
//	站點時刻表-Schedule:	
//	1. 新增車次ID(後台)
	
//	2. 根據車次ID修改車次(後台)
//	3. 根據車次ID刪除車次(後台)
//	4. 根據行車方向ID查找同一行徑方向的火車資訊

	
	
	
//	車票-ticket:	
	
	
}
