package com.example.bai_thi_module3.repository;

import com.example.bai_thi_module3.model.SanPham;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RepoSanPham implements IRepoSanPham{
    private final String SELECT_ALL = "select * from san_pham order by id_san_pham desc";
    private final String INSERT_INTO = "insert into san_pham(ten_san_pham,gia,muc_giam_gia,ton_kho) values(?,?,?,?) ";


    @Override
    public List<SanPham> findAll() {
        List<SanPham> sanPhamList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id_san_pham = resultSet.getInt("id_san_pham");
                String ten_san_pham = resultSet.getString("ten_san_pham");
                int gia = resultSet.getInt("gia");
                int muc_giam_gia = resultSet.getInt("muc_giam_gia");
                int ton_kho = resultSet.getInt("ton_kho");

                SanPham sanPham = new SanPham(id_san_pham, ten_san_pham, gia, muc_giam_gia, ton_kho);
                sanPhamList.add(sanPham);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return sanPhamList;
    }

    @Override
    public boolean add(SanPham sanPham) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);) {
            preparedStatement.setString(1, sanPham.getTensanPham());
            preparedStatement.setInt(2, sanPham.getGia());
            preparedStatement.setInt(3, sanPham.getMucGiamGia());
            preparedStatement.setInt(4, sanPham.getTonKho());

            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
