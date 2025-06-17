package com.example.bai_thi_module3.model;

public class SanPham {
    private int idSanPham;
    private String tensanPham;
    private int gia;
    private int mucGiamGia;
    private int tonKho;

    public SanPham(int idSanPham, String tensanPham, int gia, int mucGiamGia, int tonKho) {
        this.idSanPham = idSanPham;
        this.tensanPham = tensanPham;
        this.gia = gia;
        this.mucGiamGia = mucGiamGia;
        this.tonKho = tonKho;
    }

    public SanPham(String tensanPham, int gia, int mucGiamGia, int tonKho) {
        this.tensanPham = tensanPham;
        this.gia = gia;
        this.mucGiamGia = mucGiamGia;
        this.tonKho = tonKho;
    }

    public int getIdSanPham() {
        return idSanPham;
    }

    public void setIdSanPham(int idSanPham) {
        this.idSanPham = idSanPham;
    }

    public String getTensanPham() {
        return tensanPham;
    }

    public void setTensanPham(String tensanPham) {
        this.tensanPham = tensanPham;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    public int getMucGiamGia() {
        return mucGiamGia;
    }

    public void setMucGiamGia(int mucGiamGia) {
        this.mucGiamGia = mucGiamGia;
    }

    public int getTonKho() {
        return tonKho;
    }

    public void setTonKho(int tonKho) {
        this.tonKho = tonKho;
    }
}
