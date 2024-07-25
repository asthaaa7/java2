<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*, utils.StringUtils, java.io.*, javax.imageio.*, java.util.Base64"%>
<html lang="en">
<head>
<%

String contextPath = request.getContextPath();
    HttpSession userSession = request.getSession();
    String currentUser = (String) userSession.getAttribute("email");%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../stylesheets/admin.css">
    <title>Inventory Management</title>
  <style>
  body {
    font-family: Arial, Helvetica, sans-serif;
    margin: 0;
    padding: 0px;
}
.header {
    background-color: #ffffff;
    padding: 15px;
    display: flex;
    justify-content: flex-end;
}
.header button {
    background-color: #9A9696;
    padding: 5px 10px;
    border-radius: 15px;
    cursor: pointer;
    color: #ffffff;
}
table {
    border-collapse: collapse;
    width: 100%;
    border: 1px solid #ddd;
    margin-top: 15px;
}
th, td {
    padding: 8px;
    text-align: left;
}
th {
    background-color: #f1f1f1;
}
.text-left{
    text-align: left;
}
.text-right {
    text-align: right;
}
.text-centre{
    text-align: center;
}
.actions {
    text-align: center;
}
.pachadi{
    padding: 30px;
    background-color:#8A919B;
    padding-bottom: 360px;
    padding-top: 50px;
}
.daya{
    flex: 30%;
    margin: 20px;
    padding: 10px;
    font-size: 20px;
    border-radius: 25px;
    background: white;
    padding: 20px;
    height: 150px;
    text-align: center;
    border: 50px;

}
.daya:hover{
    background-color: #9A9696;
    transition: all 0.5s ease-in-out 
}
.container{
    display: flex;
    background-color: #0F2D61; 
    padding: 170px;
}
.secondT{
    padding: 50px;
    background-color: #ffffff;
}

.eye{
    width:20px; height: 30px;
    padding-right: 10px;
}
.pen{
    width:15px; height: 30px;
    padding-right: 10px;
}
.trash{
    width:20px; height: 30px;
}
.sidebar{
    position: sticky;
    top: 0;
    left: 0;
    bottom: 0;
    width: 200px;
    height: 100vh ;
    padding: 0px;
    color: #ffffff;
    overflow: hidden;
    transition: all 0.5s linear;
    background: rgb(255, 255, 255);
}

.logo{
    height: 5px;
    padding: 16px;
    width: 10px;
}
.menu{
    height: 88%;
    position: relative;
    list-style: none;
    padding: 10px 30px 10px 35px ;
}
.menu li {
    padding: 1 rem;
    margin: 8px 0;
    border-radius: 8px;
    transition: all 0.5s ease-in-out 
}
.menu li:hover{
    background: #5d474758;
}
.menu a{
    color: #705f5f;
    font-size: 14px;
    text-decoration: none;
    display: flex;
    align-items: center;
    align-items: center;
    gap: 1.5rem;
}
.menu a span{
    overflow: hidden;
    color: rgb(4, 4, 4);
    margin-bottom: 25px;
    padding-left: 5px; ;
    padding-top: 20px ;
}
.menu a i {
    font-size: 1.2rem;
}
.bar{
    padding-left: 200px;
    margin: 0;
    width: 1300px;
    position: absolute;         
}


.images{
    display:flex;
    
}

.images img {
    width:60px; 
    height: 60px;
}
  </style>
</head>
<body>
<%
    String esession = (String) session.getAttribute("email");
    String cookieUsername  = null;
    String cookieSessionID = null;
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
        for(Cookie cookie: cookies){
            if(cookie.getName().equals(StringUtils.USER)) cookieUsername = cookie.getValue();
            if(cookie.getName().equals(StringUtils.JSESSIONID)) cookieSessionID = cookie.getValue();
        }
 }

%>
    <div class="bar">
        <div class="header">
            <form action="<%
    // Conditionally set the action URL based on user session
    if (currentUser != null) {
        out.print(contextPath + StringUtils.SERVLET_URL_LOGOUT);
    } else {
        out.print(contextPath + StringUtils.LOGIN_PAGE);
    }

%>" method="post">
    <input type="submit" value="<%



        // Conditionally set the button label based on user session



        if (currentUser != null) {



            out.print("Logout");



        } else {



            out.print("Login");



        }



    %>"style="width:70px;
                height:30px;
                margin-top:15px;
                margin-left:50px;
                background-color:#4E7FB0;

                color:white;


"/>
</form>
            
        </div>
        
        <div style=" background-color: #0F2D61; padding: 10px 10px 10px 20px; color: beige;"> <h1>Hello! Admin</h1></div>
        <div class="container">
            <div class="daya"> <img src="../images/headphone.png" style="height:50px; width:50px;" > <br> Products:<br> 4 </div>
            <div class="daya"> <img src="../images/quantity.svg" style="height:50px; width:50px;"><br> Quantity: <br> 100</div>
            <div class="daya"> <img src="../images/stock.png" style="height:50px; width:50px;"> <br> Stocks Left: <br> 15000 </div>
        </div>
        
    </div>


 <div class="sidebar">
        <div class="logo" >  </div>
        <ul class="menu">
            <li>
                
                    <span> Dashboard</span>
                
            </li>

            <li>
                <a href="./product.jsp">
                    <span> Product Management</span>
                </a>
            </li> 

            <li>
                <a href="./user.jsp">
                    <span> User Management</span>
                </a>
            </li>
        </ul>
    </div>
    
   
</body>
</html>