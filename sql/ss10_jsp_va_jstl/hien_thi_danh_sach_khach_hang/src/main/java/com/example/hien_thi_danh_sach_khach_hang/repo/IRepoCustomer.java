package com.example.hien_thi_danh_sach_khach_hang.repo;

import com.example.hien_thi_danh_sach_khach_hang.model.Customer;

import java.util.List;

public interface IRepoCustomer {
    List<Customer> findAll();
}
