package com.example.todoapp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.todoapp.models.User;


public interface UserRepository extends JpaRepository<User, Long>{
    User findByEmail(String email);
}
