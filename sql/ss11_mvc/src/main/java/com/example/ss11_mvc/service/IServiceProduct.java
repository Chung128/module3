package com.example.ss11_mvc.service;

import com.example.ss11_mvc.model.Product;

import java.util.List;

public interface IServiceProduct {
    List<Product> findAll();
    void add(Product product);
    void edit(Product product);
    void delete(int id);
    Product search(int id);
}
