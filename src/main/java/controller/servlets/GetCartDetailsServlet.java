package controller.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.database.DBController;
import utils.StringUtils;

/**
 * Servlet implementation class GetCartDetailsServlet
 */
@WebServlet("/GetCartDetailsServlet")
public class GetCartDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCartDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession userSession = request.getSession();
        String currentUser = (String) userSession.getAttribute(StringUtils.Email);
        String contextPath = request.getContextPath();
        int userRole = 0;
        String prodName = "";
       


        Connection conn = null;
        ArrayList<String> productNames = new ArrayList<>();

        PreparedStatement roleStmt = null;
        ResultSet roleRs = null;
        PreparedStatement prodStmt = null;
        ResultSet prodRs = null;
        
        try {
        DBController dbObj = new DBController();
            conn = dbObj.getConnection();
            String roleQuery = "SELECT email from register_table where email = ?";
            roleStmt = conn.prepareStatement(roleQuery);
            roleStmt.setString(1, currentUser);
            roleRs = roleStmt.executeQuery();
            
            
            
           

            if (roleRs.next()) {
            userRole = roleRs.getInt("email");
                System.out.println(userRole);
            }
            
            while(prodRs.next()) {
                prodName = prodRs.getString("name");
                productNames.add(prodName);
            }

            // Set userRole as an attribute in the request object
            request.setAttribute("userRole", userRole);
            request.setAttribute("product", productNames);
            

            
            request.getRequestDispatcher("./pages/docadmin.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (roleRs != null) roleRs.close();
                if (roleStmt != null) roleStmt.close();
                if (conn != null) conn.close(); // Close connection
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}



