<%-- 
 Document   : AddProduct
 Created on : Mar 15, 2022, 1:48:19 PM
 Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="assets/layout/header.jsp" %>
    </head>
    <body>
        <%@include file="assets/layout/navbar.jsp" %>

        <form action="Add" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Product ID </td>
                        <td><input type="text" name="pID" ><br></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="color: red">
                            <%
                                if (request.getAttribute("error") != null) {
                                    out.println(request.getAttribute("error"));
                                }
                            %>
                        </td>
                    </tr>
                    <tr>
                        <td>Category ID </td>
                        <td><input type="text" name="cateID" ><br></td>
                    </tr>
                    <tr>
                        <td>Title</td>
                        <td><input type="text" name="title" ><br></td>
                    </tr>
                    <tr>
                        <td>Price </td>
                        <td><input type="text" name="price" ><br></td>
                    </tr>
                    <tr>
                        <td>Image link </td>
                        <td><input type="text" name="image_link" ><br></td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td><input type="text" name="status" ><br></td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td><input type="text" name="description" ><br></td>
                    </tr>
                    <tr>
                        <td>Size</td>
                        <td><input type="text" name="size" ><br></td>
                    </tr>
                    <tr>
                        <td>Color</td>
                        <td><input type="text" name="color" ><br></td>
                    </tr>
                    <tr>
                        <td>Rate</td>
                        <td><input type="text" name="rating" ><br></td>
                    </tr>
                    <tr>
                        <td>Import_date</td>
                        <td> <input type="text" name="import_date" ><br></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Create"> </td>
                    </tr>
                </tbody>
            </table>
        </form>










        <%@include file="assets/layout/footer.jsp" %>

        <!-- Start Script -->
        <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/templatemo.js"></script>
        <script src="assets/js/custom.js"></script>
        <!-- End Script -->
    </body>
</html>