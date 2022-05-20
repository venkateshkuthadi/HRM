<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%@page import="com.hrm.controller.CreateRequestServlet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dhatsol</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="jsFiles\dropDownAjax.js">
 
</script>
<style>
#reason{
height:30px;
width:180px;
}
#textArea{
width:280px;
height:60px;
}
</style>
<style>
  span {
    display: inline-block;
    width: 600px;
    height: 500px;
    margin: 6px;
    background-color: lightblue;
  }
  </style>

</head>
<body>
  <nav class="navbar navbar-expand-sm bg-light navbar-light">
  <ul class="navbar-nav">
		 <div class="navbar-header">
			<h1>
				<a href="index.jsp">Dhatsol IT Solutions</a>
			</h1>
		</div>
		 </ul>
	</nav>
	 <nav class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-end">
    <a class="navbar-brand" href="index.jsp">Home</a>
    <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle"
          type="button" id="dropdownMenu1" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">
    Employee
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
	<a class="dropdown-item" href="EmployeeRegistration.jsp">New Registration</a>
	<a class="dropdown-item" href="#">ResponseApproved</a>
	<a class="dropdown-item" href="EmployeeViewDirection.jsp">Search Employee</a>
	<a class="dropdown-item" href="Login.jsp">Login</a>
  </div>
</div>
    <div class="collapse navbar-collapse flex-grow-0" id="navbarSupportedContent">
        <ul class="navbar-nav text-right">
           
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="Aboutus3.jsp">about us </a>
            </li>
        </ul>
    </div>
</nav>
  
 <div id="#mainform">
 <center>
  <div class="loginbox">
   <br> <br>
   <form action="CreateRequestServlet" method="post">
<div class=emailTo>
<div id="EmailTo">
email To: <select id="emailTo" name="emailTo"
onchange="getManagerList(this.value)">
<option>Select manager</option>
<option value="Project Manager">Projectmanager</option>
<option value="HR Manager">HrManager</option>
<option value="Admin">Admin</option>
</select> <br>
</div><br>
<div id="managerOptions">
Manager : <select>
<option>Select name</option>
</select>
</div><br>
<div><label>
Reason: <textarea type="text" name="reason" id="reason" onkeydown="reason(this.value)">
</textarea></label></div>
<br><br>
<div><label>
TextArea: <textarea type="text" rows="5" name="textArea" id="textArea" placeholder="Enter text here..." onkeydown="reason(this.value)">
</textarea></label></div>
<br><br>
<button>Send</button>
<button>Cancel</button>
</center>
</form>
  </div>
 </div>
</body>
</html>

