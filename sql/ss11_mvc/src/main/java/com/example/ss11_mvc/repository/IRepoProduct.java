package com.example.ss11_mvc.repository;

import com.example.ss11_mvc.model.Product;

import java.util.List;

public interface IRepoProduct {
    List<Product> findAll();
     void add(Product product);
    void edit(Product product);
    void delete(int id);
    Product search(int id);
}
