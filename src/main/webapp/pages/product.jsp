<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


 <!-- Database Connection using taglib directive -->
                <sql:setDataSource var="DbConnection" driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:3306/p" user="root"
                    password="" />
                <sql:query var="productList" dataSource="${DbConnection}">
                      SELECT Productid, Productname,Unitprice, Stockquantity,description, path FROM productss;
                  </sql:query>
                  

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../stylesheets/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Inventory Management</title>
</head>
<body>
<div class="bar">
    <div class="header">
        <button>Log Out</button>
    </div>
    <div class="pachadi" > 
        <a href="add.jsp"><button >Add Products</button> </a>
        
        <table class="secondT">
            <tr >
                <th style="background-color: black; color: #f1f1f1;">Product ID</th>
                <th style="background-color: black; color: #f1f1f1;">Product Name</th>
                <th style="background-color: black; color: #f1f1f1;"> Unit Price</th>
                <th style="background-color: black; color: #f1f1f1;"> Stock Quantity</th>
                <th style="background-color: black; color: #f1f1f1;"> Description</th>
                <th style="background-color: black; color: #f1f1f1;">Actions</th>
            </tr>
             
            <c:forEach var="product" items="${productList.rows}">
                <tbody>
                    <tr class="alternate-row">
                        <td><c:out value="${product.productId}" /></td>
                        <td><c:out value="${product.productName}" /></td>
                        <td><c:out value="${product.unitPrice}" /></td>
                        <td><c:out value="${product.StockQuantity}" /></td>
                        <td><c:out value="${product.description}" /></td>
                        <td><img src="../images/${product.path}" style="max-width: 10vw; max-height: 10vh;"></td>

                        
                        
                        <td>
                            <form action="<%=request.getContextPath()%>/delete" method="post">
                            <input type="hidden" name="productId" value="${product.productId}" />
                                <input type="submit" value="Delete" >

                                
                            </form>
                            <form action="<%=request.getContextPath()%>/updateProduct" method="post">
                            <input type="hidden" name="productId" value="${product.productId}" />
                                <input type="submit" value="Update" >

                                
                            </form>
                            
                            <form id="updateForm-${product.product_id}"
                                        action="<%=contextPath + StringUtils.SERVLET_URL_PRODUCT_UPDATE%>">
                                        <input type="hidden" name="<%=StringUtils.UPDATE_ID %>"
                                            value="${product.product_id}" />
                                        <button class="action-button" id="update-button" type="submit"
                                            onclick="update('${product.product_id}')">Edit</button>
                                    </form>
                            
                        </td>
                        
                        
                     </tr>
                </tbody>
            </c:forEach>
            
           
        </table>
    </div>
</div>
<div class="sidebar">
    <div class="logo"></div>
    <ul class="menu">
        <li>
            <a href="admin.jsp">
                <span> Dashboard</span>
            </a>
        </li>

        <li>
            <a href="#">
                <span> Product Management</span>
            </a>
        </li> 

        <li>
            <a href="user.jsp">
                <span> User Management</span>
            </a>
        </li>
    </ul>
</div>
   
</body>
</html>