<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

    <title>Login</title>
	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
	<!--<link href="navbar.css" rel="stylesheet"> -->
	<style type="text/css">
	html,
body {
  height: 100%;
}

body {
 /*display: -ms-flexbox;
  display: -webkit-box;
  display: flex;
  -ms-flex-align: center;
  -ms-flex-pack: center;
  -webkit-box-align: center;
  align-items: center;
  -webkit-box-pack: center;
  justify-content: center;
  padding: 20px;
 /* background-color: #f5f5f5;*/
}

.navbar {
  	top:0px;
	height:10%;
	width:100%;
  padding:20px;
  background-color:blue;
}
.container{
	margin-top:10%;
}
.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .checkbox {
  font-weight: 400;
}
.form-signin .form-control {
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
  </head>

<body class="text-center" background="https://www.air.irctc.co.in/assets/img/bg.jpg">
<nav class="navbar">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/FlightAssistant/AdminHome.html" style="color:whitesmoke;"><strong>Flight Assistant</strong></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/FlightAssistant/Login.jsp" style="color:whitesmoke;"><span class="glyphicon glyphicon-log-in"></span>Customer Login</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
    <form class="form-signin" action="FlightServlet" method="post">
      <h1 class="h3 mb-3 font-weight-normal">Admin Login</h1>
      <label for="inputEmail" class="sr-only">Email address</label>
      <input type="text" id="inputEmail" name="uname" class="form-control" placeholder="Email address" required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" id="inputPassword" name="pwd" class="form-control" placeholder="Password" required>
      <button class="btn btn-lg btn-primary btn-block" type="submit" name="param" value="adminlogin">Sign in</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2020</p>
    </form>
</div>
  </body>
</html>
