package spring.mvc.bean;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import com.google.gson.Gson;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainTime {

	private String trainNo;
	
	private String departStationName;
	
	private String arriveStationName;
	
	private String departDate;
	
	private String departTime;
	
	private String arriveTime;
	
	private String price;
	
	public String getJson() {
		return new Gson().toJson(this);
	}
}
