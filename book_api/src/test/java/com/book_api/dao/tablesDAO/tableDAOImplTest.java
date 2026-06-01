package com.book_api.dao.tablesDAO;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import static org.junit.jupiter.api.Assertions.*;

class tableDAOImplTest {
    @Test
    void getAllTables() {
        tableDAOImpl tableDAO = new tableDAOImpl();

        assertNotNull(tableDAO.getAllTables());
    }

    @ParameterizedTest
    @CsvSource(value = {"2, 'maniana'"})
    void getAvaliableTables(int guests, String shift) {
        tableDAOImpl tableDAO = new tableDAOImpl();

        assertNotNull(tableDAO.getAvaliableTables(guests, shift));
    }

    @ParameterizedTest
    @CsvSource(value = {"1"})
    void getTable(int id) {
        tableDAOImpl tableDAO = new tableDAOImpl();

        assertNotNull(tableDAO.getTable(id));
    }

    @ParameterizedTest
    @CsvSource(value = {"1"})
    void setActive(int id) {
        tableDAOImpl tableDAO = new tableDAOImpl();

        assertEquals(1, tableDAO.setActive(id));
    }

    @ParameterizedTest
    @CsvSource(value = {"1"})
    void setDeactive(int id) {
        tableDAOImpl tableDAO = new tableDAOImpl();

        assertEquals(1, tableDAO.setDeactive(id));
    }
}