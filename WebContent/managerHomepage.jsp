<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="com.hrm.constants.EmployeeConstants"%>
<%@page import="com.hrm.session.SharedObject"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manager HomePage</title>
<link rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
Object obj = SharedObject.getFromSession(EmployeeConstants.EMPLOYEE_ID);
String userId = "";
if (null != obj) {
userId = (String) obj;
}
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
<div class="container">
<a class="navbar-brand" href="index.jsp"> Dhatsol It Solutions</a>
<button class="navbar-toggler" type="button" data-toggle="collapse"
data-target="#navbarResponsive" aria-controls="navbarResponsive"
aria-expanded="false" aria-label="Toggle navigation"></button>
<div class="collapse navbar-collapse" id="navbarResponsive">
<ul class="navbar-nav ml-auto">
<li class="nav-item active"><a href="userupdate.jsp">Update
Profile&nbsp;&nbsp;</a></li>
<li class="nav-item"><a href="ManagerEmpServlet?<%=userId%>">EmployeeData&nbsp;&nbsp;</a></li>
<li class="nav-item"><a href="Payslip.jsp">Pay
Slip&nbsp;&nbsp;</a></li>
<li><a href="ResponseApproved.jsp">Response Approved</a></li>
</ul>
</div>
</div>
</nav>
<br> <br> <br>

<%
SharedObject.setSession(request.getSession());
%>

<div align="center">
<h1 LoginView>LoginView</h1>
<br> <b>Login As:  </b><%=userId%>
<br> <br> <br>
<form align="center" action="LogOutServlet" method="post">
<input type="submit" value="LogOut">
</form>
<br> <br>
</div>
<br> <br>
</body>
</html>
