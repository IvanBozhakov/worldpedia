package worldpedia.driver;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.mysql.jdbc.PreparedStatement;

import worldpedia.beans.Image;



public class Images {

	private Connection connection;
	public Images(){
		
		this.connection = Connect.get();
	}
	public ArrayList<Image> getImagesForLandmark(int landmark){
		ArrayList<Image> images =  new ArrayList();

		try{
		
			Statement stm = this.connection.createStatement();
		String query = "select * from landmarks_images where landmark_id="+landmark;
		ResultSet rs = stm.executeQuery(query);
		
		while(rs.next()){
			images.add(
					new Image(
							Integer.parseInt(rs.getString("id")),
							rs.getString("path"),
							Integer.parseInt(rs.getString("landmark_id"))
							
					));
		
		}
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return images;
	}
	
	public Image getImageForLandmark(int landmark){
		Image image =  new Image();

		try{
		
			Statement stm = this.connection.createStatement();
		String query = "select * from landmarks_images "+
			"join landmarks on landmarks_images.landmark_id = landmarks.id"+
			" where landmark_id="+landmark+" limit 1";
		ResultSet rs = stm.executeQuery(query);
		
		while(rs.next()){
			image = 
					new Image(
							Integer.parseInt(rs.getString("id")),
							rs.getString("path"),
							Integer.parseInt(rs.getString("landmark_id"))
							
					);
			image.setName(rs.getString("name"));
		
		}
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return image;
	}
	
	public void create (String path, int landmark){
		try{
			
			  String query = "insert into landmarks_images (landmark_id, path) values(?,?)";
			 
		      PreparedStatement preparedStmt = (PreparedStatement) this.connection.prepareStatement(query);
		      preparedStmt.setInt (1, landmark);
		      preparedStmt.setString (2, path);
		      preparedStmt.execute();
		     
		      
		}catch(Exception exc){
			exc.printStackTrace();
		}
		
	}
	public void deleteImagesForLandmark (int img){
		try{
			
			  PreparedStatement st = (PreparedStatement)
					  connection.prepareStatement("delete FROM landmarks_images where id = ?");
			  st.setInt(1,img);
			  st.execute(); 
		      
		}catch(Exception exc){
			exc.printStackTrace();
		}
		
	}
	public void closeConnection(){
		try{
		 this.connection.close();
		}catch(Exception exc){
			exc.printStackTrace();
		}
	}
	
	public void updateUserImage(String image,HttpServletRequest request){
		try{
			
		  String query = "update users set image= ? where id= ?";
		  PreparedStatement preparedStmt = (PreparedStatement) this.connection.prepareStatement(query);
	      preparedStmt.setInt (2, (Integer)request.getSession().getAttribute("id"));
	      preparedStmt.setString (1, image);
	      preparedStmt.execute();
		     
		      
		}catch(Exception exc){
			exc.printStackTrace();
		}
	}
	
	public ArrayList<Image> getRandomImages(){
		ArrayList<Image> images =  new ArrayList();

		try{
		
			Statement stm = this.connection.createStatement();
		String query = "select * from landmarks_images order by rand() limit 4";
		ResultSet rs = stm.executeQuery(query);
		
		while(rs.next()){
			images.add(
					new Image(
							Integer.parseInt(rs.getString("id")),
							rs.getString("path"),
							Integer.parseInt(rs.getString("landmark_id"))
							
					));
		
		}
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return images;
	}
	
}
