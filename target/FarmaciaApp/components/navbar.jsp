<%-- 
    Document   : navbar
    Created on : 9 nov 2025, 1:26:47 p.m.
    Author     : jadrianh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.damp.sig.farmacia.model.Usuario"%>
<%
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    Usuario user = (Usuario) session.getAttribute("usuario");
%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJx3WcN28kq5f6b8gbZXjhfDbjVQs68B2b1Dx1lHliYlwJWcI9YGoakSiTgL" crossorigin="anonymous">
    <style>
        .navbar-custom .navbar-brand {
            color: #f8f9fa;
        }
        .navbar-custom .navbar-nav .nav-link {
            color: #f8f9fa;
            transition: all 0.3s ease;
        }
        .navbar-custom .navbar-nav .nav-link:hover {
            color: #ffd700;
        }
        .navbar-custom .navbar-nav .nav-link.active {
            color: f8f9fa;
        }
        .dropdown-menu {
            background-color: #0D4FB3;
        }
        .dropdown-item:hover {
            background-color: #09326F;
            color: #f8f9fa;
        }
        /* Cambio de color en el navbar cuando se hace scroll */
        .navbar-scroll {
            background-color: #212529 !important;
            transition: background-color 0.3s ease;
        }
    </style>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom bg-primary fixed-top mb-3">
        <div class="container-fluid">
            <a class="navbar-brand fs-2" href="#">Super Farmacias</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active fs-5" aria-current="page" href="./home.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fs-5" href="./sell.jsp">Ventas</a>
                    </li>
                    <%
                        if (user != null && user.getRol_id() == 1) {
                    %>
                    <!-- Botón visible solo para administradores -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle fs-5" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Administracion</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item text-light fs-6" href="#">Nuevo Empleado</a></li>
                            <li><a class="dropdown-item text-light fs-6" href="#">Stock Producto</a></li>
                            <li><a class="dropdown-item text-light fs-6" href="#">Reportes</a></li>
                        </ul>
                    </li>
                    <%
                        }
                    %>
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-danger fs-5" href="./index.jsp">Log out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Bootstrap JS y Popper.js (necesarios para los componentes interactivos) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybR8mOa9Xz+3hxDWb6q9sFxS6K3wQbl0xghlGd74g0PhwF1Hi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0v8FqR7zH0Wy3Hc3b5s5v5F6l62FhHLy+q3HRFgfpnZ6ePTf" crossorigin="anonymous"></script>

    <!-- Script para cambio de color del navbar al hacer scroll -->
    <script>
        window.onscroll = function() {toggleNavbarColor()};

        var navbar = document.querySelector(".navbar-custom");

        function toggleNavbarColor() {
            if (window.scrollY > 50) {
                navbar.classList.add("navbar-scroll");
            } else {
                navbar.classList.remove("navbar-scroll");
            }
        }
    </script>