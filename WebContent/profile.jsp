<jsp:include page="/WEB-INF/pages/header.jsp"/>
<%@ page import="java.util.ArrayList" %>
<%@ page import="worldpedia.beans.Landmark" %>
<%@ page import="worldpedia.driver.Landmarks" %>
<%@ page import="worldpedia.beans.Image" %>
<%@ page import="worldpedia.driver.Images" %>
<%@ page import="worldpedia.driver.CommentsRepo" %>
<%@ page import="worldpedia.beans.Comment" %>
<%@ page import="worldpedia.beans.Tag" %>
<%@ page import="worldpedia.driver.TagsRepo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/profile.css" rel="stylesheet">
<script src="js/profile.js"></script>
<% if (session.getAttribute("id") == null) { %>
 	<jsp:forward page="index.jsp">
  			<jsp:param name="action" value="failed" />
 	</jsp:forward>
<% } %>
<div class="container populars-wrap">
    <div class="row profile">
		<div class="col-md-3">
			<div class="profile-sidebar">
				<!-- SIDEBAR USERPIC -->
				<div class="profile-userpic">
					<img src="images/<%=session.getAttribute("image")%>" class="img-responsive" onerror="this.src='images/profile.png'" alt="">
				</div>
				<!-- END SIDEBAR USERPIC -->
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
						<%=session.getAttribute("username")%>
					</div>
					<div class="profile-usertitle-job">
						<%=session.getAttribute("role")%>
					</div>
				</div>
				<!-- END SIDEBAR USER TITLE -->
				<!-- SIDEBAR BUTTONS -->
				<div class="profile-userbuttons">
					<div>
					
					</div>
					
					<form class="upload-form" enctype="multipart/form-data"  action="UserImage" method="post">
					<span class="btn btn-default btn-file">
					    Browse <input type="file" name="image">
					</span>
					<button class="btn btn-default btn-file uploadbtn" type="submit">
					<span class="fa fa-cloud-upload fa-2x"><span>
					</button>
					</form>
					<div class="errors">
						<%
						    String error =  (String) request.getAttribute("error");
						    if(error != null){
						    	out.println(error);
						    }
						%>
					</div>
				</div>
				<!-- END SIDEBAR BUTTONS -->
				<!-- SIDEBAR MENU -->
				<div class="profile-usermenu">
					<ul class="nav">
						<li class="active settings tab">
							<a >
							<i class="fa fa-cogs"></i>
							Account Settings </a>
						</li>
						<li class="favorites tab">
							<a >
							<i class="fa fa-tags"></i>
							Tags </a>
						</li>
						
					</ul>
				</div>
				<!-- END MENU -->
			</div>
		</div>
		<div class="col-md-9">
            <div class="profile-content tab-setings">
            	<div class="warp-settings">
					<form class="form-horizontal" method="post" action="Account">
						<div class="errors">
							<%
							    String error_s =  (String) request.getAttribute("error-settings");
							    if(error_s != null){
							    	out.println(error_s);
							    }
							%>
						</div>
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Your Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="name" id="name"  value="<%=session.getAttribute("username")%>"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="email" disabled class="form-control" name="email" id="email"  placeholder="<%=session.getAttribute("email")%>"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Old Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="oldpassword" id="password"  placeholder="Enter your Old Password"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">New Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm new Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="Confirm your Password"/>
								</div>
							</div>
						</div>

						<div class="form-group ">
							<button type="submit" class="btn btn-primary btn-lg btn-block login-button">UPDATE</button>
						</div>
						
					</form>
				</div>
            </div>
            <div class="profile-content tab-favorites inactive">
			   <% 
			   		TagsRepo tagsRepo = new TagsRepo();
					Images  imageRepo = new Images();				
					ArrayList<Tag>	tags = 
							tagsRepo.getTagsOfUser(
									Integer.parseInt(session.getAttribute("id").toString())
									);	
				for (Tag tag : tags) {
				Image image  = 	imageRepo.getImageForLandmark(tag.getLandmark_id());%>
				<div class="tags_user">
			   <span class="date">On <%= tag.getDate() %> you was in</span>
			   <span class="imag_wrap">
			   <img src="<%=image.getPath()%>" class="profile_imaes_landmarks">
			    <div class="landmark_name"><%= image.getName() %></div>
			   <span>
			  
			   </div>
			   <% }%>
			   
            </div>
            <div class="profile-content tab-followers inactive">
			   followers
            </div>
		</div>
	</div>
</div>
<center>
<div class="overlay"><div>
<jsp:include page="/WEB-INF/pages/footer.jsp"/>