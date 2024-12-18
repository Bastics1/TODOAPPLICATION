package com.example.todoapp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.todoapp.models.Task;


import java.util.List;


public interface TaskRepository extends JpaRepository<Task, Long> {
    List<Task> findByTitle(String title);
}
