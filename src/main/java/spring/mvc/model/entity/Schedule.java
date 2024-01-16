package spring.mvc.model.entity;

import java.sql.Time;

public class Schedule {
	private Integer scheduleId;
	private Integer trainId;
	private Integer stationId;
	private Time arriveTime;
	private Time departTime;
	
	public Schedule(Integer scheduleId, Integer trainId, Integer stationId, Time arriveTime, Time departTime) {
		super();
		this.scheduleId = scheduleId;
		this.trainId = trainId;
		this.stationId = stationId;
		this.arriveTime = arriveTime;
		this.departTime = departTime;
	}

	public Integer getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(Integer scheduleId) {
		this.scheduleId = scheduleId;
	}

	public Integer getTrainId() {
		return trainId;
	}

	public void setTrainId(Integer trainId) {
		this.trainId = trainId;
	}

	public Integer getStationId() {
		return stationId;
	}

	public void setStationId(Integer stationId) {
		this.stationId = stationId;
	}

	public Time getArriveTime() {
		return arriveTime;
	}

	public void setArriveTime(Time arriveTime) {
		this.arriveTime = arriveTime;
	}

	public Time getDepartTime() {
		return departTime;
	}

	public void setDepartTime(Time departTime) {
		this.departTime = departTime;
	}

	@Override
	public String toString() {
		return "Schedule [scheduleId=" + scheduleId + ", trainId=" + trainId + ", stationId=" + stationId
				+ ", arriveTime=" + arriveTime + ", departTime=" + departTime + "]";
	}
	
	
	
}
