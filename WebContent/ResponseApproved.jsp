<%@page import="com.hrm.bean.RequestBean"%>
<%@page import="java.util.List"%>
<%@page import="com.hrm.services.HRMServicesImplementation"%>
<%@page import="com.hrm.services.HRMService"%>
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
<script type="text/javascript" src="jsFiles\dropDownAjax.js">
	
</script>
<script type="text/javascript">
	function clearErrorMsg() {
		document.getElementById("errorMsg90").innerHTML = "";
	}
	function validationCheck() {
		var Reason = document.getElementById("reasonName").value;
		if (Reason == null || Reason == "") {
			document.getElementById("errorMsg90").innerHTML = "Please Enter Reason.";
			return false;
		}
	}
</script>

</head>
<body>
	<%
		SharedObject.setSession(request.getSession());
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
				<li class="nav-item"><a href="ManagerEmpServlet">EmployeeData&nbsp;&nbsp;</a></li>
				<li class="nav-item"><a href="Payslip.jsp">Pay
						Slip&nbsp;&nbsp;</a></li>
				<li><a href="ResponseApproved.jsp">Response Approved</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<br>
	<br>
	<br>

	<div class="container">
		<form align="right" action="LogOutServlet" method="post">
			<input type="submit" value="LogOut">
		</form>
	</div>
	<div class="container" align="center">
		<%
			HRMService service = new HRMServicesImplementation();
			List<RequestBean> req = service.responseRequestData();
			if (req != null && !req.isEmpty()) {
		%>
		<table>
			<tr>
				<th>Name &nbsp;&nbsp;</th>
				<th>Reason Id &nbsp;&nbsp;</th>
				<th>Reason Text &nbsp;&nbsp;</th>
				<th>Status &nbsp;&nbsp;</th>
			</tr>
			<%
				for (RequestBean request1 : req) {
			%>
			<tr>
				<%
					if (request1.getStatus().equals("pending")) {
				%>
				<td><%=request1.getSenderMail()%></td>
				<td><%=request1.getReasonId()%></td>
				<td><%=request1.getTextArea()%></td>
				<td><%=request1.getStatus()%>
				<td><button type="button" class="btn btn-info"
						data-toggle="modal" data-target="#myModal">.....</button>

					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">

							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">Response Status</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="container">
									<!-- <form action="CloseStatusServlet" method="post"> -->
									<form action="ResponseUpdateServlet" method="post">
										<table>
											<tr>
												<th>Name &nbsp;&nbsp;</th>
												<td><%=request1.getSenderMail()%></td>
											</tr>
											<tr>
												<th>Reason Id &nbsp;&nbsp;</th>
												<td><input type="hidden" id="reasonId" name="reasonId"
													value="<%=request1.getReasonId()%>"><%=request1.getReasonId()%></td>
											</tr>
											<tr>
												<th>Reason Text &nbsp;&nbsp;</th>
												<td><%=request1.getTextArea()%></td>
											</tr>
											<tr>
												<th>Status &nbsp;&nbsp;</th>
												<td><%=request1.getStatus()%></td>
											</tr>
											<tr>
												<th>Reason &nbsp;&nbsp;</th>
												<td><textarea rows="5" cols="40" id="reasonName"
														onblur="clearErrorMsg()" name="reasonName"></textarea></td>
												<td><span id="errorMsg90" style="color: red;"></span></td>
											</tr>
											<tr>
												<th>Re-Assign</th>
												<td><div class=emailTo>
														<div id="EmailTo">
															<select id="emailTo" name="emailTo"
																onchange="getManagerList(this.value)">
																<option>Select Manager Type</option>
																<option value="Project Manager">Project Manager</option>
																<option value="HR Manager">HR Manager</option>
															</select>
														</div>
														<div id="managerOptions">
															<select>
																<option>Select Manager Name</option>
															</select>
														</div>
													</div> <input type="submit" value="Submit" name="submit123"
													onclick="return validationCheck()"></td>
											</tr>
										</table>
									</form>
									<table>
										<tr>
											<th>Change Status</th>
											<td><input type="submit" value="Close Status"
												id="closed123" name="closed123"
												onclick="return validationCheck()"></td>
										</tr>

									</table>
									<!-- </form> -->
								</div>
								<div class="modal-footer"></div>
								<br>
							</div>

						</div>
					</div></td>
			</tr>
			<%
				} else {
							System.out.print("No Pending Responses are There.");
						}
					}
			%>
		</table>
		<%
			}
		%>
		<br> <br>
	</div>
	<br>
	<br>
</body>
</html>
