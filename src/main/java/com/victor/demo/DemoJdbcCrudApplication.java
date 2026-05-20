package com.victor.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DemoJdbcCrudApplication {
    public static void main(String[] args) {
        try {
            SpringApplication.run(DemoJdbcCrudApplication.class, args);
        }
        catch (Exception e) {
            System.out.println("\r- Error caught: " + e.getMessage());
        }

        System.out.print("Listening for database...");
    }
}