package com.example.bai_thi_module3.model;

public class DatHang {
    private int maDatHang;
    private int idKhachHang;
    private int idSanPham;
    private int soLuon;

    public DatHang(int maDatHang, int idKhachHang, int idSanPham, int soLuon) {
        this.maDatHang = maDatHang;
        this.idKhachHang = idKhachHang;
        this.idSanPham = idSanPham;
        this.soLuon = soLuon;
    }

    public int getMaDatHang() {
        return maDatHang;
    }

    public void setMaDatHang(int maDatHang) {
        this.maDatHang = maDatHang;
    }

    public int getIdKhachHang() {
        return idKhachHang;
    }

    public void setIdKhachHang(int idKhachHang) {
        this.idKhachHang = idKhachHang;
    }

    public int getIdSanPham() {
        return idSanPham;
    }

    public void setIdSanPham(int idSanPham) {
        this.idSanPham = idSanPham;
    }

    public int getSoLuon() {
        return soLuon;
    }

    public void setSoLuon(int soLuon) {
        this.soLuon = soLuon;
    }
}

