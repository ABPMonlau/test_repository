package com.book_api.dao.clientsDAO;
import com.book_api.model.classes.clients;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;
@Repository
public class clientDAOImpl implements clientDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private static final clientRowMapper rowMapper = new clientRowMapper();
    @Override
    public List<clients> getAllClients() {
        String query = 'SELECT * FROM clientes';
        return jdbcTemplate.query(query, rowMapper);
    }
    @Override
    public clients getClient(int id) {
        try {
            String query = 'SELECT * FROM clientes WHERE id_cliente = ?';
            return jdbcTemplate.queryForObject(query, rowMapper, id);
        }
        catch (EmptyResultDataAccessException e) {
            return null;
        }
    }
    @Override
    public int addClient(clients c) {
        String query = 'INSERT INTO clientes(nombre, telefono, email, fecha_registro) VALUES (?, ?, ?, ?)';
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, c.getName());
            ps.setString(2, c.getPhone());
            ps.setString(3, c.getEmail());
            ps.setDate(4, c.getBookDate());
            return ps;
        }, keyHolder);
        return keyHolder.getKey().intValue();
    }
}
