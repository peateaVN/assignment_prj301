<%-- 
    Document   : Admin
    Created on : Mar 22, 2022, 11:57:45 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Delvin Shop - Admin User</title>
        <%@include file="assets/layout/header.jsp" %>
        
    </head>
    <body>
        <%@include file="assets/layout/navbar.jsp" %>
       <c:set var="user" value="${requestScope.user}"/>
       <div class="container py-5">
           
        <c:if test="${requestScope.user != null}">
            <c:if test="${not empty requestScope.user}">
                <table class ="table" border="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>UserName</th>
                            <th>Password</th>
                            <th>Role</th>
                            <th>Name</th>
                            <th>Age</th>
                            <th>Email</th>
                            <th>Address</th>
                        </tr>
                    </thead>
                    <c:forEach var="user" items="${user}">
                    <tbody>
                        
                        <form action="" method="POST">
                            <tr>
                                <td>${user.userID}<input type="hidden" name="id" value="${user.userID}"/></td>
                                <td>${user.username}</td>
                                <td>${user.password}</td>
                                <td>${user.accessRight}</td>
                                <td>${user.name}</td>
                                <td>${user.age}</td>
                                <td>${user.email}</td>
                                <td>${user.address}</td>
                                <td><input type="submit" class="btn btn-danger" name="action" value="Update"/></td> 
                                <td><input type="submit" class="btn btn-danger" name="action" value="Remove"/></td>  
                            </tr>
                        </form>
                    </tbody>
                </c:forEach>
            </table>
        </c:if>
    </c:if>
        
    
        <%@include file="assets/layout/footer.jsp" %>
        <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/templatemo.js"></script>
        <script src="assets/js/custom.js"></script>
    </body>
</html>
