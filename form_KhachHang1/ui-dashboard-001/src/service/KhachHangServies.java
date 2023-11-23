/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import entiny.KhachHang;
import static service.DBConnect.getConnection;

/**
 *
 * @author Phương Thảo
 */
public class KhachHangServies {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = null;

    public List<KhachHang> getAll() {
        sql = "select id,maKH, ho_ten_kh, gioi_tinh, ngay_sinh, dia_chi, sdt_kh, mat_khau from KhachHang";
        List< KhachHang> list = new ArrayList<>();
        try {
            con = DBConnect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                KhachHang kh = new KhachHang();
                kh.setId(rs.getInt(1));
                kh.setMaKH(rs.getString(2));
                kh.setHoTen(rs.getString(3));
                kh.setGioiTinh(rs.getString(4));
                kh.setNgaySinh(rs.getDate(5));
                kh.setSdt(rs.getString(6));
                kh.setDiaChi(rs.getString(7));

                kh.setMatKhau(rs.getString(8));
                list.add(kh);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int addKhachhang(KhachHang kh) {
        String sql = "INSERT INTO KhachHang(maKH, ho_ten_kh, gioi_tinh, ngay_sinh, dia_chi, sdt_kh, mat_khau) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnect.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            // Set values for the prepared statement
            ps.setString(2, kh.getMaKH());
            ps.setString(3, kh.getHoTen());
            ps.setString(4, kh.getGioiTinh());
            ps.setDate(5, new java.sql.Date(kh.getNgaySinh().getTime()));  // Assuming getNgaySinh() returns a Date
            ps.setString(6, kh.getDiaChi());
            ps.setString(7, kh.getSdt());
            ps.setString(8, kh.getMatKhau());

            // Execute the update and return the result
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    public int DeleteSinhVien(int id) {    // Xóa theo khóa chính
        sql = "DELETE FROM KhachHang WHERE id=? ";
        try {  //thêm được
            con = DBConnect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setObject(1, id);
            return ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public void addKhachhang() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
