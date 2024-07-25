<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
    <style>
body
{

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

.button{
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

</style>
    </head>
        
        <body>
            <form>
            <div class="Nav">
            <img src="1.png" class="img">
            <div class="sear">
            <input class="search" type="search" >
            <button class="sb" type="submit" name="search">Search</button>
            </div>
            <button class="login" name="login" type="submit">Login</button> 
            <img src="./images/2.jpg" class="account">
            <img src="./images/cart">
            </div>

            <div>
            <p class="Airpod"> Air <br>
                Pods<br>
                Pro
                </p>
            <div class="photo">
            <img src="3.png"  height="400px" width="400px">
            </div>
            </div>

            <div>
                <p class="Small"> Air <br>
                    Pods <br>
                    Pro </p>

                <p class="text"> Adaptive EQ that tunes<br>
                    music to your ear, and<br>
                    delivers an experience<br>
                    that’s simply magical.<br>

                </p>

                <button class="button">Shop Now</button>

                <img src="4.webp" class="charge" height="350px" width="350px">
            </div>
        </form>

            

            </body>
        
</html>

