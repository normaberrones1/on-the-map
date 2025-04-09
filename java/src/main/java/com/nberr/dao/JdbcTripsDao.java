package com.nberr.dao;

import com.nberr.exception.DaoException;
import com.nberr.model.Trips;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcTripsDao implements TripsDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcTripsDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Trips> getTripsByUserId(Long userId) {
        List<Trips> trips = new ArrayList<>();
        String sql = "SELECT id, user_id, destination, start_date, end_date, total_cost, budget, savings FROM trips WHERE user_id = ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
            while (results.next()) {
                trips.add(mapRowToTrips(results));
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return trips;
    }

    @Override
    public Trips getTripById(Long tripId) {
        Trips trips = null;
        String sql = "SELECT id, user_id, destination, start_date, end_date, total_cost, budget, savings FROM trips WHERE id = ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, tripId);
            if (results.next()) {
                trips = mapRowToTrips(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return trips;
    }


    @Override
    public Trips createTrip(Trips trips) {
        String sql = "INSERT INTO trips (user_id, destination, start_date, end_date, total_cost, budget, savings) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?) RETURNING id";
        try {
            long newTripId = jdbcTemplate.queryForObject(sql, long.class, trips.getUserId(), trips.getDestination(),
                    trips.getStartDate(), trips.getEndDate(),
                    trips.getTotalCost(), trips.getBudget(), trips.getSavings());
            return getTripById(newTripId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
    }

    @Override
    public Trips updateTrip(Trips trips) {
        String sql = "UPDATE trips SET destination = ?, start_date = ?, end_date = ?, total_cost = ?, " +
                "budget = ?, savings = ? WHERE id = ?";
        try {
            int rowsUpdated = jdbcTemplate.update(sql, trips.getDestination(), trips.getStartDate(), trips.getEndDate(),
                    trips.getTotalCost(), trips.getBudget(), trips.getSavings(), trips.getId());
            if (rowsUpdated > 0) {
                return trips;
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return null;
    }

    @Override
    public boolean deleteTrip(long id) {
        String sql = "DELETE FROM trips WHERE id = ?";
        try {
            int rowsDeleted = jdbcTemplate.update(sql, id);
            return rowsDeleted > 0;
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
    }

    private Trips mapRowToTrips(SqlRowSet rs) {
        Trips trips = new Trips();
        trips.setId(rs.getLong("id"));
        trips.setUserId(rs.getLong("user_id"));
        trips.setDestination(rs.getString("destination"));
        trips.setStartDate(rs.getDate("start_date").toLocalDate());
        trips.setEndDate(rs.getDate("end_date").toLocalDate());
        trips.setTotalCost(rs.getBigDecimal("total_cost"));
        trips.setBudget(rs.getBigDecimal("budget"));
        trips.setSavings(rs.getBigDecimal("savings"));
        return trips;
    }
}