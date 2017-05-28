package worldpedia.beans;

import java.util.ArrayList;

import worldpedia.driver.CountryRepo;

public class Country {
	private int id;
	private String country;
	
	public int getId() {
		return id;
	}
	
	public Country() {
		super();
		
	}

	public Country(int id, String country) {
		super();
		this.id = id;
		this.country = country;
	}

	public String getCountry() {
		return country;
	}
	
	 public ArrayList<Country> getCountries(){
		 CountryRepo contries =  new CountryRepo();
		 
		 return contries.countries();
	
	 }
}
