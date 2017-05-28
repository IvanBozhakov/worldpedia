package worldpedia.beans;

public class Comment {
	private int id;
	private int user_id;
	private int landmark_id;
	private String text;
	private String username;
	private String avatar;
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUsername() {
		return this.username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAvatar() {
		if (this.avatar != null && !this.avatar.isEmpty()) {
			return this.avatar;
		}else{
			return "profile.png";
		}
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	public int getId() {
		return id;
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
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	

}
