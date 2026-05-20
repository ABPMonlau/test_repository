package com.victor.demo.dao;

import com.victor.demo.model.Product;

import java.util.List;

public interface ProductDAO {
    Product get_by_id(int id);
    List<Product> get_all();

    int create(Product p);
    int update(Product p);
    int delete(int id);
}