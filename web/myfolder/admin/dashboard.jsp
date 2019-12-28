<%-- 
    Document   : dashboard
    Created on : Jun 19, 2019, 6:47:33 PM
    Author     : LEGION
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="perfect-scrollbar-on">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="template/admin-libary.jsp"/>
    </head>
    <body class="">        
        <div class="wrapper">
            <jsp:include page="template/admin-sidebar.jsp"/>
            <div class="main-panel">
                <jsp:include page="template/admin-navbar.jsp"/>
                <div class="content">
                    
                    
                    
                </div>
                <jsp:include page="template/admin-footer.jsp"/>
                
            </div>            
        </div>
                <jsp:include page="template/admin-js.jsp"/>
    </body>
</html>
