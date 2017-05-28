package worldpedia.driver;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import worldpedia.beans.Landmark;



public class Landmarks {
	private Connection connection;
	private int id;
	public Landmarks(){
		
		this.connection = Connect.get();
	}
	
	
	public ArrayList<Landmark> searchByCountry(int country){
		ArrayList<Landmark> landmarks =  new ArrayList();

		try{
		
			Statement stm = this.connection.createStatement();
		String query = "SELECT DISTINCT worldpedia.landmarks.*, worldpedia.country.country, worldpedia.landmarks_images.path  FROM worldpedia.landmarks "+
						"LEFT  JOIN worldpedia.landmarks_images "+
						"ON worldpedia.landmarks.id = worldpedia.landmarks_images.landmark_id"+
					   " JOIN worldpedia.country"+
					   " ON worldpedia.landmarks.country_id = worldpedia.country.country_id"+
					   " WHERE worldpedia.landmarks.country_id ="+country+" GROUP by worldpedia.landmarks.id";
		ResultSet rs = stm.executeQuery(query);
		
		while(rs.next()){
			landmarks.add(
					new Landmark(
							Integer.parseInt(rs.getString("id")),
							rs.getString("name"),
							rs.getString("description"),
							rs.getString("country"),
							rs.getString("path")
					));
		
		}
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return landmarks;
	}
	
	public ArrayList<Landmark> searchByName(String name){
		ArrayList<Landmark> landmarks =  new ArrayList();
		
		try{
		
			Statement stm = this.connection.createStatement();
		String query = "SELECT DISTINCT  worldpedia.landmarks.*, worldpedia.country.country, worldpedia.landmarks_images.path  FROM worldpedia.landmarks "+
							 "LEFT  JOIN worldpedia.landmarks_images "+
							 "ON worldpedia.landmarks.id = worldpedia.landmarks_images.landmark_id"+
					   " JOIN worldpedia.country"+
					   " ON worldpedia.landmarks.country_id = worldpedia.country.country_id"+
					   " WHERE worldpedia.landmarks.name LIKE '%"+name+"%' GROUP by worldpedia.landmarks.id";
		ResultSet rs = stm.executeQuery(query);
		
		while(rs.next()){
			landmarks.add(
					new Landmark(
							Integer.parseInt(rs.getString("id")),
							rs.getString("name"),
							rs.getString("description"),
							rs.getString("country"),
							rs.getString("path")
					));
		
		}
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return landmarks;
	}
	public Landmark searchById(int id){
		Landmark landmark =  new Landmark();
		
		try{
		
			Statement stm = this.connection.createStatement();
		String query = "SELECT DISTINCT  worldpedia.landmarks.*, worldpedia.country.country, worldpedia.landmarks_images.path  FROM worldpedia.landmarks "+
							 "LEFT  JOIN worldpedia.landmarks_images "+
							 "ON worldpedia.landmarks.id = worldpedia.landmarks_images.landmark_id"+
					   " JOIN worldpedia.country"+
					   " ON worldpedia.landmarks.country_id = worldpedia.country.country_id"+
					   " WHERE worldpedia.landmarks.id="+id;
		ResultSet rs = stm.executeQuery(query);
		
		while(rs.next()){
			landmark = 
					new Landmark(
							Integer.parseInt(rs.getString("id")),
							rs.getString("name"),
							rs.getString("description"),
							rs.getString("country"),
							rs.getString("path")
					);
		
		}
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return landmark;
	}
	
	public ArrayList<Landmark> searchByNameAndCountry(int country, String name){
		ArrayList<Landmark> landmarks =  new ArrayList();
		
		try{
		
			Statement stm = this.connection.createStatement();
		String query = "SELECT DISTINCT worldpedia.landmarks.*, worldpedia.country.country,worldpedia.landmarks_images.path  FROM worldpedia.landmarks "
					+ "LEFT  JOIN worldpedia.landmarks_images "+
					"ON worldpedia.landmarks.id = worldpedia.landmarks_images.landmark_id"+
					   " JOIN worldpedia.country"+
					   " ON worldpedia.landmarks.country_id = worldpedia.country.country_id"+
					   " WHERE worldpedia.landmarks.name LIKE '%"+name+"%' "
					   		+ "AND worldpedia.landmarks.country_id="+country+" GROUP by worldpedia.landmarks.id";
		ResultSet rs = stm.executeQuery(query);
		
		while(rs.next()){
			landmarks.add(
					new Landmark(
							Integer.parseInt(rs.getString("id")),
							rs.getString("name"),
							rs.getString("description"),
							rs.getString("country"),
							rs.getString("path")
					));
		
		}
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return landmarks;
	}
	
	public int create(String name, String description, int country){
		 
		try{
			
			//Statement stm = this.connection.createStatement();
			
			String query = "insert into landmarks (name, description, country_id) values(?,?,?)";

		      
		      PreparedStatement preparedStmt = (PreparedStatement) this.connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
		      preparedStmt.setString (1, name);
		      preparedStmt.setString (2, description);
		      preparedStmt.setInt(3, country);
		     
		    
		      preparedStmt.execute();
		     
		      ResultSet rs = preparedStmt.getGeneratedKeys();
		      if (rs.next()) {
		         this.id = (int) rs.getLong(1);
		      }
		      
		      this.connection.close();
		}catch(Exception exc){
			exc.printStackTrace();
		}
		
		return this.id;
	}
	public void update(String name, String description, int country, int landmark){
		 
		try{
			
			
			String query = "update  landmarks SET name = ?, description = ? , country_id = ? where id="+landmark;

		      System.out.println(name);
		      PreparedStatement preparedStmt = (PreparedStatement) this.connection.prepareStatement(query);
		      preparedStmt.setString (1, name);
		      preparedStmt.setString (2, description);
		      preparedStmt.setInt(3, country);
		     
		    
		      preparedStmt.execute();
		     
		      
		      
		      this.connection.close();
		}catch(Exception exc){
			exc.printStackTrace();
		}
		
		
	}
	
	public void addFavorite(int user_id, int landmark_id){
		try{
			
			  String query = "insert into user_landmarks (user_id, landmark_id) values(?,?)";
		      PreparedStatement preparedStmt = (PreparedStatement) 
		    		  this.connection.prepareStatement(query);
		      preparedStmt.setInt (1, user_id);
		      preparedStmt.setInt (2, landmark_id);
		     
		      preparedStmt.execute();
		      this.connection.close();
		}catch(Exception exc){
			exc.printStackTrace();
		}
	}
	
	public ArrayList<Landmark> getFavoritesLandmarksForUser(int user_id){
		ArrayList<Landmark> landmarks =  new ArrayList();
		
		try{
		
			Statement stm = this.connection.createStatement();
		String query = "SELECT DISTINCT worldpedia.landmarks.*, worldpedia.country.country,"
				+ "worldpedia.landmarks_images.path "+
					"FROM worldpedia.landmarks "+ 
					"LEFT  JOIN worldpedia.landmarks_images "+ 
					"ON worldpedia.landmarks.id = worldpedia.landmarks_images.landmark_id "+
					"JOIN worldpedia.country "+
					"ON worldpedia.landmarks.country_id = worldpedia.country.country_id "+
					"JOIN worldpedia.user_landmarks "+
					"ON worldpedia.user_landmarks.landmark_id = worldpedia.landmarks.id "+
					"WHERE  worldpedia.user_landmarks.user_id="+user_id+
					" GROUP by worldpedia.landmarks.id";
		ResultSet rs = stm.executeQuery(query);
		
		while(rs.next()){
			landmarks.add(
					new Landmark(
							Integer.parseInt(rs.getString("id")),
							rs.getString("name"),
							rs.getString("description"),
							rs.getString("country"),
							rs.getString("path")
					));
		
		}
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return landmarks;
	}
	
	public boolean isFavorite(int user_id, int landmark_id){
		boolean is_favorite = false;
		try{
			
			Statement stm = this.connection.createStatement();
		String query = "SELECT worldpedia.user_landmarks.id FROM worldpedia.user_landmarks WHERE user_id="+
			user_id+" AND landmark_id="+landmark_id;
		ResultSet rs = stm.executeQuery(query);
		
		is_favorite =  rs.first();
		
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return is_favorite;
	}
	
	public int countUserLikeLandmark(int landmark_id){
		int count = 0;
		try{
			
			Statement stm = this.connection.createStatement();
		String query = "SELECT count(worldpedia.user_landmarks.id) as count "
				+ "FROM worldpedia.user_landmarks WHERE landmark_id="+landmark_id;
		ResultSet rs = stm.executeQuery(query);
		rs.next();
		count = rs.getInt("count");
		
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return count;
	}
	
	
	public ArrayList<Landmark> getMostPopularLandmark(){
		ArrayList<Landmark> landmarks =  new ArrayList();
		
		try{
		
		Statement stm = this.connection.createStatement();
			
		String query = "select count(worldpedia.user_landmarks.landmark_id)  as count,"+
						" worldpedia.landmarks.*,worldpedia.country.country"+
						" from worldpedia.user_landmarks "+
						" join worldpedia.landmarks"+
						" on worldpedia.landmarks.id=worldpedia.user_landmarks.landmark_id"+
						" JOIN worldpedia.country "+
						" ON worldpedia.landmarks.country_id = worldpedia.country.country_id "+
						" group by worldpedia.user_landmarks.landmark_id"+
						" order by count desc";
		
		ResultSet rs = stm.executeQuery(query);
		
		while(rs.next()){
			Landmark lm = new Landmark(
					Integer.parseInt(rs.getString("id")),
					rs.getString("name"),
					rs.getString("description"),
					rs.getString("country"),
					null
			);
			lm.setVote(rs.getInt("count"));
			
			landmarks.add(lm);
		
		}
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return landmarks;
	}
	
	
}
