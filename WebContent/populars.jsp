<jsp:include page="/WEB-INF/pages/header.jsp"/>
<div>
<%@ page import="java.util.ArrayList" %>
<%@ page import="worldpedia.beans.Landmark" %>
<%@ page import="worldpedia.driver.Landmarks" %>
<%@ page import="worldpedia.beans.Image" %>
<%@ page import="worldpedia.driver.Images" %>
<%@ page import="worldpedia.driver.CommentsRepo" %>
<%@ page import="worldpedia.beans.Comment" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/*li:hover{
    color: #777;
    background-color: #eee;
    border:3px solid #b3e0ff;
    border-radius:3px;
}*/
</style>

<%
	CommentsRepo commentsRepo = new  CommentsRepo();
	Landmarks landmarksRepo = new Landmarks();
	ArrayList<Landmark> landmarks = landmarksRepo.getMostPopularLandmark();
%>
<div class="container">
<ul class="list-group">
<%

for (Landmark landmark : landmarks) {
	Images imagesRepo = new Images();
  	ArrayList<Image> images = imagesRepo.getImagesForLandmark(landmark.getId());
%>

<li class="list-group-item">
  <div class="">
    <div class="thumbnail">
       <% if(images.size() > 0){%>
      	<img id="thumb-<%=landmark.getId() %>" class="main-image" src="<%=images.get(0).getPath() %>" alt="No image">
      <%}else{%>
      <img id="thumb-<%=landmark.getId() %>" class="main-image" src="<%=landmark.getPath() %>" alt="No image">
      <%} %>
      <div class="caption">
      	
      	<div class=" container">
      	<div class="row">
      	<% if(images != null){
      		for (Image image : images) {
      	%>
      	 <img class="image-small" src="<%=image.getPath() %>" onclick="toView('<%=landmark.getId() %>',this)" alt="No image">
      	 <% }} %>
      	 </div>
      	</div>
      	
        <h3><%=landmark.getName()%> 
        <% 
        int c = landmarks.size();
        int  v = (int) Math.round((landmark.getVote()/(double)c) * 6);
        for(int i=1;i<=v;i++){%>
        	<i class="fa fa-star " aria-hidden="true" style="color:#ffff4d;"></i>
       	<% }%>
       	<%if(session.getAttribute("logged") != null && session.getAttribute("role").equals("admin")){ %>
       		<a href="EditLandmark?id=<%=landmark.getId()%>">
       		<i class="fa fa-pencil-square-o"></i>
       		</a>
       	<% }%>
        </h3>
        <p><%=landmark.getDescription()%></p>
        <p><b>Country: </b><%=landmark.getCountry()%></p>
       <div>
       		<% if(session.getAttribute("logged") != null){
	       		Landmarks landRepo = new Landmarks();
	       		if(landRepo.isFavorite((Integer)session.getAttribute("id"), landmark.getId()) == false){
	       		%>
	       		<form class="fv-form" action="FovoritesServlet" method="post">
	       			<input type="hidden" name="landmark_id" value="<%=landmark.getId() %>">
	       			<button class="btn btn-warning" type="submit">
	       				<i class="fa fa-thumbs-up" aria-hidden="true">
	       				<%=landRepo.countUserLikeLandmark(landmark.getId()) %>
	       				</i>
	       			</button>
	       		</form>
	       		<%}else{%>
       				<b><i class="fa fa-thumbs-up " aria-hidden="true" >
       					</i><sup><%=landRepo.countUserLikeLandmark(landmark.getId()) %></sup>
       				</b>
	       		<% }}%>
       		<span class="map-icon" onclick="showMap('<%=landmark.getId()%>')"><i class="fa fa-map-marker fa-1x" aria-hidden="true"></i></span>
       		<%if(session.getAttribute("logged") != null){ %>
       		<i class="fa fa-tags" onclick="tag(<%=landmark.getId()%>)"></i>
       		<% }%>
       		
       </div>
      </div>
      
	      <div id="map-<%=landmark.getId()%>" class="maps modal-map inactive">
	      <div class="closeModal"><span class="fa fa-times"></span></div> 
	      	<iframe
			  width="100%"
			  height="450"
			  frameborder="0" style="border:0"
			  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDMxlzZ9TJ9mIcbTMBj8dFein1khm--Z94
			    &q=<%=landmark.getName()%>" allowfullscreen>
			</iframe>
	      </div>
	 
    </div>
    
    <div class="comments">
	    <h3 class="btn btn-default comment-btn-togle" data-toggle="collapse" data-target="#comment-wrap-<%=landmark.getId()%>">
	    	<i class="fa fa-comments-o" aria-hidden="true"></i> Comments
	    </h3>
	    <div id="comment-wrap-<%=landmark.getId()%>" class="collapse">
		<div id="section_<%=landmark.getId()%>" >
			<%
			ArrayList<Comment> comments = commentsRepo.getCommentssForLandmark(landmark.getId());
			for (Comment comment : comments) {
			%>
			<div class="item-comment">
				<h4>
				<span class="userpic-menu">
					<img style="display: inline;" src="images/<%=comment.getAvatar()%>"  onerror="this.src='images/profile.png'" alt="">
				</span>
					<b><i><%= comment.getUsername() %></i> <i class="fa fa-comment" aria-hidden="true"></i></b>
				</h4>
				<div><%= comment.getText() %></div>
			</div>
			<%}
			if(comments.size() == 0){
			%>
				<p class="no-comment">No comment for this item</p>
			<% }%>
		</div>
				<%if(session.getAttribute("logged") != null){ %>
			<div class="add-comment-wrap">
			<form class="cmnt-form" action="/Comment" method="post">
				<textarea class="text" name="comment" placeholder="Add comment..." cols="60" rols="5"></textarea>
				<input class="user" type="hidden" name="user" value="<%=session.getAttribute("id") %>"/>
				<input class="landmark" type="hidden" name="landmark" value="<%=landmark.getId()%>"/>
				<button type="button" name="commnet-btn" value="POST"
				 class="btn btn-success comment-btn" onclick="addComment(this)">
				 <i class="fa fa-commenting-o" aria-hidden="true"></i> POST</button>
			</form>
			</div>
		<%} %>
		</div>
	</div>
  </div>
</li>
<%}%>
</ul>
</div>
<div class="overlay"><div>
<jsp:include page="/WEB-INF/pages/footer.jsp"/>