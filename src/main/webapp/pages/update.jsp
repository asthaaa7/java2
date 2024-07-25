<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Form</title>
</head>
<body>
    <form action = "../addproduct" method = "post" enctype="multipart/form-data">
        <h2>Update Product</h2>
            <label >Product Id:</label>
        <input type="number" name="productID" required> <br> <br>

        <label >Product Name:</label>
        <input type="text"  name="productName" required> <br> <br>

        <label>Unit Price:</label>
        <input type="number"  name="unitPrice" min="0" required> <br> <br>

        <label>Stock Quantity:</label>
        <input type="number"  name="stockQuantity" min="0" required><br> <br>

         <label >Description:</label>
        <input type="text"  name="description" min="0" required><br> <br>

           <label >Product Image:</label>
        <input type="file" name="image" required> <br> <br>

        <button type="submit">Add Product</button>

        </form>
</body>
</html>