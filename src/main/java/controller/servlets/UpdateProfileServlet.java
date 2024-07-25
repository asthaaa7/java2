package controller.servlets;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.database.DBController;
import model.RegisterModel;
import utils.StringUtils;

/**
 * Servlet implementation class UserProfileServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/UserProfileServlet" })
public class UpdateProfileServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
private final DBController DatabaseController = new DBController();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

/**
* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
*/
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub
response.getWriter().append("Served at: ").append(request.getContextPath());
HttpSession session = request.getSession();
String email = (String) session.getAttribute("UserEmail");

/* Creating a new UserModel to store user Profile data
UserModel user = new UserModel();
user.setEmail(email);
**/

// Get user details form the database;
User userProfile = DatabaseController.updateUserProfile(email);

if (userProfile != null) {
request.setAttribute(StringUtils.USER_PROFILE_ATTRIBUTE, userProfile);
request.getRequestDispatcher(StringUtils.PAGE_URL_USER_PROFILE).forward(request, response);
}
else {
response.sendRedirect(request.getContextPath() + StringUtils.URL_INDEX);
}
}



/**
* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub

// Get parameters using getParameter
String address = request.getParameter(StringUtils.First_Name);
String phoneNumber = request.getParameter(StringUtils.Last_Name);
String email = request.getParameter(StringUtils.Email);
String password = request.getParameter(StringUtils.Password);

HttpSession session = request.getSession();
String email = (String) session.getAttribute("UserEmail");

// Get user's current data before modifying
User userProfile = DatabaseController.updateUserProfile(email);


// Creating a new user model to store the user's updated details
User updatedUser = new User();
updatedUser.setEmail(email);


// To check if the address is empty
if (address != null && !address.isEmpty()) {
updatedUser.setfirstName(firstName);
}
else {
// If user does not change the address, this will get the address from database  
updatedUser.setAddress(userProfile.getAddress());
}

// To check if the phoneNumber is empty
if (phoneNumber != null && !phoneNumber.isEmpty()) {
updatedUser.setPhoneNumber(phoneNumber);
}
else {
// If user does not change the phoneNumber, this will get the address from database  
updatedUser.setPhoneNumber(userProfile.getPhoneNumber());
}

// To check if the password is empty
if (password != null && !password.isEmpty()) {
updatedUser.setPassword(password);
}
else {
// If user does not change the password, this will get the address from database  
updatedUser.setPassword(userProfile.getPassword());
}

// to update user in database
boolean update = DBController.updateUserProfile(updatedUser);


if(!update) {

response.sendRedirect(StringUtils.PAGE_URL_USER_PROFILE);
}
}





}
