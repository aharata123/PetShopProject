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
        <jsp:include page="myfolder/user/template/page-libary.jsp"/>
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


        <style>
            a {
                text-decoration: none;
                color: inherit;
            }
            .image{
                position:relative;
                overflow:hidden;
                padding-bottom:100%;
            }
            .image img{
                position: absolute;
                max-width: 100%;
                max-height: 100%;
                top: 50%;
                left: 50%;
                transform: translateX(-50%) translateY(-50%);
            }
            input[type="number"] {
                -webkit-appearance: textfield;
                -moz-appearance: textfield;
                appearance: textfield;
            }

            input[type=number]::-webkit-inner-spin-button,
            input[type=number]::-webkit-outer-spin-button {
                -webkit-appearance: none;
            }

            .number-input {
                border: 2px solid #ddd;
                display: inline-flex;
            }

            .number-input,
            .number-input * {
                box-sizing: border-box;
            }

            .number-input button {
                outline:none;
                -webkit-appearance: none;
                background-color: transparent;
                border: none;
                align-items: center;
                justify-content: center;
                width: 3rem;
                height: 3rem;
                cursor: pointer;
                margin: 0;
                position: relative;
            }

            .number-input button:before,
            .number-input button:after {
                display: inline-block;
                position: absolute;
                content: '';
                width: 1rem;
                height: 2px;
                background-color: #212121;
                transform: translate(-50%, -50%);
            }
            .number-input button.plus:after {
                transform: translate(-50%, -50%) rotate(90deg);
            }

            .number-input input[type=number] {
                font-family: sans-serif;
                max-width: 5rem;
                padding: .5rem;
                border: solid #ddd;
                border-width: 0 2px;
                font-size: 2rem;
                height: 3rem;
                font-weight: bold;
                text-align: center;
            }

        </style>

    </head>
    <body>
        <jsp:include page="myfolder/user/template/user-Info-bar.jsp"/>
        <jsp:include page="myfolder/user/template/user-header.jsp"/>

        <div class="limiter">
            <div class="container-table100">
                <div class="wrap-table100">
                    <div class="table100">


                        <c:if test="${not empty sessionScope.VIEWCART}">
                            <c:if test="${not empty sessionScope.MESSAGE.error}">
                                <div class="alert alert-info alert-danger">
                                    <a class="panel-close close" data-dismiss="alert">×</a> 
                                    <i class="fa fa-coffee"></i>
                                    <strong>Action fail</strong>. ${sessionScope.MESSAGE.error}
                                </div>
                                <c:remove var="MESSAGE" scope="session"/>
                            </c:if>

                            <table id="myTable">
                                <thead>
                                    <tr class="table100-head">
                                        <th class="column2">ID</th>
                                        <th class="column3">Name</th>
                                        <th class="column1">Item Image</th>
                                        <th class="column4">Price</th>
                                        <th class="column1">Quantity</th>
                                        <th class="column6">Total</th>
                                        <th class="column1">Remove item</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${sessionScope.VIEWCART}" var="items">
                                        <tr class="products-items">
                                            <td class="column2">${items.dto.accessoryID}</td>
                                            <td class="column3">${items.dto.name}</td>
                                            <td class="column1"><img src="/project/images/${items.dto.image}" width="100" height="100">   </td>
                                            <td class="column4">${items.dto.price} VNĐ</td>
                                            <td class="column1"><div class="number-input">
                                                    <input class="quantity changeQuantity" min="1" name="quantity" value="${items.quantity}" type="number" required id="quantityField${items.dto.accessoryID}">                                                
                                                </div>

                                            </td>
                                            <td class="column6">${items.dto.price * items.quantity} VNĐ</td>
                                            <th class="column1"><button type="button" onclick="remove(this)" class="btn btn-danger" value="${items.dto.accessoryID}">Remove</button></th>
                                        </tr>
                                    </c:forEach>

                                    <c:set var="priceTotal" value="${0}" />
                                    <c:forEach var="item" items="${sessionScope.VIEWCART}">
                                        <c:set var="priceTotal" value="${priceTotal + (item.dto.price * item.quantity)}" />
                                    </c:forEach>

                                <td class="column2"></td>
                                <td class="column3"></td>
                                <td class="column1"></td>
                                <td class="column4"></td>
                                <td class="column1" style="color: red">Total : </td>
                                <td class="column6" style="color: red">${priceTotal} VNĐ </td>  

                                <form action="CheckOutController" id="CheckOut">
                                    <td class="column1"><button type="button" onclick="CheckOut()" class="btn btn-info">CheckOut</button></td>
                                    <input type="hidden" name="total" id="totalField" value="${priceTotal}"/>
                                </form> 


                                </tbody>
                            </table>

                        </c:if> 
                        <c:if test="${empty sessionScope.VIEWCART}">

                            <div class="container">
                                <div class="My-wish-section">
                                    <section id="wish">
                                        <div class="my-wish-content">

                                            <div class="coats sing-c">
                                                <c:if test="${not empty sessionScope.SUCCESS}">
                                                    <div class="alert alert-info alert-success">
                                                        <a class="panel-close close" data-dismiss="alert">×</a> 
                                                        <i class="fa fa-coffee"></i>
                                                        <strong>Action success</strong> ${sessionScope.SUCCESS}
                                                    </div>
                                                    <c:remove var="SUCCESS" scope="session"/>
                                                </c:if>
                                                <h3 class="c-head">Your Bascket(0)</h3>
                                                <p>Your Bascket Is Empty Please Go <a href="MainController?action=ShowProduct">here</a> And Shop</p>
                                            </div>

                                        </div>
                                </div>
                            </div>

                        </c:if>             
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="myfolder/user/template/user-footer.jsp"/>
        <jsp:include page="myfolder/user/template/user-js.jsp"/>

        <script>
            $(document).ready(function () {
                var change = false;
                var itemID;
                var quantity;
                var idBtn;
                $("#myCart").remove();
                $('.changeQuantity').on('input', function () {
                    change = true;
                    console.log(change);
                    itemID = $(this).closest("tr").find(".column2").text();
                    quantity = $(this).val();
                    btn = this;
                    console.log(quantity);
                    idBtn = $(this).attr("id");
                });


                $('body').on('click', function () {
                    if (change === true) {
//                        console.log("Hello");
//                        console.log(itemID);
                        if (quantity <= 0) {
                            alert("Please enter an integer number greater than 0");
                        }
                        change = false;
                        $.ajax({
                            method: "POST",
                            url: "MainController?action=EditCart",
                            data: {itemID: itemID, quantity: quantity},
                            success: function (result) {
                                $(".limiter").replaceWith(result);
                                if (quantity <= 0) {
                                } else {

                                    if (isInt(quantity)) {
                                        alert("Update in process");
                                    } else {
                                        alert("Please input an integer");
                                    }
                                }
                            }
                        });
                    }
                });

                $(document).ajaxStop(function () {



                    $('.changeQuantity').on('input', function () {
                        change = true;
                        console.log(change);
                        itemID = $(this).closest("tr").find(".column2").text();
                        quantity = $(this).val();
                        btn = this;
                        console.log(quantity);
                        idBtn = $(this).attr("id");
                    });


                    $('body').on('click', function () {
                        if (change === true) {
//                        console.log("Hello");
//                        console.log(itemID);
                            if (quantity <= 0) {
                                alert("Please enter an integer number greater than 0");
                            }
                            change = false;
                            $.ajax({
                                method: "POST",
                                url: "MainController?action=EditCart",
                                data: {itemID: itemID, quantity: quantity},
                                success: function (result) {
                                    $(".limiter").replaceWith(result);
                                    if (quantity <= 0) {
                                    } else {

                                        if (isInt(quantity)) {
                                            alert("Update in process");
                                        } else {
                                            alert("Please input an integer");
                                        }
                                    }
                                }
                            });
                        }
                    });
                });
            });

            function remove(btn) {
                var deleteItem = $(btn).val();
                console.log(deleteItem);
                $.ajax({
                    method: "POST",
                    url: "MainController?action=RemoveItem",
                    data: {deleteItem: deleteItem},
                    success: function (result) {
                        $(".limiter").replaceWith(result);
                        alert("Remove successfull");
                    }
                });
            }
            ;



            function isInt(value) {
                return !isNaN(value) && (function (x) {
                    return (x | 0) === x;
                })(parseFloat(value))
            }

            function CheckOut() {
                $("#CheckOut").append($("#totalField"));
                $("#CheckOut").submit();
            }
            ;

        </script>

    </body>
</html>
