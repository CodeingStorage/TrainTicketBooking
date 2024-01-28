package spring.mvc.model.entity;



import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.Time;
import java.text.ParseException;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Schedule {

	private String trainNo;
	
	private String departStation;
	
	private String arriveStation;
	
	private Time departTime;
	
	private Time arriveTime;
	
	
	
}
