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
        <jsp:include page="myfolder/user/template/user-libary.jsp"/>
    </head>
    <body>
        <jsp:include page="myfolder/user/template/user-Info-bar.jsp"/>
        <jsp:include page="myfolder/user/template/user-header.jsp"/>
        <div class="limiter">
            <div class="container-login100" style="background-image: url('myfolder/login/images/background.jpg');">
                <div class="wrap-login100">
                    <form class="login100-form validate-form" action="MainController" method="POST" oninput='confirm.setCustomValidity(confirm.value != password.value ? "Passwords do not match." : "")' accept-charset="UTF-8">
                        <span class="login100-form-logo">
                            <i class="zmdi zmdi-landscape"></i>
                        </span>

                        <span class="login100-form-title p-b-34 p-t-27">
                            Create New Account
                        </span>
                        <c:if test="${not empty requestScope.MESSAGE}">
                            <div class="alert alert-danger">
                                <strong>Create account fail!</strong> ${requestScope.MESSAGE.error}
                            </div>
                            <br/>
                        </c:if>
                        <div class="wrap-input100 validate-input" data-validate = "Enter username">
                            <input class="input100" type="text" name="username" placeholder="Username" maxlength="50" minlength="4" value="${param.username}">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <input class="input100" type="password" name="password" placeholder="Password" maxlength="50" minlength="6">
                            <span class="focus-input100" data-placeholder="&#xf191;"></span>
                        </div>
                        
                         <div class="wrap-input100 validate-input" data-validate="Confirm Password">
                            <input class="input100" type="password" name="confirm" placeholder="Confirm">
                            <span class="focus-input100" data-placeholder="&#xf191;"></span>
                        </div>
                        
                        <div class="wrap-input100 validate-input" data-validate = "Enter Last Name">
                            <input class="input100" type="text" name="lastName" placeholder="Last Name" maxlength="50" value="${param.lastName}">
                            <span class="focus-input100" data-placeholder="&#xf106;"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate = "Enter First Name">
                            <input class="input100" type="text" name="firstName" placeholder="First Name" maxlength="50" value="${param.firstName}" >
                            <span class="focus-input100" data-placeholder="&#xf106;"></span>
                        </div>
                        
                        <c:if test="${not empty requestScope.INVALID}">
                            <div class="alert alert-danger">
                                <strong>Login failed !</strong> ${requestScope.INVALID.message}
                            </div>
                        </c:if>


                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Create Account
                            </button>
                        </div>
                        <input type="hidden" name="action" value="Create"/>
                        
                    </form>
                </div>
            </div>
        </div>

        <jsp:include page="myfolder/user/template/user-footer.jsp"/>
        <jsp:include page="myfolder/user/template/user-js.jsp"/>
    </body>
</html>
