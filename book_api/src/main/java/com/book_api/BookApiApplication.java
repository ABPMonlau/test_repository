package com.book_api;

import org.springframework.beans.factory.BeanCreationException;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BookApiApplication {
    public static void main(String[] args) {
        try {
            SpringApplication.run(BookApiApplication.class, args);

            System.out.println("Connection successful!");
            System.out.print("Listening for database...");
        }
        catch (BeanCreationException e) {
            System.out.println("\r- Error caught: database not found or server not started");
        }
    }
}