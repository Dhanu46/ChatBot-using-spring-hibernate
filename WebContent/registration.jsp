<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<title>Registration Form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script>
function validation() {
    
    var age = document.ureg.age.value;
    var ph = document.ureg.mobnum.value;
    var pwd = document.ureg.pwd.value;
    var name = document.ureg.cname.value;
    var uname = document.ureg.uname.value;
    var city = document.ureg.city.value;
    var sex = document.ureg.sex.value;
    
    var letters = /^[a-zA-Z]+$/;
    var letter = /^[0-9a-zA-Z]+$/;
    var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;

    if(!(sex.match(letters) || sex.equals("Male") || sex.equals("Female") || sex.equals("Others"))) {
        alert("Invalid Sex.Please Enter 'Male','Female' or 'Others'");
        document.ureg.sex.focus();
        return  false;
    }
    
    if (isNaN(ph) || ph < 6000000000 || ph > 9999999999) {
        alert("Invalid Mobile Number.");
        document.ureg.mobnum.focus();
        return  false;
    }
    
    if (isNaN(age) || age>99 || age<10) {
        alert("Invalid Age.");
        document.ureg.age.focus();
        return  false;
    }
    
    if(!(pwd.match(passw))) { 
     alert('Please enter alphanumeric Password with atleast 6 characters and less than 20 characters');
     document.ureg.pwd.focus();
     return false;
    }
    
    if(!(name.match(letters)))
    {
    alert('Your Name should have only alphabets.');
    document.ureg.cname.focus();
    return false;
    }
    
    if(!(city.match(letters)))
    {
    alert('City should have only alphabets.');
    document.ureg.city.focus();
    return false;
    }
	
    if(!(uname.match(letter)))
    {
    alert('Username should can only be alphanumeric.');
    document.ureg.uname.focus();
    return false;
    }
    
    if(!(uname.length<6 || uname.length>10))
    {
    alert('Username should be more than 6 characters and less than 10 characters.');
    document.ureg.uname.focus();
    return false;
    } 
    
}
</script>
<style type="text/css">
	body{
		color: #fff;
		//background: #63738a;
		font-family: 'Roboto', sans-serif;
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
	.navbar {
	top:0px;
	height:8%;
	width:100%;
    padding:10px;
    }
</style>
</head>
<body background="https://www.air.irctc.co.in/assets/img/bg.jpg">
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
<div class="signup-form">
    <form action="FlightServlet" method="post" name="ureg">
		<h2>Customer Registration</h2>
		<p class="hint-text">Please fill up the form.All the fields are mandatory.</p>
        <div class="form-group">
			<!--<div class="row">
				<div class="col-xs-6"><input type="text" class="form-control" name="first_name" placeholder="First Name" required="required"></div>
				<div class="col-xs-6"><input type="text" class="form-control" name="last_name" placeholder="Last Name" required="required"></div>
			</div> -->   
			<input type="text" class="form-control" name="cname" placeholder="Name" required="required">
        </div>
		<div class="form-group">
            <input type="text" class="form-control" name="age" placeholder="Age" required="required">
        </div> 
		<div class="form-group">
            <input type="text" class="form-control" name="sex" placeholder="Sex" required="required">
        </div> 
		<div class="form-group">
            <input type="text" class="form-control" name="mobnum" placeholder="Mobile Number" required="required">
        </div> 
		<div class="form-group">
            <input type="text" class="form-control" name="city" placeholder="City" required="required">
        </div> 
        <div class="form-group">
        	<input type="email" class="form-control" name="uname" placeholder="Username" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="pwd" placeholder="Password" required="required">
        </div>
	<!--	<div class="form-group">
            <input type="password" class="form-control" name="confirm_password" placeholder="Confirm Password" required="required">
        </div>  --> 
     <!--   <div class="form-group">
			<label class="checkbox-inline"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label>
		</div> -->
		<div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block" name="param" value="register">Register Now</button>
        </div>
    </form>
</div>
</body>
</html>                            