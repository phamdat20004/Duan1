/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

//import Utils.XDate;
import entity.VouCher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author manhnt
 */
public class VouCherService {

    private String query = null;
    private Statement stm = null;
    private PreparedStatement pstm = null;
    private ResultSet rs = null;
    private Connection con = null;

    public List<VouCher> getAll(int page, int limt) {
        List<VouCher> list = new ArrayList<>();

        try {
            query = "select ID , ma_voucher , hinh_thuc ,mucGiam, so_luong , don_toiThiue , ngay_tao, ngay_bat_dau , ngay_ket_thuc , mo_ta , trang_thai from Voucher"
                    + "	order by ID DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
            con = DBConnection.getConnect();
            pstm = con.prepareStatement(query);
            pstm.setInt(1, (page - 1) * limt);
            pstm.setInt(2, limt);
            rs = pstm.executeQuery();

            while (rs.next()) {
                VouCher vouCher = new VouCher(
                        rs.getInt("ID"),
                        rs.getString("ma_voucher"),
                        rs.getInt("so_luong"),
                        rs.getInt("hinh_thuc"),
                        rs.getFloat("mucGiam"),
                        rs.getFloat("don_toiThiue"),
                        rs.getDate("ngay_bat_dau"),
                        rs.getDate("ngay_ket_thuc"),
                        rs.getDate("ngay_tao"),
                        rs.getString("mo_ta"),
                        rs.getInt("trang_thai"));

                list.add(vouCher);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(VouCherService.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public int insert(VouCher vouCher) {
        try {
            query = "INSERT INTO Voucher ( ma_voucher ,hinh_thuc , so_luong , don_toiThiue , ngay_bat_dau , ngay_ket_thuc , mo_ta , trang_thai, mucGiam) VALUES\n"
                    + "	 ( ? ,? , ? , ? , ? , ? , ? , ?,?)";
            con = DBConnection.getConnect();
            pstm = con.prepareStatement(query);
            pstm.setString(1, vouCher.getMaVC());
            pstm.setInt(2, vouCher.getHinhThuc());
            pstm.setInt(3, vouCher.getSoLuong());
            pstm.setFloat(4, vouCher.getDonToiThieu());
            pstm.setDate(5, (java.sql.Date) vouCher.getNgayBatDau());
            pstm.setDate(6, (java.sql.Date) vouCher.getNgayKetThuc());
            pstm.setString(7, vouCher.getMoTa());
            pstm.setInt(8, vouCher.getTrangThai());
            pstm.setFloat(9, vouCher.getMucGiam());
            return pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(VouCherService.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }

    }

    public int update(VouCher vouCher) {
        try {
            query = "	 UPDATE Voucher\n"
                    + "	 SET hinh_thuc = ? , so_luong  = ? , don_toiThiue   = ?, ngay_bat_dau  = ? , ngay_ket_thuc  = ? , mo_ta =?, trang_thai  = ?, mucGiam = ? \n"
                    + "	WHERE ma_voucher  = ? ";
            con = DBConnection.getConnect();
            pstm = con.prepareStatement(query);
            pstm.setInt(1, vouCher.getHinhThuc());
            pstm.setInt(2, vouCher.getSoLuong());
            pstm.setFloat(3, vouCher.getDonToiThieu());
            pstm.setDate(4, (java.sql.Date) vouCher.getNgayBatDau());
            pstm.setDate(5, (java.sql.Date) vouCher.getNgayKetThuc());
            pstm.setString(6, vouCher.getMoTa());
            pstm.setInt(7, vouCher.getTrangThai());
            pstm.setFloat(8, vouCher.getMucGiam());
            pstm.setString(9, vouCher.getMaVC());
            return pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(VouCherService.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public List<VouCher> timTheoNgay(Date ngay1, Date ngay2, int page, int limt) {
        try {
            List<VouCher> list = new ArrayList<>();
            query = "SELECT ID, ma_voucher, hinh_thuc,mucGiam, so_luong, don_toiThiue, ngay_bat_dau, ngay_ket_thuc, ngay_tao, mo_ta, trang_thai\n"
                    + "FROM Voucher\n"
                    + "WHERE ngay_bat_dau  >= ? AND ngay_bat_dau <= ? "
                    + " ORDER BY ID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";

            con = DBConnection.getConnect();
            pstm = con.prepareStatement(query);
            pstm.setDate(1, ngay1);
            pstm.setDate(2, ngay2);
            pstm.setInt(3, (page - 1) * limt);
            pstm.setInt(4, limt);

            rs = pstm.executeQuery();
            while (rs.next()) {
                VouCher vouCher = new VouCher(
                        rs.getInt("ID"),
                        rs.getString("ma_voucher"),
                        rs.getInt("so_luong"),
                        rs.getInt("hinh_thuc"),
                        rs.getFloat("mucGiam"),
                        rs.getFloat("don_toiThiue"),
                        rs.getDate("ngay_bat_dau"),
                        rs.getDate("ngay_ket_thuc"),
                        rs.getDate("ngay_tao"),
                        rs.getString("mo_ta"),
                        rs.getInt("trang_thai"));
                list.add(vouCher);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(VouCherService.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            return null;
        }

    }

    public List<VouCher> timMa(String ma, int page, int limt) {
        try {
            List<VouCher> list = new ArrayList<>();
            query = "SELECT ID, ma_voucher, hinh_thuc,mucGiam, so_luong, don_toiThiue, ngay_bat_dau, ngay_ket_thuc, ngay_tao, mo_ta, trang_thai\n"
                    + "FROM Voucher\n"
                    + "WHERE ma_voucher LIKE '%" + ma + "%' "
                    + "	order by ID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            con = DBConnection.getConnect();
            pstm = con.prepareStatement(query);
            pstm.setInt(1, (page - 1) * limt);
            pstm.setInt(2, limt);
            rs = pstm.executeQuery();

            while (rs.next()) {
                VouCher vouCher = new VouCher(
                        rs.getInt("ID"),
                        rs.getString("ma_voucher"),
                        rs.getInt("so_luong"),
                        rs.getInt("hinh_thuc"),
                        rs.getFloat("mucGiam"),
                        rs.getFloat("don_toiThiue"),
                        rs.getDate("ngay_bat_dau"),
                        rs.getDate("ngay_ket_thuc"),
                        rs.getDate("ngay_tao"),
                        rs.getString("mo_ta"),
                        rs.getInt("trang_thai"));
                list.add(vouCher);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(VouCherService.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

    public int getRowCountVC() {
        String countSql = "SELECT COUNT(*) AS totalRows FROM Voucher";
        con = DBConnection.getConnect();
        try {
            stm = con.createStatement();
            rs = stm.executeQuery(countSql);
            int totalRows = 0;
            if (rs.next()) {
                return totalRows = rs.getInt("totalRows");
            }
            return 0;
        } catch (SQLException ex) {

            return 0;
        }

    }

    public List<Object> getVCbyMAHD(String maHD) {
        try {
            List<Object> lst = new ArrayList<>();
            query = "select maHD, hinh_thuc, mucGiam,ngay_thanh_toan  from Voucher \n"
                    + "		join HoaDon on HoaDon.id_voucher = Voucher.ID \n"
                    + "		where ma_voucher like ?";
            con = DBConnection.getConnect();
            pstm = con.prepareStatement(query);
            pstm.setString(1, maHD);
            rs = pstm.executeQuery();
            int i = 0;
            while (rs.next()) {
                Object[] ob = new Object[]{
                    i,
                    rs.getString("maHD"),
                    rs.getInt("hinh_thuc"),
                    rs.getFloat("mucGiam"),
                    rs.getDate("ngay_thanh_toan")

                };
                lst.add(ob);
            }
            return lst;
        } catch (SQLException ex) {
            Logger.getLogger(VouCherService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Integer xoa(String ma) {
        Integer row = null;
        con = DBConnection.getConnect();
        query = "delete from Voucher where ma_voucher=?";
        try {
            pstm = con.prepareStatement(query);
            pstm.setObject(1, ma);
            row = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(VouCherService.class.getName()).log(Level.SEVERE, null, ex);

        }
        return row;

    }

}
