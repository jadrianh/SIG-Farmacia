<%-- 
    Document   : home
    Created on : 26 oct 2025, 11:48:58 p.m.
    Author     : jadrianh
--%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.damp.sig.farmacia.model.Usuario" %>
<%
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container-fluid">
    <div class="row">
        <!--el menu-->
        <jsp:include page="components/menu.jsp" />


        <div class="col-md-9 col-lg-10 p-4">
            <h2 class="mb-4">Bienvenido, <%= user.getNombre_usuario() %> 👋</h2>

            <div class="card shadow-sm border-0">
                <div class="card-body">
                    <h5 class="card-title text-primary">Información del usuario</h5>
                    <p><strong>Email:</strong> <%= user.getEmail() != null ? user.getEmail() : "No registrado" %></p>
                    <p><strong>Rol:</strong> 
                        <%= (user.getRol_id() == 1) ? "Administrador" : "Vendedor" %>
                    </p>
                    <a href="LogoutServlet" class="btn btn-danger btn-sm mt-3">Cerrar sesión</a>
                </div>
            </div>

            <hr class="my-4">

            <!--aca va dasboard -->
            <%
                if (user.getRol_id() == 1) { // Admin
            %>
                <div class="alert alert-primary">Panel de administrador - aquí puedes gestionar usuarios, productos y reportes.</div>
            <%
                } else {
            %>
                <div class="alert alert-success">Panel de vendedor - aquí puedes registrar ventas y consultar productos.</div>
            <%
                }
            %>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>