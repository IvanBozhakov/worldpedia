package worldpedia.driver;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;



import worldpedia.beans.Country;

public class CountryRepo {
	private Connection connection;
	public CountryRepo(){
		
		this.connection = Connect.get();
	}
	
	
	public ArrayList<Country> countries(){
		ArrayList<Country> countries =  new ArrayList();

		try{
		
			Statement stm = this.connection.createStatement();
		
		ResultSet rs = stm.executeQuery("select * from country");
		
		while(rs.next()){
			countries.add(new Country(Integer.parseInt(rs.getString("country_id")), (String)rs.getString("country")));
		
		}
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return countries;
	}
	
}
