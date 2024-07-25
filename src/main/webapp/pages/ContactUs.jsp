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
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #888;
    width: 30%;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
  }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
.Nav{
    background-color: #0C193B;
    
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
.head{

    text-align: center;
    font-size: 50px;
    
}
.one{
    background-color: #D9D9D9;
    display: flex;
}

.two{
    margin-top: 30px;
    background-color: #D9D9D9;
    display: flex;
}
.three{
    margin-top: 30px;
    background-color: #D9D9D9;
    display: flex;
}

.four{
    margin-top: 30px;
    background-color: #D9D9D9;
    display: flex;

}

.five{
    margin-top: 30px;
    background-color: #D9D9D9;
    display: flex;
}
.twoimg{
    padding-left: 1000px;
    position: absolute;
    padding-top: 20px;
}
.s{
  padding-left: 300px;
}
.q{
    padding-left: 200px;
}
.oneimg{
    padding-top: 20px;
    padding-left: 150px;
    position: absolute;
}

.lbl{
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 500;
    color: #555;
}

.lbl2{
    display: block;
  margin-bottom: 0.5rem;
  font-weight: 500;
  color: #555;
  margin-top:10px;

}
.firstL {
    width: 80%; /* Adjust the width as needed */
    padding: 0.75rem;
    border: 1px solid #ccc;
    border-radius: 0.25rem;
    font-family: inherit;
    font-size: 1rem;
    background-color: #f9f9f9;
    transition: border-color 0.3s ease;
    margin: 0 auto; /* Add this line to center the input field horizontally */
}

.secondL {
    width: 80%; /* Adjust the width as needed */
    padding: 0.75rem;
    border: 1px solid #ccc;
    border-radius: 0.25rem;
    font-family: inherit;
    font-size: 1rem;
    background-color: #f9f9f9;
    transition: border-color 0.3s ease;
    height: 200px;
    margin: 0 auto; /* Add this line to center the input field horizontally */
}
.AboutUs{
    display: block;
    width: 100%;
    padding: 0.75rem;
    background-color: #0C193B;
    color: #fff;
    border: none;
    border-radius: 0.25rem;
    font-family: inherit;
    font-size: 1rem;
    font-weight: 500;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin-top: 10px;

}
.success {
    position: fixed;
    top: 20px; /* Adjust as needed */
    left: 50%;
    transform: translateX(-50%);
    background-color: rgb(106, 168, 126);
    padding: 10px;
    display: none; /* Hide by default */
    border-radius: 5px;
    border-left: 6px solid rgb(28, 78, 28);
    z-index: 999; /* Ensure it appears on top of other elements */
}
.error {
    position: fixed;
    top: 20px; /* Adjust as needed */
    left: 50%;
    transform: translateX(-50%);
    background-color: red;
    padding: 10px;
    display: none; /* Hide by default */
    border-radius: 5px;
    
    z-index: 999; /* Ensure it appears on top of other elements */
}
.Sujal1{
	
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    border: none;
    background: none;
    padding: 0;
    margin: 0;
}
.Sujal2{
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    border: none;
    background: none;
    padding: 0;
    margin: 0;
}
.Baishali1{
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    border: none;
    background: none;
    padding: 0;
    margin: 0;
}.Baishali2{
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    border: none;
    background: none;
    padding: 0;
    margin: 0;
    margin-bottom:20px;
}
.Aliya1{
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    border: none;
    background: none;
    padding: 0;
    margin: 0;
}.Aliya2{
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    border: none;
    background: none;
    padding: 0;
    margin: 0;
}
.Astha1{
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    border: none;
    background: none;
    padding: 0;
    margin: 0;
}.Astha2{
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    border: none;
    background: none;
    padding: 0;
    margin: 0;
}
.Rashi1{
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    border: none;
    background: none;
    padding: 0;
    margin: 0;
}.Rashi2{
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    border: none;
    background: none;
    padding: 0;
    margin: 0;
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
    			
    </div>







        <img src="../images/2.jpg" class="account">



    


</section>
    
    <p class="head">ABOUT US</p>

    <div class="one">
        <div class="oneimg">
            <img src="../images/8.png" height="130px" width="130px">
        </div>
        <div class="s">
            <h1>Sujal Nakarmi</h1>
            <p>You can contact me by clicking on my phone and email. Feel Free to Ask!</p>
<!---------------------------------------------------------------------- Sujal Contact 1 ------------------------------------->
           	<button class="Sujal1" id="popupBtn"><p>+977 9810394967</p></button><br>
           	
            <%
        String msg = request.getParameter("msg");
        if ("valid".equals(msg))
        {
        %>
        <div class="success">
        <h3> Message Successfully Sent. Our Team Will Contact You Soon! </h3>
        </div>
        <% } %>
        <%
      
        if ("invalid".equals(msg))
        {
        %>
        <div class="error">
        <h3> An Error Occurred! Please Try Again. </h3>
        </div>
        <% } %>
        
          
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close">&times;</span>
                    <h1>Enter Your Query</h1>
                    <form action="../Contact" method="post">
                        <div class="form-group">
                            <label for="email" class="lbl">Email Address</label>
                            <input class="firstL" id="email" name="email" placeholder="Enter your email" required>
                        </div>
                        <div class="form-group">
                            <label class="lbl2" for="email">Message</label>
                            <input class="secondL" id="email" name="message" placeholder="Enter your message" >
                        </div>
                        <button id="zod" class="AboutUs" type="submit">Submit</button>
                    </form>
                </div>
            </div>
<!---------------------------------------------------------------------- Sujal Contact 2 ------------------------------------->         
            <button class="Sujal2"id="SujalEmail"><p>nakarmisujal@gmail.com</p></button>
            <%
        String sujalemail = request.getParameter("msg");
        if ("valid".equals(msg))
        {
        %>
        <div class="success">
        <h3> Message Successfully Sent. Our Team Will Contact You Soon! </h3>
        </div>
        <% } %>
        <%
      
        if ("invalid".equals(msg))
        {
        %>
        <div class="error">
        <h3> An Error Occurred! Please Try Again. </h3>
        </div>
        <% } %>
        <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close">&times;</span>
                    <h1>Enter Your Query</h1>
                    <form action="../Contact" method="post">
                        <div class="form-group">
                            <label for="email" class="lbl">Email Address</label>
                            <input class="firstL" id="email" name="email" placeholder="Enter your email" required>
                        </div>
                        <div class="form-group">
                            <label class="lbl2" for="email">Message</label>
                            <input class="secondL" id="email" name="message" placeholder="Enter your message" >
                        </div>
                        <button id="zod" class="AboutUs" type="submit">Submit</button>
                    </form>
                </div>
            </div>
          
            
        </div>
    </div>
    
    <!---------------------------------------------------------------------- Biaishali Contact 1 ------------------------------------->
    <div class="two">
    <div class="twoimg">
    <img src="../images/6.png" height="150px" width="150px" >
    </div>
    <div class="q">
    <h1> Baishali Maharjan</h1>
    <p>You can contact me by clicking on my phone and email. Feel Free to Ask!</p><br><br>    
        
    
         <button class="Baishali1" id="BaishaliPhone"><p>+ 977 9842976999</p></button><br>
         
        <!---------------------------------------------------------------------- Baishali Contact 2 ------------------------------------->
        <button class="Baishali2" id="BaishaliMail">baishalima7@gmail.com</button>
         
          
            
    
   
    
        
   
   
    </div>
</div>

<div class="three">
    <div class="oneimg">
    <img src="../images/9.png" height="130px" width="130px" >
    </div>
    <div class="s">
    <h1> Aliya Manandhar</h1>
    <p>You can contact me by clicking on my phone and email. Feel Free to Ask!</p>
	<!---------------------------------------------------------------------- Aliya Contact 1 ------------------------------------->   
    <button class="Aliya1" id="AliyaPhone"><p>+977 9841216969</p></button><br>
   
    <!---------------------------------------------------------------------- Aliya Contact 2 ------------------------------------->
    <button class="Aliya2" id="AliyaMail"><p>manandharaliya@gmail.com</p></button>
    
    </div>
</div>

<div class="four">
    <div class="twoimg">
    <img src="../images/10.png" height="150px" width="150px" >
    </div>
    <div class="q">
    <h1> Aastha Ghimire</h1>
    <p>You can contact me by clicking on my phone and email. Feel Free to Ask!</p><br><br>  
     <!---------------------------------------------------------------------- Aastha Contact 1 ------------------------------------->    
    <button class="Astha1" id="AsthaPhone"><p>+977 9849757125</p></button><br>
    
    
    <!---------------------------------------------------------------------- Aastha Contact 1 -------------------------------------> 
    <button class="Astha2" id = "AsthaMail"><p>asthatg12@gmail.com</p></button>
    
    </div>
</div>
    <!---------------------------------------------------------------------- Sujal Contact 1 ------------------------------------->
<div class="five">
    <div class="oneimg">
    <img src="../images/11.png" height="130px" width="130px" >
    </div>
    <div class="s">
    <h1>Rashi Maharjan</h1>
    <p>You can contact me by clicking on my phone and email. Feel Free to Ask!</p>
        <!---------------------------------------------------------------------- Rashi Contact 1 ------------------------------------->
    <button class="Rashi1" id="RashiPhone"><p>+977 9813641255</p></button><br>
    <!---------------------------------------------------------------------- Rashi Contact 1 ------------------------------------->
    <button class="Rashi2" id="RashiMail"><p>maharjanrashi@gmail.com</p></button>
    </div>
</div>

    <script>
    // Get the popup element for Sujal Contact 1
    var popup = document.getElementById("popup");
    // Get the button that opens the popup for Sujal Contact 1
    var popupBtn = document.getElementById("popupBtn");
    // Get the <span> element that closes the popup for Sujal Contact 1
    var closeBtn = document.getElementsByClassName("close")[0];

    // Open the popup when the button is clicked for Sujal Contact 1
    popupBtn.onclick = function() {
        popup.style.display = "block";
    }

    // Close the popup when the close button is clicked for Sujal Contact 1
    closeBtn.onclick = function() {
        popup.style.display = "none";
    }

    // Close the popup when the user clicks outside the popup for Sujal Contact 1
    window.onclick = function(event) {
        if (event.target == popup) {
            popup.style.display = "none";
        }
    }

    // Check if the success message should be displayed for Sujal Contact 1
    var msg = "<%= request.getParameter("msg") %>";
    if (msg === "valid") {
        document.querySelector('.success').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.success').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    } else if (msg === "invalid") {
        document.querySelector('.error').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.error').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    }
    </script>
    
    <!---------------------------------------------------------------- Sujal Contact 2 ------------------------------------->
     <script>
    // Get the popup element for Sujal Contact 1
    var popup = document.getElementById("popup");
    // Get the button that opens the popup for Sujal Contact 1
    var popupBtn = document.getElementById("SujalEmail");
    // Get the <span> element that closes the popup for Sujal Contact 1
    var closeBtn = document.getElementsByClassName("close")[0];

    // Open the popup when the button is clicked for Sujal Contact 1
    popupBtn.onclick = function() {
        popup.style.display = "block";
    }

    // Close the popup when the close button is clicked for Sujal Contact 1
    closeBtn.onclick = function() {
        popup.style.display = "none";
    }

    // Close the popup when the user clicks outside the popup for Sujal Contact 1
    window.onclick = function(event) {
        if (event.target == popup) {
            popup.style.display = "none";
        }
    }

    // Check if the success message should be displayed for Sujal Contact 1
    var msg = "<%= request.getParameter("msg") %>";
    if (msg === "valid") {
        document.querySelector('.success').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.success').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    } else if (msg === "invalid") {
        document.querySelector('.error').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.error').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    }
    </script>
    
    <!---------------------------------------------------------------------- Baishali Contact 1 ------------------------------------->

    <script>
    // Get the popup element for Sujal Contact 1
    var popup = document.getElementById("popup");
    // Get the button that opens the popup for Sujal Contact 1
    var popupBtn = document.getElementById("BaishaliPhone");
    // Get the <span> element that closes the popup for Sujal Contact 1
    var closeBtn = document.getElementsByClassName("close")[0];

    // Open the popup when the button is clicked for Sujal Contact 1
    popupBtn.onclick = function() {
        popup.style.display = "block";
    }

    // Close the popup when the close button is clicked for Sujal Contact 1
    closeBtn.onclick = function() {
        popup.style.display = "none";
    }

    // Close the popup when the user clicks outside the popup for Sujal Contact 1
    window.onclick = function(event) {
        if (event.target == popup) {
            popup.style.display = "none";
        }
    }

    // Check if the success message should be displayed for Sujal Contact 1
    var msg = "<%= request.getParameter("msg") %>";
    if (msg === "valid") {
        document.querySelector('.success').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.success').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    } else if (msg === "invalid") {
        document.querySelector('.error').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.error').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    }
    </script>
    
    <!---------------------------------------------------------------- Baishali Contact 2 ------------------------------------->
     <script>
    // Get the popup element for Sujal Contact 1
    var popup = document.getElementById("popup");
    // Get the button that opens the popup for Sujal Contact 1
    var popupBtn = document.getElementById("BaishaliMail");
    // Get the <span> element that closes the popup for Sujal Contact 1
    var closeBtn = document.getElementsByClassName("close")[0];

    // Open the popup when the button is clicked for Sujal Contact 1
    popupBtn.onclick = function() {
        popup.style.display = "block";
    }

    // Close the popup when the close button is clicked for Sujal Contact 1
    closeBtn.onclick = function() {
        popup.style.display = "none";
    }

    // Close the popup when the user clicks outside the popup for Sujal Contact 1
    window.onclick = function(event) {
        if (event.target == popup) {
            popup.style.display = "none";
        }
    }

    // Check if the success message should be displayed for Sujal Contact 1
    var msg = "<%= request.getParameter("msg") %>";
    if (msg === "valid") {
        document.querySelector('.success').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.success').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    } else if (msg === "invalid") {
        document.querySelector('.error').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.error').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    }
    </script>
    <!---------------------------------------------------------------------- Aliya Contact 1 ------------------------------------->

    <script>
    // Get the popup element for Sujal Contact 1
    var popup = document.getElementById("popup");
    // Get the button that opens the popup for Sujal Contact 1
    var popupBtn = document.getElementById("AliyaPhone");
    // Get the <span> element that closes the popup for Sujal Contact 1
    var closeBtn = document.getElementsByClassName("close")[0];

    // Open the popup when the button is clicked for Sujal Contact 1
    popupBtn.onclick = function() {
        popup.style.display = "block";
    }

    // Close the popup when the close button is clicked for Sujal Contact 1
    closeBtn.onclick = function() {
        popup.style.display = "none";
    }

    // Close the popup when the user clicks outside the popup for Sujal Contact 1
    window.onclick = function(event) {
        if (event.target == popup) {
            popup.style.display = "none";
        }
    }

    // Check if the success message should be displayed for Sujal Contact 1
    var msg = "<%= request.getParameter("msg") %>";
    if (msg === "valid") {
        document.querySelector('.success').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.success').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    } else if (msg === "invalid") {
        document.querySelector('.error').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.error').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    }
    </script>
    
    <!---------------------------------------------------------------- Aliya Contact 2 ------------------------------------->
     <script>
    // Get the popup element for Sujal Contact 1
    var popup = document.getElementById("popup");
    // Get the button that opens the popup for Sujal Contact 1
    var popupBtn = document.getElementById("AliyaMail");
    // Get the <span> element that closes the popup for Sujal Contact 1
    var closeBtn = document.getElementsByClassName("close")[0];

    // Open the popup when the button is clicked for Sujal Contact 1
    popupBtn.onclick = function() {
        popup.style.display = "block";
    }

    // Close the popup when the close button is clicked for Sujal Contact 1
    closeBtn.onclick = function() {
        popup.style.display = "none";
    }

    // Close the popup when the user clicks outside the popup for Sujal Contact 1
    window.onclick = function(event) {
        if (event.target == popup) {
            popup.style.display = "none";
        }
    }

    // Check if the success message should be displayed for Sujal Contact 1
    var msg = "<%= request.getParameter("msg") %>";
    if (msg === "valid") {
        document.querySelector('.success').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.success').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    } else if (msg === "invalid") {
        document.querySelector('.error').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.error').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    }
    </script>
    
    <!---------------------------------------------------------------------- AASTHA Contact 1 ------------------------------------->

    <script>
    // Get the popup element for Sujal Contact 1
    var popup = document.getElementById("popup");
    // Get the button that opens the popup for Sujal Contact 1
    var popupBtn = document.getElementById("AsthaPhone");
    // Get the <span> element that closes the popup for Sujal Contact 1
    var closeBtn = document.getElementsByClassName("close")[0];

    // Open the popup when the button is clicked for Sujal Contact 1
    popupBtn.onclick = function() {
        popup.style.display = "block";
    }

    // Close the popup when the close button is clicked for Sujal Contact 1
    closeBtn.onclick = function() {
        popup.style.display = "none";
    }

    // Close the popup when the user clicks outside the popup for Sujal Contact 1
    window.onclick = function(event) {
        if (event.target == popup) {
            popup.style.display = "none";
        }
    }

    // Check if the success message should be displayed for Sujal Contact 1
    var msg = "<%= request.getParameter("msg") %>";
    if (msg === "valid") {
        document.querySelector('.success').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.success').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    } else if (msg === "invalid") {
        document.querySelector('.error').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.error').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    }
    </script>
    
    <!---------------------------------------------------------------- AASTHA Contact 2 ------------------------------------->
     <script>
    // Get the popup element for Sujal Contact 1
    var popup = document.getElementById("popup");
    // Get the button that opens the popup for Sujal Contact 1
    var popupBtn = document.getElementById("AsthaMail");
    // Get the <span> element that closes the popup for Sujal Contact 1
    var closeBtn = document.getElementsByClassName("close")[0];

    // Open the popup when the button is clicked for Sujal Contact 1
    popupBtn.onclick = function() {
        popup.style.display = "block";
    }

    // Close the popup when the close button is clicked for Sujal Contact 1
    closeBtn.onclick = function() {
        popup.style.display = "none";
    }

    // Close the popup when the user clicks outside the popup for Sujal Contact 1
    window.onclick = function(event) {
        if (event.target == popup) {
            popup.style.display = "none";
        }
    }

    // Check if the success message should be displayed for Sujal Contact 1
    var msg = "<%= request.getParameter("msg") %>";
    if (msg === "valid") {
        document.querySelector('.success').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.success').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    } else if (msg === "invalid") {
        document.querySelector('.error').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.error').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    }
    </script>
    <!---------------------------------------------------------------------- Rashi Contact 1 ------------------------------------->

    <script>
    // Get the popup element for Sujal Contact 1
    var popup = document.getElementById("popup");
    // Get the button that opens the popup for Sujal Contact 1
    var popupBtn = document.getElementById("RashiPhone");
    // Get the <span> element that closes the popup for Sujal Contact 1
    var closeBtn = document.getElementsByClassName("close")[0];

    // Open the popup when the button is clicked for Sujal Contact 1
    popupBtn.onclick = function() {
        popup.style.display = "block";
    }

    // Close the popup when the close button is clicked for Sujal Contact 1
    closeBtn.onclick = function() {
        popup.style.display = "none";
    }

    // Close the popup when the user clicks outside the popup for Sujal Contact 1
    window.onclick = function(event) {
        if (event.target == popup) {
            popup.style.display = "none";
        }
    }

    // Check if the success message should be displayed for Sujal Contact 1
    var msg = "<%= request.getParameter("msg") %>";
    if (msg === "valid") {
        document.querySelector('.success').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.success').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    } else if (msg === "invalid") {
        document.querySelector('.error').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.error').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    }
    </script>
    
    <!---------------------------------------------------------------- Rashi Contact 2 ------------------------------------->
     <script>
    // Get the popup element for Sujal Contact 1
    var popup = document.getElementById("popup");
    // Get the button that opens the popup for Sujal Contact 1
    var popupBtn = document.getElementById("RashiMail");
    // Get the <span> element that closes the popup for Sujal Contact 1
    var closeBtn = document.getElementsByClassName("close")[0];

    // Open the popup when the button is clicked for Sujal Contact 1
    popupBtn.onclick = function() {
        popup.style.display = "block";
    }

    // Close the popup when the close button is clicked for Sujal Contact 1
    closeBtn.onclick = function() {
        popup.style.display = "none";
    }

    // Close the popup when the user clicks outside the popup for Sujal Contact 1
    window.onclick = function(event) {
        if (event.target == popup) {
            popup.style.display = "none";
        }
    }

    // Check if the success message should be displayed for Sujal Contact 1
    var msg = "<%= request.getParameter("msg") %>";
    if (msg === "valid") {
        document.querySelector('.success').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.success').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    } else if (msg === "invalid") {
        document.querySelector('.error').style.display = 'block';
        setTimeout(function() {
            document.querySelector('.error').style.display = 'none';
        }, 3000); // 3000 milliseconds = 3 seconds
    }
    </script>
    
</body>
</html>