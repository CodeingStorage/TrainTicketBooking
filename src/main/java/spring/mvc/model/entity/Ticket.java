package spring.mvc.model.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ticket {
	
	private int ticketId;
	
	private String userId;
	
    private String trainNo;
    
    private Date date;  
    
    private String trainCarId;
    
    private Integer seatId;
    
    private Integer price;
    
    private Date bookTime;
    
    //關聯屬性
    private Schedule schedule;
    
    
}
