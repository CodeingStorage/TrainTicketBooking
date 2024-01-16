package spring.mvc.model.entity;

public class Direction {
	private String directionId;
	private String directionName;
	
	public Direction(String directionId, String directionName) {
		super();
		this.directionId = directionId;
		this.directionName = directionName;
	}

	public String getDirectionId() {
		return directionId;
	}

	public void setDirectionId(String directionId) {
		this.directionId = directionId;
	}

	public String getDirectionName() {
		return directionName;
	}

	public void setDirectionName(String directionName) {
		this.directionName = directionName;
	}

	@Override
	public String toString() {
		return "Direction [directionId=" + directionId + ", directionName=" + directionName + "]";
	}
	
	
	
}
