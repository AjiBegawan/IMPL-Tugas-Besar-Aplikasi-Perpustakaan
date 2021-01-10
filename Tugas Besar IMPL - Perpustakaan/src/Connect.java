/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author LENOVO
 */
public class Connect {
        private static Connection con;
    
    public Connection getConnection(){
         try{
            con=DriverManager.getConnection("jdbc:mysql://localhost/perpus", "root","");
    }
    catch(SQLException e){
        JOptionPane.showMessageDialog(null,e + " Gagal Koneksi");
    }
return con;
  }
}