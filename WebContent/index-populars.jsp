<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="worldpedia.beans.Landmark" %>
<%@ page import="worldpedia.driver.Landmarks" %>
<%@ page import="worldpedia.beans.Image" %>
<%@ page import="worldpedia.driver.Images" %>
<%
Landmarks landmarksRepo = new Landmarks();
Images landmarkImage = new Images();
ArrayList<Landmark> landmarks = landmarksRepo.getMostPopularLandmark();
ArrayList<Image> randomImages = landmarkImage.getRandomImages();
%>
<div class="container-fluid populars-wrap" >
<h2>Most popular Landmarks</h2>
<div class="row">
 <% for(int i = 0; i < 4; i+=1) { %>
  <div class="col-xs-6 col-md-3">
  		<% 
      	Images imagesRepo = new Images();
      	ArrayList<Image> images = imagesRepo.getImagesForLandmark(landmarks.get(i).getId());
      	if(images.size() >0){
      	%>
    <a href="Search?name=<%=landmarks.get(i).getName() %>&country=0" class="thumbnail a-tumb">
      <img src="<%=images.get(0).getPath() %>" alt="..." onerror="this.src='images/landmarks_placeholder.png'">
    </a>
    <% }else{%>
     <a href="Search?name=<%=landmarks.get(i).getName() %>" class="thumbnail a-tumb">
      <img src="images/landmarks_placeholder.png" alt="..." onerror="this.src='images/landmarks_placeholder.png'">
    </a>
    <% }%>
    <h3><%=landmarks.get(i).getName() %></h3>
  </div>
  <%}%>
</div>
</div>
<div style="padding:50px;"></div>
<div class="container-fluid populars-wrap" >
<h2>Photos</h2>
<div class="row">
  <% for(Image imagesRand : randomImages){%>
  <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="<%=imagesRand.getPath() %>" alt="..." onerror="this.src='images/landmarks_placeholder.png'">
    </a>
  </div>
  <%} %>
</div>
</div>