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
  </style>
</head>
<body>
<% Customer cust ;
if(request.getAttribute("cust")!=null){ 
	cust = (Customer)request.getAttribute("cust");
}else{
	FlightDao dao = new FlightDao();
	cust = dao.getCustomerById((String)request.getParameter("id"));
}
%> 
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
        <li class="active"><a href="/FlightAssistant/customerhome.jsp?id=<%=cust.getId()%>">Home</a></li>
        <li><a href="/FlightAssistant/customerprofile.jsp?id=<%=cust.getId()%>">View Profile</a></li>
        <li><a href="/FlightAssistant/customerbooking.jsp?id=<%=cust.getId()%>">View Bookings</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/FlightAssistant/Login.jsp"><span class="glyphicon glyphicon-log-in"></span>Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-8 text-left"> 
    <% if (request.getAttribute("msg")==null){ %>
      <h1>Welcome <%=cust.getName() %> </h1> 
      <% FlightDao dao = new FlightDao();
      ArrayList<Book> blist = (ArrayList<Book>)dao.getBookingsByID(String.valueOf(cust.getId()));
      for(Book bl:blist){
    	  Flight fl = dao.getFlightById(String.valueOf(bl.getFlightid()));
    	  if(fl.getStatus().equalsIgnoreCase("CANCELLED")){%>
    		  <h4>Your Flight <%=fl.getName()%> scheduled to travel from <%=fl.getDest()%> to <%=fl.getSrc()%> has been cancelled.We regret for the inconvenience, Please book again.</h4>
    	<%  }else if(fl.getStatus().equalsIgnoreCase("DELAY")){%>
    		 <h4>Your Flight <%=fl.getName()%> scheduled to travel from <%=fl.getDest()%> to <%=fl.getSrc()%> has been delayed by <%=fl.getDelay()%>hrs.We regret for the inconvenience, Please Co-operate.</h4>
    	<%}
      }
     }else{ %> 
        <h1> <%=(String)request.getAttribute("msg")%></h1> 
        <%} %>
 	 <div class="botui-app-container" id="flight-bot">
      <bot-ui></bot-ui>
   <form action="FlightServlet" method="post" id="myform">
   <input type="hidden" name="fid" id="flight">
   <input type="hidden" name="feature" id="feature">
   <input type="hidden" name="cid" value="<%=cust.getId()%>">
   <input type="hidden" name="param" value="book">
    </form>
    </div>
    	<% FlightDao dao = new FlightDao();
  		ArrayList<Flight> flights = dao.getAllFlights();
  		Gson gson = new Gson();
  		JsonArray ja = new JsonArray();
  		int count = 0;
  		for(Flight fl:flights){
  		ja.add(gson.toJson(fl));
  		count++;
  		}%>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/vue/latest/vue.min.js"></script>
    <script type="text/javascript" src="https://unpkg.com/botui/build/botui.js"></script>
    <script>
    var botui = new BotUI('flight-bot');
   	var flights = <%=ja%>;
   	var jsonData = null;
   	var fid = 0;
 	for(var i = 0;i<flights.length;i++){
   	   	jsonData = JSON.parse(flights[i]);
   	   	console.log(jsonData);
   	   	}
   	var places = ['Mumbai','Chennai','Bengaluru','Delhi','Hyderabad'];
   	botui.message
    .bot('Where would you like to travel?')
    .then(function () {
      return botui.action.button({
        delay: 1000,
        action: [{
            text: 'Chennai',
            value: 'Chennai'
          },{
            text: 'Delhi',
            value: 'Delhi'
          },{
    		 text: 'Mumbai', 
    		 value: 'Mumbai'
    	  },{
    		 text: 'Bengaluru', 
    		 value: 'Bengaluru'
    	  },{
    		 text: 'Hyderabad', 
    		 value: 'Hyderabad'
    	  }]
      })
  }).then(function (res) {
  	dest = res.value;
  	 botui.message
      .bot({
        delay: 500,
        content: 'From where do you travel?'
      })
      return botui.action.button({
        delay: 1000,
        action: [{
          text: 'Chennai',
          value: 'Chennai'
        },{
          text: 'Delhi',
          value: 'Delhi'
        },{
  		 text: 'Mumbai', 
  		 value: 'Mumbai'
  	  },{
 		 text: 'Bengaluru', 
		 value: 'Bengaluru'
	  },{
		 text: 'Hyderabad', 
		 value: 'Hyderabad'
	  }]
    })
  }).then (function (res2){
  	src = res2.value;
      var text= ["1"];
      var value= ["1"];
      for(var i = 0;i<flights.length;i++){
 	   	   	jsonData = JSON.parse(flights[i]);
 	   	   	if(jsonData["status"]=="ACTIVE"){
 	   	   		if(jsonData["src"]==src && jsonData["dest"]==dest){
 	   	   			    text[i] = src+"--to--"+dest+"--on--"+jsonData["dept"];
 	   	   			    value[i] = jsonData["id"];
 	   	   		}
 	   	   	}
      }
  	 if(text.length == 1 || value.length == 1){
  		botui.message
  	      .bot({
  	        delay: 500,
  	        content: 'No flights available for the '+ dest +' from '+src+'.Try again by refreshing the page'
  	      })
  	 }else if(text.length == 2 || value.length == 2){
  		 botui.message
  	      .bot({
  	        delay: 500,
  	        content: 'Select the flights.'
  	      })
  		 
 			return botui.action.button({
  	  				 delay: 1000,
  	  			     action:[{
  	  				    text:text[1],
  	  				    value:value[1]
  	  			}]
  	  		});
  	  	}else if(text.length == 3 || value.length == 3){
  	  		
  	  	 botui.message
  	      .bot({
  	        delay: 500,
  	        content: 'Select the flights.'
  	      })
  	      
  	  		return botui.action.button({
				 delay: 1000,
			     action:[{
				    text:text[1],
				    value:value[1]
			},{
			    text:text[2],
			    value:value[2]
			}]
		});
  	  	}else if(text.length == 4 || value.length == 4){
  	  	 botui.message
  	      .bot({
  	        delay: 500,
  	        content: 'Select the flights.'
  	      })
  	  		return botui.action.button({
				 delay: 1000,
			     action:[{
				    text:text[1],
				    value:value[1]
			},{
			    text:text[2],
			    value:value[2]
			},{
			    text:text[3],
			    value:value[3]
			}]
		});
  	  		}else {
  	    	  	
  	  		 botui.message
  	       .bot({
  	         delay: 500,
  	         content: 'Select the flights.'
  	       })
  	  	  		return botui.action.button({
  					 delay: 1000,
  				     action:[{
  					    text:text[1],
  					    value:value[1]
  				},{
  				    text:text[2],
  				    value:value[2]
  				},{
  				    text:text[3],
  				    value:value[3]
  				},{
  				    text:text[4],
  				    value:value[4]
  				}]
  			});
  	  	  }
  	  }).then(function (res){
  		  
  		fid = res.value;
  		
  	 	botui.message
      	.bot({
        delay: 500,
        content: 'Plase choose these facilities'})
        	return botui.action.button({
					 delay: 1000,
				     action:[{
					    text:'Movies',
					    value:'Movies'
				},{
				    text:'Meals',
				    value:'Meals'
				},{
				    text:'Meals And Movies',
				    value:'Meals  And Movies'
				},{
				    text:'None',
				    value:'None'
				}]
        	})
  	  }).then(function (res){
        		var feature = res.value;
  		document.getElementById("flight").value = fid ;
	    document.getElementById("feature").value = feature ;
  	   	document.getElementById("myform").submit();
  });
 
/*var sflight = function (){
   	  	for(var i = 0;i<flights.length;i++){
   	   	   	jsonData = JSON.parse(flights[i]);
   	   	   	if(jsonData["status"]=="ACTIVE"){
   	   	   		if(jsonData["src"]==src && jsonData["dest"]==dest){
   			 return botui.action.button({
    	  			delay: 1000,
    	  			action:{
    	  				text:jsonData["date"],
    	  				value:jsonData["id"]
    	  			}
    	  		});
    	  	}
   	  	}
   	  }
  }*/
    </script>
  </div>
  </div>
</div>
<footer class="container-fluid text-center">
  <p>Coprighted by Flight Assistant @ 2020</p>
</footer>
</body></html>