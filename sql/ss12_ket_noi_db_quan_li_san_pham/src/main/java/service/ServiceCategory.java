package service;

import model.Category;
import model.Product;
import repo.IRepoCategory;
import repo.RepoCategory;

import java.util.List;

public class ServiceCategory implements IServiceCategory{
private IRepoCategory repoCategory=new RepoCategory();
    @Override
    public List<Category> findAll() {
        return repoCategory.findAll();
    }
}
