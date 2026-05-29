package com.book_api.model.classes;

import com.book_api.model.enums.bookStates;

import jakarta.persistence.Id;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.relational.core.mapping.Table;

import java.sql.Date;
import java.sql.Time;

@Setter
@Getter
@Entity
@Table("reservas")
public class books {
    @Id
    private int bookID;

    private int guests;
    private Date bookDate, creationDate;
    private Time hour;
    private bookStates state;

    @ManyToOne
    @JoinColumn(name = "id_cliente") //Possible error
    private clients client;

    @ManyToOne
    @JoinColumn(name = "id_mesa")  //Possible error
    private tables table;

    @ManyToOne
    @JoinColumn(name = "id")
    private shifts shift;

    public books() {}

    public int getId() {
        return bookID;
    }

    public void setId(int id) {
        this.bookID = id;
    }

    public shifts getShift() {
        return shift;
    }

    public void setShift(shifts s) {
        shift = s;
    }

    public tables getTable() {
        return table;
    }

    public void setTable(tables t) {
        table = t;
    }

    public clients getClient() {
        return client;
    }

    public void setClient(clients c) {
        client = c;
    }

    public Date getBookDate() {
        return bookDate;
    }

    public void setBookDate(Date d) {
        bookDate = d;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date d) {
        creationDate = d;
    }

    public Time getHour() {
        return hour;
    }

    public void setHour(Time h) {
        hour = h;
    }

    public int getGuests() {
        return guests;
    }

    public void setGuests(int g) {
        guests = g;
    }

    public String getState() {
        return state.name();
    }

    public void setState(bookStates s) {
        state = s;
    }
}