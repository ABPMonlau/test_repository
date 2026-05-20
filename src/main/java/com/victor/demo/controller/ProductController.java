package com.victor.demo.controller;

import com.victor.demo.dao.ProductDAO;
import com.victor.demo.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
public class ProductController {
    @Autowired
    ProductDAO productDAO;

    @GetMapping("/api/products")
    public ResponseEntity<ArrayList<Product>> get_all_products() {
        System.out.print("Getting all products... ");

        ArrayList<Product> list = new ArrayList<>();

        for (Product p : productDAO.get_all()){
            list.add(p);
        }

        System.out.print("Done!");

        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping("/api/products/{id}")
    public ResponseEntity<Product> get_product(@PathVariable int id) {
        System.out.print("Getting product by ID: " + id + "... ");

        Product p = productDAO.get_by_id(id);

        if (p == null) {
            System.out.println("Product not found!");

            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        System.out.println("Done!");

        return new ResponseEntity<>(p, HttpStatus.OK);
    }

    //NOTE
    //Product argument does not work with JSON call.
    //Either fix it or change it so Product is a static object.
    @PostMapping("/api/products/add")
    public ResponseEntity<Product> add_product(@RequestBody Product p) {
        System.out.print("Adding new product " + p.get_name() + "... ");

        int numRows = productDAO.create(p);

        if (numRows == 0) {
            System.out.println("Error, Bad Request!");

            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        System.out.println("Done!");

        return new ResponseEntity<>(p, HttpStatus.CREATED);
    }

    @PutMapping("/api/products/update/{id}")
    public ResponseEntity<Product> update_product(@PathVariable int id, @RequestBody Product p) {
        System.out.print("Updating product by ID: " + id + "... ");

        p.set_id(id);
        int numRows = productDAO.update(p);

        if (numRows == 0) {
            System.out.println("Error, Bad Request!");

            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        System.out.println("Done!");

        return new ResponseEntity<>(p, HttpStatus.OK);
    }

    @DeleteMapping("/api/products/{id}")
    public ResponseEntity<Product> delete_product(@PathVariable int id) {
        System.out.print("Deleting product by ID: " + id + "... ");

        int numRows = productDAO.delete(id);

        if (numRows == 0) {
            System.out.println("Error, Bad Request!");

            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        System.out.println("Done!");

        return new ResponseEntity<>(HttpStatus.OK);
    }
}