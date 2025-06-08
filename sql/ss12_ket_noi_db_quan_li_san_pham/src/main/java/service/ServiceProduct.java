package service;

import model.Product;
import repo.IRepoProduct;
import repo.RepoProduct;

import java.util.List;

public class ServiceProduct implements IServiceProduct{
    private IRepoProduct repoProduct=new RepoProduct();
    @Override
    public List<Product> findAll() {
        return repoProduct.findAll();
    }

    @Override
    public boolean add(Product product) {
        return repoProduct.add(product);
    }

    @Override
    public boolean edit(Product product) {
        return repoProduct.edit(product);
    }

    @Override
    public boolean delete(int id) {
        return repoProduct.delete(id);
    }

    @Override
    public Product search(int id) {
        return repoProduct.search(id);
    }

    @Override
    public Product findById(int id) {
        return repoProduct.findById(id);
    }
}
