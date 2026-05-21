package com.victor.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.sql.Time;
import java.util.Date;

@Entity
@Table(name = "mesas")
public class Board {
    @Id
    private int tableNum;

    @Column(name = "activa")
    private boolean isBooked;

    @Column(name = "capacidad")
    private int personNum;

    private Date bookDate;
    private Time bookHour;

    public Board() {}

    public Board(int tableNum, int personNum, Date bookDate, Time bookHour) {
        this.tableNum = tableNum;
        this.personNum = personNum;
        this.bookDate = bookDate;
        this.bookHour = bookHour;
        isBooked = true;
    }

    public Board(int personNum, Date bookDate, Time bookHour) {
        this.personNum = personNum;
        this.bookDate = bookDate;
        this.bookHour = bookHour;
        isBooked = true;
    }

    public Board(int tableNum, int capacity, int active) {
        this.tableNum = tableNum;
        personNum = capacity;
        isBooked = (active == 1) ? false : true;
    }

    public int getTableNum() {
        return tableNum;
    }

    public void setTableNum(int tableNum) {
        this.tableNum = tableNum;
    }

    public int getPersonNum() {
        return personNum;
    }

    public void setPersonNum(int personNum) {
        this.personNum = personNum;
    }

    public Date getBookDate() {
        return bookDate;
    }

    public void setBookDate(Date bookDate) {
        this.bookDate = bookDate;
    }

    public Time getBookHour() {
        return bookHour;
    }

    public void setBookHour(Time bookHour) {
        this.bookHour = bookHour;
    }

    public void setIsBooked(boolean isBooked) {
        this.isBooked = isBooked;
    }

    public boolean getIsBooked() {
        return isBooked;
    }
}