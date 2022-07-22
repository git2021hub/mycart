
<%@page import="com.learn.mycart.entities.User"%>
<%
   User user2=(User)session.getAttribute("current-user");
   if(user2 == null){
        session.setAttribute("message", "You Are Not Logged in !! Login First");
        response.sendRedirect("login.jsp");
        return;
    }else {
           if(user2.getUserType().equals("normal")){
           session.setAttribute("message", "You are Not Admin ! Do not access for this page");
           response.sendRedirect("login.jsp");
           return;
    }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container admin">
            
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
           <div class="row mt-3">
            
                <!<!-- first col -->
            
            <div class="col-md-4">
                  <!-- first Box -->
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img  style="max-width: 120px" class="img-fluid rounded-circle" src="image/man.png" alt="user_icon">
                        </div>
                        <h1>212</h1>
                        <h1 class="text-uppercase text-muted">Users</h1>
                    </div>
                </div>
            </div>
            
                <!<!-- second col -->
            
                <div class="col-md-4">
                    <!-- second Box -->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                            <img  style="max-width: 120px" class="img-fluid rounded-circle" src="image/categories.png" alt="user_icon">
                        </div>
                            <h1>232</h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>  
                
                <!-- third col -->
             <div class="col-md-4">
                 <!-- third Box -->
                 <div class="card "> 
                    <div class="card-body text-center">
                        <div class="container">
                            <img  style="max-width: 120px" class="img-fluid rounded-circle" src="image/product.png" alt="user_icon">
                        </div>
                        <h1>323</h1>
                        <h1 class="text-uppercase text-muted">Products</h1>
                    </div>
                </div>
            </div>
       </div> 
            
            <!-- second Row -->
            <div class="row mt-3">
                <!-- first col -->
                <div class="col-md-6"> 
                    <div class="card" data-toggle="modal" data-target="#add-category-modal"> 
                       <div class="card-body text-center">
                            <div class="container">
                                <img  style="max-width: 120px" class="img-fluid rounded-circle" src="image/box.png" alt="user_icon">
                            </div>
                           <h6 class="mt-2">Click here to add new category</h6>
                            <h2 class="text-uppercase text-muted">Add Categories</h2>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-6">
                    <div class="card"  data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img  style="max-width: 120px " class="img-fluid rounded-circle" src="image/brand-identity.png" alt="user_icon">
                                <h6 class="mt-2">click here to add new product</h6>
                            <h2 class="text-uppercase text-muted">Add Products</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        
        
        <!-- Add category model -->

        

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        
                        <form action="ProductOperationServlet" method="post">
                           
                            <input type="hidden" name="operation" value="addcategory">
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required/>
                            </div>
                            
                            <div class="form-group">
                                <textarea style="height: 300px"  class="form-control" placeholder="Enter Category Description" name="catDescription" required></textarea>
                            </div>
                             
                            <div class="container text-center">
                                <button  class="btn btn-outline-success">Add Category</button>

                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>
                        </form>
                    
                </div>
            </div>
        </div>
        </div>    
        <!-- End Addcategory model -->





   <!-- Add Produdct model -->

        

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        
                        <form>
                            <div class="form-group">
                                <input type="text" class="form-control" name="prodTitle" placeholder="Enter Product Name" required/>
                            </div>
                            
                            <div class="form-group">
                                <textarea style="height: 200px"  class="form-control" placeholder="Enter Product Description" name="prodDescription" required></textarea>
                            </div>
                            <div class="form-group">
      
                                <input type="image" src="" alt="Submit" width="48" height="48">
                            </div>
                            <div>
                                <input type="number" name="prodprice" class="form-control" placeholder="Enter Product Amount" required/>
                            </div>
                            
                            <div>
                                 <input type="number" name="prodDiscount" class="form-control" placeholder="Enter Product Discount" required/>
                            </div>
                            
                            <div>
                                 <input type="number" name="prodQuantity" class="form-control" placeholder="Enter Product Quantity" required/>
                            </div>
                            <div class="container text-center">
                                <button type="button" class="btn btn-outline-success">Add Product</button>

                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>
                        </form>
                    
                </div>
            </div>
        </div> 
        </div>
        <!-- End Add Product model -->
    </body>
    </html>


