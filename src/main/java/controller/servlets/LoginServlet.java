package controller.servlets;

import java.io.IOException;
/*import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;*/

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.database.DBController;
import utils.StringUtils;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

private static final int SESSION_TIMEOUT = 30 * 60; // 30 minutes in seconds

DBController dbController = new DBController();

   public LoginServlet() {
       super();
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // Handle GET requests if needed
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String email = request.getParameter("email");
       String password = request.getParameter("password");

       // Validate input fields
       if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
           request.setAttribute("errorMessage", "Please enter your email and password.");
           request.getRequestDispatcher("index.jsp").forward(request, response);
           return;
       }

       int loginResult = dbController.getUserLoginInfo(email, password);

       if (loginResult == 1) {
           // Login successful
           HttpSession emailsession = request.getSession();
           emailsession.setAttribute("email", email);
           emailsession.setMaxInactiveInterval(SESSION_TIMEOUT);
           
           Cookie usernameCookie = new Cookie(StringUtils.USER, email);
           usernameCookie.setMaxAge(SESSION_TIMEOUT); // Set cookie expiration time
           response.addCookie(usernameCookie);

           if (isAdmin(email)) {
               // User is an admin
            // Set the session attribute "Email" to store the user's email
           
               request.getRequestDispatcher("./pages/admin.jsp").forward(request, response);
           } else {
               // Regular user
               emailsession.setAttribute("isAdmin", false);
               request.getRequestDispatcher("index.jsp").forward(request, response);
           }
       } else if (loginResult == 0) {
           // Login failed
           request.setAttribute("errorMessage", "Invalid email or password.");
           request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
       } else {
           // Error occurred
           request.setAttribute("errorMessage", "An error occurred during login");
           request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
       }
   }

   private boolean isAdmin(String email) {
       return email.equals("jaz@admin.com");
   }
}