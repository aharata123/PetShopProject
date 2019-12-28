<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="user-desc">
    <div class="container">
        <ul>
            
                <c:choose>
                    <c:when test="${not empty sessionScope.TOTAL}">
                    <li id="myCart"><i class="cart" ></i><a  href="/PetShopOnlinePRJ/MainController?action=ViewCart">Cart(${sessionScope.TOTAL})</a></li>
                    </c:when>
                    <c:otherwise>
                        <li id="myCart"><i class="cart" ></i><a  href="/PetShopOnlinePRJ/MainController?action=ViewCart">Cart(0)</a></li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${not empty sessionScope.USER}">
                    <li><i class="user"></i><a href="/PetShopOnlinePRJ/myfolder/user/logged/edit-user.jsp">My Account</a></li>
                    <li><i class="user"></i><a href="/PetShopOnlinePRJ/myfolder/user/logged/ViewHistoryController">Purchase history</a></li>
                    <li><i class=""></i><a href="/PetShopOnlinePRJ/LogOutController">Log out</a></li>
                        </c:when>
                        <c:otherwise>
                    <li><i class="user"></i><a href="login.jsp">My Account</a></li>
                        </c:otherwise>
                    </c:choose>


        </ul>
    </div>
</div>