<%@page import="model.ProductModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.product-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
}

.product-item {
  background-color: #f5f5f5;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.3s ease;
}

.product-item:hover {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.product-item img {
  width: 200px;
  height: 200px;
  object-fit: cover;
  padding-left:50px;
}

.product-details {
  padding: 1rem;
}

.product-details h3 {
  margin-top: 0;
  font-size: 1.2rem;
}

.product-details .price {
  font-weight: bold;
  color: #555;
  margin-bottom: 0.5rem;
}

.product-details .description {
  margin-bottom: 0;
  color: #777;
  line-height: 1.4;
}
.Fine{
margin-top:20px;
margin-left:70px;
width: 100%;
    padding: 10px;
    border: none;
    outline: none;
    background: #007bff;
    color: white;
    width:100px;
    border-radius: 30px;

}

</style>
</head>
<body>


<%-- Retrieve the list of ProductModel objects from the session --%>
<% List<ProductModel> searchedProduct = (List<ProductModel>) session.getAttribute("sujalSession"); %>
<%-- Check if the list is not null and not empty --%>
<div class="product-grid">
  <% if (searchedProduct != null && !searchedProduct.isEmpty()) { %>
    <% for (ProductModel product : searchedProduct) { %>
      <div class="product-item">
        <img src="${pageContext.request.contextPath}/images/<%= product.getImageUrlFromPart() %>" alt="<%= product.getProductName() %>">
        <div class="product-details">
          <h3><%= product.getProductName() %></h3>
          <p class="price">$<%= product.getUnitPrice() %></p>
          <p class="description"><%= product.getDescription() %></p>
          <a href="../index.jsp#product" ><button class="Fine">Buy Now</button></a>
          
          <!-- Add more product details or buttons as needed -->
        </div>
      </div>
    <% } %>
  <% } else { %>
    <p>No products found.</p>
  <% } %>
</div>

  
</body>
</html>