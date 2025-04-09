package com.nberr.dao;
import com.nberr.model.Trips;
import java.util.List;

public interface TripsDao {

    List<Trips> getTripsByUserId(Long userId);

    Trips getTripById(Long tripId);

    Trips createTrip(Trips trip);

    Trips updateTrip(Trips trip);

    boolean deleteTrip(long id);
}
