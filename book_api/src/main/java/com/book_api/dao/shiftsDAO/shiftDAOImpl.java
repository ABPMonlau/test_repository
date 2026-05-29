package com.book_api.dao.shiftsDAO;

import com.book_api.model.classes.shifts;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class shiftDAOImpl implements shiftDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private static final shiftRowMapper rowMapper = new shiftRowMapper();

    @Override
    public List<shifts> getAllShifts() {
        String query = "SELECT * FROM turnos";

        return jdbcTemplate.query(query, rowMapper);
    }

    @Override
    public shifts getShiftById(int id) {
        String query = "SELECT * FROM turnos WHERE id_turno = ?";

        return jdbcTemplate.query(query, rowMapper, id).getFirst();
    }
}