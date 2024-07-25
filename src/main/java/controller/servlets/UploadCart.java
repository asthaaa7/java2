package controller.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.database.DBController;
import model.CartModel;
import utils.StringUtils;

/**
 * This Servlet class handles student registration requests. It extracts student
 * information from the registration form submission, performs basic data
 * validation (to be implemented), and attempts to register the student in the
 * database using a `DBController`. The user is redirected to the login page
 * upon successful registration.
 *
 * 
 */
@WebServlet(asyncSupported = true, urlPatterns = { StringUtils.SERVLET_URL_REGISTER })
public class UploadCart extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final DBController dbController;

	public UploadCart() {
		this.dbController = new DBController();
	}
	
	


	/**
	 * Handles HTTP POST requests for student registration.
	 *
	 * @param request  The HttpServletRequest object containing registration form
	 *                 data.
	 * @param response The HttpServletResponse object for sending responses.
	 * @throws ServletException if a servlet-specific error occurs.
	 * @throws IOException      if an I/O error occurs.
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		// Extract student information from request parameters
		String email = request.getParameter("email");
		String product_id = request.getParameter(StringUtils.PRODUCT_ID);
		String quantity = request.getParameter(StringUtils.QUANTITY);
		
		
		

		

		// Create a CartModel object to hold cart information
		CartModel cart = new CartModel(product_id,email,quantity);
		
		// Implement data validation here (e.g., check for empty fields, email format,
		// etc.)
		

		// Call DBController to upload to cart
		int result = dbController.addToCart(cart);

		if (result == 1) {
			request.setAttribute(StringUtils.MESSAGE_SUCCESS, StringUtils.MESSAGE_SUCCESS_REGISTER);
			response.sendRedirect(request.getContextPath() + StringUtils.PAGE_URL_INDEX+ "?success=true");
		} else if (result == 0) {
			request.setAttribute(StringUtils.MESSAGE_ERROR, StringUtils.MESSAGE_ERROR_REGISTER);
			request.getRequestDispatcher(StringUtils.PAGE_URL_INDEX).forward(request, response);
		} else {
			request.setAttribute(StringUtils.MESSAGE_ERROR, StringUtils.MESSAGE_ERROR_SERVER);
			request.getRequestDispatcher(StringUtils.PAGE_URL_INDEX).forward(request, response);
		}
		
			}
}