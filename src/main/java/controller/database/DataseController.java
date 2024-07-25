package controller.database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.OrderModel;
import model.ProductModel;
import utils.StringUtils;

public class DataseController {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/p";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    

    public Connection getDbConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("MySQL JDBC driver not found", e);
        }
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
    
    

    
  //Delete products
    public int deleteProductInfo(String productName) {
        try (Connection con = getDbConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.DELETE_PRODUCT);
            st.setString(1, productName);
            return st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(); // exception for debug
            return -1;
        }
    }


//update products

public int updateProductAct(ProductModel upProductModel) {
    try (Connection con = getDbConnection()) {
        PreparedStatement st = con.prepareStatement("UPDATE product SET product_name=?,unit_price=?,category= ?,stock= ? WHERE product_id = ?");
        st.setString(1, upProductModel.getProductName());
        st.setInt(2, upProductModel.getUnitPrice());
        st.setInt(4, upProductModel.getStockQuantity());
        st.setInt(5, upProductModel.getProductId());


        return st.executeUpdate();
    } catch (SQLException ex) {
        ex.printStackTrace(); // Log the exception for debugging
        return -1;
    }
}
public void getProductInfoUp(int Productid) throws ClassNotFoundException{
    try {
        Connection con = getDbConnection();
        PreparedStatement st = con.prepareStatement("SELECT * FROM product WHERE Productid = ?");
        st.setInt(1,Productid);
        ResultSet rs = st.executeQuery();

        ProductModel product = new ProductModel();

        while(rs.next()) {


            product.setProductId(rs.getInt("ProductId"));
            product.setProductName(rs.getString("ProductName"));
            product.setUnitPrice(rs.getInt("Unitprice"));
            product.setStockQuantity(rs.getInt("stockQuantity"));
            product.setImageUrlFromDB(rs.getString("path"));
            return;

        }

    } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }


}}
