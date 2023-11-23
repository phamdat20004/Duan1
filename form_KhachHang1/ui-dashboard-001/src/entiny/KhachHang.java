/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entiny;

import java.util.Date;

/**
 *
 * @author Phương Thảo
 */
public class KhachHang {

    private int id;
    private String maKH;
    private String hoTen;
    private Date ngaySinh;
    private String gioiTinh;
    private String diaChi;
    private String sdt;
    private String matKhau;

    public KhachHang() {
    }

    public KhachHang(int id, String maKH, String hoTen, Date ngaySinh, String gioiTinh, String diaChi, String sdt, String matKhau) {
        this.id = id;
        this.maKH = maKH;
        this.hoTen = hoTen;
        this.ngaySinh = ngaySinh;
        this.gioiTinh = gioiTinh;
        this.diaChi = diaChi;
        this.sdt = sdt;
        this.matKhau = matKhau;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMaKH() {
        return maKH;
    }

    public void setMaKH(String maKH) {
        this.maKH = maKH;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    @Override
    public String toString() {
        return "KhachHang{" + "id=" + id + ", maKH=" + maKH + ", hoTen=" + hoTen + ", ngaySinh=" + ngaySinh + ", gioiTinh=" + gioiTinh + ", diaChi=" + diaChi + ", sdt=" + sdt + ", matKhau=" + matKhau + '}';
    }

   
    
    public Object[] toDatarow() {
        return new Object[]{
            this.id,
            this.maKH,
            this.hoTen,
            this.ngaySinh,
            this.gioiTinh,
            this.diaChi,
            this.sdt,
            this.matKhau
        };
    }

    public Object setGioiTinh() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Object setNgaySinh() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
