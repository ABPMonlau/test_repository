package com.book_api.dao.shiftsDAO;

import com.book_api.model.classes.shifts;

import java.util.List;

public interface shiftDAO {
    List<shifts> getAllShifts();

    shifts getShiftById(int id);
}