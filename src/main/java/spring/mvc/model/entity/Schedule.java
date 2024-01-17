package spring.mvc.model.entity;

public class Schedule {

	private int stationId;
	private String stationName;
	public Schedule(int stationId, String stationName) {
		super();
		this.stationId = stationId;
		this.stationName = stationName;
	}
	public int getStationId() {
		return stationId;
	}
	public void setStationId(int stationId) {
		this.stationId = stationId;
	}
	public String getStationName() {
		return stationName;
	}
	public void setStationName(String stationName) {
		this.stationName = stationName;
	}
	@Override
	public String toString() {
		return "Station [stationId=" + stationId + ", stationName=" + stationName + "]";
	}
		
	
}
