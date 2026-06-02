package com.book_api.model.classes;

import com.book_api.model.enums.tableStates;

import jakarta.persistence.Id;
import jakarta.persistence.Entity;
import org.springframework.data.relational.core.mapping.Table;

@Entity
@Table(name = "mesas")
public class tables {
    @Id
    private int tableID;

    private int capacity;
    private tableStates state;
    private String location;

    public tables() {}

    public void setId(int id) {
        this.tableID = id;
    }

    public int getId() {
        return tableID;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setState(tableStates state) {
        this.state = state;
    }

    public tableStates getState() {
        return state;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLocation() {
        return location;
    }
}