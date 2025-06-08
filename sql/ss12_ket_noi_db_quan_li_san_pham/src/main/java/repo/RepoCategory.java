package repo;

import model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RepoCategory implements IRepoCategory{
    private final String SELECT_ALL ="select * from category;";
    @Override
    public List<Category> findAll() {
        List<Category> categoryList = new ArrayList<>();
        // kết nối DB
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id_category");
                String name = resultSet.getString("name_category");
                Category category = new Category(id,name);
                categoryList.add(category);
            }
        } catch ( SQLException e) {
            throw new RuntimeException(e);
        }

        return categoryList;
    }
}
