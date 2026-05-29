package com.book_api.dao.shiftsDAO;

import com.book_api.model.classes.shifts;
import com.book_api.model.enums.dayShiftStates;
import com.book_api.model.enums.timeShiftStates;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class shiftRowMapper implements RowMapper<shifts> {
    @Override
    public shifts mapRow(ResultSet rs, int rowNum) throws SQLException {
        shifts s = new shifts();

        s.setId(rs.getInt("id_turno"));

        String day = rs.getString("dia_semana");

        s.setDayShift(
                (day.equals("Monday")) ? dayShiftStates.MONDAY      :
                (day.equals("Tuesday")) ? dayShiftStates.TUESDAY     :
                (day.equals("Wednesday")) ? dayShiftStates.WEDNESDAY   :
                (day.equals("Thursday")) ? dayShiftStates.THURSDAY    :
                (day.equals("Friday")) ? dayShiftStates.FRIDAY      :
                (day.equals("Saturday")) ? dayShiftStates.SATURDAY    :
                             dayShiftStates.SUNDAY
        );

        String time = rs.getString("tipo_turno");

        s.setTimeShift(
                (time.equals("maniana")) ? timeShiftStates.maniana   :
                (time.equals("comida")) ? timeShiftStates.comida    :
                              timeShiftStates.noche
        );

        s.setStartHour(rs.getTime("hora_comienzo"));
        s.setEndHour(rs.getTime("hora_cierre"));
        s.setMaxBooks(rs.getInt("maxima_reserva"));

        return s;
    }
}