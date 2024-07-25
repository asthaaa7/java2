package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.database.DBController;
import utils.StringUtils;

/**
 * Servlet implementation class delete
 */
@WebServlet("/deleteCart")
public class deleteCart extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DBController dbController;

    public deleteCart() {
        this.dbController = new DBController();
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
        String deleteId = request.getParameter("prouduct_id");
        
        if (deleteId != null && !deleteId.isEmpty()) {
            doDelete(request, response);
        }
        
    }
    
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Deleted!!");
        doGet(req, resp);

        String remove = req.getParameter("prouduct_id");
        int result = dbController.deleteProductInfo(remove);
        if (result == 1) {
            resp.sendRedirect("./index.jsp");
        } else {
            resp.sendRedirect("pages/AddProduct.jsp");
        }
    }

}