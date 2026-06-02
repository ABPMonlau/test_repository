package com.book_api.model.classes;

import com.book_api.model.enums.dayShiftStates;
import com.book_api.model.enums.timeShiftStates;

import jakarta.persistence.Id;
import jakarta.persistence.Entity;
import org.springframework.data.relational.core.mapping.Table;

import java.sql.Time;

@Entity
@Table(name = "turnos")
public class shifts {
    @Id
    private int shiftID;

    private dayShiftStates dayShift;
    private timeShiftStates timeShift;

    private Time startHour;
    private Time endHour;
    private int maxBooks;

    public shifts() {}

    public int getId() {
        return shiftID;
    }

    public void setId(int id) {
        shiftID = id;
    }

    public void setDayShift(dayShiftStates shift) {
        dayShift = shift;
    }

    public dayShiftStates getDayShift() {
        return dayShift;
    }

    public void setTimeShift(timeShiftStates shift) {
        timeShift = shift;
    }

    public String getTimeShift() {
        return timeShift.name();
    }

    public void setStartHour(Time hour) {
        startHour = hour;
    }

    public Time getStartHour() {
        return startHour;
    }

    public void setEndHour(Time hour) {
        endHour = hour;
    }

    public Time getEndHour() {
        return endHour;
    }

    public void setMaxBooks(int max) {
        maxBooks = max;
    }

    public int getMaxBooks() {
        return maxBooks;
    }
}