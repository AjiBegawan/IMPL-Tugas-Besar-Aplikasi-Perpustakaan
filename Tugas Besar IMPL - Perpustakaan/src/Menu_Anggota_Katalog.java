import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author indiz
 */
public class Menu_Anggota_Katalog extends javax.swing.JFrame {

private DefaultTableModel model;
public int banyak;

    /**
     * Creates new form Menu
     */
    public Menu_Anggota_Katalog()  {
        initComponents();

          loadBuku();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        panelUtama = new javax.swing.JPanel();
        panelJudul = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        panelNavBar = new javax.swing.JPanel();
        profileBtn = new javax.swing.JButton();
        katalogBtn = new javax.swing.JButton();
        pengembalianBtn = new javax.swing.JButton();
        logoutBtn = new javax.swing.JButton();
        panelAwal = new javax.swing.JPanel();
        Profile = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        TableBuku = new javax.swing.JTable();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("KATALOG");
        setMinimumSize(new java.awt.Dimension(900, 700));
        getContentPane().setLayout(null);

        panelUtama.setBackground(new java.awt.Color(0, 51, 51));
        panelUtama.setLayout(null);

        panelJudul.setBackground(new java.awt.Color(0, 51, 51));
        panelJudul.setMinimumSize(new java.awt.Dimension(720, 90));
        panelJudul.setLayout(null);

        jLabel1.setBackground(new java.awt.Color(0, 51, 51));
        jLabel1.setFont(new java.awt.Font("Dialog", 0, 24)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Menu Katalog");
        panelJudul.add(jLabel1);
        jLabel1.setBounds(30, 20, 250, 40);

        panelUtama.add(panelJudul);
        panelJudul.setBounds(0, 0, 710, 90);

        panelNavBar.setBackground(new java.awt.Color(0, 51, 51));
        panelNavBar.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204), 2));

        profileBtn.setBackground(new java.awt.Color(50, 50, 50));
        profileBtn.setForeground(new java.awt.Color(255, 243, 230));
        profileBtn.setText("Profile");
        profileBtn.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        profileBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                profileBtnActionPerformed(evt);
            }
        });

        katalogBtn.setBackground(new java.awt.Color(50, 50, 50));
        katalogBtn.setForeground(new java.awt.Color(255, 243, 230));
        katalogBtn.setText("Katalog");
        katalogBtn.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        katalogBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                katalogBtnActionPerformed(evt);
            }
        });

        pengembalianBtn.setBackground(new java.awt.Color(50, 50, 50));
        pengembalianBtn.setForeground(new java.awt.Color(255, 243, 230));
        pengembalianBtn.setText("Pengembalian");
        pengembalianBtn.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        pengembalianBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                pengembalianBtnActionPerformed(evt);
            }
        });

        logoutBtn.setBackground(new java.awt.Color(50, 50, 50));
        logoutBtn.setForeground(new java.awt.Color(255, 243, 230));
        logoutBtn.setText("Log Out");
        logoutBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                logoutBtnActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout panelNavBarLayout = new javax.swing.GroupLayout(panelNavBar);
        panelNavBar.setLayout(panelNavBarLayout);
        panelNavBarLayout.setHorizontalGroup(
            panelNavBarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panelNavBarLayout.createSequentialGroup()
                .addGroup(panelNavBarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(pengembalianBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(katalogBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(profileBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(logoutBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        panelNavBarLayout.setVerticalGroup(
            panelNavBarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panelNavBarLayout.createSequentialGroup()
                .addGap(54, 54, 54)
                .addComponent(profileBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(katalogBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(pengembalianBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 287, Short.MAX_VALUE)
                .addComponent(logoutBtn)
                .addGap(36, 36, 36))
        );

        panelUtama.add(panelNavBar);
        panelNavBar.setBounds(0, 100, 160, 530);

        panelAwal.setBackground(new java.awt.Color(0, 51, 51));
        panelAwal.setLayout(null);

        Profile.setFont(new java.awt.Font("Dialog", 0, 36)); // NOI18N
        Profile.setForeground(new java.awt.Color(255, 255, 255));
        Profile.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Profile.setText("K A T A L O G");
        panelAwal.add(Profile);
        Profile.setBounds(0, 0, 550, 70);

        TableBuku.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(TableBuku);

        panelAwal.add(jScrollPane1);
        jScrollPane1.setBounds(40, 120, 500, 300);

        panelUtama.add(panelAwal);
        panelAwal.setBounds(160, 100, 560, 530);

        getContentPane().add(panelUtama);
        panelUtama.setBounds(0, 0, 730, 640);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void profileBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_profileBtnActionPerformed
        // TODO add your handling code here:
        Menu_Anggota_Profile MPP = new Menu_Anggota_Profile();
        MPP.setVisible(true);
        dispose();
    }//GEN-LAST:event_profileBtnActionPerformed

    private void katalogBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_katalogBtnActionPerformed
        // TODO add your handling code here:
        Menu_Anggota_Katalog MPK = new Menu_Anggota_Katalog();
        MPK.setVisible(true);
        dispose();
    }//GEN-LAST:event_katalogBtnActionPerformed

    private void pengembalianBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_pengembalianBtnActionPerformed
        // TODO add your handling code here:
        Menu_Anggota_Pengembalian MPP = new Menu_Anggota_Pengembalian();
        MPP.setVisible(true);
        dispose();
    }//GEN-LAST:event_pengembalianBtnActionPerformed

    private void logoutBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_logoutBtnActionPerformed
        // TODO add your handling code here:
        
        Login L = new Login();
        Connect db = new Connect();
        String sq ="UPDATE anggota SET Session = 0 WHERE Session = 1";
        java.sql.Connection conn=(Connection) db.getConnection();
        java.sql.PreparedStatement pst = null;
        try {
            pst = conn.prepareStatement(sq);
        } catch (SQLException ex) {
            Logger.getLogger(Menu_Petugas_Profile.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            pst.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Menu_Petugas_Profile.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        L.setVisible(true);
        dispose();
    }//GEN-LAST:event_logoutBtnActionPerformed

    public void loadBuku(){
     //menghapus isi table tblGaji
        model =new DefaultTableModel();
        TableBuku.setModel(model);
        model.addColumn("ID Buku");
        model.addColumn("Nama Buku");
        model.addColumn("Penulis");
        model.addColumn("Penerbit");
        model.addColumn("Kategori");
        model.addColumn("Jumlah");

     try{
           //membuat statemen pemanggilan data pada table tblGaji dari database
           Connect db = new Connect();
           Statement stat = (Statement) db.getConnection().createStatement();;
           String sql        = "Select * from buku";
           ResultSet res   = stat.executeQuery(sql);

           //penelusuran baris pada tabel tblGaji dari database
           while(res.next ()){
                Object[ ] obj = new Object[6];
                obj[0] = res.getString("ID_Buku"); 
                obj[1] = res.getString("Judul_Buku");
                obj[2] = res.getString("Penulis"); 
                obj[3] = res.getString("Penerbit");
                obj[4] = res.getString("Kategori");
                obj[5] = res.getString("Kuantiti");
         
                model.addRow(obj);
            }
      }catch(SQLException err){
            JOptionPane.showMessageDialog(null, err.getMessage() );
      }
//     banyak = model.getRowCount();
//     TotalBuku.setText(""+banyak);
}
    
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Menu_Anggota_Katalog.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Menu_Anggota_Katalog.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Menu_Anggota_Katalog.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Menu_Anggota_Katalog.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Menu_Anggota_Katalog().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel Profile;
    private javax.swing.JTable TableBuku;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JButton katalogBtn;
    private javax.swing.JButton logoutBtn;
    private javax.swing.JPanel panelAwal;
    private javax.swing.JPanel panelJudul;
    private javax.swing.JPanel panelNavBar;
    private javax.swing.JPanel panelUtama;
    private javax.swing.JButton pengembalianBtn;
    private javax.swing.JButton profileBtn;
    // End of variables declaration//GEN-END:variables

    
}
