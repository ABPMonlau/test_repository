package com.victor.demo.dao;

import com.victor.demo.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDAOImplJdbc implements ProductDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private final ProductRowMapper productRowMapper = new ProductRowMapper();

    @Override
    public Product get_by_id(int id) {
        String query = "SELECT * FROM products WHERE id = ?";
        List<Product> list = jdbcTemplate.query(query, productRowMapper, id);

        return (list != null && !list.isEmpty()) ? list.get(0) : null;
    }

    @Override
    public List<Product> get_all() throws DataAccessException {
        String query = "SELECT * FROM products";

        return jdbcTemplate.query(query, productRowMapper);
    }

    @Override
    public int create(Product p) {
        String query = "INSERT INTO products (name, buy_price, sell_price, stock) VALUES (?, ?, ?, ?)";

        return jdbcTemplate.update(query,
                p.get_name(),
                p.get_buy_price(),
                p.get_sell_price(),
                p.get_stock());
    }

    @Override
    public int update(Product p) {
        String query = "UPDATE products SET name = ?, buy_price = ?, sell_price = ?, stock = ? WHERE id = ?";

        return jdbcTemplate.update(query,
                p.get_name(),
                p.get_buy_price(),
                p.get_sell_price(),
                p.get_stock(),
                p.get_id());
    }

    @Override
    public int delete(int id) {
        String query = "DELETE FROM products WHERE id = ?";

        return jdbcTemplate.update(query, id);
    }
}