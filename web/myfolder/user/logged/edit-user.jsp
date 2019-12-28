<%-- 
    Document   : test
    Created on : Jul 1, 2019, 5:57:00 PM
    Author     : LEGION
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../template/user-libary.jsp"/>
        <link rel="icon" type="image/png" href="/PetShopOnlinePRJ/myfolder/user/tableUser/images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/PetShopOnlinePRJ/myfolder/user/tableUser/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/PetShopOnlinePRJ/myfolder/user/tableUser/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/PetShopOnlinePRJ/myfolder/user/tableUser/vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/PetShopOnlinePRJ/myfolder/user/tableUser/vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/PetShopOnlinePRJ/myfolder/user/tableUser/vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/PetShopOnlinePRJ/myfolder/user/tableUser/css/util.css">
        <link rel="stylesheet" type="text/css" href="/PetShopOnlinePRJ/myfolder/user/tableUser/css/main.css">


    </head>
    <body>
        <jsp:include page="../template/user-Info-bar.jsp"/>
        <jsp:include page="../template/user-header.jsp"/>
        <div class="container">
            <br/>
            <h1>Edit Profile</h1>
            <hr>
            <div class="row">
                <!-- left column -->
                <div class="col-md-3">
                    <div class="text-center">
                        <img src="../template/logo-small.png" class="avatar img-circle" alt="avatar" height="250">         
                    </div>
                </div>

                <!-- edit form column -->
                <div class="col-md-9 personal-info">
                    <c:if test="${not empty sessionScope.MESSAGE}">
                        <c:if test="${not empty sessionScope.MESSAGE.message}">
                            <div class="alert alert-info alert-dismissable">
                                <a class="panel-close close" data-dismiss="alert">×</a> 
                                <i class="fa fa-coffee"></i>
                                <strong>Action complete</strong>. ${sessionScope.MESSAGE.message}
                            </div>
                            <c:remove var="MESSAGE" scope="session"/>
                        </c:if>
                        <c:if test="${not empty sessionScope.MESSAGE.error}">
                            <div class="alert alert-info alert-danger">
                                <a class="panel-close close" data-dismiss="alert">×</a> 
                                <i class="fa fa-coffee"></i>
                                <strong>Action fail</strong>. ${sessionScope.MESSAGE.error}
                            </div>
                            <c:remove var="MESSAGE" scope="session"/>
                        </c:if>
                    </c:if>
                    <h3>Personal info</h3>

                    <form class="form-horizontal" role="form" action="UserController" method="POST" oninput='confirm.setCustomValidity(confirm.value != password.value ? "Passwords do not match." : "")'>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Username:</label>
                            <div class="col-md-8">
                                <input class="form-control" type="text" value="${sessionScope.USER.username}" readonly name="username">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Password:</label>
                            <div class="col-md-8">
                                <input class="form-control" type="password" value="${sessionScope.USER.password}" required="" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Confirm password:</label>
                            <div class="col-md-8">
                                <input class="form-control" type="password" value="${sessionScope.USER.password}" name="confirm">
                            </div>
                        </div>           
                        <div class="form-group">
                            <label class="col-lg-3 control-label">First name:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" value="${sessionScope.USER.firstName}" required name="firstName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Last name:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" value="${sessionScope.USER.lastName}" required name="lastName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Email:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="email" pattern="^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$" value="${sessionScope.USER.email}" name="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Address : </label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" value="${sessionScope.USER.address}" required name="address">
                            </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Phone : </label>
                            <div class="col-lg-8">
                                <input class="form-control" type="tel" pattern="[0-9]{8,10}" placeholder="Format: 8-10 digits" value="${sessionScope.USER.phoneNum}" name="phone" required>
                            </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-md-3 control-label"></label>
                            <div class="col-md-8">
                                <input type="submit" class="btn btn-primary" value="Save Changes">
                                <span></span>
                                <input type="reset" class="btn btn-default" value="Cancel">
                            </div>
                        </div>
                        <input type="hidden" name="action" value="Update"/>
                    </form>
                </div>
            </div>
        </div>
        <hr>

        <div class="container">
            <br/>
            <h1>Pet Manager</h1>
            <hr>
            <div class="row">
                <!-- left column -->
                <div class="col-md-3">
                    <div class="text-center">

                    </div>
                </div>

                <!-- edit form column -->

                <div class="col-md-9 personal-info">
                    <div align='right'><td class="column1"><td class="column1"><button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-info">Add new pet</button></td></td></div>
                    <h3>Pet Info</h3>

                    <br/>

                    <div class="limiter">
                        <div class="container-table100">
                            <div class="wrap-table100">
                                <div class="table100">

                                    <c:if test="${not empty sessionScope.LISTPET}">


                                        <table id="myTable">
                                            <thead>
                                                <tr class="table100-head">
                                                    <th class="column2">ID</th>
                                                    <th class="column3">Name</th>
                                                    <th class="column3">Age</th>
                                                    <th class="column3">Type</th>
                                                    <th class="column3">Update</th>
                                                    <th class="column3">Remove</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${sessionScope.LISTPET}" var="items">
                                                
                                                    <tr class="products-items">
                                                        <form action="UpdatePetController" method="POST">
                                                        <td class="column2">${items.petId}</td>
                                                        <td class="column3"><input type="text" value="${items.name}" required name="name"/></td>
                                                        <td class="column3"><input type="number" min="0" max="20" value="${items.age}" required name="age" /></td>
                                                        <td class="column3"> 
                                                            <select name="typeId">
                                                                <option value="1" <c:if test="${items.typeId ==1}">selected</c:if> >Dog</option>
                                                                <option value="2" <c:if test="${items.typeId ==2}">selected</c:if>>Cat</option>
                                                                </select>
                                                            </td>
                                                            <td class="column3"><button type="submit" class="btn btn-info">Update</button></td>
                                                        <input type="hidden" name="petId" value="${items.petId}"/>
                                                    <input type="hidden" name="owner" value="${sessionScope.USER.username}"/>
                                                        </form>
                                                <td class="column3"><a href="RemovePetController?petId=${items.petId}&&owner=${sessionScope.USER.username}"><button class="btn btn-danger">Remove</button></a>  </td>
                                                
                                                    </tr>
                                            
                                                    
                                                    
                                            </c:forEach>








                                            </tbody>
                                        </table>

                                    </c:if> 
                                    <c:if test="${empty sessionScope.LISTPET}">
                                        <div class="container">
                                            <div class="My-wish-section">
                                                <section id="wish">
                                                    <div class="my-wish-content">

                                                        <div class="coats sing-c">
                                                            <p>You don't have any pet</p>
                                                        </div>

                                                    </div>
                                            </div>
                                        </div>
                                    </c:if>             
                                </div>
                            </div>
                        </div>
                    </div>
                    <br/>


                </div>
            </div>
        </div>
        <!-- Add Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Create Pet</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="AddPetController" method="POST" accept-charset="UTF-8">
                            <div class="form-group">
                                <label for="name">Pet Name</label>
                                <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" required maxlength="50">
                            </div>
                            <div class="form-group">
                                <label for="price"></span>Age</label>
                                <input type="number" class="form-control" id="price" placeholder="Enter age" name="age" required min="0" max="20">
                            </div>
                            <div class="form-group">
                                <label for="des"></span>Type</label>
                                <select name="typeId">
                                    <option value="1" <c:if test="${items.typeId ==1}">selected</c:if> >Dog</option>
                                    <option value="2" <c:if test="${items.typeId ==2}">selected</c:if>>Cat</option>
                                    </select>
                                </div>
                                <input type="hidden" name="owner" value="${sessionScope.USER.username}"/>
                            <button type="submit" class="btn btn-default btn-success btn-block">Create</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <jsp:include page="../template/user-footer.jsp"/>
        <jsp:include page="../template/user-js.jsp"/>
    </body>
</html>
