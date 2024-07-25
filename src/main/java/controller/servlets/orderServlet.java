 package controller.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.database.DBController;
import model.CartModel;
import model.OrderModel;
import utils.StringUtils;

/**
 * Servlet implementation class UploadCartServlet
 */
@WebServlet("/orderServlet")
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final DBController dbController;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderServlet() {
		this.dbController = new DBController();
        
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession userSession = request.getSession();
	 	   String currentUser = (String) userSession.getAttribute(StringUtils.EMAIL);
	 	   int odr = 0;
	 	   String productids = request.getParameter("pids");
	 	    Connection conn = null; // Declare the Connection variable only once
	         String ordIDD = "";
	         
	         PreparedStatement ords = null;
	         ResultSet ordrs = null;
	         
	         String price = request.getParameter("price");

	         
	 	   try {
	 		  conn = dbController.getConnection();
	 	        
	 	       
	           ords = conn.prepareStatement("SELECT COUNT(Order_Id) AS orders FROM orders WHERE email = ?");
	           ords.setString(1, currentUser);
	           ordrs = ords.executeQuery();

	           if (ordrs.next()) {
	               odr = ordrs.getInt("orders");
	           }
	 	   }catch (SQLException | ClassNotFoundException  e) {
	 	        e.printStackTrace();
	 	    } finally {
	 	        try {
	 	            if (ordrs != null) ordrs.close();
	 	            if (ordrs != null) ordrs.close();
	 	        } catch (SQLException e) {
	 	            e.printStackTrace();
	 	        }
	 	    }   
		 	 ordIDD =  currentUser+(odr+1);

		 	 
	        // Check if product_name is not null
	        if (currentUser != null) {
	        	String cleanString = productids.substring(1, productids.length() - 1);

                // Split the string by commas
                String[] elements = cleanString.split(",");

                // Convert the string values to integers
                int[] productid = new int[elements.length];
                for (int i = 0; i < elements.length; i++) {
                    productid[i] = Integer.parseInt(elements[i].trim());
                    String prodid = String.valueOf(productid[i]);
                    OrderModel odm = new OrderModel(ordIDD,prodid,currentUser,price);

                    try {
						dbController.setOrder(odm);
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                }
	            // Create a CartModel object with the retrieved parameters
	            
	            

		         // Remove the square brackets
		       
		         

	            
	            // Handle the result accordingly
	            
	        } else {
	            // Handle case where product_name is null
	            request.setAttribute(StringUtils.MESSAGE_ERROR, "Product name cannot be null.");
	            request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
	        }
		}




}