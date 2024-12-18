package com.example.todoapp.controllers;

import java.io.IOException;
import java.security.Principal;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.todoapp.models.Task;
import com.example.todoapp.services.TaskService;

import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class TaskController {
    private final TaskService taskService;

    @GetMapping("/")
    public String tasks(@RequestParam(name = "title", required = false) String title, Principal principal, Model model) {
        model.addAttribute("tasks", taskService.listTasks(title));
        model.addAttribute("user", taskService.getUserByPrincipal(principal));
        return "tasks";
    }

    @GetMapping("/task/{id}")
    public String taskInfo(@PathVariable Long id, Model model, Principal principal) {
        Task task = taskService.getTaskById(id);
        if (task == null || !task.getUser().getId().equals(taskService.getUserByPrincipal(principal).getId())) {
            return "redirect:/";
        }
        model.addAttribute("task", task);
        return "task-info";
    }

    @PostMapping("/task/create")
    public String createTask(Task task, Principal principal) throws IOException {
        taskService.saveTask(principal, task);
        return "redirect:/";
    }

    @PostMapping("/task/delete/{id}")
    public String deleteTask(@PathVariable Long id) {
        taskService.deleteTask(id);
        return "redirect:/";
    }

    @GetMapping("/task/edit/{id}")
    public String editTaskForm(@PathVariable Long id, Model model, Principal principal) {
        Task task = taskService.getTaskById(id);
        if (task == null || !task.getUser().getId().equals(taskService.getUserByPrincipal(principal).getId())) {
            return "redirect:/"; 
        }
        model.addAttribute("task", task);
        return "edit-task"; 
    }

    @PostMapping("/task/edit/{id}")
    public String updateTask(@PathVariable Long id, Task updatedTask, Principal principal) throws IOException {
        Task existingTask = taskService.getTaskById(id);
        if (existingTask != null && existingTask.getUser().getId().equals(taskService.getUserByPrincipal(principal).getId())) {

            existingTask.setTitle(updatedTask.getTitle());
            existingTask.setDescription(updatedTask.getDescription());
            existingTask.setDate(updatedTask.getDate());
            taskService.saveTask(principal, existingTask); 
        }
        return "redirect:/"; 
    }     
}
