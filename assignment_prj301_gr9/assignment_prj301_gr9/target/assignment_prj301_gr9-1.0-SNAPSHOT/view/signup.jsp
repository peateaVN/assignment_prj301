<%-- 
    Document   : signup
    Created on : Mar 12, 2022, 11:04:11 PM
    Author     : ADMIN
--%>

<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Delvin Shop - Sign up</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <style>
.login-form {
    width: 340px;
    margin: 50px auto;
  	font-size: 15px;
}
.login-form form {
    margin-bottom: 15px;
    background: #f7f7f7;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    padding: 30px;
}
.login-form h2 {
    margin: 0 0 15px;
}
.form-control, .btn {
    min-height: 38px;
    border-radius: 2px;
}
.btn {        
    font-size: 15px;
    font-weight: bold;
}
.btn-primary {
    color: #fff;
    background-color: #ff7c00;
    border-color: #ff7c00;
}
</style>
</head>
    <body>
        
      

        <!-- Modal -->
        <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="w-100 pt-1 mb-5 text-right">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="" method="get" class="modal-content modal-body border-0 p-0">
                    <div class="input-group mb-2">
                        <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                        <button type="submit" class="input-group-text bg-success text-light">
                            <i class="fa fa-fw fa-search text-white"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        
        <c:url var="SignupLink" value="${request.contextPath}/Access/signup"/>
        <c:url var="loginLink" value="${request.contextPath}/Access/login"/>

        <div class="login-form">
        <form action="${SignupLink}" name="a" method="POST">
            <h2 class="text-center">Create a new account</h2>
            <div class="form-group">
            <input name="username" class="form-control" type="text" placeholder="Username" required="required" ><br>
            <input name="password" class="form-control" type="password" placeholder="Password" required="required"><br> 
            <input name="confirmPassword" class="form-control" type="password" placeholder="Confirm Password" required="required"><br>
            <input name="accountName" class="form-control" type="text" placeholder="AccountName" required="required"><br>
            <input name="age" class="form-control" type="text" placeholder="Age" required="required"><br>
            <input name="phonenumber" class="form-control" type="text" placeholder="PhoneNumber" maxlength="10" required="required"><br>
            <input name="email" class="form-control" type="text" placeholder="Email" required="required"><br>
            <input name="address" class="form-control" type="text" placeholder="Address" required="required"><br>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">Sign up</button>
        </div>
              <%
                if (request.getAttribute("signup-msg") != null && !request.getAttribute("signup-msg").equals("")){
                    out.print("<label for='name' style='color: red'>"+request.getAttribute("signup-msg")+"</label><br>  ");
                };                 
        %>    
            </div>
        </form>
        </div>
    </body>
</html>
