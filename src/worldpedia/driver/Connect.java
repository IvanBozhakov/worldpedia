package worldpedia.driver;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connect {
	
	public static Connection get(){
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/worldpedia?useUnicode=true&characterEncoding=UTF-8","root","");
			
		/*Statement stm = this.connection.createStatement();
		
		ResultSet rs = stm.executeQuery("select * from users");
		while(rs.next()){
			System.out.println(rs.getString("name")+", "+ rs.getString("email"));
		}*/
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return con;
	}

}
