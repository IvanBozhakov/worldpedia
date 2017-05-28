package worldpedia.beans;

public class Image {
private int id;
private String path;
private int landmark_id;
private String name;
public Image(int id, String path, int landmark_id) {
	super();
	this.id = id;
	this.path = path;
	this.landmark_id = landmark_id;
}

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPath() {
	return path;
}
public void setPath(String path) {
	this.path = path;
}
public int getLandmark_id() {
	return landmark_id;
}
public void setLandmark_id(int landmark_id) {
	this.landmark_id = landmark_id;
}
public Image() {
	super();
	// TODO Auto-generated constructor stub
}
}
