/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.damp.sig.farmacia.controller;

/**
 *
 * @author jadrianh
 */
import com.damp.sig.farmacia.model.UsuarioDAO;
import com.damp.sig.farmacia.model.Usuario;
import com.damp.sig.farmacia.util.HashUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        String hash = HashUtil.sha256(password);

        UsuarioDAO dao = new UsuarioDAO();
        Usuario user = dao.validar(usuario, hash);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", user);
            response.sendRedirect("home.jsp");
        } else {
            request.setAttribute("mensaje", "Usuario o contraseña incorrectos.");
            request.getRequestDispatcher("loginError.jsp").forward(request, response);
        }
    }
}