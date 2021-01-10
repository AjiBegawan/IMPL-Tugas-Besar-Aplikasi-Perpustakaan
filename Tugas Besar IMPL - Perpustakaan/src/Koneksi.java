
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author febri
 */
public class Koneksi {

    private static Connection kon;

    public static Connection getConnection() {
        try {
            kon = DriverManager.getConnection("jdbc:mysql://localhost/perpus", "root", "");
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Gagal Koneksi");
        }
        return kon;
    }
}
