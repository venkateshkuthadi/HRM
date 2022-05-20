package com.hrm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrm.bean.EmployeeBean;
import com.hrm.bean.RequestBean;
import com.hrm.services.HRMService;
import com.hrm.services.HRMServicesImplementation;
import com.hrm.session.SharedObject;

/**
 * Servlet implementation class CloseStatusServlet
 */
@WebServlet("/CloseStatusServlet")
public class CloseStatusServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CloseStatusServlet() {
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
String status = "closed";

RequestBean reqbean = new RequestBean();
reqbean.setReasonId(reasonId);
reqbean.setManagerReason(reasonNam);
reqbean.setStatus(status);

SharedObject.setSession(request.getSession());
HRMService hrmService=new HRMServicesImplementation();

int reqclose = hrmService.closeStatus(reqbean);
if(reqclose>0) {
RequestDispatcher requestDispatch = request.getRequestDispatcher("ResponseApproved.jsp");
requestDispatch.forward(request, response);
}else {
RequestDispatcher requestDispatch1 = request.getRequestDispatcher("ResponseApproved.jsp");
requestDispatch1.forward(request, response);
}

}

}