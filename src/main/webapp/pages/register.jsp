<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/baishali/stylesheets/register.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
    <title>Register</title>
</head>
<body>
	<main>
		<section style="position: relative;top: 20px;left: 400px; height: 500px; text-align: center;" class="mainbox">
            <div style="display: inline-block;margin: 20px 50px 60px 50px;">
            
            
            <div class = "container">
            <%
            String errorMessage = (String) request.getAttribute("errormessage");
            if (errorMessage != null){
            	
            %>
            <p style = "color: red;"> <%=errorMessage%> </p>
            <%}
            %>
            </div>
            
            
                <h1 class="h1">Register</h1>
            </div>
            <form action = "../RegisterServlet" method = "post" style="width: 350px;position: relative;left:68px;background-color: white;">
                <div style="display: flex; width: 350px; background-color: white;">
                    <input style="width: 175px;" class="form" type="text" name = 'firstName' placeholder="First &#160;Name">
                    <input style="width: 175px; position: relative;left: 8px;" class="form" type="text" name = 'lastName' placeholder="Last &#160;Name">
                </div>
                    <input class="form" type="email" name = 'email' placeholder="Email &#160;Address">
                    <input class="form" type="password" name = 'password' placeholder="Password">
                    <input class="form" type="password" name = 'passwordconfirm' placeholder="Password Confirm">
                    <button type="submit" name="myButton">Register</button>
            </form>
            <p class="p">Have Account ?<a style="background-color: white; color: #0f295b; text-decoration: none;" href="login.jsp">&#160;&#160;Login</a></p>
            
        </section>
	</main>
</body>
</html>