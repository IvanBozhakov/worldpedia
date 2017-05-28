<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/pages/header.jsp"/>
<%@ page import="worldpedia.beans.Country" %>
<%@ page import="java.util.ArrayList" %>
<%
Country country = new Country();
ArrayList<Country> countries =  country.getCountries();
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
	<form enctype="multipart/form-data"  action="CreateLandmark" method="post">
		 <div class="form-group">
		  <label for="usr">Landmark name:</label>
		  <input type="text" name="name" class="form-control" id="usr">
		</div>
		 <div class="form-group">
		  <label for="usr">Country:</label>
		<select id="country_select" class="form-control" name="country_select">
		   <% for(Country cn : countries) { %>
		    <option value="<%= cn.getId() %>"><%= cn.getCountry() %></option>
		   <% } %>
		</select>
		</div>
		<textarea name="description"></textarea>
		<div class="upload-image-form"  >
		<label class="control-label">Select Images</label>
			<input id="input-7" name="images[]" multiple type="file" class="file file-loading"
			 data-allowed-file-extensions='["jpg", "jpeg","gif","png"]'>
		</div>
		<div class="admin-post-btn">
		<button type="submit" class="btn btn-success">Post landmark</button>
		</div>
	</form>

</div>
<jsp:include page="/WEB-INF/pages/footer.jsp"/>
<script>tinymce.init({ selector:'textarea' });
$("#input-7").fileinput({
    showUpload: false,
   
});
</script>