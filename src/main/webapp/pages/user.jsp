<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="../stylesheets/admin.css">

    <title>Inventory Management</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    

</head>

<body>

<div class="bar">

    <div class="header">

        <button>Log Out</button>

    </div>

    <div class="pachadi" >  

    	<h2 style=" color: white;">Order Product Table</h2>

        <table class="secondT">



            <tr >

                <th style="background-color: black; color: #f1f1f1;">Order ID</th>

                <th style="background-color: black; color: #f1f1f1;">Product ID</th>

                <th style="background-color: black; color: #f1f1f1;">Customer ID</th>

                <th style="background-color: black; color: #f1f1f1;">Quantity</th>

                <th style="background-color: black; color: #f1f1f1;">Total Price</th>

                <th style="background-color: black; color: #f1f1f1;">Actions</th>

                

            </tr>

            <tr>

                <td>1010</td>

                <td>1</td>

                <td>23</td>

                <td>5</td>

                <td>100</td>

                <td> <a href="" style="text-decoration:none; margin-right:10px"><i class="fa-solid fa-eye"></i> </a> <a href="" style="text-decoration:none;"><i class="fa-solid fa-pen"></i> </a>  </td>

            </tr>

            <tr>

                <td>1011</td>

                <td>2</td>

                <td>24</td>

                <td>2</td>

                <td>200</td>

                <td> <a href="" style="text-decoration:none; margin-right:10px"><i class="fa-solid fa-eye"></i> </a> <a href="" style="text-decoration:none;"><i class="fa-solid fa-pen"></i> </a>  </td>

            </tr>

            <tr>

                <td>1012</td>

                <td>3</td>

                <td>25</td>

                <td>3</td>

                <td>800</td>

                <td><a href="" style="text-decoration:none; margin-right:10px"><i class="fa-solid fa-eye"></i> </a> <a href="" style="text-decoration:none;"><i class="fa-solid fa-pen"></i> </a>  </td>

            </tr>

            <tr>

                <td>1013</td>

                <td>4</td>

                <td>26</td>

                <td>22</td>

                <td>300</td>

                <td><a href="" style="text-decoration:none; margin-right:10px"><i class="fa-solid fa-eye"></i> </a> <a href="" style="text-decoration:none;"><i class="fa-solid fa-pen"></i> </a>  </td>

            </tr>

        </table>

        	

        	<h2 style=" color:white;">Product Table</h2>

            <table class="secondT">

            <tr >

                <th style="background-color: black; color: #f1f1f1;">Order ID</th>

                <th style="background-color: black; color: #f1f1f1;">Order Address</th>

                <th style="background-color: black; color: #f1f1f1;">Actions</th>

                

            </tr>

            <tr>

                <td>1010</td>

                <td>Bhaktapur</td>

           		<td> <a href="" style="text-decoration:none; margin-right:10px "> <i class="fa-solid fa-eye"></i> </a>   <a href="" style="text-decoration:none;"><i class="fa-solid fa-pen"></i> </a>  </td>

            </tr>

            <tr>

               <td>1011</td>

                <td>Bhaktapur</td>

           		<td><a href="" style="text-decoration:none; margin-right:10px"><i class="fa-solid fa-eye"></i> </a> <a href="" style="text-decoration:none;"><i class="fa-solid fa-pen"></i> </a>  </td>

            </tr>

            <tr>

               <td>1012</td>

                <td>Bhaktapur</td>

           		<td><a href="" style="text-decoration:none; margin-right:10px"><i class="fa-solid fa-eye"></i> </a> <a href="" style="text-decoration:none;"><i class="fa-solid fa-pen"></i> </a>  </td>

            </tr>

            <tr>

               <td>1013</td>

                <td>Bhaktapur</td>

           		<td> <a href="" style="text-decoration:none; margin-right:10px"><i class="fa-solid fa-eye"></i> </a> <a href="" style="text-decoration:none;"><i class="fa-solid fa-pen"></i> </a>  </td>

            </tr>

        </table>

    </div>

</div>

<div class="sidebar">

    <div class="logo"></div>

    <ul class="menu">

        <li>

            <a href="admin.jsp">

                <span> Dashboard</span>

            </a>

        </li>



        <li>

            <a href="product.jsp">

                <span> Product Management</span>

            </a>

        </li> 



        <li>

            <a href="#">

                <span> User Management</span>

            </a>

        </li>

    </ul>

</div>

   

</body>

</html>
