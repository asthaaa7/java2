package utils;

public class StringUtils {

	// Start: DB Connection
	public static final String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";
	public static final String LOCALHOST_URL = "jdbc:mysql://localhost:3306/p";
	public static final String LOCALHOST_USERNAME = "root";
	public static final String LOCALHOST_PASSWORD = "";
	// End: DB Connection

	// Start: Queries
	public static final String QUERY_ADD_CART = "INSERT INTO cart ("
			+ "product_id, email,quantity) "
			+ "VALUES (?, ?,? )";

	public static final String PRODUCT_ID = "product_id";
	public static final String EMAIL = "email";
	public static final String QUANTITY = "quantity";
	
	
	
	
	public static final String ORDER_DONE = "INSERT INTO orders"
			+ "(Order_Id,product_id , email, Total_Price)"
			+ "VALUES (?, ?, ?, ?)";
	public static final String ORDER_ID = "Order_id";
	public static final String PRODUCT_ID_ORDER = "product_id";
	public static final String TOTAL_PRICE = "total_price";
	public static final String EMAIL_ORDER = "email";
	

	// Start: Validation Messages
	// Register Page Messages
	public static final String MESSAGE_SUCCESS_REGISTER = "Successfully Registered!";
	public static final String MESSAGE_ERROR_REGISTER = "Please correct the form data.";
	public static final String MESSAGE_ERROR_USERNAME = "Username is already registered.";
	public static final String MESSAGE_ERROR_EMAIL = "Email is already registered.";
	public static final String MESSAGE_ERROR_PHONE_NUMBER = "Phone number is already registered.";
	public static final String MESSAGE_ERROR_PASSWORD_UNMATCHED = "Password is not matched.";
	public static final String MESSAGE_ERROR_INCORRECT_DATA = "Please correct all the fields.";

	// Login Page Messages
	public static final String MESSAGE_SUCCESS_LOGIN = "Successfully LoggedIn!";
	public static final String MESSAGE_ERROR_LOGIN = "Either username or password is not correct!";
	public static final String MESSAGE_ERROR_CREATE_ACCOUNT = "Account for this username is not registered! Please create a new account.";

	// Other Messages
	public static final String MESSAGE_ERROR_SERVER = "An unexpected server error occurred.";
	public static final String MESSAGE_SUCCESS_DELETE = "Successfully Deleted!";
	public static final String MESSAGE_ERROR_DELETE = "Cannot delete the user!";

	public static final String MESSAGE_SUCCESS = "successMessage";
	public static final String MESSAGE_ERROR = "errorMessage";
	// End: Validation Messages

	// Start: JSP Route
	public static final String PAGE_URL_INDEX = "/index.jsp";
	public static final String PAGE_URL_P= "/pages/p.jsp";
	public static final String PAGE_URL_PRO = "/pages/pro.jsp";
	public static final String PAGE_URL_MAX = "pages/max.jsp";
	public static final String PAGE_URL_HEADER = "pages/header.jsp";
	public static final String URL_LOGIN = "/login.jsp";
	public static final String URL_INDEX = "/index.jsp";
	// End: JSP Route

	// Start: Servlet Route
	public static final String SERVLET_URL_LOGIN = "/login";
	public static final String SERVLET_URL_REGISTER = "/uploadCart";
	public static final String SERVLET_URL_LOGOUT = "/logout";
	// End: Servlet Route

	// Start: Normal Text
	public static final String USER = "user";
	public static final String SUCCESS = "success";
	public static final String TRUE = "true";
	public static final String JSESSIONID = "JSESSIONID";
	public static final String LOGIN = "Login";
	public static final String LOGOUT = "Logout";
	public static final String STUDENT_MODEL = "studentModel";
	
	public static final String INSERT_USER = "INSERT INTO register_table"
			+ "(firstName, lastName, email, password)"
			+ "VALUES (?, ?, ?, ?)";
	
	public static final String GET_LOGIN_USER_INFO = "SELECT * from register_table where email = ? AND password = ?";
	
	
	public static final String First_Name = "firstName";
	public static final String Last_Name = "lastName";
	public static final String Email = "email";
	public static final String Password = "password";
	
	
	public static final String SUCCESS_REGISTER_MESSAGE = "Successfully Registered!";
	public static final String ERROR_REGISTER_MESSAGE = "Please enter correct data!";
	public static final String SERVER_ERROR_MESSAGE = "Unexpected server error occured.";
	public static final String SUCCESS_MESSAGE = "successMessage";
	public static final String ERROR_MESSAGE = "errorMessage";
	
	
	public static final String LOGIN_PAGE = "/pages/login.jsp";
	public static final String REGISTER_PAGE = "/pages/register.jsp";
	
	
	public static final String REGISTER_SERVLET = "/RegisterServlet";
	
	public static final String INSERT_CONTACT = "INSERT INTO contactt"
            + "(email, message)"
            +"VALUES (?,?)";
	
	
	    public static final String Add_Product = "INSERT INTO productss (Productid, Productname, Unitprice, Stockquantity, description, path) VALUES (?, ?, ?, ?, ?, ?)";

	   

	    public static final String p_id = "ProductId";
	    public static final String p_name = "ProductName";
	    public static final String unit_price = "UnitPrice";
	    public static final String stock_qty = "Stockquantity";


	    public static final String SUCCESS_ADDPRODUCT_MESSAGE = "Successfully PRODUCT Added!";
	    public static final String ERRORADDPRODUCT_MESSAGE = "Please enter correct data!";
	    public static final String SERVERADDPRODUCT_MESSAGE = "Unexpected server error occured.";
	   

	    public static final String AddProduct_Page = "/pages/AddProduct.jsp";



	    public static final String AddProduct_SERVLET = "/addproductServlet";


	    public static final String Get_Product_Info = "SELECT * FROM productss WHERE Productname LIKE ?";

	   public static final String IMAGE_ROOT_PATH = "/Users/baishalimaharjan/Desktop/javaa/baishali/src/main/webapp/images/product";
	  
	   public static final String DELETE_PRODUCT = "DELETE FROM productss WHERE Productid = ?";

	   public static final String DELETE_CART = "DELETE FROM cart WHERE  product_id = ?";
	   
	   
	   public static final String UPDATE_PRODUCT = "UPDATE productss SET Productname=?,Unitprice=?,Stockquantity= ?,description=?, path=? WHERE Productid = ?";
	   public static final String UPDATE_PRODUCT_NO_IMG = "UPDATE product SET Productname=?,Unitprice=?,Stockquantity= ?,description= ?,path= ? WHERE Productid = ?";
	   public static final String GET_ORDER = "SELECT order_id, product_id, Productname, quantity, Unitprice, total_price FROM orders WHERE 1";

	   public static final String UPDATE_ID = "update_id";
	   public static final String SERVLET_URL_PRODUCT_UPDATE ="/update";
	   public static final String PAGE_URL_UPDATE_PRODUCT = "/pages/update.jsp";
	   
	   public static final String USER_PROFILE_ATTRIBUTE = "userProfile";
	   public static final String PAGE_URL_USER_PROFILE = "pages/userProfile.jsp";

	    // End: DB Connection
	    }
	
	// End: Normal Text

		




