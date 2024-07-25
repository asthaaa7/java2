<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
    .body {
    background-color: #0F295B;
}

.container {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    color: #0a0303;
}

.form-group {
    margin-bottom: 20px;
}

label {
    font-weight: bold;
    display: block;
    color: #0c0b0b;
    margin-bottom: 5px;
}

input[type="text"],
input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 16px;
    background-color: #fff;
    color: #333;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #45a049;
}</style>
</head>
<body class="body"> 
    <div class="container">
        <h2>User Profile</h2>
        
         <%
    String successMessage = request.getParameter("success");
    String errorMessage = request.getParameter("error");
    if (successMessage != null && !successMessage.isEmpty()) {
    %>
        <p style="color:green;">Profile updated successfully!</p>
    <%
    } else if (errorMessage != null && !errorMessage.isEmpty()) {
    %>
        <p style="color:red;">Error occurred while updating the profile.</p>
    <%
    }
    %>
        
        <form id="profileForm" action="updateProfile" method="post">
            <div >
                <label for="firstName">First name:</label>
                <input type="text" id="firstName" name="firstName" value="${p.register_table.firstName}" >
            </div>
            <div >
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastName" value="${p.lastName}">
            </div>
            <div >
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${p.email}">
            </div>
            
            <hr>
            <div >
                <label for="currentPassword">Current Password:</label>
                <input type="password" id="currentPassword" name="currentPassword">
            </div>
            <div >
                <label for="newPassword">New Password:</label>
                <input type="password" id="newPassword" name="newPassword">
            </div>
            <div>
                <label for="confirmNewPassword">Confirm New Password:</label>
                <input type="password" id="confirmNewPassword" name="confirmNewPassword">
            </div>
            <button type="submit">Update Profile</button>
        </form>
    </div>
</body>
</html>