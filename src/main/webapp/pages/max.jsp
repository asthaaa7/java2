<%@page import=" utils.StringUtils, javax.imageio.*, java.util.Base64"%>

    <%

String contextPath = request.getContextPath();

    HttpSession userSession  = request.getSession();

	String email= (String) userSession.getAttribute(StringUtils.Email);

	 String currentUser = (String) userSession.getAttribute("email");

	

%>

<html lang="en" dir="ltr">



<head>

  <meta name="viewport" content="width=device-width, initial-scale=1">



  <link rel="stylesheet" href="../stylesheets/style.css">
  <style>
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

    margin-left: 150px;

}

.search{

    margin-top: 15px;

    margin-left: 400px;

   

    padding-left: 10px;

    height: 30px;

    font-family: Arial, Helvetica, sans-serif ;

}

.sb{
   margin-top: 15px;
   margin-bottom: 15px;
   background-color:#4E7FB0;
   color:white;
   padding:7px;
   
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

    margin-left: 30px;

    margin-top: 13px;

    

}

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



        <img src="../images/1.png" class="img">



        <div class="sear">


<form action = " ../Search" method = "get">
            <input class="search" type="search" name="search" >
            <button class="sb" type="submit">Search</button>
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
    			<button id="open_cart_btn">
        
            <img src="../images/cart.png" style="width: 30px;">
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
    
                    <img src="../images/cart.png" style ="width:40px" />
                    <div class="header_title">
                        <h2>Your Cart</h2>
    
                        </div>
    
                    <span id="close_cart_btn" class="close_btn">&times;</span>
                </div>
               
    
    
                   
                    <div class="cart_items">
                        <div class="item_img">
                            <img src="./images/airpods pro 2nd gen.jpg">
                        </div>
                        <div class="items_details">
                            <p>Airpods Pro 2nd Generation</p>
                            <strong> Rs $129 </strong>
                        </div>
    
                        
                    </div>
    
                    <div class="cart_items">
                        <div class="item_img">
                            <img src="./images/airpods 3rd gen.jpg">
                        </div>
                        <div class="items_details">
                            <p>Airpods Pro 3rd Generation</p>
                            <strong> Rs $169 </strong>
                        </div>
    
                        
                    </div>
    
                    <div class="cart_items">
                        <div class="item_img">
                            <img src="./images/airmax.png">
                        </div>
                        <div class="items_details">
                            <p>Air Pod Max </p>
                            <strong> Rs $549 </strong>
                        </div>
    
                        
                    </div>
    
    
    
    
                    <div class="cart_action">
                    <div class="subtotal">
                        
    
    
    
                    </div>
                    
                    <button>Checkout</button>
                    </div>
    
    </div>
    </div>







        <img src="../images/2.jpg" class="account">



    </div>



</section>
<section>
    <div class="container">
      <div class="left">
        <div class="main_image">
          <img src="../images/airmax.png" class="slide">
        </div>
        <div class="option flex">
          <img src="../images/airmax.png" onclick="img('../images/airmax.png')">
          <img src="../images/4p1.png" onclick="img('../images/4p1.png')">
          <img src="../images/4p2.png" onclick="img('../images/4p2.png')">
          <img src="../images/4p3.png" onclick="img('../images/4p3.png')">
          
        </div>
      </div>
      <div class="right">
        <h3>AirPods Max</h3>
        <h4> <small>$</small>549 </h4>
        <p>From cushion to canopy, AirPods Max are designed for an uncompromising fit that creates the optimal acoustic seal for many different head shapes — fully immersing you in every sound. The canopy spanning the headband is made from a breathable knit mesh, distributing weight to reduce on‑head pressure. </p>
        
        
        
        <div class="add flex1">
          
        </div>
        <form action="<%=contextPath%>/uploadCart" method='post'>
				<input type='hidden' value="6" name="product_id">
				<input type='hidden' value="<%=email %>" name="email">
				<h5>Quantity</h5>
				<input type='text' name="quantity">
				
		        <button type='submit' id = "addToCartBtn" class="hi">Add to Cart</button>
		
		</form>



            <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close">&times;</span>
                    <h3>Please Log in! to add to cart.</h3>
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



        </div>



    </div>



</section>







<script>



document.addEventListener("DOMContentLoaded", function() {



    // Get the popup element



    var popup = document.getElementById("popup");







    // Get the button that opens the popup



    var popupBtn = document.getElementById("addToCartBtn");







    // Get the form element



    var form = document.getElementById("cartForm");







    // Get the current user from the server-side



    var currentUser = '<%= currentUser == null ? "" : currentUser %>';







    // Open the popup when the button is clicked



    popupBtn.onclick = function(event) {



        if (currentUser === "") {



            popup.style.display = "block";



            event.preventDefault(); // Prevent default form submission



        }



    };







    // Close the popup when the close button is clicked



    var closeBtn = document.querySelector('.close');



    closeBtn.onclick = function() {



        popup.style.display = "none";



    };







    // Close the popup when the user clicks outside the popup



    window.onclick = function(event) {



        if (event.target == popup) {



            popup.style.display = "none";



        }



    };



});



</script>

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





 

        

</body>



</html>