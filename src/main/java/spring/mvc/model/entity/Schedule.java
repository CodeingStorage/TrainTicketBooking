package spring.mvc.model.entity;

import java.sql.Time;

import java.text.SimpleDateFormat;
import java.util.Date;
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
	
	public void setDepartTime(String departTime) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        Date parsedDate = sdf.parse(departTime);
        this.departTime = new Time(parsedDate.getTime());
    }

    public void setArriveTime(String arriveTime) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        Date parsedDate = sdf.parse(arriveTime);
        this.arriveTime = new Time(parsedDate.getTime());
    }
	
}
