<%-- 
    Document   : index
    Created on : 26 oct 2025, 11:48:50 p.m.
    Author     : jadrianh
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Inicio de Sesión - Super Farmacias</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>
    <body>
        <section class="w-100 vh-100 bg-primary justify-content-center py-5 py-md-5 py-xl-8">
            <div class="container">
                <div class="row gy-4 justify-content-center align-items-center">
                    <div class="col-12 col-md-6 col-xl-7">
                        <div class="d-flex justify-content-center text-bg-primary">
                            <div class="col-12 col-xl-9">
                                <img
                                    class="img-fluid rounded mb-4"
                                    loading="lazy"
                                    src="./assets/img/bsb-logo-light.svg"
                                    width="245"
                                    height="80"
                                    alt="Super Farmacias Logo"
                                    />
                                <hr class="border-primary-subtle mb-4" />
                                <h2 class="h1 mb-4">
                                    Sistema de información general: Super Farmacias
                                </h2>
                                <p class="lead mb-5">
                                    Brindar productos farmacéuticos y de cuidado personal de alta
                                    calidad, con atención humana, accesible y confiable para todas
                                    las familias de Latinoamérica.
                                </p>
                                <div class="text-endx">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="48"
                                        height="48"
                                        fill="currentColor"
                                        class="bi bi-grip-horizontal"
                                        viewBox="0 0 16 16"
                                        >
                                        <path
                                            d="M2 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm3 3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm3 3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm3 3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm3 3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"
                                            />
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-xl-5">
                        <div class="card border-0 rounded-4">
                            <div class="card-body p-3 p-md-4 p-xl-6">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="mb-4">
                                            <h3>Iniciar Sesión</h3>
                                            <p>
                                                No tienes una cuenta?
                                                <a href="#!">Contacta con el administrador</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <form action="LoginServlet" method="post">
                                    <div class="row gy-3 overflow-hidden">
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input
                                                    type="text"
                                                    class="form-control"
                                                    name="usuario"
                                                    id="usuario"
                                                    placeholder="Username"
                                                    required
                                                    />
                                                <label for="usuario" class="form-label">Username</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input
                                                    type="password"
                                                    class="form-control"
                                                    name="password"
                                                    id="password"
                                                    value=""
                                                    placeholder="Password"
                                                    required
                                                    />
                                                <label for="password" class="form-label"
                                                       >Password</label
                                                >
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="d-grid">
                                                <button class="btn btn-primary btn-lg" type="submit">
                                                    Continuar
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="row">
                                    <div class="col-12">
                                        <div
                                            class="d-flex gap-2 gap-md-4 flex-column flex-md-row justify-content-md-end mt-4"
                                            >
                                            <a href="#!">Olvidastes tu contraseña?</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Modal de error -->
        <div
            class="modal fade"
            id="errorModal"
            tabindex="-1"
            aria-labelledby="errorModalLabel"
            aria-hidden="true"
            >
            <div class="modal-dialog">
                <div class="modal-content border-danger">
                    <div class="modal-header bg-danger text-white">
                        <h5 class="modal-title" id="errorModalLabel">
                            Error de inicio de sesión
                        </h5>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Cerrar"
                            ></button>
                    </div>
                    <div class="modal-body">
                        <p>${mensaje}</p>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-secondary"
                            data-bs-dismiss="modal"
                            >
                            Cerrar
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        <% if (request.getAttribute("mensaje") != null) { %>
      var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
      errorModal.show();
        <% }%>
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

</html>
