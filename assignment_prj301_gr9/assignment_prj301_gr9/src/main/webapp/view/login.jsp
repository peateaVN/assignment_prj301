<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Delvin Shop - Login</title>
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
        <c:url var="SignupLink" value="${request.contextPath}/Access/signup"/>
        <c:url var="loginLink" value="${request.contextPath}/Access/login"/>
        <c:set var="errors" value="${requestScope.errors}"/>
        <div class="login-form">
            <form action="${loginLink}" name="a" method="POST">
                <h2 class="text-center">Login</h2>
                <div class="form-group">
                    <input name="username" class="form-control" type="text" placeholder="Username" required="required" ><br>
                    <c:if test="${not empty errors['username']}">
                        <p name="error" style="color:red;"> ${errors['username']} </p>
                    </c:if>
                    <input name="password" class="form-control" type="password" placeholder="Password" required="required"><br>
                    <c:if test="${not empty errors['password']}">
                        <p name="error" style="color:red;"> ${errors['password']} </p>
                    </c:if>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block">Log in</button>
                    </div>
                    <%
                        if (request.getAttribute("login-msg") != null && !request.getAttribute("login-msg").equals("")) {
                            out.print("<label for='name' style='color: red'>" + request.getAttribute("login-msg") + "</label><br>  ");
                        };
                    %>    
                </div>
            </form>
            <p class="text-center"><a href="${SignupLink}">Create an Account</a></p>
        </div>
    </body>
</html>
