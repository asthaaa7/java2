<%@page import="java.sql.*, utils.StringUtils, java.io.*, javax.imageio.*, java.util.Base64"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
    <%
String contextPath = request.getContextPath();
    HttpSession userSession = request.getSession();
    String currentUser = (String) userSession.getAttribute("email");
    String userRole = "";
    HashMap<Integer, String> cart = new HashMap<>();
    ArrayList<String> cartdetails = new ArrayList<>();
    int cartId = 0;
    String productId = "";
    String email = "";
    String quantity = "";
    String price = "";
    String prodName = "";
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String path = "";
    String pid = "";
    
    

    Connection conn = null;
    
    PreparedStatement s = null;
    ResultSet r = null;

    PreparedStatement roleStmt = null;
    ResultSet roleRs = null;
    
    
    try {
        conn = DriverManager.getConnection(StringUtils.LOCALHOST_URL, StringUtils.LOCALHOST_USERNAME, StringUtils.LOCALHOST_PASSWORD);
        String rq = "SELECT product_id FROM cart WHERE email = ?";
        s = conn.prepareStatement(rq);
        s.setString(1, currentUser);
        r = s.executeQuery();

        while (r.next()) {
            pid = r.getString("product_id");
           	 
			cartdetails.add(pid);
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
    }
    
    
    stmt = conn.prepareStatement("SELECT * FROM cart INNER JOIN products ON products.product_id = cart.product_id WHERE email = ?");
    stmt.setString(1, currentUser);
    rs = stmt.executeQuery();
   
    while(rs.next()) {
    	cartId = rs.getInt("cart_id"); // Assuming id is the primary key for users
        productId = rs.getString("product_id");
        email = rs.getString("email");
        quantity = rs.getString("quantity");
        price = rs.getString("unit_price");
        prodName = rs.getString("product_name");
		path = rs.getString("path");
        
                    
        // Concatenate user attributes into a single string
        String cartData = productId + "," + email+ "," + quantity+ "," + price + "," + prodName + "," + path ;

        // Add user data to the HashMap with user ID as the key
        cart.put(cartId, cartData);
    }

    
    
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="./stylesheets/s.css">
  <style>
  
@charset "UTF-8";
.body {
    font-family: sans-serif;
    margin: 0;
    padding: 0;
    
   
  }
 
  
  
  header {
    background-color: #f1f1f1;
    padding: 20px;
    text-align: center;
  }
  
  .h1p{
    
    text-align: center;
    
    

  }
  
  /* AirPods section styles */
  .airpod {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    margin: 20px auto;
    width: 80%;
    border-radius: 5px;
    background-color: #fff
  }
  
  .airpod1{
    background-color: #fff;
    
    box-shadow: black;
    margin: 10px;
    padding: 10px;
    text-align: center;
    width: 200px; 
    
  height: 700px;
  
  }
  .airpod2{
    background-color: #fff;
    
    box-shadow: black;
    margin: 10px;
    padding-top: 10px;
    text-align: center;
    width: 200px; 
    
  height: 700px;
  
  }
  .airpod3{
    background-color: #fff;
    
    box-shadow: black;
    margin: 10px;
    padding-top: 10px;
    text-align: center;
    width: 200px; 
    
  height: 700px;
  
  }
  .airpod4{
    background-color: #fff;
    
    box-shadow: black;
    margin: 10px;
    padding-top: 10px;
    text-align: center;
    width: 200px; 
    
  height: 700px;
  
  }
  
  .airpod img {
    width: 100%;
    height: auto;
  }
  
  .airpod h2 {
    margin-bottom: 10px;
  }
  
  .airpod button {
    background-color: #007bff;
    border: none;
    color: #fff;
    cursor: pointer;
    padding: 10px 20px;
    border-radius: 5px;
  }
  
  /* Footer styles */
  footer {
    background-color: #f1f1f1;
    padding: 20px;
    text-align: center;
    width: 100%;
  }
  
  footer p {
    margin-bottom: 5px;
  }
  body {
                margin: 0;
                padding: 0;
                background-color:red;
            }
            .container {
                position: relative;
                width: 100%;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .background-image {
                position: absolute;
                top: 35;
                left: 65%;
                transform: translateX(-50%);
                z-index: -1;
                width: 450px;
                size: 250; 
            }
            .content {
                text-align: center;
            }
            h1 {
                font-size: 75px;
                font-family: Arial, sans-serif;
                color: #0F295B;
                padding-left: 20;
            }
            .down {
                background-color: #0F295B;
                color: white;
                padding: 15px 25px;
                font-size: 20px;
                border: none;
                border-radius: 30px;
                cursor: pointer;
                transition: background-color 0.3s;
                margin-top: 20px;
            }
            .down:hover {
                background-color: #093E77;
            }
            .middle{
            height:900px;}


            :root{
                --accent-color: #069fe6;
                --light-grey: rgba(0,0,0,0.1);
            }
            #open_cart_btn{
                position: absolute;
                top: 5px;
                right: 10px;
                border: none;
                background-color:#0C193B;
                padding: 10px;
                
                
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
            }
            
            body{
                min-height: 100vh;
                background-color:white;
                overflow-x: hidden;
            }
            
            .sidecart{
                position: fixed;
                top: 0;
                right: 0;
                height: 100vh;
                width: 350px;
                background-color: #fff;
                box-shadow: -10px 0 15px var(---grey);
                transform: translateX(110%);
                transition: transform 0.5s ease-in-out;
            }
            
            .sidecart.open{
                transform: translateX(0);
            }
            
            .cart_content{
                display: flex;
                flex-direction: column;
                height: 100%;
                
            
            }
            .cart_header{
                padding: 1rem;
                border-bottom: 1px solid var(--light-grey);
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            
            .cart_header .close_btn{
                font-size: 2rem;
                cursor: pointer;
                transition: transform 0.2s ease;
            }
            
            .cart_header .close_btn:hover{
                transform: scale(1.1);
            
            }
            
            .cart_items{
                display: flex;
                overflow-x: hidden;
            }
            .item_img{
                flex: 1;
            }
            .item_img img{
                width: 100%;
                height: 100%;
                object-fit: contain;
            
            }
            .items_details{
                flex: 2;
            }
            
            .cart_action{
                padding: 1rem 2rem;
                display: flex;
                flex-direction: column;
                gap: 1rem;
                border-top: 1px solid var(--light-grey);
                box-shadow: 0 -5px 10px var(--light-grey);
            }
            
            .cart_action .subtotal{
                margin-bottom: 1rem;
                display: flex;
                align-items: center;
                justify-content: space-between;
                font-size: 14px;
                font-weight: bold;
                letter-spacing: 2px;
            }
            
            .cart_action button{
                border: none;
                background-color: var(--accent-color);
                color: #fff;
                border-radius: 15px;
                padding: 10px;
                font-size: 14px;
                text-transform: uppercase;
                letter-spacing: 2px;
                cursor: pointer;
            }
            
            
            
            
            button:hover{
                opacity: 0.8;
            }
            
 .popup {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.4);
}

.popup-content {
  background-color: #fefefe;
  margin: 10% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 30%;
}

.popup-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
}


.c{
  color: #aaa;
  font-size: 28px;
  font-weight: bold;
  background-color: #fff;
  float: right;
}

.c:hover,
.c:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.form {
    margin-top: 0;
    margin-bottom: 12px;
    border: 2px solid #0F295B;
    height: 40px;
    width: 350px;
    padding-left: 12px;
    margin-left: 170px;
}

.m {
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: white;
    padding: 20px;
    margin-right: 150px;
}

.my {
    color: #ffffff;
    background-color: #0f295b;
    font-family: "Open Sans", sans-serif;
    font-size: 19px;
    border: 0;
    padding: 10px 160px;
    margin-top: 20px;
    margin-bottom: 15px;
    cursor: pointer;
    margin-left: 170px;
}

.my:hover {
    background-color: #637AA7;
}

.p {
    font-family: "Open Sans", sans-serif;
    color: #909090;
    background-color: white;
    margin-top: 10px;
    margin-left:120px;
}
        
 .Nav{
    background-color: #0C193B;
    
}
.kk{
    text-decoration: none;
    color: black;
}
.img{
width: 200px;
height: 60px;

margin-left: 50px;
}
.sear{
    display: flex;
    margin-left: 10px;
   
}
.search{
    margin-top: 15px;
    margin-left: 500px;
   
    padding-left: 10px;
    height: 30px;
    font-family: Arial, Helvetica, sans-serif ;
    
    
}
.sb{
   margin-top: 15px;
   margin-bottom: 15px;
   background-color:#4E7FB0;
   color:white;
   
}
.Nav{
    display: flex;
}

.login{
    margin-left: 40px;
    margin-bottom: 10px;
    font-family: Arial, Helvetica, sans-serif;
    height: 30px;
    margin-top: 15px;
    
}
.account{
    width: 35px;
    height: 35px;
    margin-left: 50px;
    margin-top: 13px;
    
}
.cart{
    width: 35px;
    height: 35px;
    margin-left: 30px;
    margin-top: 13px;
}
.AirPod{
     margin-left: 200px;
     margin-top: 50px;
     font-size: 150px;
     font-family: Arial, Helvetica, sans-serif;
     /*0F295B*/
     color:  #0C193B;
     font-weight: 1000;
     
}
.photo{
    position: absolute;
    top: 30%;
    margin-left: 150px;
    
}
.small{
    position: absolute;
    top: 20%;
    margin-left: 620px;
    font-size: 50px;
    font-weight: bold;
    font-family: Arial, Helvetica, sans-serif;
    color: #0C193B;
}

.text{
    position: absolute;
    margin-left: 620px;
    top: 53%;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px ;
}

.now{
    position: absolute;
    margin-left: 620px;
    top: 75%;
    color: aliceblue;
    background-color: #0C193B;
    height: 40px;
    width: 80px;
    border-radius: 30px;
    border: none;
    
}

.charge{
    position: absolute;
    top: 52%;
    margin-left: 800px;

}
 .tops{
    height: 900px;
  }
  body {
                margin: 0;
                padding: 0;
            }
            .container {
                position: relative;
                width: 100%;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .background-image {
                position: absolute;
                top: 35;
                left: 65%;
                transform: translateX(-50%);
                z-index: -1;
                width: 450px;
                size: 250; 
            }
            .content {
                text-align: center;
            }
            h1 {
                font-size: 75px;
                font-family: Arial, sans-serif;
                color: #0F295B;
                padding-left: 20;
            }
            .mid {
                background-color: #0F295B;
                color: white;
                padding: 15px 25px;
                font-size: 20px;
                border: none;
                border-radius: 30px;
                cursor: pointer;
                transition: background-color 0.3s;
                margin-top: 20px;
            }
            
            .middle{
            height:900px;}
  .ub{
appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    border: none;
    background: none;
    padding: 0;
    margin: 0;}
    .num{
appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    border: none;
    background: none;
    padding: 0;
    margin: 0;}
    .ema{
appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    border: none;
    background: none;
    padding: 0;
    margin: 0;}
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
	<section class="tops">
   
            <div class="Nav">
            <img src="./images/1.png" class="img">
            <div class="sear">
            <form action="<%=contextPath %>/Search" method="get">
            <input class="search" type="search" name="search">
            <button class="sb" type="submit" name="search">Search</button>
            </form>
            </div>
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

            
   <a href="<%=contextPath%>/pages/userProfile.jsp"><button class='ub'>
            <img src="./images/2.jpg" class="account"></button></a>
            </div>
            
          
           

            <div>
            <p class="AirPod"> Air <br>
                Pods<br>
                Pro
                </p>
            <div class="photo">
            <img src="./images/3.png"  height="400px" width="400px">
            </div>
            </div>

            <div>
                <p class="small"> Air <br>
                    Pods <br>
                    Pro </p>

                <p class="text"> Adaptive EQ that tunes<br>
                    music to your ear, and<br>
                    delivers an experience<br>
                    that’s simply magical.<br>

                </p>
				
                <a href="#product"><button class="now">Shop Now</button></a>
				
                <img src="./images/4.webp" class="charge" height="350px" width="350px">
                
            </div>
            
        
        <button id="open_cart_btn">
        <img src="./images/cart1.png" style="width: 30px;">
    </button>
<div id="popup" class="popup">
        <div class="popup-content">
            <span id="c" class="c">&times;</span>
            <h3>Please Log in! to view your cart list.</h3>
            <form action="<%=contextPath%>/LoginServlet" method="post" style="width: 350px; margin: 0 auto; background-color: white;">
                <div class="m">
                    <input class="form" type="email" name='email' placeholder="Email Address">
                    <input class="form" type="password" name='password' placeholder="Password">
                    <button type="submit" name="myButton" class="my">Login</button>
                </div>
            </form>
            <p class="p">No Account ?<a style="background-color: white; color: #0f295b; text-decoration: none;" href="register.jsp">&#160;&#160;&#160Register</a></p>
        </div>
    </div>

    <div class="sidecart">
    
        <div class="cart_content">


            <div class="cart_header">

                <img src="cart1.png" style ="width:40px" />
                <div class="header_title">
                    <h2>Your Cart</h2>

                    </div>

                <span id="close_cart_btn" class="close_btn">&times;</span>
            </div>
            <form action="<%=contextPath%>/orderServlet" method="post">
           
	<% 
        for (Map.Entry<Integer, String> entry : cart.entrySet()) {
            int userId = entry.getKey();
            String cartData = entry.getValue();

            // Split the userData string using comma as delimiter
            String[] cartDataArray = cartData.split(",");

            // Extract first name and email
            String productIdd = cartDataArray[0];
            String emaill = cartDataArray[1];
            String quantityy = cartDataArray[2];
            String pricee = cartDataArray[3];
            String prodNamee = cartDataArray[4];
            String pathh = cartDataArray[5];

            
        %>
	
               
                <div class="cart_items">
                	<input type="hidden" value=<%=pricee %>  name="price">
                	<input type="hidden" value="<%=productIdd%>" name="pid">
                    <div class="item_img">
                        <img src="./images/<%= pathh%>">
                    </div>
                    <div class="items_details">
                        <p><%= prodNamee %></p>
                        <strong><%= pricee %></strong>
                        
                        
                         
                    </div>

                    
                </div>

                
		<%} %>



                <div class="cart_action">
                <div class="subtotal">
                    



                </div></div>
                
                 </form>
                <input type="text" value="<%=cartdetails %>" name="pids">
                <a href="./pages/orderMessage.jsp">
                <input type="submit" value="Checkout"></a>
                
               

</div>
</div>
<script>
document.addEventListener("DOMContentLoaded", function() {
    // Get the popup element
    var popup = document.getElementById("popup");

    // Get the button that opens the cart
    var openCartBtn = document.getElementById("open_cart_btn");



    // Get the current user from the server-side
    var currentUser = '<%= currentUser == null ? "" : currentUser %>';

    // Open the cart when the button is clicked
    openCartBtn.onclick = function(event) {
        if (currentUser === "") {
            popup.style.display = "block";
            event.preventDefault(); // Prevent default action
        } else {
            openCart(); // Call the function to open the cart
        }
    };

    // Define the function to open the cart
    function openCart() {
        // Add your code to display the cart here
        var cart = document.querySelector('.sidecart');
        cart.classList.add('open');
    }
    var closePopupBtn = document.getElementById("c");
    closePopupBtn.onclick = function(event) {
      popup.style.display = "none";
    };

    var closeCartBtn = document.getElementById("close_cart_btn");
    closeCartBtn.onclick = function(event) {
      // Code to close the side cart
      var cart = document.querySelector('.sidecart');
      cart.classList.remove('open');  // Assuming 'open' class is used for visibility
    };


});
</script>    
        </section >
        <section class="middle">
         <div class="container">
            <img class="background-image" src="./images/airmax.png" alt="Max">
            <div class="content">
                <h1> LOOKING <br> FOR <br> YOUR <br> EAR <br> BUDDY?</h1>
               <a href="./pages/NewProduct.jsp"> <button class="mid">Buy</button></a>
            </div>
        </div></section>
        <section id='product'>
    <header>
        <h1 class="h1p">AirPods</h1>
      </header>
      <div class="airpod">
 
        <div class="airpod1">
          <img src="./images/airpods_2nd_gen-removebg-preview.png" alt="AirPods 2nd generation">
          <h2 class="h2p">AirPods 2nd Generation</h2>
          <p>$129</p>
          <a href= "pages/p.jsp">
          <button>Buy</button></a>
        </div>
        
        <div class="airpod2">
          <img src="./images/airpods 3rd gen.jpg" alt="AirPods 3rd generation">
          <h2 class="h2p">AirPods 3rd Generation</h2>
          <p>$169</p>
          <a href= "pages/third.jsp">
          <button>Buy</button></a>
        </div>
        <div class="airpod3">
          <img src="./images/airpods 3rd gen.jpg" alt="AirPods 2nd generation (USB-C)">
          <h2 class="h2p">AirPods 2nd Generation (USB-C)</h2>
          <p>$249</p>
          <a href= "pages/pro.jsp">
          <button>Buy</button></a>
        </div>
        <div class="airpod4">
          <img src="./images/airmax.png" alt="AirPods Max">
          <h2 class="h2p">AirPods Max</h2>
          <p>$549</p>
          <a href= "pages/max.jsp">
          <button>Buy</button></a>
        </div>
        </div>
        </section>
     
      <footer>
        <p>&copy; Earbuddies</p>
        <p>Follow us: @Earbuddies</p>
        <p>Contact:</p>
         <a href="./pages/ContactUs.jsp"><button class="num"><p>Phone Number: +9777 98******</p></button><br></a>
         <a href="./pages/ContactUs.jsp"><button class="ema"><p>Email: earbuddies@gmail.com</p></button></a>
      </footer>
    </body>
    </html>