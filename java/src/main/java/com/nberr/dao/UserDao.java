package com.nberr.dao;

import com.nberr.model.RegisterUserDto;
import com.nberr.model.User;

import java.util.List;

public interface UserDao {

    List<User> getUsers();

    User getUserById(int id);

    User getUserByUsername(String username);

    User createUser(RegisterUserDto user);
}
