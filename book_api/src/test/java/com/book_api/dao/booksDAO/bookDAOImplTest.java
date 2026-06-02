package com.book_api.dao.booksDAO;

import com.book_api.model.classes.books;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import static org.junit.jupiter.api.Assertions.*;

class bookDAOImplTest {
    @Test
    void getAllReserves() {
        bookDAOImpl bookDAO = new bookDAOImpl();

        assertNotNull(bookDAO.getAllReserves());
    }

    @ParameterizedTest
    @CsvSource(value = {"1"})
    void getReserveByTable(int id) {
        bookDAOImpl bookDAO = new bookDAOImpl();

        assertNotNull(bookDAO.getReserveByTable(id));
    }

    @ParameterizedTest
    @CsvSource(value = {"1"})
    void getReserveById(int id) {
        bookDAOImpl bookDAO = new bookDAOImpl();

        assertNotNull(bookDAO.getReserveById(id));
    }

    @ParameterizedTest
    @CsvSource(value = {"''"})
    void addReserve(books b) {
        bookDAOImpl bookDAO = new bookDAOImpl();

        assertEquals(1, bookDAO.addReserve(b));
    }

    @ParameterizedTest
    @CsvSource(value = {"1"})
    void cancelReserve(int id) {
        bookDAOImpl bookDAO = new bookDAOImpl();

        assertEquals(1,  bookDAO.cancelReserve(id));
    }
}