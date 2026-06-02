package com.book_api.dao.tablesDAO;

import com.book_api.model.classes.tables;
import com.book_api.model.enums.timeShiftStates;

import java.util.List;

public interface tableDAO {
    List<tables> getAllTables();

    List<tables> getAvaliableTables(int guests, String tss);

    tables getTable(int id);

    int setActive(int id);

    int setDeactive(int id);
}