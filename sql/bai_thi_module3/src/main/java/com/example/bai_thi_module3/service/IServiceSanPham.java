package com.example.bai_thi_module3.service;

import com.example.bai_thi_module3.model.SanPham;

import java.util.List;

public interface IServiceSanPham {
    List<SanPham> findAll();
    boolean add(SanPham sanPham);
}
