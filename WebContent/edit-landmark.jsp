<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="worldpedia.beans.Landmark" %>
<%@ page import="worldpedia.driver.Landmarks" %>
<%@ page import="worldpedia.beans.Image" %>
<%@ page import="worldpedia.driver.Images" %>
<jsp:include page="/WEB-INF/pages/header.jsp"/>
<%@ page import="worldpedia.beans.Country" %>
<%@ page import="java.util.ArrayList" %>
<%
Country country = new Country();
ArrayList<Country> countries =  country.getCountries();

Landmarks landmarksRepo =  new Landmarks();
Landmark landmark = landmarksRepo.searchById(Integer.parseInt(request.getParameter("id")));

%>
<% if (session.getAttribute("role") == null || !session.getAttribute("role").equals("admin")) { %>
 	<jsp:forward page="index.jsp">
  			<jsp:param name="action" value="failed" />
 	</jsp:forward>
<% } %>
<script src="js/tinymce/tinymce.min.js"></script>
<link href="js/fileinput/css/bootstrap.min.css" rel="stylesheet">
<link href="js/fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
<link href="js/fileinput/themes/explorer/theme.css" media="all" rel="stylesheet" type="text/css"/>
<script src="js/fileinput/js/fileinput.js" type="text/javascript"></script>
<div class="container">
<div id="result">
            <h3>${requestScope["message"]}</h3>
        </div>
	<form enctype="multipart/form-data"  action="EditLandmark" method="post">
	     <input type="hidden" name="landmark_id" value="<%= landmark.getId() %>">
		 <div class="form-group">
		  <label for="usr">Landmark name:</label>
		  <input type="text" name="name" class="form-control" id="usr" value="<%= landmark.getName() %>">
		</div>
		 <div class="form-group">
		  <label for="usr">Country:</label>
		<select id="country_select" class="form-control" name="country_select">
		   <% for(Country cn : countries) { 
		   if(landmark.getCountry().equals(cn.getCountry())){
		   %>
		    <option value="<%= cn.getId() %>" selected><%= cn.getCountry() %></option>
		    <% }else{ %>
		     <option value="<%= cn.getId() %>"><%= cn.getCountry() %></option>
		   <% }} %>
		</select>
		</div>
		<textarea name="description"><%= landmark.getDescription()%></textarea>
		<div class="upload-image-form"  >
		<label class="control-label">Select Images</label>
			<input id="input-7" name="images[]" multiple type="file" class="file file-loading"
			 data-allowed-file-extensions='["jpg", "jpeg","gif","png"]'>
		</div>
		<div class="admin-post-btn">
		<button type="submit" class="btn btn-success">Update landmark</button>
		</div>
	</form>

</div>
<jsp:include page="/WEB-INF/pages/footer.jsp"/>
<% 
Images imageRepo = new Images();
ArrayList<Image> images = imageRepo.getImagesForLandmark(landmark.getId());
for(Image image : images){
%>
<span class="hide_images" id="<%=image.getId() %>" style="display:none;"><%=image.getPath() %></span>
<% }%>

<script>
tinymce.init({ selector:'textarea' });
var img = [];
var inputs = $('.hide_images');
var option = [];

var ss = [];
for(var i=0;i<inputs.length;i++){
	var path = $(inputs[i]).text();
	var name = path.split("/")[1];
	var folder = path.split("/")[0];
	var obj = {};
	img.push('http://localhost:8080/Worldpedia/'+folder+"/"+name);
	obj['caption'] = name;
	obj['width'] = "120px";
	obj['url'] = "http://localhost:8080/Worldpedia/Delete?id="+$(inputs[i]).attr("id");
	obj['key'] = i;
	ss.push(obj);
}
console.dir(ss);
$("#input-7").fileinput({
   /* 'theme': 'explorer',*/
    
    showUpload: false,
    showRemove: true,
    overwriteInitial: false,
    initialPreviewAsData: true,
    initialPreview: img,
    initialPreviewConfig: ss
});


</script>