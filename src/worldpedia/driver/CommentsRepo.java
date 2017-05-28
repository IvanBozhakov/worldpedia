package worldpedia.driver;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import worldpedia.beans.Comment;



public class CommentsRepo {

	private Connection connection;
	public CommentsRepo(){
		
		this.connection = Connect.get();
	}
	public ArrayList<Comment> getCommentssForLandmark(int landmark){
		ArrayList<Comment> images =  new ArrayList();

		try{
		
			Statement stm = this.connection.createStatement();
		String query = "select comments.*, users.name ,users.image from "
				+ "comments join users on users.id = comments.user_id where landmark_id="+landmark;
		ResultSet rs = stm.executeQuery(query);
		
		while(rs.next()){
			Comment  comment = new Comment();
			comment.setId(rs.getInt("id"));
			comment.setUser_id(rs.getInt("id"));
			comment.setLandmark_id(rs.getInt("landmark_id"));
			comment.setText(rs.getString("text"));
			comment.setAvatar(rs.getString("image"));
			comment.setUsername(rs.getString("name"));
			
			images.add(comment);
		
		}
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return images;
	}
	
	public void add(int landmark, int user, String text){
		try{

			  String query = "insert into comments (user_id,landmark_id,text) values(?,?,?)";
			 
		      PreparedStatement preparedStmt = (PreparedStatement) this.connection.prepareStatement(query);
		      preparedStmt.setInt (1, user);
		      preparedStmt.setInt (2, landmark);
		      preparedStmt.setString (3, text);
		      preparedStmt.execute();
		}catch(Exception exc){
			  exc.printStackTrace();
		}
	}
	
	
	
}
