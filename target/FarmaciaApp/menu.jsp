<%-- 
    Document   : menu
    Created on : 2 nov 2025, 4:16:50
    Author     : Usuario
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.damp.sig.farmacia.model.Usuario" %>

<%
    Usuario user = (Usuario) session.getAttribute("usuario");
    if (user == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    int rolId = user.getRol_id();
%>

<!-- Sidebar -->
<div class="col-md-3 col-lg-2 bg-dark text-white min-vh-100 p-3">
    <h4 class="text-center mb-4">SIG Farmacia</h4>

    <div class="mb-4 text-center">
        <strong><%= user.getNombre_usuario() %></strong><br>
        <small class="text-light">
            <%= (rolId == 1) ? "Administrador" : "Vendedor" %>
        </small>
    </div>

    <hr class="border-secondary">

    <ul class="nav flex-column px-2">
        <li class="nav-item mb-2">
            <a class="nav-link text-white" href="home.jsp">
                <i class="bi bi-house-door"></i> Inicio
            </a>
        </li>

        <% if (rolId == 1) { %>
            <!-- opciones para admin-->
            <li class="nav-item mb-2">
                <a class="nav-link text-white" href="usuarios.jsp">
                    <i class="bi bi-people"></i> Usuarios
                </a>
            </li>
            <li class="nav-item mb-2">
                <a class="nav-link text-white" href="productos.jsp">
                    <i class="bi bi-capsule"></i> Productos
                </a>
            </li>
            <li class="nav-item mb-2">
                <a class="nav-link text-white" href="laboratorios.jsp">
                    <i class="bi bi-building"></i> Laboratorios
                </a>
            </li>
            <li class="nav-item mb-2">
                <a class="nav-link text-white" href="reportes.jsp">
                    <i class="bi bi-graph-up"></i> Reportes
                </a>
            </li>
        <% } else { %>
            <!-- lo que puede ver solo el vendedor -->
            <li class="nav-item mb-2">
                <a class="nav-link text-white" href="ventas.jsp">
                    <i class="bi bi-cart-check"></i> Ventas
                </a>
            </li>
            <li class="nav-item mb-2">
                <a class="nav-link text-white" href="clientes.jsp">
                    <i class="bi bi-person-lines-fill"></i> Clientes
                </a>
            </li>
            <li class="nav-item mb-2">
                <a class="nav-link text-white" href="productos.jsp">
                    <i class="bi bi-capsule"></i> Productos
                </a>
            </li>
        <% } %>

        <hr class="border-secondary my-3">

        <li class="nav-item">
            <a class="nav-link text-danger fw-bold" href="LogoutServlet">
                <i class="bi bi-box-arrow-right"></i> Cerrar sesión
            </a>
        </li>
    </ul>
</div>

<!-- los iconos-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

