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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>
    <body class="bg-light">

        <div class="container-fluid">
            <div class="row">
                <jsp:include page="components/menu.jsp" />

                <div class="col-md-9 col-lg-10 p-4">
                    <!-- Header dinámico -->
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <div>
                            <h2 class="fw-bold mb-1 text-dark">Bienvenido, <%= user.getNombre_usuario()%> <span class="wave">👋</span></h2>
                            <span class="badge rounded-pill bg-info text-dark shadow">Sistema General de Farmacias</span>
                        </div>
                        <div>
                            <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#profileModal">
                                <i class="bi bi-person-circle"></i> Perfil
                            </button>
                        </div>
                    </div>

                    <!-- Tarjetas de métricas rápidas (dashboard widgets) -->
                    <div class="row g-4 mb-4">
                        <% if (user.getRol_id() == 1) { %>
                        <div class="col-12 col-md-4">
                            <div class="card border-0 shadow h-100 animate__animated animate__fadeInUp">
                                <div class="card-body py-3 text-center">
                                    <i class="bi bi-people fs-2 text-success mb-1"></i>
                                    <h5 class="card-title">Usuarios activos</h5>
                                    <span class="display-5 fw-bold text-success">12</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="card border-0 shadow h-100 animate__animated animate__fadeInUp animate__delay-1s">
                                <div class="card-body py-3 text-center">
                                    <i class="bi bi-capsule-pill fs-2 text-primary mb-1"></i>
                                    <h5 class="card-title">Productos en inventario</h5>
                                    <span class="display-5 fw-bold text-primary">520</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="card border-0 shadow h-100 animate__animated animate__fadeInUp animate__delay-2s">
                                <div class="card-body py-3 text-center">
                                    <i class="bi bi-graph-up-arrow fs-2 text-warning mb-1"></i>
                                    <h5 class="card-title">Reportes generados</h5>
                                    <span class="display-5 fw-bold text-warning">34</span>
                                </div>
                            </div>
                        </div>
                        <% } else { %>
                        <div class="col-12 col-md-6">
                            <div class="card border-0 shadow h-100 animate__animated animate__fadeInUp">
                                <div class="card-body py-3 text-center">
                                    <i class="bi bi-cart-check fs-2 text-success mb-1"></i>
                                    <h5 class="card-title">Ventas registradas</h5>
                                    <span class="display-5 fw-bold text-success">18</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="card border-0 shadow h-100 animate__animated animate__fadeInUp animate__delay-1s">
                                <div class="card-body py-3 text-center">
                                    <i class="bi bi-capsule-pill fs-2 text-primary mb-1"></i>
                                    <h5 class="card-title">Productos en stock</h5>
                                    <span class="display-5 fw-bold text-primary">97</span>
                                </div>
                            </div>
                        </div>
                        <% }%>
                    </div>

                    <!-- Panel general -->
                    <div class="card shadow border-0 mb-4 animate__animated animate__fadeInUp animate__delay-3s">
                        <div class="card-body">
                            <h5 class="card-title text-primary">Información del usuario</h5>
                            <div class="row g-3 align-items-center">
                                <div class="col-sm-6 col-lg-4">
                                    <p><strong>Email:</strong> <%= user.getEmail() != null ? user.getEmail() : "No registrado"%></p>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    <p><strong>Rol:</strong> <%= (user.getRol_id() == 1) ? "Administrador" : "Vendedor"%></p>
                                </div>
                                <div class="col-lg-4 text-lg-end">
                                    <a href="LogoutServlet" class="btn btn-danger btn-sm mt-2">Cerrar sesión</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Panel dinámico informativo -->
                    <%
                        if (user.getRol_id() == 1) { // Admin
                    %>
                    <div class="alert alert-primary shadow-sm animate__animated animate__fadeInDown" role="alert">
                        <i class="bi bi-tools"></i> Panel de administrador - gestiona usuarios, productos y reportes con un solo clic.
                    </div>
                    <%
                    } else {
                    %>
                    <div class="alert alert-success shadow-sm animate__animated animate__fadeInDown" role="alert">
                        <i class="bi bi-handbag"></i> Panel de vendedor - registra ventas y consulta productos fácilmente.
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>

        <!-- Modal perfil -->
        <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content border-0">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="profileModalLabel">Perfil de usuario</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <p><strong>Nombre de usuario:</strong> <%= user.getNombre_usuario()%></p>
                        <p><strong>Email:</strong> <%= user.getEmail() != null ? user.getEmail() : "No registrado"%></p>
                        <p><strong>Rol:</strong> <%= (user.getRol_id() == 1) ? "Administrador" : "Vendedor"%></p>
                    </div>
                </div>
            </div>
        </div> 
        <!-- Bootstrap y animaciones -->
        <link href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</html>