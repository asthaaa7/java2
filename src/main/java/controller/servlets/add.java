package controller.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.database.DBController;
import model.ProductModel;
import utils.StringUtils;

/**
 * Servlet implementation class add
 */
@WebServlet("/addproduct")
@MultipartConfig(maxFileSize = 16177215)
public class add extends HttpServlet {
private static final long serialVersionUID = 1L;
    
    private final DBController databaseController;

    public add() {
        this.databaseController = new DBController();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
  
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productID"));
        System.out.println(productId);
        String productName = request.getParameter("productName");
        int unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
        int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
        String description = request.getParameter("description");
        
        Part part = request.getPart("image");
        
        
        
        ProductModel product = new ProductModel(productId, productName, unitPrice, stockQuantity, description, part);// Use prodImage here
        int result;
        try {
            result = databaseController.addProduct(product);
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }

        if (result > 0) {
            
         // Get the image file name from the student object (assuming it was extracted earlier)
                     String fileName = product.getImageUrlFromPart();

                     // Check if a filename exists (not empty or null)
                     if (!fileName.isEmpty() && fileName != null) {
                       // Construct the full image save path by combining the directory path and filename
                       String savePath = StringUtils.IMAGE_ROOT_PATH;
                       part.write(savePath + fileName);  
                     }
                     response.sendRedirect("./pages/sucessmsg.jsp");
                     
        } else {
            response.sendRedirect("error.jsp");
        }
    }
    
}