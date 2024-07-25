<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%
	HttpSession userSession  = request.getSession();
	String user= (String) productsession.getAttribute(StringUtils.Email);
	Connection conn = null;
	
    ArrayList<String> users = new ArrayList<>();
    try{
    	conn = DriverManager.getConnection(StringUtils.LOCALHOST_URL, StringUtils.LOCALHOST_EMAIL, StringUtils.LOCALHOST_PASSWORD);
    	PreparedStatement statement = conn.prepareStatement("SELECT ? FROM ? WHERE ? = ?");
    	stmt.setString(1, "id");
    	stmt.setString(2, "register_table");
        stmt.setString(3, "id");
        stmt.setString(4, currentUserID);
        
        ResultSet userResultSet = prepare.executeQuery();
        if (userResultSet.next()) {
            String userResultSet = userResultSet.getString(1);
        catch (SQLException e) {
            // Handle SQLException (improve error handling)
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) conn.close(); // Close connection (if not managed by pool)
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
   
	
    ArrayList<String> cartProducts = new ArrayList<>();
    try{
    	conn = DriverManager.getConnection(StringUtils.LOCALHOST_URL, StringUtils.LOCALHOST_EMAIL, StringUtils.LOCALHOST_PASSWORD);
    	PreparedStatement statement = conn.prepareStatement("SELECT ? FROM ? WHERE ? = ?");
    	stmt.setString(1, "product_name");
    	stmt.setString(2, "cart");
        stmt.setString(3, "id");
        stmt.setString(4, currentUserID);
        
        ResultSet productResultSet = prepare.executeQuery();
        while (productResultSet.next()) {
            productNames.add(produstResultSet.getString(1));
        }
       
      
        } catch (SQLException e) {
        // Handle SQLException (improve error handling)
        e.printStackTrace();
    } finally {
        try {
            if (conn != null) conn.close(); // Close connection (if not managed by pool)
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }