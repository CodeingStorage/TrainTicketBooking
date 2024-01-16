package spring.mvc.model.entity;

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
	private Integer user_Id;
	private String user_Name;
	
	
	
	
	public User(Integer user_Id, String user_Name) {
		super();
		this.user_Id = user_Id;
		this.user_Name = user_Name;
	}
	public Integer getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(Integer user_Id) {
		this.user_Id = user_Id;
	}
	public String getUser_Name() {
		return user_Name;
	}
	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}
	@Override
	public String toString() {
		return "User [user_Id=" + user_Id + ", user_Name=" + user_Name + "]";
	}
	
	
	
	
	
	
}
