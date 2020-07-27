<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.flight.*" import="java.util.*" import="com.google.gson.*" import="org.json.*"%>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Flight Assistant</title>
  
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="A bot that confirms a delivery address for shipping. A conversational UI built using BotUI.">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://unpkg.com/botui/build/botui.min.css"/>
<link rel="stylesheet" href="https://unpkg.com/botui/build/botui-theme-default.css"/>
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
		#elections {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
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
<% String cust = (String)request.getParameter("id"); %> 
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
        <li class="active"><a href="/FlightAssistant/customerhome.jsp?id=<%=cust%>">Home</a></li>
        <li><a href="/FlightAssistant/customerprofile.jsp?id=<%=cust%>">View Profile</a></li>
        <li><a href="/FlightAssistant/customerbooking.jsp?id=<%=cust%>">View Bookings</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/FlightAssistant/Login.jsp"><span class="glyphicon glyphicon-log-in"></span>Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-lg text-center"> 
      <h1>Booking Details</h1>
	  <% FlightDao dao = new FlightDao();
	   ArrayList<Book> blist = (ArrayList<Book>)dao.getBookingsByID(cust);
	   Customer custmr = dao.getCustomerById(cust);
		if(blist.size()!=0){
		int count = 0;
		%>
	   <table  id="elections" class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Sl no.</th>
      <th scope="col">Customer Name</th>
      <th scope="col">Flight Number</th>
      <th scope="col">Flight Name</th>
      <th scope="col">Source</th>
	  <th scope="col">Destination</th>
	  <th scope="col">Arrival Date</th>
	  <th scope="col">Departure Date</th>
	  <th scope="col">Delay</th>
	  <th scope="col">Extras</th>
	  <th scope="col">Flight Status</th>  
	  <th scope="col">Cancel</th>  
    </tr>
  </thead>
  <tbody>
  <%for (Book bl:blist){
	  count++;
	  Flight fl = dao.getFlightById(String.valueOf(bl.getFlightid()));%>
    <tr>
      <td><%=count%></td>
      <td><%=custmr.getName()%></td>
      <td><%=fl.getNum()%></td>
      <td><%=fl.getName()%></td>
      <td><%=fl.getSrc()%></td>
	  <td><%=fl.getDest()%></td>
	  <td><%=fl.getArr()%></td>
	  <td><%=fl.getDept()%></td>
	  <td><%=fl.getDelay()%></td>
	  <td><%=bl.getExtras()%></td>
	  <td><%=fl.getStatus()%></td>
	 <td><form method="post" action="FlightServlet">
		<input type="hidden" name="bid" value="<%=bl.getId()%>">
		<input type="hidden" name="cid" value="<%=cust%>">
		<button type="submit" class="btn btn-danger btn-sm btn-block" name="param" value="cancelbook">Cancel</button></form></td>
		</tr>
		<%}%></tbody>
</table>
		<%} else{ %><h3>No Bookings available.</h3><%} %>
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