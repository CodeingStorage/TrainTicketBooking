package spring.mvc.bean;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Time;

import com.google.gson.Gson;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainTime {

	private String trainNo;
	
	private String departStationName;
	
	private String arriveStationName;
		
	private Time departTime;
	
	private Time arriveTime;
	
	private String price;
	
	public String getJson() {
		return new Gson().toJson(this);
	}
}
