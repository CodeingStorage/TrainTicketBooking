package spring.mvc.model.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
