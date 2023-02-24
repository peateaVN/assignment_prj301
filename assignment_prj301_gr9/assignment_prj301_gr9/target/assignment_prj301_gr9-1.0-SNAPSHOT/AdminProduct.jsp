<%-- 
    Document   : Admin
    Created on : Mar 22, 2022, 11:57:45 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Delvin Shop - Admin Product</title>
        <%@include file="assets/layout/header.jsp" %>

    </head>
    <body>
        <%@include file="assets/layout/navbar.jsp" %>
        <c:set var="listProduct" value="${requestScope.listProduct}"/>
        <div class="container py-5">
            <c:if test="${requestScope.listProduct != null}">
                <c:if test="${not empty requestScope.listProduct}">
                    <table class ="table" border="0">
                        <thead>
                            <tr >
                                <th>Product ID</th>
                                <th>Category ID</th>
                                <th>Title</th>
                                <th>Price</th>
                                <th>Image link</th>
                                <th>Status</th>
                                <th>Description</th>
                                <th>Size</th>
                                <th>Color</th>
                                <th>Rating</th>
                                <th>Import date</th>
                            <a href="AddProduct.jsp">Create new product</a>
                        </tr>
                        </thead>
                        <c:forEach var="listProduct" items="${listProduct}">
                            <tbody>
                                <tr>
                                    <td>${listProduct.pID}<input type="hidden" name="id"/></td>
                                    <td>${listProduct.cateID}</td>
                                    <td>${listProduct.title}</td>
                                    <td>${listProduct.price}</td>
                                    <td><img src="${listProduct.image_link}" width="200px"></td>
                                    <td>${listProduct.status}</td>
                                    <td>${listProduct.description}</td>
                                    <td>${listProduct.size}</td>
                                    <td>${listProduct.color}</td>
                                    <td>${listProduct.rating}</td>
                                    <td>${listProduct.import_date}</td>
                                    <td><a href="Update?pID=${listProduct.pID}">Update</td> 
                                    <td><a href="#" onclick="showMess(${listProduct.pID})">Delete</td>  
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </c:if>
            </c:if>

        </div>



        <%@include file="assets/layout/footer.jsp" %>
        <script>
            function showMess(id) {
                var option = confirm("Are you sure to delete this product?");
                if (option === true) {
                    window.location.href = 'Delete?pID=' + id;
                }
            }
        </script>
        <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/templatemo.js"></script>
        <script src="assets/js/custom.js"></script>
    </body>
</html>
