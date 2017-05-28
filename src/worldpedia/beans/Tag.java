package worldpedia.beans;

public class Tag {

	private int id;
	private int user_id;
	private int landmark_id;
	private String comment;
	private String date;
	public int getId() {
		return id;
	}
	public Tag() {
		super();
		
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getLandmark_id() {
		return landmark_id;
	}
	public void setLandmark_id(int landmark_id) {
		this.landmark_id = landmark_id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
