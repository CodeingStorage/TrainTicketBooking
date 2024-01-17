package spring.mvc.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
/*
 * 使用者資料
+-------------------+-----------------
|       user_Id     |    user_Name    | 
+-------------------+-----------------
|  	  101    		|     A123456789  | 
| 	  102   	    | 	  J987654328  | 
+-------------------+-----------------
 */
public class User {
	private Integer userId;
	private String userName;
	

	
}
