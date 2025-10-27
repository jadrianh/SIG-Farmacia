/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.damp.sig.farmacia.model;

/**
 *
 * @author jadrianh
 */
import com.damp.sig.farmacia.util.DBConnection;
import java.sql.*;

public class UsuarioDAO {

    public Usuario validar(String nombreUsuario, String hashPassword) {
        Usuario user = null;

        String sql = "SELECT * FROM Usuario WHERE nombre_usuario = ? AND contrasena_hash = ? AND estado = 1";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nombreUsuario);
            ps.setString(2, hashPassword);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new Usuario();
                user.setId_usuario(rs.getInt("id_usuario"));
                user.setNombre_usuario(rs.getString("nombre_usuario"));
                user.setContrasena_hash(rs.getString("contrasena_hash"));
                user.setEmail(rs.getString("email"));
                user.setRol_id(rs.getInt("rol_id"));
                user.setEstado(rs.getBoolean("estado"));
            }

        } catch (Exception e) {
            System.out.println("❌ Error en validación de usuario: " + e.getMessage());
        }
        return user;
    }
}
