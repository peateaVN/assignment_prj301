<%-- 
    Document   : Shop
    Created on : Mar 13, 2022, 11:30:09 PM
    Author     : ACER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    
<head>
    <title>Delvin Shop - Shop</title>
    <%@include file="assets/layout/header.jsp" %>
    <c:set var="sortList" value="${requestScope.sortList}"/>
</head>


    <body>

        <%@include file="assets/layout/navbar.jsp" %>

        <!-- Modal -->
        <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="w-100 pt-1 mb-5 text-right">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="./Shop" method="get" class="modal-content modal-body border-0 p-0">
                    <div class="input-group mb-2">
                        <input type="text" class="form-control" id="inputModalSearch" name="search" placeholder="Search ...">
                        <button type="submit" class="input-group-text bg-success text-light">
                            <i class="fa fa-fw fa-search text-white"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>



        <!-- Start Content -->
        <div class="container py-5">
            <div class="row">


            <div class="col-lg-3">
                <h1 class="h2 pb-4">Sort filter</h1>
                <ul class="list-unstyled templatemo-accordion">
                    <li class="pb-3">
                        
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Products
                            <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul class="collapse show list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="${pageContext.request.contextPath}/Shop">All</a></li>
                            <li><a class="text-decoration-none" href="${pageContext.request.contextPath}/Shop?sort=new">Newest</a></li>
                            <li><a class="text-decoration-none" href="${pageContext.request.contextPath}/Shop?sort=rating">Rating</a></li>
                            <li><a class="text-decoration-none" href="${pageContext.request.contextPath}/Shop?sort=priceLow">Price lowest to highest</a></li>
                            <li><a class="text-decoration-none" href="${pageContext.request.contextPath}/Shop?sort=priceHigh">Price highest to lowest</a></li>
                        </ul>
                    </li>
                    <li clas
                    <li class="pb-3">
                        
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Shirt Type
                            <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul class="collapse show list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="${pageContext.request.contextPath}/Shop?category=1">T'Shirt</a></li>
                            <li><a class="text-decoration-none" href="${pageContext.request.contextPath}/Shop?category=4">Sweater</a></li>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Jacket Type
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="${pageContext.request.contextPath}/Shop?category=2">Hoodie</a></li>
                            <li><a class="text-decoration-none" href="${pageContext.request.contextPath}/Shop?category=3">Jacket</a></li>
                        </ul>
                    </li>
                    
                </ul>
            </div>

            <div class="col-lg-9">
                <div class="row">                   
                        <c:if test="${not empty sortList}">  
                            <c:set value="${sortList}" var="list"/>                         
                        </c:if>
                        <c:if test="${empty sortList}"> 
                            <c:set value="${requestScope.listProduct}" var="list"/>
                        </c:if>  
                        <c:forEach items="${list}" var="list">
                        <div class="col-md-4">
                        <div class="card mb-4 product-wap rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src="${list.image_link}">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">

                                        <li><a class="btn btn-success text-white mt-2" href="${pageContext.request.contextPath}/Product?id=${list.pID}"><i class="far fa-eye"></i></a></li>
                                        <li><a class="btn btn-success text-white mt-2" href="${pageContext.request.contextPath}/Cart?pID=${list.pID}&product-quanity=1"><i class="fas fa-cart-plus"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/Product?id=${list.pID}" class="h3 text-decoration-none text-">${list.title}</a>
                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
                                    <li>${list.size}</li>
                                    <li class="pt-2">
                                        <span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
                                    </li>
                                </ul>
                                <ul class="list-unstyled d-flex justify-content-md-start mb-1">
                                    <c:choose>
                                        <c:when test="${list.rating=='5.0'}">
                                         <li>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                        </li>   
                                        </c:when>
                                        <c:when test="${list.rating<'5' && list.rating >= '4.5'}">
                                        <li>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star-half-alt"></i>
                                        </li>
                                        </c:when>
                                        <c:when test="${list.rating<'4.5' && list.rating >= '4.0'}">
                                        <li>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                        </li>
                                        </c:when>
                                        <c:when test="${list.rating<'4.0' && list.rating >= '3.5'}">
                                        <li>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star-half-alt"></i>
                                            <i class="text-muted fa fa-star"></i>
                                        </li>
                                        </c:when>
                                        <c:when test="${list.rating<'3.5' && list.rating >= '3.0'}">
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
                                </ul>
                                <p class="text-left mb-0">${list.price} VND</p>
                            </div>
                        </div>
                       </div>
                    </c:forEach>
            </div>
        </div>
        <!-- End Content -->

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