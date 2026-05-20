package com.victor.demo.dao;

import com.victor.demo.model.Product;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductRowMapper implements RowMapper<Product> {
    @Override
    public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
        Product p = new Product();
        p.set_id(rs.getInt("id"));
        p.set_name(rs.getString("name"));
        p.set_buy_price(rs.getDouble("buy_price"));
        p.set_sell_price(rs.getDouble("sell_price"));
        p.set_stock(rs.getInt("stock"));

        return p;
    }
}