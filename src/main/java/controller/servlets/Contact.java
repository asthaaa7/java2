package controller.servlets;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import controller.database.DBController;
import model.ContactModel;



/**
 * Servlet implementation class Contact
 */
@WebServlet("/Contact")
public class Contact extends HttpServlet {
private static final long serialVersionUID = 1L;

DBController dbController = new DBController();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contact() {
        super();
        // TODO Auto-generated constructor stub
    }

/**
* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
*/
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub
//getWriter().append("Served at: ").append(request.getContextPath());
}

/**
* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub
//doGet(request, response);

String email = request.getParameter("email");
String message = request.getParameter("message");

ContactModel contactModel = new ContactModel(email, message);




int result = dbController.addContact(contactModel);

if (result > 0) {
            // Set a success message as a request attribute


response.sendRedirect(request.getContextPath() + "/pages/ContactUs.jsp?msg=valid");

        } else {
            // Set an error message as a request attribute
       
        response.sendRedirect(request.getContextPath() + "/pages/ContactUs.jsp?msg=invalid");
        }

    }
}
