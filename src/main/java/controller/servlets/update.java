package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.database.DataseController;
import model.ProductModel;
import utils.StringUtils;

/**
 * Servlet implementation class ModifyProductServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ModifyProductServlet" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class update extends HttpServlet {
private static final long serialVersionUID = 1L;

private final DataseController dbController;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update() {
        this.dbController = new DataseController();
        // TODO Auto-generated constructor stub
    }

/**
 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String updateId = request.getParameter(StringUtils.UPDATE_ID);
System.out.println(updateId);
        ProductModel productDetail = DataseController.getProductInfoUp(Integer.parseInt(updateId));

        request.setAttribute("product", productDetail);
        request.getRequestDispatcher(StringUtils.PAGE_URL_UPDATE_PRODUCT).forward(request, response);
}

/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

String updateId = request.getParameter(StringUtils.UPDATE_ID);

        if (updateId != null && !updateId.isEmpty()) {
                doPut(request, response);
            }

}
@Override
protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
int producID=Integer.parseInt(req.getParameter("productID")) ;
String productName=req.getParameter("productName");
int unitPrice=Integer.parseInt(req.getParameter("unitPrice"));
String category=req.getParameter("category");;
int stock=Integer.parseInt(req.getParameter("stock"));

ProductModel product=new ProductModel();
product.setProductId(producID);
product.setProductName(productName);
product.setUnitPrice(unitPrice);
product.setStockQuantity(stock);

if (dbController.updateProductAct(product) == 1) {
 
    resp.sendRedirect(req.getContextPath() + "/pages/productManagement.jsp");
    return;
}
else if (dbController.updateProductAct(product) == 0) {

resp.sendRedirect(req.getContextPath() + "/pages/productManagement.jsp");
} else {

resp.sendRedirect(req.getContextPath() + "/pages/productManagement.jsp");
}
}

}
