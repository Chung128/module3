package com.example.hien_thi_danh_sach_khach_hang.service;

import com.example.hien_thi_danh_sach_khach_hang.model.Customer;
import com.example.hien_thi_danh_sach_khach_hang.repo.IRepoCustomer;
import com.example.hien_thi_danh_sach_khach_hang.repo.RepoCustormer;

import java.util.List;

public class ServiceCustomer implements IServiceCustomer{
    private IRepoCustomer customerService=new RepoCustormer();
    @Override
    public List<Customer> findAll() {
        return customerService.findAll();
    }
}
