package spring.mvc.model.entity;

import java.sql.Date;
import java.sql.Timestamp;

public class Ticket {
	private int ticketId;
	private int userId;
    private String userName;
    private int trainId;
    private Date date;
    private String departTime;
    private String arrivaTime;
    private int startStationId;
    private int endStationId;
    private int trainCarId;
    private String seatId;
    private int price;
    private Timestamp bookTime;
	
    public Ticket(int ticketId, int userId, String userName, int trainId, Date date, String departTime,
			String arrivaTime, int startStationId, int endStationId, int trainCarId, String seatId, int price,
			Timestamp bookTime) {
		super();
		this.ticketId = ticketId;
		this.userId = userId;
		this.userName = userName;
		this.trainId = trainId;
		this.date = date;
		this.departTime = departTime;
		this.arrivaTime = arrivaTime;
		this.startStationId = startStationId;
		this.endStationId = endStationId;
		this.trainCarId = trainCarId;
		this.seatId = seatId;
		this.price = price;
		this.bookTime = bookTime;
	}

	public int getTicketId() {
		return ticketId;
	}

	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getTrainId() {
		return trainId;
	}

	public void setTrainId(int trainId) {
		this.trainId = trainId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDepartTime() {
		return departTime;
	}

	public void setDepartTime(String departTime) {
		this.departTime = departTime;
	}

	public String getArrivaTime() {
		return arrivaTime;
	}

	public void setArrivaTime(String arrivaTime) {
		this.arrivaTime = arrivaTime;
	}

	public int getStartStationId() {
		return startStationId;
	}

	public void setStartStationId(int startStationId) {
		this.startStationId = startStationId;
	}

	public int getEndStationId() {
		return endStationId;
	}

	public void setEndStationId(int endStationId) {
		this.endStationId = endStationId;
	}

	public int getTrainCarId() {
		return trainCarId;
	}

	public void setTrainCarId(int trainCarId) {
		this.trainCarId = trainCarId;
	}

	public String getSeatId() {
		return seatId;
	}

	public void setSeatId(String seatId) {
		this.seatId = seatId;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Timestamp getBookTime() {
		return bookTime;
	}

	public void setBookTime(Timestamp bookTime) {
		this.bookTime = bookTime;
	}

	@Override
	public String toString() {
		return "Ticket [ticketId=" + ticketId + ", userId=" + userId + ", userName=" + userName + ", trainId=" + trainId
				+ ", date=" + date + ", departTime=" + departTime + ", arrivaTime=" + arrivaTime + ", startStationId="
				+ startStationId + ", endStationId=" + endStationId + ", trainCarId=" + trainCarId + ", seatId="
				+ seatId + ", price=" + price + ", bookTime=" + bookTime + "]";
	}
    
    
    
}
