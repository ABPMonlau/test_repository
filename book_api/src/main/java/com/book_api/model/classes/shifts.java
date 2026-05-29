package com.book_api.model.classes;

import com.book_api.model.enums.dayShiftStates;
import com.book_api.model.enums.timeShiftStates;

import jakarta.persistence.Id;
import jakarta.persistence.Entity;
import org.springframework.data.relational.core.mapping.Table;

import java.sql.Date;
import java.sql.Time;

@Entity
@Table(name = "turnos")
public class shifts {
    @Id
    private int shiftID;

    private dayShiftStates dayShift;
    private timeShiftStates timeShift;

    private Date date;
    private Time startHour;
    private Time endHour;
    private int maxBooks;

    public shifts() {}

    public boolean isTableAvailable(tables t) {
        return t.isAvaliable();
    }

    public int getId() {
        return shiftID;
    }

    public void setId(int id) {
        this.shiftID = id;
    }

    public void setDayShift(dayShiftStates shift) {
        this.dayShift = shift;
    }

    public dayShiftStates getDayShift() {
        return dayShift;
    }

    public void setTimeShift(timeShiftStates shift) {
        this.timeShift = shift;
    }

    public String getTimeShift() {
        return timeShift.name();
    }

    public void setStartHour(Time startHour) {
        this.startHour = startHour;
    }

    public Time getStartHour() {
        return startHour;
    }

    public void setEndHour(Time endHour) {
        this.endHour = endHour;
    }

    public Time getEndHour() {
        return endHour;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public void setMaxBooks(int maxBooks) {
        this.maxBooks = maxBooks;
    }

    public int getMaxBooks() {
        return maxBooks;
    }
}