<%-- 
    Document   : purchase-history
    Created on : Jul 13, 2019, 9:46:19 PM
    Author     : LEGION
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h1>Purchase History</h1>
            <hr>
            <div class="row">
                <!-- left column -->
                <div class="col-md-3">
                    <div class="text-center">

                    </div>
                </div>

                <!-- edit form column -->

                <div class="col-md-9 personal-info">

                    <h3>History</h3>

                    <br/>

                    <div class="limiter">
                        <div class="container-table100">
                            <div class="wrap-table100">
                                <div class="table100">

                                    <c:if test="${not empty requestScope.HISTORY}">


                                        <table id="myTable">
                                            <thead>
                                                <tr class="table100-head">
                                                    <th class="column2">Order ID</th>
                                                    <th class="column3">Date Order</th>
                                                    <th class="column3">Total</th>
                                                    <th class="column3">Detail</th>


                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${requestScope.HISTORY}" var="items">

                                                <tr class="products-items">

                                                    <td class="column2"> ${items.orderid} </td>
                                                    <td class="column3"> ${items.date}  </td>
                                                    <td class="column3"> ${items.total} VNĐ</td>                                                    
                                                    <td class="column3">  
                                                        <button value="${items.orderid}" type="button" onclick="viewDetail(this)" class="btn btn-info">View</button>                                                    
                                                    </td>

                                                </tr>



                                            </c:forEach>


                                            </tbody>
                                        </table>

                                    </c:if> 
                                    <c:if test="${empty requestScope.HISTORY}">
                                        <div class="container">
                                            <div class="My-wish-section">
                                                <section id="wish">
                                                    <div class="my-wish-content">
                                                        <div class="coats sing-c">
                                                            <h3 class="c-head">No purchase</h3>
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

                                        <!-- Modal -->
<div id="viewModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
                                        

        <jsp:include page="../template/user-footer.jsp"/>
        <jsp:include page="../template/user-js.jsp"/>
        
        <script>
            function viewDetail(btn) {
            var id = $(btn).val();
            $.ajax({
                method: "GET",
                url: "DetailController",
                data: {orderID: id},
                success: function (result) {
                    console.log(result);
                    
                    $("#viewModal").replaceWith(result);
                    $("#viewModal").modal("toggle");
                }
            });
        }
        ;
            
            
        </script>
        
        
        
    </body>
</html>
