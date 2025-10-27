/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.damp.sig.farmacia.model;

/**
 *
 * @author jadrianh
 */

public class Usuario {
    private int id_usuario;
    private String nombre_usuario;
    private String contrasena_hash;
    private String email;
    private int rol_id;
    private boolean estado;

    // Getters y Setters
    public int getId_usuario() { return id_usuario; }
    public void setId_usuario(int id_usuario) { this.id_usuario = id_usuario; }

    public String getNombre_usuario() { return nombre_usuario; }
    public void setNombre_usuario(String nombre_usuario) { this.nombre_usuario = nombre_usuario; }

    public String getContrasena_hash() { return contrasena_hash; }
    public void setContrasena_hash(String contrasena_hash) { this.contrasena_hash = contrasena_hash; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public int getRol_id() { return rol_id; }
    public void setRol_id(int rol_id) { this.rol_id = rol_id; }

    public boolean isEstado() { return estado; }
    public void setEstado(boolean estado) { this.estado = estado; }
}
