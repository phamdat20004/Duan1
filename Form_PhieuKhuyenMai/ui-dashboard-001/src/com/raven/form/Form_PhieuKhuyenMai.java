/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raven.form;

import entity.VouCher;
import java.awt.Color;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.*;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.table.TableColumnModel;

import service.VouCherService;
import swing.EventSwitchSelected;
import swing.SwitchButton;




/**
 *
 * @author RAVEN
 */
public class Form_PhieuKhuyenMai extends javax.swing.JPanel {

    private VouCherService vouCherService = new VouCherService();
    private static int page = 1;
    private static int lmit = 8;
    int gioiHanPage = (int) ((Math.ceil(vouCherService.getRowCountVC() / lmit))) + 1;
    private static List<VouCher> list = new ArrayList<>();
    private static int index = -1;
    
    private List<EventSwitchSelected> events;
    /**TableColumnModel row= tblKH.getColumnModel();
     * Creates new form Form_1
     */
    public Form_PhieuKhuyenMai() {
        
        initComponents();
        tblKH.getColumnModel().getColumn(12).setCellRenderer(new SwitchButton());
        
        txtTim.setText("Mã Voucher");
        txtTim.setForeground(Color.GRAY);
        txtMa.setText("Mã Voucher");
        txtMa.setForeground(Color.BLACK);
        txtDonMin.setText("Đơn tối thiểu");
        txtDonMin.setForeground(Color.GRAY);
        txtMuc.setText("Mức giảm giá");
        txtMuc.setForeground(Color.GRAY);
        txtSoLuong.setText("Số lượng");
        txtSoLuong.setForeground(Color.GRAY);
        txtMoTa.setText("Mô tả ...");
        txtMoTa.setForeground(Color.GRAY);
        list = vouCherService.getAll(page, lmit);
        fillToTableVC(list);
        
        TableColumnModel row= tblKH.getColumnModel();
        int colum= 12;
        int columW = 38;
        TableColumn columm = row.getColumn(colum);
        columm.setPreferredWidth(columW);
        int rowH = 25;
        tblKH.setRowHeight(rowH);
    }

    private void fillToTableVC(List<VouCher> list) {
        DefaultTableModel dtm = (DefaultTableModel) this.tblKH.getModel();
        dtm.setRowCount(0);
        int i = 1;
        for (VouCher kh : list) {
            dtm.addRow(kh.rowData(i));
            i++;
        }
    }

    private void fillToTableLS(List<Object> list) {
        DefaultTableModel dtm = (DefaultTableModel) this.tblLS.getModel();
        dtm.setRowCount(0);
        for (int i = 0; i < list.size(); i++) {
            dtm.addRow((Object[]) list.get(i));
        }

    }

    private void first() {

        lblPageTTKH.setText(1 + " / " + gioiHanPage);
        list = vouCherService.getAll(1, lmit);
        fillToTableVC(list);
    }

    private void prev() {
        page--;

        if (page >= 1) {
            lblPageTTKH.setText(page + " / " + gioiHanPage);
            list = vouCherService.getAll(page, lmit);
            fillToTableVC(list);
            return;
        }
        page = 1;

    }

    private void next() {
        page++;

        if (page <= gioiHanPage) {
            list = vouCherService.getAll(page, lmit);
            fillToTableVC(list);
            lblPageTTKH.setText(page + " / " + gioiHanPage);
            return;
        }
        page = gioiHanPage;
    }

    private void last() {

        lblPageTTKH.setText(gioiHanPage + " / " + gioiHanPage);
        list = vouCherService.getAll(gioiHanPage, lmit);
        fillToTableVC(list);
    }

    void showData(int index, List<VouCher> list) {

        VouCher vouCher = list.get(index);
        txtMa.setText(vouCher.getMaVC());
        txtDonMin.setText(vouCher.getDonToiThieu() + "");
        txtMoTa.setText(vouCher.getMoTa() + "");
        dateNgaybd.setDate(vouCher.getNgayBatDau());
        dateNgaykt.setDate(vouCher.getNgayKetThuc());
        txtMuc.setText(vouCher.getMucGiam() + "");
        txtSoLuong.setText(vouCher.getSoLuong() + "");
        cboLoai.setSelectedIndex(vouCher.getHinhThuc());
        cboTT.setSelectedIndex(vouCher.getTrangThai());
    }

    private VouCher getForm() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String maVC = txtMa.getText().trim();
        int maxIDNV = vouCherService.getRowCountVC() + 1;
        if (maVC.isEmpty()) {
            if (maxIDNV < 10) {
                maVC = "VOUCHER" + "00" + maxIDNV;
            } else if (maxIDNV < 100) {
                maVC = "VOUCHER" + "00" + maxIDNV;
            } else {
                maVC = "VOUCHER" + maxIDNV;
            }
        }
        int loai = cboLoai.getSelectedIndex();
        int trangThai = cboLoai.getSelectedIndex();
        String mucGiamStr = txtMuc.getText().trim();
        String donToiThieuStr = txtDonMin.getText().trim();
        String moTa = txtMoTa.getText().trim();
        float donToiThieu = 0, mucGiam = 0;
        int soLuong = 0;
        if (mucGiamStr.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Mức chưa có !");
            txtMuc.requestFocus();
            return null;
        } else {
            try {
                mucGiam = Float.parseFloat(mucGiamStr);

            } catch (Exception e) {
                JOptionPane.showMessageDialog(this, "Mức giảm phải là số !");
                txtMuc.requestFocus();
                return null; //thêm
            }
        }

        if (donToiThieuStr.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Đơn tối thiểu chưa có !");
            txtDonMin.requestFocus();
            return null;
        } else {
            try {
                donToiThieu = Float.parseFloat(donToiThieuStr);

            } catch (Exception e) {
                JOptionPane.showMessageDialog(this, "Đơn tối thiểu phải là số !");
                txtDonMin.requestFocus();
                return null; //thêm
            }
        }
        String soLuongStr = txtSoLuong.getText().trim();
        if (soLuongStr.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Số lượng tối thiểu chưa có !");
            txtSoLuong.requestFocus();
            return null;
        } else {
            try {
                soLuong = Integer.parseInt(soLuongStr);

            } catch (Exception e) {
                JOptionPane.showMessageDialog(this, "Số lượng tối thiểu phải là số !");
                txtSoLuong.requestFocus();
                return null;  //thêm
            }
        }

        if (dateNgaybd.getDate() == null) {
            JOptionPane.showMessageDialog(this, "Chưa nhập ngày bắt đầu");
            dateNgaybd.requestFocus();
            return null;
        }
        if (dateNgaykt.getDate() == null) {
            JOptionPane.showMessageDialog(this, "Chưa nhập ngày kết thúc");
            dateNgaykt.requestFocus();
            return null;
        }

        java.util.Date utilDate1 = dateNgaybd.getDate(); // Giả sử dateNgaybd.getDate() trả về java.util.Date
        java.sql.Date sqlDate1 = new java.sql.Date(utilDate1.getTime());
        java.util.Date utilDate2 = dateNgaykt.getDate(); // Giả sử dateNgaybd.getDate() trả về java.util.Date
        java.sql.Date sqlDate2 = new java.sql.Date(utilDate1.getTime());
        return new VouCher(maVC, soLuong, loai, mucGiam, donToiThieu, sqlDate1, sqlDate2, moTa, trangThai);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel2 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        txtMa = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        cboLoai = new javax.swing.JComboBox<>();
        jLabel3 = new javax.swing.JLabel();
        txtMuc = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        txtMoTa = new javax.swing.JTextArea();
        btnThem = new javax.swing.JButton();
        btnSUa = new javax.swing.JButton();
        jLabel7 = new javax.swing.JLabel();
        txtDonMin = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        cboTT = new javax.swing.JComboBox<>();
        jLabel11 = new javax.swing.JLabel();
        txtSoLuong = new javax.swing.JTextField();
        dateNgaybd = new com.toedter.calendar.JDateChooser();
        dateNgaykt = new com.toedter.calendar.JDateChooser();
        btnReset = new javax.swing.JButton();
        btnXoa = new javax.swing.JButton();
        switchButton1 = new swing.SwitchButton();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        jPanel3 = new javax.swing.JPanel();
        jScrollPane3 = new javax.swing.JScrollPane();
        tblKH = new javax.swing.JTable();
        jLabel13 = new javax.swing.JLabel();
        txtTim = new javax.swing.JTextField();
        btnDau = new javax.swing.JButton();
        btnLui = new javax.swing.JButton();
        lblPageTTKH = new javax.swing.JLabel();
        btnTien = new javax.swing.JButton();
        btnCuoi = new javax.swing.JButton();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        btnTim = new javax.swing.JButton();
        dateNgayDau = new com.toedter.calendar.JDateChooser();
        dateNgaycuoi = new com.toedter.calendar.JDateChooser();
        jCheckBox1 = new javax.swing.JCheckBox();
        jPanel1 = new javax.swing.JPanel();
        jScrollPane2 = new javax.swing.JScrollPane();
        tblLS = new javax.swing.JTable();

        setToolTipText("");

        jPanel2.setBackground(new java.awt.Color(255, 255, 255));
        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder("Phiếu khuyến mại"));

        jLabel1.setText("Mã Voucher:");

        txtMa.setEditable(false);
        txtMa.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                txtMaMouseClicked(evt);
            }
        });
        txtMa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtMaActionPerformed(evt);
            }
        });

        jLabel2.setText("Hình thức:");

        cboLoai.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        cboLoai.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Phần trăm ( % )", "VND", " " }));

        jLabel3.setText("Mức giảm giá:");

        txtMuc.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                txtMucMouseClicked(evt);
            }
        });
        txtMuc.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtMucActionPerformed(evt);
            }
        });

        jLabel4.setText("Ngày bắt đầu:");

        jLabel5.setText("Ngày kết thúc:");

        jLabel6.setText("Mô tả:");

        txtMoTa.setColumns(20);
        txtMoTa.setRows(5);
        txtMoTa.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                txtMoTaMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(txtMoTa);

        btnThem.setBackground(new java.awt.Color(102, 51, 255));
        btnThem.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnThem.setForeground(new java.awt.Color(255, 255, 255));
        btnThem.setText("Lưu");
        btnThem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnThemActionPerformed(evt);
            }
        });

        btnSUa.setBackground(new java.awt.Color(102, 0, 255));
        btnSUa.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnSUa.setForeground(new java.awt.Color(255, 255, 255));
        btnSUa.setText("Sửa");
        btnSUa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSUaActionPerformed(evt);
            }
        });

        jLabel7.setText("Đơn tối thểu ");

        txtDonMin.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                txtDonMinMouseClicked(evt);
            }
        });
        txtDonMin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtDonMinActionPerformed(evt);
            }
        });

        jLabel10.setText("Trạng Thái");

        cboTT.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Sắp đến", "Đang áp dụng", "Hết Hạn", " " }));

        jLabel11.setText("Số lượng ");

        txtSoLuong.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                txtSoLuongMouseClicked(evt);
            }
        });
        txtSoLuong.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtSoLuongActionPerformed(evt);
            }
        });

        btnReset.setBackground(new java.awt.Color(102, 0, 255));
        btnReset.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnReset.setForeground(new java.awt.Color(255, 255, 255));
        btnReset.setText("Làm mới");
        btnReset.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnResetActionPerformed(evt);
            }
        });

        btnXoa.setBackground(new java.awt.Color(102, 0, 255));
        btnXoa.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnXoa.setForeground(new java.awt.Color(255, 255, 255));
        btnXoa.setText("Xóa");
        btnXoa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnXoaActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                        .addGroup(jPanel2Layout.createSequentialGroup()
                            .addComponent(jLabel3)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                            .addComponent(txtMuc, javax.swing.GroupLayout.PREFERRED_SIZE, 290, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel2Layout.createSequentialGroup()
                            .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addComponent(jLabel4)
                                .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addGroup(jPanel2Layout.createSequentialGroup()
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(jScrollPane1))
                                .addGroup(jPanel2Layout.createSequentialGroup()
                                    .addGap(8, 8, 8)
                                    .addComponent(dateNgaybd, javax.swing.GroupLayout.PREFERRED_SIZE, 290, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addGap(18, 18, 18)
                        .addComponent(txtMa, javax.swing.GroupLayout.PREFERRED_SIZE, 291, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(50, 50, 50)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel5)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(dateNgaykt, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addGap(31, 31, 31)
                        .addComponent(cboLoai, javax.swing.GroupLayout.PREFERRED_SIZE, 275, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel7)
                        .addGap(18, 18, 18)
                        .addComponent(txtDonMin, javax.swing.GroupLayout.PREFERRED_SIZE, 274, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(21, 21, 21)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(btnThem, javax.swing.GroupLayout.DEFAULT_SIZE, 85, Short.MAX_VALUE)
                            .addComponent(btnSUa, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(btnXoa, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(btnReset, javax.swing.GroupLayout.DEFAULT_SIZE, 85, Short.MAX_VALUE))
                        .addGap(38, 38, 38)
                        .addComponent(switchButton1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(0, 5, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel10)
                    .addComponent(jLabel11))
                .addGap(18, 18, 18)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(cboTT, 0, 206, Short.MAX_VALUE)
                    .addComponent(txtSoLuong))
                .addContainerGap(84, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap(47, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(txtMa, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2)
                    .addComponent(cboLoai, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel10)
                    .addComponent(cboTT, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(27, 27, 27)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(txtMuc, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel7)
                    .addComponent(txtDonMin, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel11)
                    .addComponent(txtSoLuong, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(23, 23, 23)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel4)
                    .addComponent(jLabel5)
                    .addComponent(dateNgaybd, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(dateNgaykt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(46, 46, 46)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(btnThem, javax.swing.GroupLayout.DEFAULT_SIZE, 34, Short.MAX_VALUE)
                                    .addComponent(btnXoa))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                    .addComponent(btnSUa, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(btnReset, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addComponent(jLabel6)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(24, 24, 24)
                        .addComponent(switchButton1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
        );

        jPanel3.setBackground(new java.awt.Color(255, 255, 255));
        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder("Danh sách phiếu khuyến mại"));

        tblKH.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null, null, null, null, null}
            },
            new String [] {
                "STT", "Mã KM", "Số lượng", "Hình thức giảm", "Mức giảm", "Đơn tối thiểu", "Ngày tạo", "Ngày bắt đầu", "Ngày kết thúc", "Mô tả", "Trạng thái", "", "Action"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Object.class, java.lang.Object.class, java.lang.Object.class, java.lang.Object.class, java.lang.Object.class, java.lang.Object.class, java.lang.Object.class, java.lang.Object.class, java.lang.Object.class, java.lang.Object.class, java.lang.Object.class, java.lang.Boolean.class, java.lang.Object.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false, false, false, false, false, false, true, true
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblKH.getTableHeader().setReorderingAllowed(false);
        tblKH.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblKHMouseClicked(evt);
            }
        });
        tblKH.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                tblKHPropertyChange(evt);
            }
        });
        jScrollPane3.setViewportView(tblKH);

        jLabel13.setText("Tìm kiếm :");

        txtTim.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                txtTimMouseClicked(evt);
            }
        });
        txtTim.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtTimActionPerformed(evt);
            }
        });

        btnDau.setText("<<");
        btnDau.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDauActionPerformed(evt);
            }
        });

        btnLui.setText("<");
        btnLui.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLuiActionPerformed(evt);
            }
        });

        lblPageTTKH.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        lblPageTTKH.setText("1/ 2");

        btnTien.setText(">");
        btnTien.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTienActionPerformed(evt);
            }
        });

        btnCuoi.setText(">>");
        btnCuoi.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCuoiActionPerformed(evt);
            }
        });

        jLabel8.setText("Ngày  đầu :");

        jLabel9.setText("Ngày cuối :");

        btnTim.setBackground(new java.awt.Color(102, 0, 255));
        btnTim.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btnTim.setForeground(new java.awt.Color(255, 255, 255));
        btnTim.setText("Tìm");
        btnTim.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTimActionPerformed(evt);
            }
        });

        jCheckBox1.setText("Select All");
        jCheckBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jCheckBox1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jScrollPane3, javax.swing.GroupLayout.DEFAULT_SIZE, 1129, Short.MAX_VALUE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(16, 16, 16)
                        .addComponent(jLabel13)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txtTim, javax.swing.GroupLayout.PREFERRED_SIZE, 127, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(226, 226, 226)
                        .addComponent(jLabel8)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(dateNgayDau, javax.swing.GroupLayout.PREFERRED_SIZE, 188, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel9)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(dateNgaycuoi, javax.swing.GroupLayout.PREFERRED_SIZE, 188, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(btnTim)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jCheckBox1)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(btnDau, javax.swing.GroupLayout.PREFERRED_SIZE, 84, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(31, 31, 31)
                .addComponent(btnLui, javax.swing.GroupLayout.PREFERRED_SIZE, 84, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(40, 40, 40)
                .addComponent(lblPageTTKH)
                .addGap(36, 36, 36)
                .addComponent(btnTien, javax.swing.GroupLayout.PREFERRED_SIZE, 84, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(29, 29, 29)
                .addComponent(btnCuoi, javax.swing.GroupLayout.PREFERRED_SIZE, 84, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(307, 307, 307))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                .addGap(15, 15, 15)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel13)
                        .addComponent(txtTim, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabel8)
                        .addComponent(jLabel9))
                    .addComponent(dateNgayDau, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(dateNgaycuoi, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(btnTim)
                        .addComponent(jCheckBox1)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 158, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(30, 30, 30)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnDau)
                    .addComponent(btnLui)
                    .addComponent(lblPageTTKH)
                    .addComponent(btnTien)
                    .addComponent(btnCuoi))
                .addContainerGap(59, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("Danh sách phiếu khuyến mại", jPanel3);

        tblLS.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "STT", "Mã hóa đơn", "Hình thức giảm", "Tiền giảm", "Ngày sử dụng"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblLS.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblLSMouseClicked(evt);
            }
        });
        jScrollPane2.setViewportView(tblLS);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 1145, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 254, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(73, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("Lịch sử dùng phiếu khuyến mại", jPanel1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jTabbedPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 1151, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(15, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jTabbedPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 368, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void txtTimActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtTimActionPerformed
//        String maVC = txtMa.getText().trim();
//        int maxIDNV = vouCherService.getRowCountVC() + 1;
//        if (maVC == "VOUCHER"+"00"+maxIDNV) {
        String thongTin = this.txtTim.getText().trim();
        list = vouCherService.timMa(thongTin, page, lmit);
        fillToTableVC(list);
//        }else{
//            JOptionPane.showMessageDialog(this, "Không tìm thấy");
//        }


    }//GEN-LAST:event_txtTimActionPerformed

    private void btnDauActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDauActionPerformed
        first();
    }//GEN-LAST:event_btnDauActionPerformed

    private void btnLuiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLuiActionPerformed
        prev();
    }//GEN-LAST:event_btnLuiActionPerformed

    private void btnTienActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTienActionPerformed
        next();
    }//GEN-LAST:event_btnTienActionPerformed

    private void btnCuoiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCuoiActionPerformed
        last();
    }//GEN-LAST:event_btnCuoiActionPerformed

    private void btnTimActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTimActionPerformed
        if (dateNgayDau.getDate() == null | dateNgaycuoi.getDate() == null) {
            JOptionPane.showMessageDialog(this, "Chưa nhập ngày bắt đầu và ngày kết thúc");
        }
        if (dateNgayDau.getDate() == null) {
            JOptionPane.showMessageDialog(this, "Chưa nhập ngày bắt đầu");
            dateNgayDau.requestFocus();
            return;
        }
        if (dateNgaycuoi.getDate() == null) {
            JOptionPane.showMessageDialog(this, "Chưa nhập ngày kết thúc");
            dateNgaycuoi.requestFocus();
            return;
        }
        java.util.Date utilDate1 = dateNgayDau.getDate(); // Giả sử dateNgaybd.getDate() trả về java.util.Date
        java.sql.Date sqlDate1 = new java.sql.Date(utilDate1.getTime());
        java.util.Date utilDate2 = dateNgaycuoi.getDate(); // Giả sử dateNgaybd.getDate() trả về java.util.Date
        java.sql.Date sqlDate2 = new java.sql.Date(utilDate1.getTime());
        list = vouCherService.timTheoNgay(sqlDate1, sqlDate2, page, lmit);
        fillToTableVC(list);
    }//GEN-LAST:event_btnTimActionPerformed

    public void reset() {
        txtMa.setText("Mã Voucher");
        txtMa.setForeground(Color.BLACK);
        txtDonMin.setText("Đơn tối thiểu");
        txtDonMin.setForeground(Color.GRAY);
        txtMuc.setText("Mức giảm giá");
        txtMuc.setForeground(Color.GRAY);
        txtSoLuong.setText("Số lượng");
        txtSoLuong.setForeground(Color.GRAY);
        txtMoTa.setText("Mô tả ...");
        txtMoTa.setForeground(Color.GRAY);
        dateNgaybd.setCalendar(null);
        dateNgaykt.setCalendar(null);
        cboLoai.setSelectedItem(null);
        cboTT.setSelectedItem(null);
        txtTim.setText("Mã Voucher");
        txtTim.setForeground(Color.GRAY);
        dateNgayDau.setCalendar(null);
        dateNgaycuoi.setCalendar(null);
    }
    private void tblLSMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblLSMouseClicked


    }//GEN-LAST:event_tblLSMouseClicked

    private void tblKHMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblKHMouseClicked
        index = tblKH.getSelectedRow();
        showData(index, list);
        String maHD = txtMa.getText();
        fillToTableLS(vouCherService.getVCbyMAHD(maHD));
    }//GEN-LAST:event_tblKHMouseClicked

    private void btnThemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnThemActionPerformed
        int tb = JOptionPane.showConfirmDialog(this, "Bạn có muốn thêm không ?", "Xác nhận", JOptionPane.YES_NO_OPTION);
        VouCher vouCher = getForm();
        if (vouCher == null) {
            return;
        }
        int ketQua = vouCherService.insert(vouCher);
        if (tb == JOptionPane.YES_OPTION) {
            if (ketQua == 1) {
                JOptionPane.showMessageDialog(this, "Thêm thành công một Voucher");
                list = vouCherService.getAll(page, lmit);
                int lastCount = list.size() - 1;
                VouCher vc = list.get(lastCount);
                list.remove(lastCount);
                list.add(0, vc);
                fillToTableVC(list);

            } else {
                JOptionPane.showMessageDialog(this, "Thêm thất bại một Voucher");
            }
        }


    }//GEN-LAST:event_btnThemActionPerformed

    private void btnSUaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSUaActionPerformed
        int tb = JOptionPane.showConfirmDialog(this, "Bạn có muốn sửa không ?", "Xác nhận", JOptionPane.YES_NO_OPTION);
        VouCher vouCher = getForm();
        if (vouCher == null) {
            return;
        }
        int ketQua = vouCherService.update(vouCher);
        if (tb == JOptionPane.YES_OPTION) {
            if (ketQua == 1) {
                JOptionPane.showMessageDialog(this, "Sửa thành công một Voucher");
                list = vouCherService.getAll(page, lmit);
                fillToTableVC(list);

            } else {
                JOptionPane.showMessageDialog(this, "Sửa thất bại một VouCher");
            }
        }

    }//GEN-LAST:event_btnSUaActionPerformed

    private void btnResetActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnResetActionPerformed

        reset();
    }//GEN-LAST:event_btnResetActionPerformed

    private void btnXoaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnXoaActionPerformed
        // TODO add your handling code here:
        int tb = JOptionPane.showConfirmDialog(this, "Bạn có muốn xóa không ?", "Xác nhận", JOptionPane.YES_NO_OPTION);
        VouCher vouCher = getForm();
        if (tb == JOptionPane.YES_OPTION) {
            if (vouCher == null) {
                JOptionPane.showMessageDialog(this, "Xóa thất bại một Voucher");
            } else {
                try {
                    JOptionPane.showMessageDialog(this, "Xóa thành công một Voucher");
                    vouCherService.xoa(txtMa.getText());
                    list = vouCherService.getAll(page, lmit);
                    fillToTableVC(list);
                    reset();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }//GEN-LAST:event_btnXoaActionPerformed

    private void txtMaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtMaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtMaActionPerformed

    private void txtTimMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_txtTimMouseClicked
        // TODO add your handling code here:
        if (txtTim.getText().equals("Mã Voucher")) {
            txtTim.setText("");
            txtTim.setForeground(Color.BLACK);
        } else {
            txtTim.setText("Mã Voucher");
            txtTim.setForeground(Color.GRAY);
        }
    }//GEN-LAST:event_txtTimMouseClicked

    private void txtMaMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_txtMaMouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_txtMaMouseClicked

    private void txtMucActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtMucActionPerformed
        // TODO add your handling code here:

    }//GEN-LAST:event_txtMucActionPerformed

    private void txtDonMinActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtDonMinActionPerformed
        // TODO add your handling code here:

    }//GEN-LAST:event_txtDonMinActionPerformed

    private void txtSoLuongActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtSoLuongActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtSoLuongActionPerformed

    private void txtMucMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_txtMucMouseClicked
        // TODO add your handling code here:
        if (txtMuc.getText().equals("Mức giảm giá")) {
            txtMuc.setText("");
            txtMuc.setForeground(Color.BLACK);
        } else {
            txtMuc.setText("Mức giảm giá");
            txtMuc.setForeground(Color.GRAY);
        }
    }//GEN-LAST:event_txtMucMouseClicked

    private void txtDonMinMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_txtDonMinMouseClicked
        // TODO add your handling code here:
        if (txtDonMin.getText().equals("Đơn tối thiểu")) {
            txtDonMin.setText("");
            txtDonMin.setForeground(Color.BLACK);
        } else {
            txtDonMin.setText("Đơn tối thiểu");
            txtDonMin.setForeground(Color.GRAY);
        }
    }//GEN-LAST:event_txtDonMinMouseClicked

    private void txtSoLuongMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_txtSoLuongMouseClicked
        // TODO add your handling code here:
        if (txtSoLuong.getText().equals("Số lượng")) {
            txtSoLuong.setText("");
            txtSoLuong.setForeground(Color.BLACK);
        } else {
            txtSoLuong.setText("Số lượng");
            txtSoLuong.setForeground(Color.GRAY);
        }
    }//GEN-LAST:event_txtSoLuongMouseClicked

    private void txtMoTaMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_txtMoTaMouseClicked
        // TODO add your handling code here:
        if (txtMoTa.getText().equals("Mô tả ...")) {
            txtMoTa.setText("");
            txtMoTa.setForeground(Color.BLACK);
        } else {
            txtMoTa.setText("Mô tả ...");
            txtMoTa.setForeground(Color.GRAY);
        }
    }//GEN-LAST:event_txtMoTaMouseClicked

    private void jCheckBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jCheckBox1ActionPerformed
        // TODO add your handling code here:
        for (int i = 0; i < tblKH.getRowCount(); i++) {
            tblKH.setValueAt(true, i, 11);
        }
    }//GEN-LAST:event_jCheckBox1ActionPerformed

    private void tblKHPropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_tblKHPropertyChange
        // TODO add your handling code here:
        
    }//GEN-LAST:event_tblKHPropertyChange


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCuoi;
    private javax.swing.JButton btnDau;
    private javax.swing.JButton btnLui;
    private javax.swing.JButton btnReset;
    private javax.swing.JButton btnSUa;
    private javax.swing.JButton btnThem;
    private javax.swing.JButton btnTien;
    private javax.swing.JButton btnTim;
    private javax.swing.JButton btnXoa;
    private javax.swing.JComboBox<String> cboLoai;
    private javax.swing.JComboBox<String> cboTT;
    private com.toedter.calendar.JDateChooser dateNgayDau;
    private com.toedter.calendar.JDateChooser dateNgaybd;
    private com.toedter.calendar.JDateChooser dateNgaycuoi;
    private com.toedter.calendar.JDateChooser dateNgaykt;
    private javax.swing.JCheckBox jCheckBox1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JLabel lblPageTTKH;
    private swing.SwitchButton switchButton1;
    private javax.swing.JTable tblKH;
    private javax.swing.JTable tblLS;
    private javax.swing.JTextField txtDonMin;
    private javax.swing.JTextField txtMa;
    private javax.swing.JTextArea txtMoTa;
    private javax.swing.JTextField txtMuc;
    private javax.swing.JTextField txtSoLuong;
    private javax.swing.JTextField txtTim;
    // End of variables declaration//GEN-END:variables
}
