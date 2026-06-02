package com.book_api.dao.clientsDAO;

import com.book_api.model.classes.clients;
import java.sql.Date;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import static org.junit.jupiter.api.Assertions.*;

class clientDAOImplTest {
    @Test
    void getAllClients() {
        clientDAOImpl clientDAO = new clientDAOImpl();

        assertNotNull(clientDAO.getAllClients());
    }

    @ParameterizedTest
    @CsvSource(value = {"1"})
    void getClient(int id) {
        clientDAOImpl clientDAO = new clientDAOImpl();

        assertNotNull(clientDAO.getClient(id));
    }

    @ParameterizedTest
    @CsvSource(value = {"''"})
    void addClient(clients c) {
        clientDAOImpl clientDAO = new clientDAOImpl();

        assertEquals(1, clientDAO.addClient(c));
    }
}