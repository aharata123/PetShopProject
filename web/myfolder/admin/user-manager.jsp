<%-- 
    Document   : dashboard
    Created on : Jun 19, 2019, 6:47:33 PM
    Author     : LEGION
--%>
<%@page import="ductn.dtos.AccessoryDTO"%>
<%@page import="ductn.constant.WebConstant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="perfect-scrollbar-on">
    <head>
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="template/admin-libary.jsp"/>

    </head>
    <body class="">
        <div class="wrapper">
            <jsp:include page="template/admin-sidebar.jsp"/>
            <div class="main-panel">
                <jsp:include page="template/admin-navbar.jsp"/>
                <div class="content">
                    <c:if test="${not empty sessionScope.MESSAGE}">
                        <c:if test="${not empty sessionScope.MESSAGE.message}">
                            <div class="alert alert-success">
                                <strong>Action Complete!</strong> ${sessionScope.MESSAGE.message}     
                                <% session.removeAttribute(WebConstant.MESSAGE);%>
                            </div>
                        </c:if>
                        <c:if test="${not empty sessionScope.MESSAGE.error}">
                            <div class="alert alert-danger">
                                <strong>Action Failed!</strong> ${sessionScope.MESSAGE.message}     
                                <% session.removeAttribute(WebConstant.MESSAGE);%>
                            </div>
                        </c:if>
                    </c:if>
                    <c:if test="${not empty requestScope.MESSAGE}">
                        <c:if test="${not empty requestScope.MESSAGE.error}">
                            <div class="alert alert-danger">
                                <strong>${requestScope.MESSAGE.error}</strong>
                            </div>
                        </c:if>                        
                    </c:if>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="s003">
                                <form action="AdminController" method="GET">
                                    <div class="inner-form">
                                        <div class="input-field second-wrap">
                                            <input id="search" type="text" placeholder="Enter Name?" name="txtSearch" value="${param.txtSearch}"/>
                                            <input type="hidden" name="action" value="SearchUser"/>
                                        </div>
                                        <div class="input-field third-wrap">
                                            <button class="btn-search" type="submit">
                                                <svg class="svg-inline--fa fa-search fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="search" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                                <path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <form action="AdminController" method="POST" id="deleteAction">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title"> User management</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class=" text-primary">
                                                <th>
                                                    Username
                                                </th>
                                                <th>
                                                    Last Name
                                                </th>
                                                <th>
                                                    First Name
                                                </th>
                                                <th>
                                                    Role
                                                </th>

                                                <th>
                                                    Address
                                                </th>
                                                <th>
                                                    Phone Number
                                                </th>
                                                <th>
                                                    Remove
                                                </th>

                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.LIST}" var="item">
                                                        <tr>
                                                            <td>
                                                                ${item.username}
                                                            </td>
                                                            <td>
                                                                ${item.lastName} 
                                                            </td>
                                                            <td>
                                                                ${item.firstName}
                                                            </td>
                                                            <td>
                                                                <c:if test="${item.roleId == 1}">
                                                                    Admin
                                                                </c:if>
                                                                <c:if test="${item.roleId == 2}">
                                                                    User
                                                                </c:if>  

                                                            </td>

                                                            <td>
                                                                ${item.address}

                                                            </td>
                                                            <td>
                                                                ${item.phoneNum}
                                                            </td>
                                                            <td>
                                                                <c:if test="${item.roleId == 2}">
                                                                      <button type="button" class="btn btn-danger a-btn-slide-text deleteBtn" value="${item.username}">
                                                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                                    <i class="nc-icon nc-simple-remove"></i>
                                                                </button>
                                                                </c:if>
                                                            </td>    
  

                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
<!--                    <div class="row">
                        <div class="col-md-7"></div>
                        <div class="col-md-5"><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add New Acessory</button></div>
                    </div> -->


                    <!-- Add Modal -->
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Create Accessory</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <form action="AddController" method="POST" accept-charset="UTF-8" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="name">Acessory Name</label>
                                            <input type="text" class="form-control" id="name" placeholder="Enter name" name="txtName" required maxlength="50">
                                        </div>
                                        <div class="form-group">
                                            <label for="price"></span>Price</label>
                                            <input type="number" class="form-control" id="price" placeholder="Enter price" name="txtPrice" required min="0">
                                        </div>
                                        <div class="form-group">
                                            <label for="des"></span>Description</label>
                                            <input type="text" class="form-control" id="des" placeholder="Enter description" name="txtDescription" required maxlength="50">
                                        </div>
                                        <div class="form-group">
                                            <label for="quantity"></span>Quantity</label>
                                            <input type="number" class="form-control" id="quantity" placeholder="Enter quantity" name="txtQuantity" required min="0">
                                        </div>

                                        <div class="form-group">
                                            <label for="img"></span>Image</label>
                                        </div>
                                        <input type="file" class="form-control" id="img" name="img" accept="image/*" required >

                                        <button type="submit" class="btn btn-default btn-success btn-block">Create</button>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- Edit modal-->
                    <div class="modal fade" id="editModal" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Edit Accessory</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">

                                    <form action="AddController" method="POST" accept-charset="UTF-8">
                                        <div class="form-group">
                                            <label for="name">Acessory Name</label>
                                            <input type="text" class="form-control" id="name" placeholder="Enter name" name="txtName" required maxlength="50"> 
                                        </div>
                                        <div class="form-group">
                                            <label for="price"></span>Price</label>
                                            <input type="number" class="form-control" id="price" placeholder="Enter price" name="txtPrice" required min="0">
                                        </div>
                                        <div class="form-group">
                                            <label for="des"></span>Description</label>
                                            <input type="text" class="form-control" id="des" placeholder="Enter description" name="txtDescription" required maxlength="50">
                                        </div>
                                        <div class="form-group">
                                            <label for="quantity"></span>Quantity</label>
                                            <input type="number" class="form-control" id="quantity" placeholder="Enter quantity" name="txtQuantity" required min="0">
                                        </div>

                                        <button type="submit" class="btn btn-default btn-success btn-block">Create</button>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <jsp:include page="template/admin-footer.jsp"/>

            </div>            
        </div>
        <jsp:include page="template/admin-js.jsp"/>
    </body>

    <script>
        $(document).ready(function () {
            $(".deleteBtn").on("click", function () {
                swal({
                    title: "Are you sure?",
                    text: "Once deleted, you will not be able to recover this account !",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                var href = "AdminController?action=DeleteUser&&deleteID=" + $(this).val();
                                console.log($("#deleteAction").attr("action", href));
                                $("#deleteAction").submit();

                            }
                        });
            });
        });



        function editAccessory(btn) {
            var id = $(btn).val();
            $.ajax({
                method: "GET",
                url: "AdminController?action=Edit",
                data: {updateID: id},
                success: function (result) {
                    $("#editModal").replaceWith(result);
                    $("#editModal").modal("toggle");
                }
            });
        }
        ;




    </script>

</html>
