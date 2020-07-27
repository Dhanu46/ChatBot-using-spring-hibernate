<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.flight.*" import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<title>Flight Assistant</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style type="text/css">
	body{
		color: #fff;
		background: #63738a;
		font-family: 'Roboto', sans-serif;
	}
.navbar {
      margin-bottom: 0;
      border-radius: 0;
	  background-color: #2196F3;
	  color:white;
    }
    .form-control{
		height: 40px;
		box-shadow: none;
		color: #969fa4;
	}
	.form-control:focus{
		border-color: #5cb85c;
	}
    .form-control, .btn{        
        border-radius: 3px;
    }
	.signup-form{
		width: 400px;
		height: auto;
		margin: 0 auto;
		padding: 30px 0;
	}
	.signup-form h2{
		color: #636363;
        margin: 0 0 15px;
		position: relative;
		text-align: center;
    }
	.signup-form h2:before, .signup-form h2:after{
		content: "";
		height: 2px;
		width: 30%;
		//background: #d4d4d4;
		position: absolute;
		top: 50%;
		z-index: 2;
	}	
	.signup-form h2:before{
		left: 0;
	}
	.signup-form h2:after{
		right: 0;
	}
    .signup-form .hint-text{
		color: #999;
		margin-bottom: 30px;
		text-align: center;
	}
    .signup-form form{
		color: #999;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #f2f3f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.signup-form .form-group{
		margin-bottom: 20px;
	}
	.signup-form input[type="checkbox"]{
		margin-top: 3px;
	}
	.signup-form .btn{        
        font-size: 16px;
        font-weight: bold;		
		min-width: 140px;
        outline: none !important;
    }
	.signup-form .row div:first-child{
		padding-right: 10px;
	}
	.signup-form .row div:last-child{
		padding-left: 10px;
	}    	
    .signup-form a{
		color: #fff;
		text-decoration: underline;
	}
    .signup-form a:hover{
		text-decoration: none;
	}
	.signup-form form a{
		color: #5cb85c;
		text-decoration: none;
	}	
	.signup-form form a:hover{
		text-decoration: underline;
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
<body background="./utility/dream.jpg">
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
      <ul class="nav navbar-nav">
        <li class="active"><a href="/FlightAssistant/Admin_flight.html">Home</a></li>
		<li><a href="/FlightAssistant/addflight.jsp">Add Flight</a></li>
      <li><a href="/FlightAssistant/updateFlight.jsp">Update Flight</a></li>
      <li><a href="/FlightAssistant/viewFlight.jsp">View Flight</a></li>
	  <li><a href="/FlightAssistant/deleteFlight.jsp">Delete Flight</a></li>
        <li><a href="/FlightAssistant/viewCustomers.jsp">View Customers</a></li>
        <li><a href="/FlightAssistant/viewBookings.jsp">View Bookings</a></li>
     <!--   <li><a href="#">Selected Candidates</a></li> -->
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/FlightAssistant/candidate_login.jsp"><span class="glyphicon glyphicon-log-in"></span>Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<% FlightDao dao = new FlightDao();
	Flight fl = dao.getFlightById(request.getParameter("fid"));%>
<div class="signup-form">
    <form action="FlightServlet" method="post">
		<h2>Add Flight</h2>
		<p class="hint-text">Please fill up the form.All the fields are mandatory.</p>
		<div class="form-group"> 
		<input type="text" class="form-control" name="fid" value="<%=fl.getId()%>" disabled>
        </div>
        <div class="form-group"> 
		<input type="text" class="form-control" name="num" value="<%=fl.getNum() %>" disabled>
        </div>
		<div class="form-group">
            <input type="text" class="form-control" name="name" value="<%=fl.getName() %>" disabled>
        </div> 
		<div class="form-group">
              <input type="text" class="form-control" name="src" value="<%=fl.getSrc() %>" disabled>
        </div> 
		<div class="form-group">
            <input type="text" class="form-control" name="dest" value="<%=fl.getDest() %>" disabled>
        </div> 
	<div class="form-group">
            <select name="delay">
            <option value="" disabled selected>Choose delay in hours</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            </select>
        </div>
		<div class="form-group">
		<input type="hidden" name="status" value="DELAY">
		<input type="hidden" name="id" value="<%=request.getParameter("fid")%>">
            <button type="submit" class="btn btn-primary btn-lg btn-block" name="param" value="updateflight">Update Flight</button>
        </div>
    </form>
</div>
</body>
</html>                            