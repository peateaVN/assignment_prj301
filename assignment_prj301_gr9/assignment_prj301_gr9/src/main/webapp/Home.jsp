<%-- 
    Document   : Home
    Created on : Mar 13, 2022, 7:36:22 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Delvin Shop - Homepage</title>
    <%@include file="assets/layout/header.jsp" %>
</head>

<body>
    
    <%@include file="assets/layout/navbar.jsp" %>
    
    <!-- Start Banner Hero -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner bg-light">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="rounded-circle img-fluid border" src="./assets/img/banner_img_01.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left align-self-center">
                                <h1 class="h1 text-success"><b>Delvin</b> store</h1>
                                <h3 class="h2">Welcome to Delvin, your one-stop satisfied-guaranteed epic online-shopping experience </h3>
                                <p>
                                    Our Shop goal is to bring the lastest fashion in unique, breath-taking, expert-designed shirts.
                                    
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="rounded-circle img-fluid border" src="./assets/img/banner_img_02.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">Check out our newest products!</h1>
                                <h3 class="h2">Fresh out of the oven!</h3>
                                <p>
                                    Designed by our talented designers! 
                                    New jacket and t-shirts! 
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="rounded-circle img-fluid border" src="./assets/img/banner_img_03.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">BUY 1 GET 1 NOW!</h1>
                                <h3 class="h2">Deals ends this week!  </h3>
                                <p>
                                    We promised you won't regret your decisions! 
                                    Come on, it's a free shirt for the price of one! What are you waiting for! Order now
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- End Banner Hero -->


    <!-- Start Categories of The Month -->
    <section class="container py-5">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1">Shop's Categories</h1>
            </div>
        </div>
        <div class="row">

            <c:forEach items="${listCategory}" var="category">  
                <div class="col-12 col-md-3 p-5 mt-3">
                    <a href="${pageContext.request.contextPath}/Shop?category=${category.cateID}"><img src="${category.image_link}" class="rounded-circle img-fluid border"></a>
                    <h5 class="text-center mt-3 mb-3">${category.cateName}</h5>
                    <p class="text-center"><a class="btn btn-success" href="${pageContext.request.contextPath}/Shop?category=${category.cateID}" >Go Shop</a></p>
                </div>
            </c:forEach>
            

        </div>
    </section>
    <!-- End Categories of The Month -->


    <!-- Start Featured Product -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">All Products</h1>
                </div>
            </div>
            <div class="row">
                <c:forEach items="${listProduct}" var="p">
                    <div class="col-2 col-md-4 mb-4">
                        <div class="card h-100">
                            <a href="${pageContext.request.contextPath}/Product?id=${p.pID}">
                                <img src="${p.image_link}" class="card-img-top" alt="...">
                            </a>
                            <div class="card-body d-flex flex-column">
                                <ul class="list-unstyled d-flex justify-content-between">
                                    <c:choose>
                                        <c:when test="${p.rating=='5.0'}">
                                         <li>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                        </li>   
                                        </c:when>
                                        <c:when test="${p.rating<'5' && p.rating >= '4.5'}">
                                        <li>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star-half-alt"></i>
                                        </li>
                                        </c:when>
                                        <c:when test="${p.rating<'4.5' && p.rating >= '4.0'}">
                                        <li>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                        </li>
                                        </c:when>
                                        <c:when test="${p.rating<'4.0' && p.rating >= '3.5'}">
                                        <li>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star-half-alt"></i>
                                            <i class="text-muted fa fa-star"></i>
                                        </li>
                                        </c:when>
                                        <c:when test="${p.rating<'3.5' && p.rating >= '3.0'}">
                                        <li>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                        </li>
                                        </c:when>
                                        <c:otherwise>
                                        <li>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                        </li>   
                                        </c:otherwise>
                                    </c:choose>
                                    <li class="text-dark text-right">${p.price} VNÐ</li>
                                </ul>
                                <a href="${pageContext.request.contextPath}/Product?id=${p.pID}" class="h2 text-decoration-none text-dark" >${p.title}</a>
                                <p class="card-text text-truncate" >
                                    ${p.description}
                                </p>
                                <ul class="list-inline position-absolute bottom-0 flex-grow-1 d-flex align-self-end ">
                                    <li class="list-inline-item"><h5>Status: </h5></li>
                                    <c:choose>
                                    <c:when test="${p.status=='Available'}">
                                        <li class="list-inline-item"><p class="text-dark align-self-end">${p.status}</p></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="list-inline-item"><p class="text-muted align-self-end">${p.status}</p></li>
                                    </c:otherwise>
                                </c:choose>
                                </ul>                                
                                <ul class="list-inline flex-grow-1 d-flex align-items-end ">                                           
                                    <li class="list-inline-item"><a class="btn btn-success align-bottom" href ="${pageContext.request.contextPath}/Product?id=${p.pID}"><i class="far fa-eye"></i></a></li>
                                    <li><a class="btn btn-success text-white mt-2" href="${pageContext.request.contextPath}/Cart?pID=${p.pID}&product-quanity=1"><i class="fas fa-cart-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- End Featured Product -->
    
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