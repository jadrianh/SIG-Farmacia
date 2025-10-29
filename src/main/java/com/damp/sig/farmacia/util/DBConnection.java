/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.damp.sig.farmacia.util;

/**
 *
 * @author jadrianh
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=SIGFarmaciaDB;encrypt=true;trustServerCertificate=true;";
    private static final String USER = "jadrianh";
    private static final String PASSWORD = "123";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Conexión exitosa a SQL Server (SIGFarmaciaDB)");
        } catch (Exception e) {
            System.out.println("❌ Error al conectar a SQL Server: " + e.getMessage());
        }
        return conn;
    }
}

