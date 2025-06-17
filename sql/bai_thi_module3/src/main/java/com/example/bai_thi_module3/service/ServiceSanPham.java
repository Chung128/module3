package com.example.bai_thi_module3.service;

import com.example.bai_thi_module3.model.SanPham;
import com.example.bai_thi_module3.repository.IRepoSanPham;
import com.example.bai_thi_module3.repository.RepoSanPham;

import java.util.List;

public class ServiceSanPham implements IServiceSanPham{
    private IRepoSanPham repoSanPham=new RepoSanPham();

    @Override
    public List<SanPham> findAll() {
        return repoSanPham.findAll();
    }

    @Override
    public boolean add(SanPham sanPham) {
        return repoSanPham.add(sanPham);
    }
}
