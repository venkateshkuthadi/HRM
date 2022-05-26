<%@page import="com.hrm.constants.EmployeeConstants"%>
<%@page import="com.hrm.session.SharedObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.List"%>
	<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Iterator"%>
<%@ page import = "java.io.*,java.util.*"%>
<%@page import="com.hrm.services.HRMServicesImplementation"%>
<%@page import="com.hrm.services.HRMService"%>
<%@page import="com.hrm.bean.EmployeeBean"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EmployeePayslip</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js"></script>
<style>}
body {
	margin: 0;
	text-align : center;
}
div{
	margin: 20px;
}
div.overallborder{
	border: 2px solid black;
}
table {
	width:100%;
}
th{
	background-color: #de6133;
}
th,td {
text-align: left;
padding: 10px;
}
table.paycal tr:nth-child(odd) {
	background-color: #edaa92;
}
th.empinfo{
	text-align: center;
}
hr{
	height: 2px;
	border-width: 0;
	background-color: black;
}
button {
	align : center;
}
.card {
	width: 63%;
	margin: 0 20%;
}
.align {
	text-align: center;
}
.left-align{
	margin-left: 15px;
	text-align: left;
}
.right-align{
	margin-right: 15px;
	text-align: right;
}
.rows {
	display: flex;
}
.column1 {
	flex: 50%;
}
.column2 {
	flex: 25%;
	text-align: right;
}
.column3 {
	flex: 25%;
	text-align: right;
}
th.column3 {
	background-color: #333333;
	color: white;
}
tr.rows:nth-child(odd) td.column3 {
	background-color: #bfbfbf;
}
</style>
</head>
<body>
<script>
	window.onload = function() {
		document.getElementById("download").addEventListener("click", ()=> {
			const payslip = document.getElementById('payslip');

			  html2canvas(payslip, {
			    useCORS: true,
			    onrendered: function(canvas) {

			      var pdf = new jsPDF('p', 'pt', 'letter');

			      var pageHeight = 986;
			      var pageWidth = 900;
			      for (var i = 0; i <= payslip.clientHeight / pageHeight; i++) {
			        var srcImg = canvas;
			        var sX = 0;
			        var sY = pageHeight * i; // start 1 pageHeight down for every new page
			        var sWidth = pageWidth;
			        var sHeight = pageHeight;
			        var dX = 0;
			        var dY = 0;
			        var dWidth = pageWidth;
			        var dHeight = pageHeight;

			        window.onePageCanvas = document.createElement("canvas");
			        onePageCanvas.setAttribute('width', pageWidth);
			        onePageCanvas.setAttribute('height', pageHeight + 900);
			        var ctx = onePageCanvas.getContext('2d');
			        ctx.drawImage(srcImg, sX, sY, sWidth, sHeight, dX, dY, dWidth, dHeight);

			        var canvasDataURL = onePageCanvas.toDataURL("image/png", 1.0);
			        var width = onePageCanvas.width;
			        var height = onePageCanvas.clientHeight;

			        if (i > 0) // if we're on anything other than the first page, add another page
			          pdf.addPage(612, 791); // 8.5" x 11" in pts (inches*72)

			        pdf.setPage(i + 1); // now we declare that we're working on that page
			        pdf.addImage(canvasDataURL, 'PNG', 20, 40, (width * .62), (height * .62)); // add content to the page

			      }
			      pdf.save('payslip.pdf');
			    }
			  })
			}
		)}

</script>
<% SharedObject.setSession(request.getSession()); %>

<div class="card">
  <div class="card-body" id="payslip">
  <div class="right-align"><button type="button" class="btn btn-success align" id="download">Download PDF</button></div>
    <form action="PaySlipServlet" method="post">
<%
Object obj=SharedObject.getFromSession(EmployeeConstants.EMPLOYEE_ID);
String userId="";
if(null != obj)
{
	userId=(String)obj;
	//employeeId=Integer.parseInt(userId);
}
HRMService service = new HRMServicesImplementation();
List<EmployeeBean> b=service.search(userId);
EmployeeBean bean=null;
bean=b.get(0);
double ctc=bean.getCurrentCTC();

if((ctc < 100000.0) && (ctc < 10000.0)){
	ctc = ctc*100000.0;
}
else if((ctc < 100000.0) && (ctc > 10000.0)){
	ctc = ctc* 12.0;
}

double basic=(40.0/100)*ctc;
double conveyance=(3.2/100)*ctc;
double hra=(20.0/100)*ctc;
double specialAllowance=(21.8/100)*ctc;
double cityCompensatoryAll=(10.0/100)*ctc;
double medical=(5.0/100)*ctc;
double professionalTax=200;
double totalDeductions=professionalTax;
double incomeTax=0.0;
double otherDeductions=0.0;
double grossSalary=ctc;
double netPay =ctc- totalDeductions;
%>

	<div class="overallborder">
		<table>
			<tr>
				<td>
					<div class="imgpadding">
						<img src="logo.png" alt="logo" width="310" height="150" align="center">
					</div>
				</td>
				<td class="align">
					<h1>DHATRI INFO SOLUTIONS PVT.LTD.</h1>
					<p>
						Manjeera Trinity Corporate, Suite #406, KPHB Phase 3, Kukatpally,
						Hyderabad: 500 072, Telangana, India<br> Phone: +91 40 6591 3555,
						6555 7888 website: 
						<a href="www.dhatriinfo.com">www.dhatriinfo.com</a>.
					</p>
				</td>
			</tr>
			<tr>
				<td colspan = "2"><hr></td>
			</tr>
			<tr>
				<td class="left-align">Payslip for the month of: <%= new SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date())%></td>
		 
				<td class="right-align" text-align="right">No.of working Days:31</td>
			</tr>		
		</table>
		<br>
		<table>
			<tr>
				<th colspan="2" class="empinfo">EMPLOYEE INFORMATION</th>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<td>EmpID:</td>
							<td><%= bean.getEmployeeId() %></td>
						</tr>
						<tr>
							<td>Full Name:</td>
							<td><%= bean.getFirstName() + " " + bean.getLastName() %></td>
						</tr>
						<tr>
							<td>Address:</td>
							<td><%= bean.getPermanentAddress() %></td>
						</tr>
						<tr>
							<td>Phone:</td>
							<td><%= bean.getMobileNumber() %></td>
						</tr>
						<tr>
							<td>EmailId:</td>
							<td><%=bean.getEmailId() %></td>
						</tr>
					</table>
				</td>
				<td>
					<table>
					<tr>
							<td>Location:</td>
							<td><%= bean.getLocation() %></td>
						</tr>
						<tr>
							<td>Designation:</td>
							<td><%= bean.getRole() %></td>
						</tr>
						<tr>
							<td>Date of Joining:</td>
							<td><%= bean.getExperience() %></td>
						</tr>
						<tr>
							<td>Bank:</td>
							<td><%=bean.getBankname() %></td>
						</tr>
						<tr>
							<td>Bank Account No:</td>
							<td><%=bean.getBankAccNo() %></td></tr>
					</table>
				</td>
			</tr>	
		</table>
		<br>
		<table class="paycal">
			<tr class="rows">
				<th class="column1">EARNINGS</th>
				<th class="column2">Current</th>
				<th class="column3">YTD</th>
			</tr>
			<tr class="rows">
				<td class="column1">Basic:</td>
				<td class="column2"><span name = "basic" id = "Basic"><%= basic %></span></td>
				<td class="column3"><span name = "basic" id = "Basic"><%= basic %></span></td>
			</tr>
			<tr class="rows">
				<td class="column1">Conveyance:</td>
				<td class="column2"><span name = "conveyance" id = "Conveyance"><%= conveyance %></span></td>
				<td class="column3"><span name = "conveyance" id = "Conveyance"><%= conveyance %></span></td>
			</tr>
			<tr class="rows">
				<td class="column1">HRA:</td>
				<td class="column2"><span name = "hra" id = "HRA"><%= hra %></span></td>
				<td class="column3"><span name = "hra" id = "HRA"><%= hra %></span></td>
			</tr>
			<tr class="rows">
				<td class="column1">City Compensatory All:</td>
				<td class="column2"><span name = "citycompensatoryall" id = "CityCompensatoryAll"><%= cityCompensatoryAll %></span></td>
				<td class="column3"><span name = "citycompensatoryall" id = "CityCompensatoryAll"><%= cityCompensatoryAll %></span></td>
			</tr>
			<tr class="rows">
				<td class="column1">Special Allowance:</td>
				<td class="column2"><span name = "specialallowance" id = "SpecialAllowance"><%= specialAllowance %></span></td>
				<td class="column3"><span name = "specialallowance" id = "SpecialAllowance"><%= specialAllowance %></span></td>
			</tr>
			<tr class="rows">
				<td class="column1">Medical:</td>
				<td class="column2"><span name = "medical" id = "Medical"><%= medical %></span></td>
				<td class="column3"><span name = "medical" id = "Medical"><%= medical %></span></td>
			</tr>
			<tr class="rows">
				<td class="column1"><br></td>
				<td class="column2"></td>
				<td class="column3"></td>
			</tr>
			<tr class="rows">
				<td class="column1"><strong>Gross Pay</strong></td>
				<td class="column2"><span name = "grosspay" id = "GrossPay"><%= grossSalary%></span></td>
				<td class="column3"><span name = "grosspay" id = "GrossPay"><%= grossSalary%></span></td>
			</tr>
		</table>
		<br>
		<br>
		<table class="paycal">
			<tr class="rows">
				<th class="column1">DEDUCTIONS</th>
				<th class="column2">Current</th>
				<th class="column3">YTD</th>
			</tr>
			<tr class="rows">
				<td class="column1">Professional Tax:</td>
				<td class="column2"><span name = "professionaltax" id = "ProfessionalTax"><%= professionalTax %></span></td>
				<td class="column3"><span name = "professionaltax" id = "ProfessionalTax"><%= professionalTax %></span></td>
			</tr>
			<tr class="rows">
				<td class="column1">Income Tax:</td>
				<td class="column2"><span name = "incometax" id = "IncomeTax"><%= incomeTax %></span></td>
				<td class="column3"><span name = "incometax" id = "IncomeTax"><%= incomeTax %></span></td>
			</tr>
			<tr class="rows">
				<td class="column1">Other Deductions:</td>
				<td class="column2"><span name = "otherdeductions" id = "OtherDeductions"><%= otherDeductions %></span></td>
				<td class="column3"><span name = "otherdeductions" id = "OtherDeductions"><%= otherDeductions %></span></td>
			</tr>
			<tr class="rows">
				<td class="column1"><br></td>
				<td class="column2"></td>
				<td class="column3"></td>
			</tr>
			<tr class="rows">
				<td class="column1"><strong>Total Deductions:</strong></td>
				<td class="column2"><span name = "totaldeductions" id = "TotalDeductions"><%= totalDeductions %></span></td>
				<td class="column3"><span name = "totaldeductions" id = "TotalDeductions"><%= totalDeductions %></span></td>
			</tr>
		</table>
		<br>
		<br>
		<table class="paycal">
			<tr class="rows">
				<th class="column1"><strong>NET PAY</strong></th>
				<th class="column2"><span name = "netpay" id = "NetPay"><%= netPay %></span></th>
				<th class="column3"><span name = "netpay" id = "NetPay"><%= netPay %></span></th>
			</tr>
		</table>
	</div>
	<footer>
		<div>
			<p class="parapadding">
				@as applicable based on savings declaration by employee.<br>
	
				*MedicalReimbursement, CityCompensatory& Income Tax have not been
				deducted as per the request of the employee.
			</p>
	
			<p class="parapadding">
				If any questions, mail to accounts@dhatriinfo.com <br> Note:
				This is system generated mail.Signature not required.
			</p>
		</div>
	</footer>	
</form>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
