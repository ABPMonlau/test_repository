package com.victor.demo.model;

import org.springframework.data.annotation.Id;

import java.sql.Time;
import java.util.Date;

public class Board {
    @Id
    private int tableNum;
    private boolean isBooked;
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

    public int get_tableNum() {
        return tableNum;
    }

    public void set_tableNum(int tableNum) {
        this.tableNum = tableNum;
    }

    public int get_personNum() {
        return personNum;
    }

    public void set_personNum(int personNum) {
        this.personNum = personNum;
    }

    public Date get_bookDate() {
        return bookDate;
    }

    public void set_bookDate(Date bookDate) {
        this.bookDate = bookDate;
    }

    public Time get_bookHour() {
        return bookHour;
    }

    public void set_bookHour(Time bookHour) {
        this.bookHour = bookHour;
    }

    public void set_isBooked(boolean isBooked) {
        this.isBooked = isBooked;
    }

    public boolean is_booked() {
        return isBooked;
    }
}