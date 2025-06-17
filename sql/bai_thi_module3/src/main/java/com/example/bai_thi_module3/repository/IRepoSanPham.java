package com.example.bai_thi_module3.repository;

import com.example.bai_thi_module3.model.SanPham;

import java.util.List;

public interface IRepoSanPham {
    List<SanPham> findAll();
    boolean add(SanPham sanPham);
}
