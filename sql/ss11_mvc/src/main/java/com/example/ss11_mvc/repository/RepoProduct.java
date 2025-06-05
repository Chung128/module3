package com.example.ss11_mvc.repository;

import com.example.ss11_mvc.model.Product;

import java.util.ArrayList;
import java.util.List;

public class RepoProduct implements IRepoProduct{
    private static List<Product> productList=new ArrayList<>();
    static {
        productList.add(new Product(1, "Laptop Dell", 1500.0, "Máy tính hiệu năng cao", "Dell"));
        productList.add(new Product(2, "iPhone 13", 999.0, "Điện thoại Apple", "Apple"));
        productList.add(new Product(3, "Samsung TV", 750.0, "Smart TV 4K", "Samsung"));
        productList.add(new Product(4, "Máy giặt LG", 480.0, "Máy giặt inverter", "LG"));
        productList.add(new Product(5, "Tai nghe Sony", 120.0, "Tai nghe chống ồn", "Sony"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
        int id = productList.size() + 1;
        product.setId(id);
       productList.add(product);
    }

    @Override
    public void edit( Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId()==product.getId()){
                productList.get(i).setName(product.getName());
                productList.get(i).setPrice(product.getPrice());
                productList.get(i).setDescribe(product.getDescribe());
                productList.get(i).setManufacturer(product.getManufacturer());
            }
        }
    }

    @Override
    public void delete(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId()==id){
                productList.remove(i);
                break;
            }
        }
    }

    @Override
    public Product search(int id) {
        for (Product p:productList){
            if (p.getId()==id){
                return p;
            }
        }
        return null;
    }
}
