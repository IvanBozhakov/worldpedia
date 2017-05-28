package worldpedia.driver;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.mysql.jdbc.PreparedStatement;

import worldpedia.beans.Image;
import worldpedia.beans.Tag;
import worldpedia.beans.User;
public class TagsRepo {
	
	
	private Connection connection;
	public TagsRepo(){
		
		this.connection = Connect.get();
	}
	
	public void tag(Tag tag){
		try{
			
			String query = "insert into tags (user_id, landmark_id, comment, date) values(?,?,?,?)";

		      
		      PreparedStatement preparedStmt = (PreparedStatement) this.connection.prepareStatement(query);
		      preparedStmt.setInt (1, tag.getUser_id());
		      preparedStmt.setInt (2, tag.getLandmark_id());
		      preparedStmt.setString (3, tag.getComment());
		      preparedStmt.setString (4, tag.getDate());
		    
		      preparedStmt.execute();
		      
		      this.connection.close();
		}catch(Exception exc){
			exc.printStackTrace();
		}
		
		
	}
	
	public ArrayList<ArrayList<String>> getTagUsersByLandmarkId(int landmark){
		
		ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
		try{
		
		Statement stm = this.connection.createStatement();
		String query = "SELECT * FROM `tags` "+
						"join users "+
						"on tags.user_id = users.id "+
						"WHERE tags.landmark_id = "+landmark;
						ResultSet rs = stm.executeQuery(query);
						
		
		
		while(rs.next()){
			ArrayList<String> obj = new ArrayList<String>();	
			obj.add(rs.getString("name"));
			obj.add(rs.getString("image"));
			list.add(obj);
		}
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return list;
		
		
	}
	
	public ArrayList<Tag> getTagsOfUser(int userId){
		
		ArrayList<Tag> list = new ArrayList<Tag>();
		try{
		
		Statement stm = this.connection.createStatement();
		String query = "SELECT * FROM `tags` "+
						"join users "+
						"on tags.user_id = users.id "+
						"WHERE tags.user_id = "+userId;
						ResultSet rs = stm.executeQuery(query);
						
		
		
		while(rs.next()){
			Tag tag = new Tag();	
			tag.setLandmark_id(rs.getInt("landmark_id"));
			tag.setDate(rs.getString("date"));
			tag.setComment(rs.getString("comment"));
			list.add(tag);
			
			
		}
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return list;
		
		
	}
	
	

}
