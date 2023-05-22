package com.revista.negocio;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Pattern;

import javax.servlet.http.Part;

import com.revista.datos.Conexion;
import com.revista.datos.*;

public class Funciones {

	private long cedula;
	private String nombre;
	private String correo;
	private String carrera;
	private long celular;
	private Date fecha;
	private byte foto;
	private byte h_vida;
	private String clave;
	private boolean aprobado;
	private static final String EMAIL_PATTERN = "^\\w+([.-]?\\w+)*@\\w+([.-]?\\w+)*(\\.\\w{2,3})+$";
	private static final Pattern pattern = Pattern.compile(EMAIL_PATTERN);

	public static boolean isValidEmail(String email) {
        return pattern.matcher(email).matches();
    }

	public long getCedula() {
		return cedula;
	}

	public void setCedula(long cedula) {
		this.cedula = cedula;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getCarrera() {
		return carrera;
	}

	public void setCarrera(String carrera) {
		this.carrera = carrera;
	}

	public long getCelular() {
		return celular;
	}

	public void setCelular(long celular) {
		this.celular = celular;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public byte getFoto() {
		return foto;
	}

	public void setFoto(byte foto) {
		this.foto = foto;
	}

	public byte getH_vida() {
		return h_vida;
	}

	public void setH_vida(byte h_vida) {
		this.h_vida = h_vida;
	}

	public boolean isAprobado() {
		return aprobado;
	}

	public void setAprobado(boolean aprobado) {
		this.aprobado = aprobado;
	}

	public String saveImage(File imageFile) throws IOException {
		String result="";
		Conexion con=new Conexion();
		byte[] imageData = Files.readAllBytes(imageFile.toPath());
        String sql = "INSERT INTO imagenes (datos) VALUES (?)";
        PreparedStatement pr=null;
        ResultSet rs=null;
    	rs=con.Consulta(sql);
         try {
           	pr=con.getConexion().prepareStatement(sql);
            pr.setBytes(1, imageData);
            if(pr.executeUpdate()==1)
          	{
          	result="Inserción correcta";
           	}
           	else
           	{
           	result="Error en inserción";
           	}
           	}
           	catch(Exception ex)
           	{
            	result=ex.getMessage();
            	}
            	finally
            	{
            	try
            	{
            	pr.close();
            	con.getConexion().close();
            	}
            	catch(Exception ex)
            	{
            	System.out.print(ex.getMessage());
            	}
            	}
         return result;
    }
	
	public byte[] getImageData(int imagenId) throws IOException {
        Conexion con = new Conexion();
        byte[] imageData = null;
        String sql = "SELECT datos FROM imagenes WHERE id = ?";
        PreparedStatement pr = null;
        ResultSet rs = null;
        
        try {
            pr = con.getConexion().prepareStatement(sql);
            pr.setInt(1, imagenId);
            
            rs = pr.executeQuery();
            
            if (rs.next()) {
                imageData = rs.getBytes("datos");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                rs.close();
                pr.close();
                con.getConexion().close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        
        return imageData;
    }
	
	public boolean guardarDatosUser(String cedula, String nombre, String correo, String carrera, String celular, String fecha, String foto) {
	    Conexion con = new Conexion();
	    PreparedStatement pr = null;
	    String clave = "123456";
	    String sql = "INSERT INTO public.tb_usuario(ci_us, nombre_us, correo_us, carrera_us, celular_us, fecha_us,clave_us ,foto_us)	VALUES (?, ?, ?, ?, ?, ?, ?,?);";
	    try {
	        pr = con.getConexion().prepareStatement(sql);
	        pr.setString(1, cedula);
	        pr.setString(2, nombre);
	        pr.setString(3, correo);
	        pr.setString(4, carrera);
	        pr.setString(5, celular);
	        pr.setString(6, fecha);
	        pr.setString(7, clave);
	        pr.setString(8, foto);
	        int filasAfectadas = pr.executeUpdate();
	        return filasAfectadas > 0; // Retorna true si se insertaron filas, false si no se insertaron filas.
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.print(e.getMessage());
	        return false; // Retorna false en caso de excepción o error.
	    }
	}
	
	public boolean guardarDatosPost(String cedula, String h_vida) {
		Conexion con = new Conexion();
		PreparedStatement pr=null;
		boolean pos=false;
		String sql = "INSERT INTO public.tb_postulante(ci_us, aprobado, h_vida) VALUES (?, ?, ?);";
        try{
            pr=con.getConexion().prepareStatement(sql);
            pr.setString(1, cedula);
            pr.setBoolean(2, pos);
            pr.setString(3, h_vida);
            int filasAfectadas = pr.executeUpdate();
	        return filasAfectadas > 0; // Retorna true si se insertaron filas, false si no se insertaron filas.
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
            return false; // Retorna false en caso de excepción o error.
        }
    }
	
	public boolean aceptarPostulacion(int estudianteId, boolean aceptado) {
	    boolean exito = false;
	    Conexion con = new Conexion();
	    
	    try (Connection conn = con.getConexion()) {
	        String sql = "UPDATE tabla_estudiantes SET estado_postulacion = ? WHERE id = ?";
	        PreparedStatement statement = conn.prepareStatement(sql);
	        statement.setBoolean(1, aceptado);
	        statement.setInt(2, estudianteId);
	        
	        int rowsAffected = statement.executeUpdate();
	        
	        if (rowsAffected > 0) {
	            exito = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return exito;
	}
	
	
	public Funciones() {
		
	}

}
