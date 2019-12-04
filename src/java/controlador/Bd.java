/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Pedido;
import modelo.Usuario;

/**
 *
 * @author Alumno_2DAW
 */
public class Bd {
   private final static String drv = "com.mysql.jdbc.Driver";
   private final static String db = "jdbc:mysql://localhost:3306/telepizza?useSSL=false";
   private final static String user = "root";
   private Connection conn;
   private PreparedStatement pst;
   private ResultSet rs; 
   
   
   public void abrirConexion() throws ClassNotFoundException, SQLException{
    Class.forName(drv);
    conn = DriverManager.getConnection(db,user,"");
       System.out.println("La conexion se realizo con exito");
   }
   public void cerrarConexion() throws SQLException{
    if(pst != null)pst.close();
    if(rs !=null)pst.close();
       System.out.println("Conexion Cerrada");
    }
      public List<Usuario> obtenerUsuarios(){
       List<Usuario> usuarios = new ArrayList<Usuario>();
       String sql = "SELECT * FROM usuarios";
       try {
           pst = conn.prepareStatement(sql);
           rs = pst.executeQuery();
           while(rs.next()){
                int id= rs.getInt(1);
                String nombreUsuario = rs.getString(2);
                String pass = rs.getString(3);
                String direccion = rs.getString(4);
                String email = rs.getString(5);
                int telefono=rs.getInt(6);
                String nombre=rs.getString(7);
                String apellidos= rs.getString(8);
                Usuario usuario = new Usuario(id, nombreUsuario, pass, direccion, email, telefono, nombre, apellidos);
                usuarios.add(usuario);
           }
       } catch (SQLException ex) {
           Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
       }
       
   
       return usuarios;
   }
      public List<Pedido> obtenerOfertas(){
          List<Pedido> pedidos = new ArrayList<Pedido>();
          String sql = "Select * from ofertas";
       try {
           pst = conn.prepareStatement(sql);
           rs = pst.executeQuery();
           while(rs.next()){
            int id = rs.getInt(1);
            String descripcion = rs.getString(2);
            Pedido pedido = new Pedido(id, descripcion);
            pedidos.add(pedido);
           }
       } catch (SQLException ex) {
           Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
       }
          return pedidos;
      }
}
