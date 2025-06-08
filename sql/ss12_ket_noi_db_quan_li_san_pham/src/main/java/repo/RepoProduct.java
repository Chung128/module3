package repo;

import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RepoProduct implements IRepoProduct {
    private final String SELECT_ALL = "select * from products;";
    private final String INSERT_INTO = "insert into products(name,price,`describe`,manufacturer,id_category) values(?,?,?,?,?);";
    private final String UPDATE_BY_ID = "update products set `name`=?,price=?,`describe`=?,manufacturer=?,id_category=? where id=?;";
    private final String FIND_BY_ID = "select * from products where id = ?";
    private final String DELETE_BY_ID = "delete from products where id =?;";

    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        // kết nối với DB ở đây
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String describe = resultSet.getString("describe");
                String manufacturer = resultSet.getString("manufacturer");
                int category = resultSet.getInt("id_category");
                Product product = new Product(id, name, price, describe, manufacturer, category);
                productList.add(product);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public boolean add(Product product) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getDescribe());
            preparedStatement.setString(4, product.getManufacturer());
            preparedStatement.setInt(5, product.getCategory());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean edit(Product product) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getDescribe());
            preparedStatement.setString(4, product.getManufacturer());
            preparedStatement.setInt(5, product.getCategory());
            preparedStatement.setInt(6, product.getId());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean delete(int id) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);) {
            preparedStatement.setInt(1, id);
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("lỗi kết nối db");
        }
        return false;
    }

    @Override
    public Product search(int id) {
        List<Product> productList=findAll();
        return null;
    }

    public Product findById(int id) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);) {
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int id1 = Integer.parseInt(resultSet.getString("id"));
                String name = resultSet.getString("name");
                double price = Double.parseDouble(resultSet.getString("price"));
                String describe = resultSet.getString("describe");
                String manufacturer = resultSet.getString("manufacturer");
                int id_category = Integer.parseInt(resultSet.getString("id_category"));
                Product product = new Product(id1,name,price,describe,manufacturer,id_category);
                return product;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
