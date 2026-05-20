package com.victor.demo.model;

import org.springframework.data.annotation.Id;

public class Product {
    @Id
    private int id;
    private String name;
    private double buyPrice;
    private double sellPrice;
    private int stock;

    public Product() {

    }

    public Product(String name, double buyPrice, double sellPrice, int stock) {
        this.name = name;
        this.buyPrice = buyPrice;
        this.sellPrice = sellPrice;
        this.stock = stock;
    }

    public Product(int id, String name, double buyPrice, double sellPrice, int stock) {
        this.id = id;
        this.name = name;
        this.buyPrice = buyPrice;
        this.sellPrice = sellPrice;
        this.stock = stock;
    }

    public int get_id() {
        return id;
    }

    public void set_id(int id) {
        this.id = id;
    }

    public String get_name() {
        return name;
    }

    public void set_name(String name) {
        this.name = name;
    }

    public double get_buy_price() {
        return buyPrice;
    }

    public void set_buy_price(double buyPrice) {
        this.buyPrice = buyPrice;
    }

    public double get_sell_price() {
        return sellPrice;
    }

    public void set_sell_price(double sellPrice) {
        this.sellPrice = sellPrice;
    }

    public int get_stock() {
        return stock;
    }

    public void set_stock(int stock) {
        this.stock = stock;
    }

    public String to_string() {
        return "Product {" +
                "id = " + id +
                ", name = " + name +
                ", buyPrice = " + buyPrice +
                ", sellPrice = " + sellPrice +
                ", stock = " + stock +
                '}';
    }
}