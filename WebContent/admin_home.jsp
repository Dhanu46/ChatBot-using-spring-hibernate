<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Flight Assistant</title>
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
	  background-color: #2196F3;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #2196f3b5;
      height: 600px;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 900px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
	a{
		color:white;
		text-decoration:none;
	}
	a:active{
		color:whitesmoke;
		background-color:bg-primary;
	}
  </style>
</head>
<body>

<nav class="navbar">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/FlightAssistant/admin_home.jsp" style="color:whitesmoke;"><strong>Flight Assistant</strong></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/FlightAssistant/admin_home.jsp">Home</a></li>
		<li><a href="/FlightAssistant/addflight.jsp">Add Flight</a></li>
      <li><a href="/FlightAssistant/updateFlight.jsp">Update Flight</a></li>
      <li><a href="/FlightAssistant/viewFlight.jsp">View Flight</a></li>
	  <li><a href="/FlightAssistant/deleteFlight.jsp">Delete Flight</a></li>
        <li><a href="/FlightAssistant/viewCustomers.jsp">View Customers</a></li>
        <li><a href="/FlightAssistant/viewBookings.jsp">View Bookings</a></li>
     <!--   <li><a href="#">Selected Candidates</a></li> -->
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/FlightAssistant/adminLogin.jsp"><span class="glyphicon glyphicon-log-in"></span>Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
   <!-- <div class="col-sm-2 sidenav">
      <p><a href="/FlightAssistant/postjob.jsp"><h4>Add Flight </h4></a></p><br/>
      <p><a href="#"><h4>Update Flight</h4></a></p><br/>
      <p><a href="#"><h4>View Flight</h4></a></p><br/>
	  <p><a href="#"><h4>Delete Flight</h4></a></p><br/>
    </div> -->
    <div class="col-sm-8 text-left"> 
      <h1>Welcome Admin</h1>
   <!--   <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <hr>
      <h3>Test</h3>
      <p>Lorem ipsum...</p> -->
	  <img src="https://www.air.irctc.co.in/assets/img/bg.jpg" width="1320px" height="530px">
    </div>
  <!--  <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div> -->
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Coprighted by Flight Assistant @ 2020</p>
</footer>
</body></html>