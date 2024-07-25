<%@page import="java.sql.*, utils.StringUtils, java.io.*, javax.imageio.*, java.util.Base64"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
    
    <%
    int prodid = 0;
    String prodname = "";
    String price = "";
    String description = "";
    String path = "";
    
     Connection conn = null;
    
    
     HashMap<Integer, String> products = new HashMap<>();

    PreparedStatement roleStmt = null;
    ResultSet roleRs = null;
    try {
        conn = DriverManager.getConnection(StringUtils.LOCALHOST_URL, StringUtils.LOCALHOST_USERNAME, StringUtils.LOCALHOST_PASSWORD);
        String roleQuery = "SELECT * FROM productss";
        roleStmt = conn.prepareStatement(roleQuery);
        roleRs = roleStmt.executeQuery();

        while (roleRs.next()) {
            prodid = roleRs.getInt("Productid");
            prodname = roleRs.getString("Productname");
            price = roleRs.getString("Unitprice");
            description = roleRs.getString("description");
            path = roleRs.getString("path");
            
            String productData = prodname + "," + price+ "," + description+ "," + path;

            // Add user data to the HashMap with user ID as the key
            products.put(prodid, productData);
            
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (roleRs != null) roleRs.close();
            if (roleStmt != null) roleStmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../stylesheets/s.css">
<style>
.h1p{
    
    text-align: center;
    
    

  }</style>
</head>
<body>
 <header>
        <h1 class="h1p">New Products</h1>
      </header>
  
        <section id='product'>
    
      <div class="airpod">
      
      <% 
            for (Map.Entry<Integer, String> entry : products.entrySet()) {
            int userId = entry.getKey();
            String userData = entry.getValue();

            // Split the userData string using comma as delimiter
            String[] userDataArray = userData.split(",");

            // Extract first name and email
            String productName = userDataArray[0];
            String pp = userDataArray[1];
            String desc = userDataArray[2];
            String img = userDataArray[3];
        %>
      
 
        <div class="airpod1">
          <img src="../images/<%=img %>" alt="AirPods 2nd generation">
          <h2 class="h2p"><%=productName %></h2>
          <p>$<%=pp %></p>
          <a href= "./pnew.jsp">
          <button>Buy</button></a>
        </div>
        
        <%} %>
        
        
        </div>
        </section>
</body>
</html>