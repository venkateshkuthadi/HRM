<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.hrm.bean.EmployeeBean"%>
<%@page import="com.hrm.session.SharedObject"%>
<%@page import="java.util.List"%>
<%@page import="com.hrm.services.HRMServicesImplementation"%>
<%@page import="com.hrm.services.HRMService"%>
<%@page import="com.hrm.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function callPopUpMethod(gender,dob){
	var w = window.open('', '', 'width=400,height=400,resizeable,scrollbars');
    w.document.write("Gender: "+gender +"\n"+"DOB:" +dob);
    w.document.close(); // needed for chrome and safari
}
</script>
<style>
.scroll1{
transform: rotateX(180deg);
margin-bottom: -160px;
}
.displaytable1{
overflow-y: auto;
    transform: rotateX(180deg);
    width:100%;
    }
</style>


<meta name="viewport" content="width=device-width, initial-scale=1">
 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" media="all" href="stylesheets/mybootstrap.css"/> 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<title>employee</title>
 </head>
<body>
<img src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/full page/img(20).webp" alt="Display of full page app intro page." class="img-fluid">
<%SharedObject.setSession(request.getSession()); %>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-link" href="index.jsp"><h2>Dhatsol IT Solutions</h2></a>
			
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li class="active"><a href="index.jsp">Home</a></li> 
					<li class="active"><a href="Aboutus.jsp">AboutUs</a></li>
					<li class="active"><a href="Login.jsp">Logout</a></li>	
				</ul></li>
		</ul>
	</div>
	</nav>

	<div class="container">
  <center>
  <a href="userupdate.jsp" class="btn btn-info" role="button">UpdateProfile</a>
  <a href="Payslip.jsp" class="btn btn-info" role="button">DownloadPayslip</a>
  <a href="CreateRequest.jsp" class="btn btn-info" role="button">CreateRequest</a></center>
  </div>
	
</body>
</html>
































