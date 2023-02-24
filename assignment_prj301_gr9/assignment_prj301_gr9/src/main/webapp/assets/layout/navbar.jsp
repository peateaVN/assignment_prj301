<%-- 
    Document   : header
    Created on : Mar 13, 2022, 11:12:35 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <c:set var="admin" value="${sessionScope.isAdmin}"/>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="assets/css/header.css">    
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">

        <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
        <script src="https://codepen.io/CodeBoomer/pen/qaOWJE"></script>
        <script src="assets/js/header.js"></script>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
            <div class="container text-light">
                <div class="w-100 d-flex justify-content-between">
                    <div>
                        <i class="fa fa-envelope mx-2"></i>
                        <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:delvin@company.com">delvin@company.com</a>
                        <i class="fa fa-phone mx-2"></i>
                        <a class="navbar-sm-brand text-light text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
                    </div>
                    <div>
                        <a class="text-light" href="https://fb.com/" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                        <a class="text-light" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                        <a class="text-light" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                        <a class="text-light" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
                    </div>
                </div>
            </div>
        </nav>
        <c:if test="${admin==0}">
        <nav class="navbar navbar-expand-lg navbar-light shadow">
            <div class="container d-flex justify-content-between align-items-center">

                <a class="navbar-brand text-success logo h1 align-self-center" href="./Home" >
                    <img src="assets/img/logo.png" />
                </a>

                <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                    <div class="flex-fill">
                        <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="./Home">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link">Shop</a>
                                <ul class="dropdown">
                                    <li class="nav-item">
                                        <a class="nav-link" href="./Shop">All</a>
                                    </li> 
                                    <li class="nav-item">
                                        <a class="nav-link" href="./Shop?sort=new">New</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="./Shop?sort=rating">Top</a>
                                    </li>  
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link">Categories</a>
                                <ul class="dropdown">
                                    <li class="nav-item">
                                        <a class="nav-link" href="${pageContext.request.contextPath}/Shop?category=1">T-Shirts</a>
                                    </li> 
                                    <li class="nav-item">
                                        <a class="nav-link" href="${pageContext.request.contextPath}/Shop?category=2">Hoodies</a>
                                    </li> 
                                    <li class="nav-item">
                                        <a class="nav-link" href="${pageContext.request.contextPath}/Shop?category=3">Jackets</a>
                                    </li> 
                                    <li class="nav-item">
                                        <a class="nav-link" href="${pageContext.request.contextPath}/Shop?category=4">Sweaters</a>
                                    </li>     
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="About.jsp">About</a>
                            </li>
                        </ul>
                    </div>
                    <div class="navbar align-self-center d-flex">
                        <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3 ">
                            <div class="input-group">
                                <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                                <div class="input-group-text">
                                    <i class="fa fa-fw fa-search"></i>
                                </div>
                            </div>
                        </div>
                        <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                            <i class="fa fa-fw fa-search text-dark mr-2"></i>
                        </a>
                        <a class="nav-icon position-relative text-decoration-none" href="Cart.jsp">
                            <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                        </a>
                        <a class="nav-icon position-relative text-decoration-none" href="view/login.jsp">
                            <i class="fa fa-fw fa-user text-dark mr-3"></i>
                        </a>
                                        <a class="nav-link" href="view/login.jsp">Log out</a>
                    </div>
                </div>

            </div>
        </nav>
        </c:if>
        <c:if test="${admin==1}">
            <nav class="navbar navbar-expand-lg navbar-light shadow">
            <div class="container d-flex justify-content-between align-items-center">

                <a class="navbar-brand text-success logo h1 align-self-center" href="./Home" >
                    <img src="assets/img/logo.png" />
                </a>

                <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                    <div class="flex-fill">
                        <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="./AdminUser">User</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./AdminProduct">Product</a> 
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./Admin/product">Order</a> 
                            </li>                         
                        </ul>
                    </div>
                    <div class="navbar align-self-center d-flex">
                        <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                            <div class="input-group">
                                <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                                <div class="input-group-text">
                                    <i class="fa fa-fw fa-search"></i>
                                </div>
                            </div>
                        </div>
                        <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                            <i class="fa fa-fw fa-search text-dark mr-2"></i>
                        </a>
                        <a class="nav-icon position-relative text-decoration-none" href="Cart.jsp">
                            <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1">                       </i>
                            <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
                        </a>
                        <a class="nav-icon position-relative text-decoration-none" href="view/login.jsp">
                            <i class="fa fa-fw fa-user text-dark mr-3"></i>
                            <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
                        </a>
                    </div>
                </div>

            </div>
        </nav>
        </c:if>
        <!-- Close Header -->

        <!-- Modal -->
        <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="w-100 pt-1 mb-5 text-right">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <c:url var="searchLink" value="${request.contextPath}/Shop"/>
                <form action="${searchLink}" method="get" class="modal-content modal-body border-0 p-0">
                    <div class="input-group mb-2">
                        <input type="text" class="form-control" id="inputModalSearch" name="search" placeholder="Search ...">
                        <button type="submit" class="input-group-text bg-success text-light">
                            <i class="fa fa-fw fa-search text-white"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </body>

</html>

