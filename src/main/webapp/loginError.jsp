<%-- 
    Document   : loginError
    Created on : 26 oct 2025, 11:49:08 p.m.
    Author     : jadrianh
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Error de Login</title></head>
<body>
<h3 style="color:red;"><%= request.getAttribute("mensaje") %></h3>
<a href="index.jsp">Volver al login</a>
</body>
</html>

