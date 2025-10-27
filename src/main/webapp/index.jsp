<%-- 
    Document   : index
    Created on : 26 oct 2025, 11:48:50 p.m.
    Author     : jadrianh
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - Farmacia</title>
</head>
<body>
<h2>Bienvenido al Sistema de Gestión Farmacéutica</h2>
<form action="LoginServlet" method="post">
    Usuario: <input type="text" name="usuario" required><br>
    Contraseña: <input type="password" name="password" required><br>
    <input type="submit" value="Ingresar">
</form>
</body>
</html>

