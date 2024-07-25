package controller.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.CartModel;
import model.ContactModel;
import model.OrderModel;
import model.RegisterModel;
import model.User;
import utils.StringUtils;
import model.ProductModel;


public class DBController {

	/**
	 * Establishes a connection to the database using pre-defined credentials and driver information.
	 * 
	 * @return A `Connection` object representing the established connection to the database.
	 * @throws SQLException if a database access error occurs.
	 * @throws ClassNotFoundException if the JDBC driver class is not found.
	 */
	public Connection getConnection() throws SQLException, ClassNotFoundException {

	    // Load the JDBC driver class specified by the StringUtils.DRIVER_NAME constant
	    Class.forName(StringUtils.DRIVER_NAME);

	    // Create a connection to the database using the provided credentials
	    return DriverManager.getConnection(StringUtils.LOCALHOST_URL, StringUtils.LOCALHOST_USERNAME,
	                                      StringUtils.LOCALHOST_PASSWORD);
	}


	/**
	 * This method attempts to register a new student in the database.
	 * 
	 * @param student A `StudentModel` object containing the student's information.
	 * @return An integer value indicating the registration status:
	 *         - 1: Registration successful
	 *         - 0: Registration failed (no rows affected)
	 *         - -1: Internal error (e.g., ClassNotFound or SQLException)
	 * @throws SQLException if a database access error occurs.
	 * @throws ClassNotFoundException if the JDBC driver class is not found.
	 */
	public int addToCart(CartModel cart) {

	    try {
	        // Prepare a statement using the predefined query for student registration
	        PreparedStatement stmt = getConnection()
	        		.prepareStatement(StringUtils.QUERY_ADD_CART);

	        // Set the student information in the prepared statement
	        stmt.setString(1, cart.getProductID());
	        stmt.setString(2, cart.getEmail());
	        stmt.setString(3, cart.getQuantity());
	        

	        // Execute the update statement and store the number of affected rows
	        int result = stmt.executeUpdate();

	        // Check if the update was successful (i.e., at least one row affected)
	        if (result > 0) {
	            return 1; // Registration successful
	        } else {
	            return 0; // Registration failed (no rows affected)
	        }

	    } catch (ClassNotFoundException | SQLException ex) {
	        // Print the stack trace for debugging purposes
	        ex.printStackTrace();
	        return -1; // Internal error
	    }
	}
	
	public int addUser(RegisterModel registerModel) {
		try (Connection con = getConnection()){
			PreparedStatement st = con.prepareStatement(StringUtils.INSERT_USER);
			
			st.setString(1, registerModel.getFirstName());
			st.setString(2, registerModel.getLastName());
			st.setString(3, registerModel.getEmail());
			st.setString(4, registerModel.getPassword());
			
			int result = st.executeUpdate();
			return result > 0 ? 1 : 0;
		} catch (ClassNotFoundException | SQLException ex) {
			ex.printStackTrace();
			return -1;
		}
			
		}
	
	public int getUserLoginInfo(String email, String password) {
	    try (Connection con = getConnection()) {
	        PreparedStatement st = con.prepareStatement(StringUtils.GET_LOGIN_USER_INFO);
	        st.setString(1, email);
	        st.setString(2, password);

	        ResultSet rs = st.executeQuery();
	        if (rs.next()) {
	            // Check if the retrieved password matches the provided password
	            String retrievedPassword = rs.getString("password");
	            if (password.equals(retrievedPassword)) {
	                return 1; // Login successful
	            } else {
	                return 0; // Incorrect password
	            }
	        } else {
	            return 0; // User not found
	        }
	    } catch (ClassNotFoundException | SQLException ex) {
	        ex.printStackTrace();
	        return -1; // Error occurred
	    }
	}
	
	
	public int addContact(ContactModel contactModel) {

		try(Connection con = getConnection()) {

			PreparedStatement st = con.prepareStatement(StringUtils.INSERT_CONTACT);

			

			

			st.setString(1, contactModel.getEmail());

			st.setString(2, contactModel.getMessage());

			

			

			int result = st.executeUpdate();

			return result > 0 ? 1 : 0;

			

			

			

			

			

		} catch (SQLException | ClassNotFoundException ex){

			ex.printStackTrace();

			return -1;

			

		}

	}
	

	public int setOrder(OrderModel order) throws ClassNotFoundException {
        try {
               PreparedStatement stmt = getConnection().prepareStatement(StringUtils.ORDER_DONE);

               stmt.setString(1, order.getOrderID());
               stmt.setString(2, order.getProductID());
               stmt.setString(3, order.getEmail());
               stmt.setString(4, order.getTotalPrice());




               int result = stmt.executeUpdate();

               // Return the number of affected rows
               return result; 
           } catch (SQLException ex) {
               ex.printStackTrace();
               return -1; // Internal error
           }
   }
	
	public int addProduct(ProductModel product) throws SQLException {

        try (Connection con = getConnection();

             PreparedStatement stmt = con.prepareStatement(StringUtils.Add_Product)) {



            stmt.setInt(1, product.getProductId());

            stmt.setString(2, product.getProductName());

            stmt.setInt(3, product.getUnitPrice());

            stmt.setInt(4, product.getStockQuantity());

            stmt.setString(5, product.getDescription());

            stmt.setString(6, product.getImageUrlFromPart());



            return stmt.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {

	        ex.printStackTrace();

	        return -1; // Error occurred

	    }

    }



    public List<ProductModel> getProduct(ProductModel product) {

        List<ProductModel> productsList = new ArrayList<>();

        try (Connection con = getConnection();

             PreparedStatement st = con.prepareStatement(StringUtils.Get_Product_Info)) {



            st.setString(1, "%" + product.getProductName().toLowerCase() + "%");



            try (ResultSet rs = st.executeQuery()) {

                while (rs.next()) {

                    String name = rs.getString("Productname");

                    int price = rs.getInt("Unitprice");

                    String desc = rs.getString("description");

                    String image = rs.getString("path");

                    

                    ProductModel result = new ProductModel(name, price, desc, image);

                    productsList.add(result);

                }

            }



        } catch (ClassNotFoundException | SQLException ex) {

	        ex.printStackTrace();

	        // Error occurred

	    }

        return productsList;

    }
    public static boolean updateUserProfile(User user) {
    try (Connection conn = DriverManager.getConnection(StringUtils.LOCALHOST_URL, StringUtils.LOCALHOST_USERNAME, StringUtils.LOCALHOST_PASSWORD)) {
		String sql = "UPDATE users SET first_name=?, last_name=?, email=?,  password=? WHERE id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, user.getFirstName());
		stmt.setString(2, user.getLastName());
		stmt.setString(3, user.getEmail());
		stmt.setString(4, user.getPassword());
		stmt.executeUpdate();			
	} catch (SQLException e) {
		e.printStackTrace();
		return false;
	}
	 return true;
}
   



    public ProductModel getOneProduct(String name) {

        try (Connection con = getConnection();

             PreparedStatement st = con.prepareStatement("SELECT * FROM productss WHERE Productname LIKE ?")) {



            st.setString(1, name);



            try (ResultSet rs = st.executeQuery()) {

                if (rs.next()) {

                    String pname = rs.getString("Productname");

                    int price = rs.getInt("Unitprice");

                    String desc = rs.getString("description");

                    String image = rs.getString("path");

                    

                    return new ProductModel(pname, price, desc, image);

                }

            }



        } catch (ClassNotFoundException | SQLException ex) {

	        ex.printStackTrace();

	        

	    }

        return null;

    }
    public int deleteProductInfo(String cart_id) {
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.DELETE_CART);
            st.setString(1,cart_id );
            return st.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {

	        ex.printStackTrace();

	        return -1; // Error occurred

	    }
    }
	/**
	 * This method attempts to validate a student login by checking the username 
	 * and password against a database.
	 * 
	 * @param username The username provided by the user attempting to log in.
	 * @param password The password provided by the user attempting to log in.
	 * @return An integer value indicating the login status:
	 *         - 1: Login successful
	 *         - 0: Username or password mismatch
	 *         - -1: Username not found in the database
	 *         - -2: Internal error (e.g., SQL or ClassNotFound exceptions)
	 * @throws SQLException if a database access error occurs.
	 * @throws ClassNotFoundException if the JDBC driver class is not found.
	 */
	
	
	public Boolean checkEmailIfExists(String email) {
	    // TODO: Implement logic to check if the provided email address exists in the database
	    // This method should likely query the database using DBController and return true if the email exists, false otherwise.
	    return false;
	}

	public Boolean checkNumberIfExists(String number) {
	    // TODO: Implement logic to check if the provided phone number exists in the database
	    // This method should likely query the database using DBController and return true if the phone number exists, false otherwise.
	    return false;
	}

	public Boolean checkUsernameIfExists(String username) {
	    // TODO: Implement logic to check if the provided username exists in the database
	    // This method should likely query the database using DBController and return true if the username exists, false otherwise.
	    return false;
	}


	public static boolean updateUserProfile1(User user) {
		// TODO Auto-generated method stub
		return false;
	}


	

}