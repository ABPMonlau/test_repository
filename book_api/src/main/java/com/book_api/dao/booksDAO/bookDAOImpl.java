package com.book_api.dao.booksDAO;

import com.book_api.model.classes.books;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class bookDAOImpl implements bookDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private static final bookRowMapper rowMapper = new bookRowMapper();

    @Override
    public List<books> getAllReserves() {
        String query = "SELECT * FROM reservas";

        return jdbcTemplate.query(query, rowMapper);
    }

    @Override
    public books getReserveByTable(int id) {
        String query = "SELECT * FROM reservas WHERE id_mesa = ?";

        return jdbcTemplate.query(query, rowMapper, id).getFirst();
    }

    @Override
    public books getReserveById(int id) {
        String query = "SELECT * FROM reservas WHERE id_reserva = ?";

        return jdbcTemplate.query(query, rowMapper, id).getFirst();
    }

    @Override
    public int addReserve(books b) {
        String query = "INSERT INTO reservas(id_cliente, id_mesa, id_turno, fecha_reserva, hora_reserva, cantidad_personas, estado, fecha_creacion) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

        return jdbcTemplate.update(query, b.getClient().getId(), b.getTable().getId(), b.getShift().getId(), b.getBookDate(), b.getHour(), b.getGuests(), b.getState(), b.getCreationDate());
    }

    @Override
    public int cancelReserve(int id) {
        String query = "DELETE FROM reservas WHERE id_reserva = ?";

        return jdbcTemplate.update(query, id);
    }
}