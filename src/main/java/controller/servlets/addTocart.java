package controller.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.StringUtils;

import java.util.ArrayList;

/**
 * Servlet implementation class addTocart
 */
@WebServlet("/addTocart")
public class addTocart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addTocart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession userSession  = request.getSession();
		String user= (String) userSession.getAttribute(StringUtils.Email);
		Connection conn = null;
		String luser = ""; 
		
	    ArrayList<String> users = new ArrayList<>();
	    try{
	    	conn = DriverManager.getConnection(StringUtils.LOCALHOST_URL, StringUtils.LOCALHOST_USERNAME, StringUtils.LOCALHOST_PASSWORD);
	    	PreparedStatement statement = conn.prepareStatement("SELECT email FROM register_table WHERE email = ?");
	    	statement.setString(1, user);
	    	
	    
	        ResultSet userResultSet = statement.executeQuery();
	        if (userResultSet.next()) {
	            luser = userResultSet.getString("email");
	        	}
	    }
	        catch (SQLException e) {
	            // Handle SQLException (improve error handling)
	            e.printStackTrace();
	        } finally {
	            try {
	                if (conn != null) conn.close(); // Close connection (if not managed by pool)
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    ArrayList<String> productNames = new ArrayList<>();
	    try{
	    	conn = DriverManager.getConnection(StringUtils.LOCALHOST_URL, StringUtils.LOCALHOST_USERNAME, StringUtils.LOCALHOST_PASSWORD);
	    	PreparedStatement statement = conn.prepareStatement("SELECT product_name FROM cart WHERE email = ?");
	        statement.setString(1, user);
	        
	        ResultSet productResultSet = statement.executeQuery();
	        while (productResultSet.next()) {
	        	String productName = productResultSet.getString("product_name");
	            productNames.add(productName);
	        }
	       
	      
	        } catch (SQLException e) {
	        // Handle SQLException (improve error handling)
	        e.printStackTrace();
	    } finally {
	        try {
	            if (conn != null) conn.close(); // Close connection (if not managed by pool)
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
