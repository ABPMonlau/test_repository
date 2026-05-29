package com.book_api.dao.clientsDAO;

import com.book_api.model.classes.clients;

import java.util.List;

public interface clientDAO {
    List<clients> getAllClients();

    clients getClient(int id);

    int addClient(clients client);
}