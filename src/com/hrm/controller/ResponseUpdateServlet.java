package com.hrm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrm.bean.RequestBean;
import com.hrm.services.HRMService;
import com.hrm.services.HRMServicesImplementation;
import com.hrm.session.SharedObject;

/**
 * Servlet implementation class ResponseUpdateServlet
 */
@WebServlet("/ResponseUpdateServlet")
public class ResponseUpdateServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResponseUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

/**
* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
*/
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

}

/**
* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

String reasonId = request.getParameter("reasonId");
String reasonNam = request.getParameter("reasonName");
String reAssignMail = request.getParameter("email");
String status = "Submitted to Another Person.";

RequestBean reqbean1 = new RequestBean();
reqbean1.setReasonId(reasonId);
reqbean1.setReasonName(reasonNam);
reqbean1.setReAssignMailId(reAssignMail);
reqbean1.setStatus(status);

SharedObject.setSession(request.getSession());
HRMService hrmService=new HRMServicesImplementation();

int reqresponse = hrmService.responseUpdate(reqbean1);
if(reqresponse>0) {
RequestDispatcher requestDispatch = request.getRequestDispatcher("ResponseApproved.jsp");
requestDispatch.forward(request, response);
}else {
RequestDispatcher requestDispatch1 = request.getRequestDispatcher("ResponseApproved.jsp");
requestDispatch1.forward(request, response);
}
}

}