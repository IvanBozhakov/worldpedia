package worldpedia.driver;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import com.mysql.jdbc.PreparedStatement;

import worldpedia.beans.User;
public class UserRepo {
	
	
	private Connection connection;
	public UserRepo(){
		
		this.connection = Connect.get();
	}
	
	public void createUser(User user){
		try{
			//Statement stm = this.connection.createStatement();
			
			String query = "insert into users (name, email, password, role) values(?,?,?,?)";

		      
		      PreparedStatement preparedStmt = (PreparedStatement) this.connection.prepareStatement(query);
		      preparedStmt.setString (1, user.getName());
		      preparedStmt.setString (2, user.getEmail());
		      preparedStmt.setString (3, user.getPassword());
		      preparedStmt.setString (4, user.getRole());
		    
		      preparedStmt.execute();
		      
		      this.connection.close();
		}catch(Exception exc){
			exc.printStackTrace();
		}
		
		
	}
	
	public boolean checkUserEmail(String email){
		boolean exists = false;
		try{
		Statement stm = this.connection.createStatement();
		
		ResultSet rs = stm.executeQuery("select * from users where email = '"+email+"'");
		if(rs.next()){
			exists = true;
		}
		}catch(Exception exc){
			exc.printStackTrace();
		}
		
		return exists;
	}
	
	public User loginUser(User user){
		
		try{
		Statement stm = this.connection.createStatement();
		
		ResultSet rs = stm.executeQuery("select * from users where email = '"+user.getEmail()+"' AND password='"+user.getPassword()+"'");
		if(rs.next()){
			user.setId(rs.getInt("id"));
			user.setRole(rs.getString("role"));
			user.setName(rs.getString("name"));
			user.setPhoto(rs.getString("image"));
		}else{
			user.setEmail("");
			user.setPassword("");
		}
		
		}catch(Exception exc){
			exc.printStackTrace();
		}
		
		return user;
	}
	
	public void changePassword(String password,HttpServletRequest request){
		try{
			
		  String query = "update users set password= ? where id= ?";
		  PreparedStatement preparedStmt = (PreparedStatement) this.connection.prepareStatement(query);
	      preparedStmt.setInt (2, (Integer)request.getSession().getAttribute("id"));
	      preparedStmt.setString (1, password);
	      preparedStmt.execute();
		     
		      
		}catch(Exception exc){
			exc.printStackTrace();
		}
	}
	
	public void changeUsername(String username,HttpServletRequest request){
		try{
			
		  String query = "update users set name= ? where id= ?";
		  PreparedStatement preparedStmt = (PreparedStatement) this.connection.prepareStatement(query);
	      preparedStmt.setInt (2, (Integer)request.getSession().getAttribute("id"));
	      preparedStmt.setString (1, username);
	      preparedStmt.execute();
		     
		      
		}catch(Exception exc){
			exc.printStackTrace();
		}
	}
	
	public boolean checkOldPassword(String password,HttpServletRequest request){
		boolean exists = false;
		try{
		Statement stm = this.connection.createStatement();
		String query = "select * from users where password = '"+
				password+"' and id="+request.getSession().getAttribute("id");
		System.out.println(query);
		ResultSet rs = stm.executeQuery(query);
		if(rs.next()){
			exists = true;
		}
		}catch(Exception exc){
			exc.printStackTrace();
		}
		System.out.println(exists);
		return exists;
	}
	
	

}
