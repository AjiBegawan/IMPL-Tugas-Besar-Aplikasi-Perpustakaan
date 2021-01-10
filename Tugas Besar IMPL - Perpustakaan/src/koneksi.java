/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author indiz
 */

import java.sql.Connection;
import java.sql.DriverManager;
public class koneksi {
   public static void main(String[]args){
      Connection con = null;
      try {
         con = DriverManager.
         getConnection("jdbc:mysql://localhost:3306/sample?useSSL=false", "root", "123456");
         System.out.println("Connection is successful !!!!!");
      } catch(Exception e) {
         e.printStackTrace();
      }
   }
}