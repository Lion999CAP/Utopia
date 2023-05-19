package com.revista.seguridad;
import java.sql.PreparedStatement;
import com.revista.datos.*;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Pagina {
	private String nombre;
	private String path;
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String mostrarMenu(int nperfil) {
	    String menu = "<ul>";
	    String sql = "SELECT * FROM tb_pagina pag, tb_perfil per, \"tb_perfilPagina\" pper WHERE pag.id_pag=pper.id_pag AND pper.id_per=per.id_per AND pper.id_per=?";
	    Conexion con = new Conexion();
	    ResultSet rs = null;
	    try {
	        PreparedStatement stmt = con.getConexion().prepareStatement(sql);
	        stmt.setInt(1, nperfil);
	        rs = stmt.executeQuery();
	        while (rs.next()) {
	            menu += "<li><a href=" + rs.getString(3) + " accesskey=" + rs.getInt(1) + ">" + rs.getString(2) + "</a></li>";
	        }
	        menu += "</ul>";
	        stmt.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.print(menu);
	    } 
	    return menu;
	}
	
	public Pagina() {
		this.nombre="";
		this.path="";
	}
}
