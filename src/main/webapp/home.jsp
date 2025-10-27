<%-- 
    Document   : home
    Created on : 26 oct 2025, 11:48:58 p.m.
    Author     : jadrianh
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.damp.sig.farmacia.model.Usuario" %>
<%
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    Usuario user = (Usuario) session.getAttribute("usuario");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inicio - SIG Farmacia</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f7f7f7; text-align: center; }
        .container {
            margin-top: 50px;
            background: white;
            padding: 30px;
            border-radius: 8px;
            width: 60%;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        h2 { color: #2c3e50; }
        .info { margin-top: 15px; }
        a.logout {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #e74c3c;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        a.logout:hover { background: #c0392b; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Bienvenido, <%= user.getNombre_usuario() %> 👋</h2>
        <div class="info">
            <p><strong>Email:</strong> <%= user.getEmail() != null ? user.getEmail() : "No registrado" %></p>
            <p><strong>Rol ID:</strong> <%= user.getRol_id() %></p>
        </div>

        <a class="logout" href="LogoutServlet">Cerrar sesión</a>
    </div>
</body>
</html>