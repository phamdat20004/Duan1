/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author PC
 */
public class VouCher {

    private Integer id;
    private String maVC;
    private Integer soLuong;
    private Integer hinhThuc;
    private Float mucGiam;
    private Float donToiThieu;
    private Date ngayBatDau;
    private Date ngayKetThuc;
    private Date ngayTao;
    private String moTa;
    private Integer trangThai;

    public VouCher() {
    }

    public VouCher(String maVC, Integer soLuong, Integer hinhThuc, Float mucGiam, Float donToiThieu, Date ngayBatDau, Date ngayKetThuc, Date ngayTao, String moTa, Integer trangThai) {
        this.maVC = maVC;
        this.soLuong = soLuong;
        this.hinhThuc = hinhThuc;
        this.mucGiam = mucGiam;
        this.donToiThieu = donToiThieu;
        this.ngayBatDau = ngayBatDau;
        this.ngayKetThuc = ngayKetThuc;
        this.ngayTao = ngayTao;
        this.moTa = moTa;
        this.trangThai = trangThai;
    }

    public VouCher(Integer id, String maVC, Integer soLuong, Integer hinhThuc, Float mucGiam, Float donToiThieu, Date ngayBatDau, Date ngayKetThuc, Date ngayTao, String moTa, Integer trangThai) {
        this.id = id;
        this.maVC = maVC;
        this.soLuong = soLuong;
        this.hinhThuc = hinhThuc;
        this.mucGiam = mucGiam;
        this.donToiThieu = donToiThieu;
        this.ngayBatDau = ngayBatDau;
        this.ngayKetThuc = ngayKetThuc;
        this.ngayTao = ngayTao;
        this.moTa = moTa;
        this.trangThai = trangThai;
    }

    public VouCher(String maVC, Integer soLuong, Integer hinhThuc, Float mucGiam, Float donToiThieu, Date ngayBatDau, Date ngayKetThuc, String moTa, Integer trangThai) {

        this.maVC = maVC;
        this.soLuong = soLuong;
        this.hinhThuc = hinhThuc;
        this.mucGiam = mucGiam;
        this.donToiThieu = donToiThieu;
        this.ngayBatDau = ngayBatDau;
        this.ngayKetThuc = ngayKetThuc;
        this.moTa = moTa;
        this.trangThai = trangThai;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getMaVC() {
        return maVC;
    }

    public void setMaVC(String maVC) {
        this.maVC = maVC;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

    public Integer getHinhThuc() {
        return hinhThuc;
    }

    public void setHinhThuc(Integer hinhThuc) {
        this.hinhThuc = hinhThuc;
    }

    public Float getDonToiThieu() {
        return donToiThieu;
    }

    public void setDonToiThieu(Float donToiThieu) {
        this.donToiThieu = donToiThieu;
    }

    public Date getNgayBatDau() {
        return ngayBatDau;
    }

    public void setNgayBatDau(Date ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }

    public Date getNgayKetThuc() {
        return ngayKetThuc;
    }

    public void setNgayKetThuc(Date ngayKetThuc) {
        this.ngayKetThuc = ngayKetThuc;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public Integer getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(Integer trangThai) {
        this.trangThai = trangThai;
    }

    public Float getMucGiam() {
        return mucGiam;
    }

    public void setMucGiam(Float mucGiam) {
        this.mucGiam = mucGiam;
    }

    @Override
    public String toString() {
        return "VouCher{" + "id=" + id + ", maVC=" + maVC + ", soLuong=" + soLuong + ", hinhThuc=" + hinhThuc + ", mucGiam=" + mucGiam + ", donToiThieu=" + donToiThieu + ", ngayBatDau=" + ngayBatDau + ", ngayKetThuc=" + ngayKetThuc + ", ngayTao=" + ngayTao + ", moTa=" + moTa + ", trangThai=" + trangThai + '}';
    }

    public Object[] rowData(int index) {
        return new Object[]{
            index, maVC, soLuong, hinhThuc == 0 ? "Phần trăm ( % )" : "VND", hinhThuc == 0 ? mucGiam + " ( % ) " : mucGiam + " VND ", donToiThieu, ngayTao, ngayBatDau,
            ngayKetThuc, moTa, trangThai == 0 ? "Sắp đến" : (trangThai == 1 ? "Đang áp dung" : "Hết hạn")
        };
    }
}
