package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.database.DataseController;
import utils.StringUtils;

/**
 * Servlet implementation class delete
 */
@WebServlet("/delete")
public class delete extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final DataseController DbController;
    
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete() {
        this.DbController = new DataseController();
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
        // TODO Auto-generated method stub
        String deleteId = request.getParameter( "productId");
        
        if (deleteId != null && !deleteId.isEmpty()) {
            doDelete(request, response);
        }
        
    }
    
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Deleted!!");
        doGet(req, resp);
        String remove = req.getParameter("productId");
        if (DbController.deleteProductInfo(remove) == 1) {
//            req.setAttribute("");
            resp.sendRedirect("pages/product.jsp");
        } else {
            resp.sendRedirect("pages/AddProduct.jsp");
//            
        }

}

}