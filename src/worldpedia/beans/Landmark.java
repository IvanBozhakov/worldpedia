package worldpedia.beans;

public class Landmark {

	private int id;
	private String name;
	private String country;
	private String description;
	private String path;
	private int vote = 0;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setVote(int vote) {
		this.vote = vote;
	}
	public int getVote() {
		return this.vote;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getDescription() {
		return description;
	}
	public String getPath() {
		if(path == null){
			return "images/landmarks_placeholder.png";
		}
		return path;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Landmark() {
		super();
	}
	public Landmark(int id, String name, String description, String country, String path) {
		super();
		this.id = id;
		this.name = name;
		this.country = country;
		this.description = description;
		this.path = path;
	}
	
	
	
	
}
