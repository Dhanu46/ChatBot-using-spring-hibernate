<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.flight.*" import="java.util.*" %>
<!DOCTYPE html>
<!-- saved from url=(0049)file:///C:/Users/Gowreesh/Desktop/main_page.html# -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Flight Assistant</title>
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	#elections td, #request th {
  border: 1px solid #ddd;
  padding: 8px;
}

#elections tr:nth-child(even){background-color: #f2f2f2;}

#elections tr:hover {background-color: #ddd;}

#elections th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #00BCD4;
  border: 1px solid #ddd;
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
    <div class="col-lg text-center"> 
      <h1>Customer Details</h1>
	  <% FlightDao dao = new FlightDao();
	   ArrayList<Customer> flist = (ArrayList<Customer>)dao.getAllCustomers();
		if(flist.size()!=0){
		int count = 0;
		%>
	   <table  id="elections">
  <thead>
    <tr>
      <th scope="col">Sl no.</th>
      <th scope="col">Customer Name</th>
      <th scope="col">Age</th>
	  <th scope="col">Sex</th>
	  <th scope="col">Mobile Number</th>
	  <th scope="col">City</th>
    </tr>
  </thead>
  <tbody>
  <%for (Customer fl:flist){
	  count++;%>
    <tr>
      <td scope="row"><%=count%></td>
      <td><%=fl.getName()%></td>
      <td><%=fl.getAge()%></td>
      <td><%=fl.getSex()%></td>
	  <td><%=fl.getMobnum()%></td>
	  <td><%=fl.getCity()%></td>
	</tr>
		<%}%></tbody>
</table>
		<%} else{ %><h3>No Flights available.</h3><%} %>
		<br/><br/>

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