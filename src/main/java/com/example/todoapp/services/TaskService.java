package com.example.todoapp.services;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Service;
import com.example.todoapp.models.Task;
import com.example.todoapp.models.User;
import com.example.todoapp.repositories.TaskRepository;
import com.example.todoapp.repositories.UserRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class TaskService {
     private final TaskRepository taskRepository;
    private final UserRepository userRepository;

    public List<Task> listTasks(String title) {
        if (title != null) return taskRepository.findByTitle(title);
        return taskRepository.findAll();
    }

    public void saveTask(Principal principal, Task task) throws IOException {
        task.setUser(getUserByPrincipal(principal));
        
        log.info("Saving new Task. Title: {}; Author email: {}", task.getTitle(), task.getUser().getEmail());

        taskRepository.save(task);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteTask(Long id) {
        taskRepository.deleteById(id);
    }

    public Task getTaskById(Long id) {
        return taskRepository.findById(id).orElse(null);
    } 
}
