package com.book_api.dao.tablesDAO;

import com.book_api.model.classes.tables;

import com.book_api.model.enums.timeShiftStates;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class tableDAOImpl implements tableDAO {
    @Autowired
    private JdbcTemplate jdbc;
    private static final tableRowMapper rowMapper = new tableRowMapper();

    @Override
    public List<tables> getAllTables() {
        String query = "SELECT * FROM mesas";

        return jdbc.query(query, rowMapper);
    }

    @Override
    public List<tables> getAvaliableTables(int guests, String tss) {
        String query = "SELECT * FROM mesas_turnos mt JOIN mesas m ON(mt.id_mesa = m.id_mesa) WHERE (m.capacidad >= ? AND m.capacidad - 2 <= ?) AND m.activa = 1 AND mt.id_turno = ? ORDER BY m.capacidad ASC";

        int tssi = (tss.equals("maniana")) ? 1 : (tss.equals("comida")) ? 2 : 3;

        return jdbc.query(query, rowMapper, guests, guests, tssi);
    }

    @Override
    public tables getTable(int id) {
        String query = "SELECT * FROM mesas WHERE id_mesa = ?";

        return jdbc.query(query, rowMapper, id).getFirst();
    }

    @Override
    public int setActive(int id) {
        String query = "UPDATE mesas SET activa = 1 WHERE id_mesa = ?";

        return jdbc.update(query, id);
    }

    @Override
    public int setDeactive(int id) {
        String query = "UPDATE mesas SET activa = 0 WHERE id_mesa = ?";

        return jdbc.update(query, id);
    }
}