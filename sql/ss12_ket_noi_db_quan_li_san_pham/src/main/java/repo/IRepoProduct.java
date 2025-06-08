package repo;

import model.Product;

import java.util.List;

public interface IRepoProduct {
    List<Product> findAll();
    boolean add(Product product);
    boolean edit(Product product);
    boolean delete(int id);
    Product search(int id);
    Product findById(int id);
}
