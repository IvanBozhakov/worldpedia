<%@ page import="worldpedia.beans.Country" %>
<%@ page import="java.util.ArrayList" %>
<%
Country country = new Country();
ArrayList<Country> countries =  country.getCountries();
%>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/Worldpedia">WorldPedia</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="FovoritesServlet">My <i class="fa fa-star" aria-hidden="true"></i></a></li>
         <li><a href="populars.jsp">Populars</a></li>
      </ul>
      <form class="navbar-form navbar-left" method="get" action="Search">
        <div class="form-group">
          <input type="text" class="form-control" name="name" placeholder="Landmarks">
        </div>
        <select class="form-control" name="country">
		  <option value="0">Country (select)</option>
		   <% for(Country cn : countries) { %>
		    <option value="<%= cn.getId() %>"><%= cn.getCountry() %></option>
		   <% } %>
		</select>
        
        <button type="submit" class="btn btn-primary">Search</button>
      </form>
      
      <ul class="nav navbar-nav navbar-right">
      <% if(session.getAttribute("logged") != null && session.getAttribute("role").equals("admin")){%>
       <li ><a href="add-landmark.jsp"><i class="fa fa-plus-circle fa-2x" aria-hidden="true"></i></a></li>
       <%} %>
      	<li class="user-menu" style="display: inline;">
      	<% if(session.getAttribute("logged") != null){ %>
      	<span class="userpic-menu">
			<img style="display: inline;" src="images/<%=session.getAttribute("image")%>"  onerror="this.src='images/profile.png'" alt="">
		</span>
		<%}%>
      	<a href="profile.jsp" style="display: inline;">
      	<% 
      	String username = (String) session.getAttribute("username");
    	String role = (String) session.getAttribute("role");
        boolean logged = false;
        if(session.getAttribute("logged") != null){
        	logged = (Boolean) session.getAttribute("logged");
        	out.print(session.getAttribute("username"));
        }
        
    	%>
    	</a>
      	</li>
      	<% if(logged == false){%>
        <li><a href="login.jsp">Sign In</a></li>
        <li><a href="register.jsp">Sign Up</a></li>
        <%}else{ %>
        <li><a href="Login">Logout</a></li>
         <%} %>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>