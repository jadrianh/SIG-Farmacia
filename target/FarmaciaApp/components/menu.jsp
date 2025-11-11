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

<!-- Sidebar Moderno -->
<div class="col-md-3 col-lg-2 d-none d-md-block bg-dark text-white min-vh-100 p-0 border-end shadow-lg position-relative">
    <div class="p-3 sticky-top">
        <div class="d-flex align-items-center gap-3 mb-3">
            <div>
                <strong class="d-block lh-1 fs-5 mb-1"><%= user.getNombre_usuario() %></strong>
                <span class="badge bg-primary text-white"><%= (rolId == 1) ? "Administrador" : "Vendedor" %></span>
            </div>
        </div>
        <hr class="border-secondary">

        <ul class="nav flex-column">
            <li class="nav-item mb-2">
                <a class="nav-link text-white active d-flex align-items-center gap-2" href="home.jsp">
                    <i class="bi bi-house-door fs-5"></i> Inicio
                </a>
            </li>
            <% if (rolId == 1) { %>
                <li class="nav-item mb-2">
                    <a class="nav-link text-white d-flex align-items-center gap-2" href="users.jsp">
                        <i class="bi bi-people fs-5"></i>
                        Usuarios <span class="badge bg-info ms-auto">12</span>
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link text-white d-flex align-items-center gap-2" href="products.jsp">
                        <i class="bi bi-capsule fs-5"></i>
                        Productos <span class="badge bg-success ms-auto">520</span>
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link text-white d-flex align-items-center gap-2" href="labs.jsp">
                        <i class="bi bi-building fs-5"></i>
                        Laboratorios
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link text-white d-flex align-items-center gap-2" href="reports.jsp">
                        <i class="bi bi-graph-up fs-5"></i>
                        Reportes <span class="badge bg-warning text-dark ms-auto">34</span>
                    </a>
                </li>
            <% } else { %>
                <li class="nav-item mb-2">
                    <a class="nav-link text-white d-flex align-items-center gap-2" href="sales.jsp">
                        <i class="bi bi-cart-check fs-5"></i>
                        Ventas
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link text-white d-flex align-items-center gap-2" href="productos.jsp">
                        <i class="bi bi-capsule fs-5"></i>
                        Productos <span class="badge bg-success ms-auto">97</span>
                    </a>
                </li>
            <% } %>

            <hr class="border-secondary my-3">

            <li class="nav-item">
                <a class="nav-link text-danger fw-bold d-flex align-items-center gap-2" href="LogoutServlet">
                    <i class="bi bi-box-arrow-right fs-5"></i> Salir
                </a>
            </li>
        </ul>
    </div>
</div>

<!-- los iconos-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">