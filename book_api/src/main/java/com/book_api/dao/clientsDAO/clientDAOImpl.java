package com.book_api.dao.clientsDAO;

import com.book_api.model.classes.clients;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class clientDAOImpl implements clientDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private static final clientRowMapper rowMapper = new clientRowMapper();

    @Override
    public List<clients> getAllClients() {
        String query = "SELECT * FROM clientes";

        List<clients> c = jdbcTemplate.query(query, rowMapper);

        return (c.isEmpty()) ? null : c;
    }

    @Override
    public clients getClient(int id) {
        try {
            String query = "SELECT * FROM clientes WHERE id_cliente = ?";

            return jdbcTemplate.queryForObject(query, rowMapper, id);
        }
        catch (EmptyResultDataAccessException e) {
            return null;
        }
    }


    @Override
    public int addClient(clients c) {
        String query = "INSERT INTO clientes(nombre, telefono, email, fecha_registro) VALUES (?, ?, ?, ?)";

        return jdbcTemplate.update(query, c.getName(), c.getPhone(), c.getEmail(), c.getBookDate());
    }
}