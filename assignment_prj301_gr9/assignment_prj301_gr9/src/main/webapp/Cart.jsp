<%-- 
    Document   : Cart
    Created on : Mar 14, 2022, 11:16:38 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Delvin Shop - Homepage</title>
        <%@include file="assets/layout/header.jsp" %>
        
    </head>
    <body>
        <%@include file="assets/layout/navbar.jsp" %>
        <c:set var="errors" value="${requestScope.errors}"/>

        <div class="container py-5">
        <c:if test="${sessionScope.cart.cart != null}">
            <c:if test="${not empty sessionScope.cart}">
                <table class ="table" border="0">
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th>Product ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="total" scope="request" value="${0}"/>
                        <c:forEach var="product" items="${sessionScope.cart.getCart().values()}" varStatus="counter">
                        <form action="" method="POST">
                            <tr>
                                <td>${counter.count}</td>
                                <td><img style="max-width: 150px; max-height: 150px" src="${product.image_link}"/></td>
                                <td>${product.pID}
                                    <input type="hidden" name="id" value="${product.pID}"/>
                                </td>
                                <td>${product.title}</td>
                                <td>${product.price}</td>
                                <td>${product.quantity}</td>
                                <td>${product.price*product.quantity}</td>
                                <c:set var="total" scope="request" value="${total+product.price*product.quantity}"/>
                                <td><input type="submit" class="btn btn-danger" name="action" value="Remove"/></td>                               
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </c:if>
        
    <h3>Total: ${total} VND</h3>
    <form action="${pageContext.request.contextPath}/Order" method="GET">
        <input type="hidden" name="total" value="${total}">
    <div class="list-inline pb-3"><a href="${pageContext.request.contextPath}/Shop" class="btn btn-primary btn-sm">Add more</a></div> 
     <div class="col-auto">
            <ul class="list-inline pb-3">
                <li class="list-inline-item"><b>Choose payment method :</b></li>
            <li class="list-inline-item">
                 <input type="radio" id="Cash" name="payment_method" value="Cash">
                 <label for="Cash">Cash</label><br></li>
            <li class="list-inline-item">
                 <input type="radio" id="Credit Card" name="payment_method" value="Credit Card">
                 <label for="Credit Card">Credit Card</label><br></li>
            <li class="list-inline-item">
                 <input type="radio" id="Mobile payments" name="payment_method" value="Mobile payments">
                 <label for="Mobile payments">Mobile payments</label>
            </li>
            <c:if test="${not empty errors['payment']}">
            <li class="list-inline-item" style="color:Tomato;">${requestScope.errors['payment']}</li>  
            </c:if>                         
            </ul>
            </div>
    <div class="col-auto">
        <ul class="list-inline">
            <li class="list-inline-item"><b>Choose shipping method :<b></li>
            <li class="list-inline-item">
                 <input type="radio" id="Fast" name="shipping_method" value="Fast">
                 <label for="Fast">Fast</label><br></li>
            <li class="list-inline-item">
                 <input type="radio" id="Normal" name="shipping_method" value="Normal">
                 <label for="Normal">Normal</label><br></li>
            <li class="list-inline-item">
                 <input type="radio" id="Express" name="shipping_method" value="Express">
                 <label for="Express">Express</label>
            </li>
            <c:if test="${not empty errors['shipping']}">
            <li class="list-inline-item" style="color:Tomato;">${requestScope.errors['shipping']}</li>  
            </c:if>
        </ul>  
    </div>
    <div class="list-inline pb-3"><input name="pc" type="submit" class="btn btn-primary btn-sm" value="Purchase"></div> 
    <%
                        if (request.getAttribute("status") != null && !request.getAttribute("status").equals("")) {
                            out.print("<label for='pc' style='color: red'>" + request.getAttribute("status") + "</label><br>  ");
                        };
                    %>  
    </form>
    </div>
        <%@include file="assets/layout/footer.jsp" %>
        <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/templatemo.js"></script>
        <script src="assets/js/custom.js"></script>
    </body>
</html>

    