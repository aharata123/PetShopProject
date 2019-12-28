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
        <style>
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

        </style>

    </head>
    <body>
        <jsp:include page="myfolder/user/template/user-Info-bar.jsp"/>
        <jsp:include page="myfolder/user/template/user-header.jsp"/>
        <div class="container">
            <div class="products-page">
                <div class="product">
                    <div class="product-listy">
                       
                    </div>
                    <div class="latest-bis">
                        <img src="/PetShopOnlinePRJ/myfolder/user/images/offer.jpg" class="img-responsive">

                    </div>

                </div>
                <div class="new-product">
                    <c:if test="${not empty sessionScope.MESSAGE}">
                        <div class="alert alert-info" id="addSuccess">
                            <strong>${sessionScope.MESSAGE.message}</strong> 
                        </div>
                        <c:remove var="MESSAGE" scope="session"/>
                    </c:if>
                    <div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">

                        <div class="pages">   

                        </div>
                        <div class="clearfix"></div>
                        <ul>
                            <c:forEach items="${requestScope.ITEMS}" var="items">

                                <li>
                                    <a class="cbp-vm-image">
                                        <div class="view view-first">
                                            <div class="inner_content clearfix">
                                                <div class="product_image ">
                                                    <div class="image">
                                                        <img src="/project/images/${items.image}" class="img-responsive" alt="${items.image}"/>
                                                    </div>
                                                  

                                                    <div class="row">

                                                    </div>

                                                    <div class="product_container">
                                                        <div class="cart-left">
                                                            <p class="title">${items.name}</p>
                                                        </div>
                                                        <br/>
                                                        <div class="pricey">${items.price} VNĐ</div>
                                                        <div class="clearfix"></div>
                                                    </div>		
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="cbp-vm-details">
                                        ${items.description}
                                    </div>
                                    <a class="cbp-vm-icon cbp-vm-add" href="MainController?action=AddToCart&&itemID=${items.accessoryID}">Add to cart</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <script src="/PetShopOnlinePRJ/myfolder/user/js/cbpViewModeSwitch.js" type="text/javascript"></script>
                    <script src="/PetShopOnlinePRJ/myfolder/user/js/classie.js" type="text/javascript"></script>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>

        <jsp:include page="myfolder/user/template/user-footer.jsp"/>
        <jsp:include page="myfolder/user/template/user-js.jsp"/>



    </body>
</html>
