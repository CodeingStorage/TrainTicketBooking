package spring.mvc.model.entity;


public class Direction {
	private String directionId;
	private String directionName;
	
	public Direction(String directionId, String directionName) {
		super();
		this.directionId = directionId;
		this.directionName = directionName;
	}


	@Override
	public String toString() {
		return "Direction [directionId=" + directionId + ", directionName=" + directionName + "]";
	}
	
	
	
}
