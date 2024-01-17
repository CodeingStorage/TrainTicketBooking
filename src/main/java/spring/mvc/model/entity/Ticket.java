package spring.mvc.model.entity;

import java.sql.Date;
import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ticket {
	private int ticketId;
	private int userId;   
    private int trainId;
    private Date date;   
    private String trainCarId;
    private Integer seatId;
    private int price;
    private Timestamp bookTime;
 // 相關欄位
    private User user;
    private Schedule schedule;
    
}
