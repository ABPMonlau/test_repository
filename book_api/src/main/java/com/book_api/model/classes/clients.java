package com.book_api.model.classes;

import com.book_api.model.exceptions.clientException;

import jakarta.persistence.Id;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import org.springframework.data.relational.core.mapping.Table;

import java.sql.Date;

@Entity
@Table("clientes")
public class clients {
    @Id
    private int clientID;

    private String name;
    private String email;
    private String phone;
    private Date bookDate;

    public clients() {}

    public int getId() {
        return clientID;
    }

    public void setId(int id) {
        this.clientID = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getBookDate() {
        return bookDate;
    }

    public void setBookDate(Date bookDate) {
        this.bookDate = bookDate;
    }
}