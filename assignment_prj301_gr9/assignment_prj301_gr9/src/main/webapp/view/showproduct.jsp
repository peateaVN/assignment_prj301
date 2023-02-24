<%-- 
    Document   : showproduct
    Created on : Mar 17, 2022, 7:13:36 PM
    Author     : tranthanhcong652001
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! ArrayList<Product> list;%>
        <%
            list = (ArrayList<Product>) session.getAttribute("searchList");
            if (list != null) {
                for (Product p : list) {%>
        <div>
            <table border ="1px">
                <tr>
                    <td> <img src="<%=p.getImage_link()%>" width="250px"  > </td>
                    <td>  <%= p.getTitle()%>  </td>
                    <td>  <%= p.getPrice() + " VND"%>  </td>    
                    <td>  <%= p.getStatus()%>  </td>
                    <td>  <%= p.getDescription()%>  </td> 
                    <td>  <%= p.getSize()%>  </td> 
                    <td>  <%= p.getColor()%>  </td> 
                    <td>  <%= p.getRating()%>  </td>                       
                </tr>   
            </table>
        </div>
        <% }
            } else {
                out.println("Empty");
            }

        %>



    </body>
</html>
