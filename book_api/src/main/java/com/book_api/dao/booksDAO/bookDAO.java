package com.book_api.dao.booksDAO;

import com.book_api.model.classes.books;

import java.util.List;

public interface bookDAO {
    List<books> getAllReserves();

    books getReserveByTable(int id);

    books getReserveById(int id);

    int addReserve(books book);

    int cancelReserve(int id);
}