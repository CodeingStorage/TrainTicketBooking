package spring.mvc.model.entity;

import java.sql.Date;

public class Ticket {
	private String userId;
	private Integer ticketId;
	//出發日期
	private Date departDate;
	//起點站(ID/名稱)
	private Integer startStationId;
	private String startStationName;
	//終點站(ID/名稱)
	private Integer endStationId;
	private String endStationName;
	//車廂
	private Integer carriageId;
	//座位
	private Integer seatId;
	//優惠
	private Integer discountId;
	private String discountName;
	//價格
	private Integer price;
	//購買日期
	private Date buyDate;
}
