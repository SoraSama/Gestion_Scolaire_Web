<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		 <!--Pulling Awesome Font -->
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
		 
		<title>Login</title>
	</head>

	<body>
	<%-- <% if((session.getAttribute("typeUser")) ==true){%>
	
	<%} %> --%>
		<div class="container">
		${loginError}
			<div class="form-group form]">
				<form action="loginProcess" method="post">
					
					<div class="col-md-offset-5 col-md-3">
			            <div class="form-login">
			            <h4>Bienvenue sur le gestionnaire scolaire :</h4>
			            <input type="text" id="userId" name="userId" class="form-control input-sm chat-input" placeholder="username" />
			            </br>
			            <input type="password" id="password" name="password" class="form-control input-sm chat-input" placeholder="password" />
			            </br>
			            <div class="wrapper">
			            <span class="group-btn">     
			                <button id="loginButton" class="form-control">Login</button>
			            </span>
			            </div>
			            </div>
			        
			        </div>
				</form>
				
			</div>
		</div>
		
	
	</body>
</html>


