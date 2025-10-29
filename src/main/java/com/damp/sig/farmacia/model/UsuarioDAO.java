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
import org.mindrot.jbcrypt.BCrypt;

public class UsuarioDAO {

    public Usuario validar(String nombreUsuario, String password) {
        Usuario user = null;

        String sql = "SELECT * FROM Usuario WHERE nombre_usuario = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nombreUsuario);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                String hashBD = rs.getString("contrasena_hash");

                // Verifica si la contraseña ingresada coincide con el hash almacenado
                if (BCrypt.checkpw(password, hashBD)) {
                    user = new Usuario();
                    user.setId_usuario(rs.getInt("id_usuario"));
                    user.setNombre_usuario(rs.getString("nombre_usuario"));
                    user.setContrasena_hash(hashBD);
                    user.setEmail(rs.getString("email"));
                    user.setRol_id(rs.getInt("rol_id"));
                    user.setEstado(rs.getBoolean("estado"));
                } else {
                    System.out.println("❌ Password incorrecto");
                }
            }
        } catch (Exception e) {
            System.out.println("❌ Error en validación de usuario: " + e.getMessage());
        }
        return user;
    }
    
    // Esta funcion crea el usuario ya con encriptado de password
    public boolean crear(String nombreUsuario, String password, String email, int rolId) {
        String sql = "INSERT INTO Usuario (nombre_usuario, contrasena_hash, email, rol_id) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Genera el hash de la contraseña
            String hash = BCrypt.hashpw(password, BCrypt.gensalt(12));

            ps.setString(1, nombreUsuario);
            ps.setString(2, hash);
            ps.setString(3, email);
            ps.setInt(4, rolId);

            int filas = ps.executeUpdate();
            return filas > 0; // true si se insertó correctamente

        } catch (Exception e) {
            System.out.println("❌ Error al crear usuario: " + e.getMessage());
            return false;
        }
    }
}
