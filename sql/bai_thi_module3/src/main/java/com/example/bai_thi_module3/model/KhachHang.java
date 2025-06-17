package com.example.bai_thi_module3.model;

public class KhachHang {
    private int idKhachHang;
    private String tenKhachHnag;
    private String ngaySinh;
    private String dienThoai;
    private String diaChi;
    private String email;

    public KhachHang(int idKhachHang, String tenKhachHnag, String ngaySinh, String dienThoai, String diaChi, String email) {
        this.idKhachHang = idKhachHang;
        this.tenKhachHnag = tenKhachHnag;
        this.ngaySinh = ngaySinh;
        this.dienThoai = dienThoai;
        this.diaChi = diaChi;
        this.email = email;
    }

    public int getIdKhachHang() {
        return idKhachHang;
    }

    public void setIdKhachHang(int idKhachHang) {
        this.idKhachHang = idKhachHang;
    }

    public String getTenKhachHnag() {
        return tenKhachHnag;
    }

    public void setTenKhachHnag(String tenKhachHnag) {
        this.tenKhachHnag = tenKhachHnag;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getDienThoai() {
        return dienThoai;
    }

    public void setDienThoai(String dienThoai) {
        this.dienThoai = dienThoai;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
