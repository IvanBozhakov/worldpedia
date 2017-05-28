<%@ page import="java.util.ArrayList" %>
<%@ page import="worldpedia.beans.Landmark" %>
<%@ page import="worldpedia.driver.Landmarks" %>
<%@ page import="worldpedia.beans.Image" %>
<%@ page import="worldpedia.driver.Images" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/pages/header.jsp"/>
<% if (session.getAttribute("logged") == null) { %>
	<jsp:forward page="login.jsp">
			<jsp:param name="action" value="failed" />
	</jsp:forward>
<% } %>
<%if(request.getAttribute("landmarks") != null && request.getAttribute("no_found") == null){
	ArrayList<Landmark> landmarks = (ArrayList<Landmark>)request.getAttribute("landmarks");
%>
<div class="container">
<ul class="list-inline">
<%
for (Landmark landmark : landmarks) {
%>

<li class=" col-sm-4">
  <div class="">
    <div class="thumbnail">
      <img id="thumb-<%=landmark.getId() %>" onclick="toView('<%=landmark.getId() %>',this)" class="main-image" src="<%=landmark.getPath() %>" alt="No image">
      <div class="caption">
      	<% 
      	Images imagesRepo = new Images();
      	ArrayList<Image> images = imagesRepo.getImagesForLandmark(landmark.getId());
      	
      	%>
      	<div class=" container">
      	<div class="row">
      	<% if(images != null){
      		for (Image image : images) {
      	%>
      	 <img class="image-small" src="<%=image.getPath() %>" alt="No image">
      	 <% }} %>
      	 </div>
      	</div>
      	
        <h3><%=landmark.getName()%></h3>
        <p><%=landmark.getDescription()%></p>
        <p><b>Country: </b><%=landmark.getCountry()%></p>
        <% Landmarks landRepo = new Landmarks();%>
        	<b><i class="fa fa-thumbs-up " aria-hidden="true" >
    					</i><sup><%=landRepo.countUserLikeLandmark(landmark.getId()) %></sup>
    				</b>
        <span class="map-icon" onclick="showMap('<%=landmark.getId()%>')"><i class="fa fa-map-marker fa-1x" aria-hidden="true"></i></span>
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
  </div>
</li>
<%}%>
</ul>
</div>
<% }else if(request.getAttribute("no_found") != null){%>
<div class="container">
<div class="row">
<div class="col-sm-12 col-md-12">
<div class="thumbnail">
  <h3 class="center " style="text-align: center">No Found Favorites landmarks</h3>
</div>
</div>
</div>
</div>
<%}%>
<div class="overlay"><div>
<jsp:include page="/WEB-INF/pages/footer.jsp"/>