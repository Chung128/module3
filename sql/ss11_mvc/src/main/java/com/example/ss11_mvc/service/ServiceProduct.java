package com.example.ss11_mvc.service;

import com.example.ss11_mvc.model.Product;
import com.example.ss11_mvc.repository.IRepoProduct;
import com.example.ss11_mvc.repository.RepoProduct;

import java.util.List;

public class ServiceProduct implements IServiceProduct {
    private IRepoProduct repoProduct = new RepoProduct();

    @Override
    public List<Product> findAll() {
        return repoProduct.findAll();
    }

    @Override
    public void add(Product product) {
        repoProduct.add(product);
    }

    @Override
    public void edit( Product product) {
        repoProduct.edit(product);
    }

    @Override
    public void delete(int id) {
        repoProduct.delete(id);
    }

    @Override
    public Product search(int id) {
        return repoProduct.search(id);
    }
}
