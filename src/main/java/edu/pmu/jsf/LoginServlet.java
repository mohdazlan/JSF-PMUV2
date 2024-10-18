package edu.pmu.jsf;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String userName = "staf";
	String userPassword = "passcode";

	String adminName = "admin";
	String adminPassword = "passcode";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		String userString = request.getParameter("txtname");
		String passwordString = request.getParameter("txtpassword");

		if (userString.equals(userName)) {
			if (passwordString.equals(userPassword)) {
response.sendRedirect("apply.jsp");
			} else {
				response.sendRedirect("error.jsp");
			}
		} else if (userString.equals(adminName)) {
			if (passwordString.equals(userPassword)) {
				response.sendRedirect("booking.jsp");
			} else {
				response.sendRedirect("error.jsp");
			}
		} else {
			response.sendRedirect("error.jsp");
		}

	}

}
