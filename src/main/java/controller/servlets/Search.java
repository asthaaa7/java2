package controller.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.database.DBController;
import model.ProductModel;



/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    DBController dbController = new DBController();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());
        HttpSession mySession = request.getSession();
        String name =request.getParameter("search");
        ProductModel product = new ProductModel(name);
        product.setProductName(name);
        
        List<ProductModel> searchresult = dbController.getProduct(product);
        
        if (searchresult != null && !searchresult.isEmpty()) {
            mySession.setAttribute("sujalSession", searchresult);
            response.sendRedirect(request.getContextPath() + "/pages/productone.jsp");
        } else {
            // No products found, redirect to a page indicating no results
            
        }
    }
        
        
        
    

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
        
    }

}