package spring.mvc.model.entity;
/*
 * 火車資訊
 * trainId:火車序號
 * directionId:行徑方向
 */
public class Train {
	private Integer trainId;
	private Integer directionId;
	
	public Train(Integer trainId, Integer directionId) {
		super();
		this.trainId = trainId;
		this.directionId = directionId;
	}

	public Integer getTrainId() {
		return trainId;
	}

	public void setTrainId(Integer trainId) {
		this.trainId = trainId;
	}

	public Integer getDirectionId() {
		return directionId;
	}

	public void setDirectionId(Integer directionId) {
		this.directionId = directionId;
	}

	@Override
	public String toString() {
		return "Train [trainId=" + trainId + ", directionId=" + directionId + "]";
	}
	
	
	
	
	
}
