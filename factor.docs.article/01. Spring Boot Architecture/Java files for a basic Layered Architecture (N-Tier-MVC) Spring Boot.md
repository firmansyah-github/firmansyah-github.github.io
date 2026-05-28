Here is a complete set of Java files for a basic **Layered Architecture (N-Tier / MVC)** Spring Boot application. The structure includes:

* `controller` → handles HTTP requests
* `service` and `service.impl` → business logic
* `repository` → database access
* `model` → entity
* `dto` → data transfer object
* `Application.java` → entry point

Let me know if you'd like to add validation, pagination, tests, or convert it to another architecture.
// File: Application.java
package com.example.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}

// File: controller/UserController.java
package com.example.app.controller;

import com.example.app.dto.UserDto;
import com.example.app.service.UserService;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public List<UserDto> getAllUsers() {
        return userService.getAllUsers();
    }

    @PostMapping
    public UserDto createUser(@RequestBody UserDto userDto) {
        return userService.createUser(userDto);
    }
}

// File: service/UserService.java
package com.example.app.service;

import com.example.app.dto.UserDto;
import java.util.List;

public interface UserService {
    List<UserDto> getAllUsers();
    UserDto createUser(UserDto userDto);
}

// File: service/UserServiceImpl.java
package com.example.app.service;

import com.example.app.dto.UserDto;
import com.example.app.model.User;
import com.example.app.repository.UserRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public List<UserDto> getAllUsers() {
        return userRepository.findAll().stream()
                .map(user -> new UserDto(user.getId(), user.getName()))
                .collect(Collectors.toList());
    }

    @Override
    public UserDto createUser(UserDto userDto) {
        User user = new User();
        user.setName(userDto.getName());
        User savedUser = userRepository.save(user);
        return new UserDto(savedUser.getId(), savedUser.getName());
    }
}

// File: repository/UserRepository.java
package com.example.app.repository;

import com.example.app.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}

// File: model/User.java
package com.example.app.model;

import jakarta.persistence.*;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    // Getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}

// File: dto/UserDto.java
package com.example.app.dto;

public class UserDto {

    private Long id;
    private String name;

    public UserDto() {}

    public UserDto(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    // Getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
} 
