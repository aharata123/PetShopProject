  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="limiter">
    <div class="container-table100">
        <div class="wrap-table100">
            <div class="table100">

                <c:if test="${not empty sessionScope.VIEWCART}">


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
                                            <input class="quantity changeQuantity" min="0" name="quantity" value="${items.quantity}" type="number" required>

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