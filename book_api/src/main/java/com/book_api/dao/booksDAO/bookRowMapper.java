package com.book_api.dao.booksDAO;

import com.book_api.model.classes.books;

import com.book_api.model.classes.clients;

import com.book_api.model.classes.shifts;
import com.book_api.dao.shiftsDAO.shiftDAOImpl;

import com.book_api.model.classes.tables;

import com.book_api.model.enums.bookStates;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class bookRowMapper implements RowMapper<books> {
    static final shiftDAOImpl shift = new shiftDAOImpl();

    @Override
    public books mapRow(ResultSet rs, int rowNum) throws SQLException {
        books b = new books();
        b.setId(rs.getInt("id_reserva"));
        b.setBookDate(rs.getDate("fecha_reserva"));
        b.setGuests(rs.getInt("cantidad_personas"));
        b.setHour(rs.getTime("hora_reserva"));

        String state = rs.getString("estado");

        b.setState((state.equals("Pendiente")) ? bookStates.Pendiente :
                (state.equals("Confirmada")) ? bookStates.Confirmada:
                (state.equals("Cancelada")) ? bookStates.Cancelada :
                bookStates.Completada);

        b.setShift(shift.getShiftById(rs.getInt("id_turno")));

        tables t = new tables();
        t.setId(rs.getInt("id_mesa"));

        b.setTable(t);

        clients c = new clients();
        c.setId(rs.getInt("id_cliente"));

        b.setClient(c);
        b.setCreationDate(rs.getDate("fecha_creacion"));

        return b;
    }
}