<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/baishali/stylesheets/login.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
    <title>Login</title>
</head>
<body>
	<main>
        <section class="mainbox">
            <div style="display: inline-block;margin: 20px 50px 60px 50px;">
            
            <%
            String errorMessage = (String) request.getAttribute("errorMessage");
    		if (errorMessage != null) {
			%>
			<p style="color: red;"><%= errorMessage %></p>
			<%
    		}
			%>
            
                <h1 class="h1">Login</h1>
            </div>
            <form action = "<%=contextPath%>/LoginServlet" method = "post" style="width: 350px;position: relative;left: 70px;background-color: white;">
                    <input class="form" type="email" name = 'email' placeholder="Email &#160;Address">
                    <input class="form" type="password" name = 'password' placeholder="Password">
                    <button type="submit" name="myButton">Login</button>
            </form>
            <p class="p">No Account ?<a style="background-color: white; color: #0f295b; text-decoration: none;" href="register.jsp">&#160;&#160;&#160Register</a></p>
            
        </section>
    </main>
</body>
</html>