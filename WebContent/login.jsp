<jsp:include page="/WEB-INF/pages/header.jsp"/>
<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1>SIGN IN</h1>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center">
					<form class="form-horizontal" method="post" action="Login">
						<div class="errors">
							<%
							    String error =  (String) request.getAttribute("error");
							    if(error != null){
							    	out.println(error);
							    }
							%>
						</div>
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="email" class="form-control" name="email" id="email"  placeholder="Enter your Email"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password"/>
								</div>
							</div>
						</div>

						

						<div class="form-group ">
							<button type="submit" class="btn btn-success btn-lg btn-block login-button">Login</button>
						</div>
					</form>
				</div>
			</div>
		</div>

<jsp:include page="/WEB-INF/pages/footer.jsp"/>
