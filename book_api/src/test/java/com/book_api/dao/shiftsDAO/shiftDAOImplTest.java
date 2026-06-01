package com.book_api.dao.shiftsDAO;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import static org.junit.jupiter.api.Assertions.*;

class shiftDAOImplTest {
    @ParameterizedTest
    @CsvSource(value = {"1"})
    void getShiftById(int id) {
        shiftDAOImpl shiftDAO = new shiftDAOImpl();

        assertNotNull(shiftDAO.getShiftById(id));
    }
}