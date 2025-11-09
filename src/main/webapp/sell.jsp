<%--
    Document   : sell
    Created on : 9 nov 2025, 1:20:39 p.m.
    Author     : jadrianh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Venta - SIG Farmacia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        body { 
            padding-top: 10% !important;
            background: #f6fbfa;
        }
        .section-card { border-radius: 18px; box-shadow: 0 6px 22px rgba(110,208,255,0.07); background: #fff; margin-top: 24px; }
        .form-title { font-size: 1.35rem; font-weight: 600; color: #337ab7;}
        .btn-gradient {
          background: linear-gradient(90deg,#37b4eb 5%,#27e2b4 80%);
          color: #fff; border: none;
          transition: transform 0.15s;
        }
        .btn-gradient:hover { transform: scale(1.04); box-shadow: 0 3px 12px rgba(97,196,174,0.17);}
        .table-productos tr td, .table-productos tr th {vertical-align: middle;}
        .fade-in { animation: fadeIn 0.6s;}
        @keyframes fadeIn { from { opacity:0} to {opacity:1}}
    </style>
</head>
<body>
    <%@ include file="components/navbar.jsp" %>

    <div class="container mt-4">
      <!-- Paso 1: Registrar Cliente -->
      <div class="section-card p-4">
        <div class="form-title mb-2">Paso 1 - Registrar Cliente</div>
        <form id="clienteForm" class="row g-3 needs-validation" novalidate action="CrearClienteServlet" method="POST">
          <div class="col-md-4">
            <label class="form-label">Nombre completo</label>
            <input type="text" class="form-control" name="nombre" required>
          </div>
          <div class="col-md-3">
            <label class="form-label">Fecha nacimiento</label>
            <input type="date" class="form-control" name="fecha_nacimiento">
          </div>
          <div class="col-md-2">
            <label class="form-label">Sexo</label>
            <select name="sexo" class="form-select" required>
              <option value="M">Masculino</option>
              <option value="F">Femenino</option>
            </select>
          </div>
          <div class="col-md-3">
            <label class="form-label">Teléfono</label>
            <input type="tel" name="telefono" class="form-control">
          </div>
          <div class="col-md-4">
            <label class="form-label">DUI</label>
            <input type="text" name="dui" class="form-control" required>
          </div>
          <div class="col-md-4">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control">
          </div>
          <div class="col-12 mt-3">
            <button class="btn btn-gradient px-4" type="submit">Guardar Cliente</button>
          </div>
        </form>
      </div>

      <!-- Paso 2: Nueva Venta (visible al crear cliente) -->
      <div id="ventaSection" class="section-card p-4 mt-4 fade-in" style="display:none;">
        <div class="form-title mb-2">Paso 2 - Registrar Venta</div>
        <form id="ventaForm" action="RegistrarVentaServlet" method="POST" enctype="multipart/form-data">
          <input type="hidden" name="cliente_id" id="inputClienteId"/>
          <div class="row g-3 mb-2">
            <div class="col-md-4">
              <label>Empleado (atendiendo):</label>
              <select class="form-select" name="empleado_id" required>
                <%-- Rellenar con empleados desde Java --%>
                <%-- Ejemplo:
                  for(Empleado emp: empleados) {
                      out.print("<option value=\""+emp.getId()+"\">"+emp.getNombres()+" "+emp.getApellidos()+"</option>");
                  }
                --%>
              </select>
            </div>
            <div class="col-md-4">
              <label>Receta (si aplica):</label>
              <input type="file" class="form-control" name="receta_adjunto"/>
            </div>
            <div class="col-md-4 align-self-end">
              <span class="badge bg-info">Fecha: <%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(new java.util.Date()) %></span>
            </div>
          </div>
          <!-- Sección de productos -->
          <div class="my-3">
            <div class="input-group mb-2">
              <span class="input-group-text">Buscar producto</span>
              <input id="buscarProd" type="text" class="form-control" placeholder="nombre, tipo, lab...">
              <button class="btn btn-outline-secondary" type="button" onclick="buscarProducto()">Buscar</button>
            </div>
            <div id="productosLista" class="table-responsive"></div>
          </div>
          <!-- Carrito -->
          <div class="my-1">
            <div class="table-responsive">
              <table class="table table-bordered table-striped table-productos">
                <thead class="table-success">
                  <tr>
                    <th>Producto</th>
                    <th>Cantidad</th>
                    <th>Precio Unitario</th>
                    <th>Subtotal</th>
                    <th>X</th>
                  </tr>
                </thead>
                <tbody id="carritoTablaBody"></tbody>
              </table>
            </div>
            <div class="d-flex justify-content-end mb-2">
               <h4 class="me-4">Total: <span id="totalVenta">$0.00</span></h4>
            </div>
            <input type="hidden" name="detalles_json" id="inputDetallesJSON"/>
            <button type="submit" class="btn btn-gradient px-4">Confirmar y Guardar Venta</button>
          </div>
        </form>
      </div>
    </div>

    <!-- JS para animaciones, validaciones, y lógica front -->
    <script>
        // Validación Bootstrap
        (() => {
          'use strict';
          const forms = document.querySelectorAll('.needs-validation');
          Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
              if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        })();
        // Lógica manejo "crear cliente"
        document.getElementById('clienteForm').onsubmit = function(evt) {
          evt.preventDefault();
          const formData = new FormData(this);
          fetch('CrearClienteServlet', { method: 'POST', body: formData })
            .then(r => r.json()).then(res => {
              if(res.success) {
                 document.getElementById('inputClienteId').value = res.cliente_id;
                 document.getElementById('ventaSection').style.display = 'block';
                 // Desactivar formulario cliente para evitar errores
                 Array.from(document.getElementById('clienteForm').elements).forEach(e => e.disabled = true);
              } else {
                 alert('Error creando cliente: ' + res.message);
              }
            });
        };

        // Simula búsqueda productos (AJAX)
        function buscarProducto() {
            const key = document.getElementById('buscarProd').value;
            fetch('BuscarProductoServlet?q=' + encodeURIComponent(key))
              .then(r => r.json()).then(arr => {
                const cont = document.getElementById('productosLista');
                if(!arr.length) { cont.innerHTML = '<span class="text-danger">No se encontraron productos.</span>'; return;}
                let html = `<table class='table'><thead><tr>
                    <th>Nombre</th><th>Tipo</th><th>Stock</th><th>Precio</th><th></th></tr></thead><tbody>`;
                arr.forEach(prod => {
                  html += `<tr>
                      <td>${prod.nombre}</td>
                      <td>${prod.tipo_medicamento}</td>
                      <td>${prod.unidades_existencia}</td>
                      <td>$${prod.precio_unitario}</td>
                      <td><button class='btn btn-sm btn-gradient' onclick='agregarAlCarrito(${JSON.stringify(prod)})'>Agregar</button></td>
                  </tr>`;
                });
                html += '</tbody></table>';
                cont.innerHTML = html;
              });
        }
        // Carrito dinámico
        let carrito = [];
        function agregarAlCarrito(prod) {
            const p = carrito.find(x=>x.id_producto === prod.id_producto);
            if(p) { p.cantidad += 1; } else { carrito.push({...prod, cantidad: 1}); }
            renderCarrito();
        }
        function eliminarDelCarrito(id){
            carrito = carrito.filter(x=>x.id_producto!==id);
            renderCarrito();
        }
        function renderCarrito() {
            let tbody = '', total = 0;
            carrito.forEach(item => {
                const sub = item.cantidad*item.precio_unitario;
                total += sub;
                tbody += `<tr>
                  <td>${item.nombre}</td>
                  <td><input type='number' min='1' value='${item.cantidad}' 
                        class='form-control form-control-sm' style='width:72px' onchange='actualizaCantidad(${item.id_producto},this.value)'/>
                  </td>
                  <td>$${item.precio_unitario}</td>
                  <td>$${sub.toFixed(2)}</td>
                  <td><button class='btn btn-danger btn-sm' onclick='eliminarDelCarrito(${item.id_producto})'>X</button></td>
                </tr>`;
            });
            document.getElementById('carritoTablaBody').innerHTML = tbody;
            document.getElementById('totalVenta').textContent = '$'+total.toFixed(2);
            document.getElementById('inputDetallesJSON').value = JSON.stringify(carrito);
        }
        function actualizaCantidad(id,val) {
            const p = carrito.find(x=>x.id_producto === id);
            if(p) { p.cantidad = Math.max(1,parseInt(val)||1); }
            renderCarrito();
        }

    </script>
</body>
</html>
