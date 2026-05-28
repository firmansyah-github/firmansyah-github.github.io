I’ve created the full Java file set for a **Hexagonal Architecture** (Ports & Adapters) Spring Boot app. It includes:

* **Domain**: Entities and core service interfaces
* **Application**: Input/output ports, use-case implementation, DTOs
* **Adapters**: Web controller and persistence adapter
* **Persistence**: JPA entities and repository

Let me know if you need additional layers (e.g., messaging), configuration classes, or example unit tests!
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

// ===== Domain Layer =====
// File: domain/model/User.java
package com.example.app.domain.model;

public class User {
    private Long id;
    private String name;

    // Constructors, getters, setters
}

// File: domain/service/UserService.java
package com.example.app.domain.service;

import com.example.app.domain.model.User;
import java.util.List;

public interface UserService {
    List<User> findAllUsers();
    User registerUser(User user);
}

// ===== Application Layer =====
// File: application/port/in/UserUseCase.java
package com.example.app.application.port.in;

import com.example.app.application.port.in.dto.UserDto;
import java.util.List;

public interface UserUseCase {
    List<UserDto> getUsers();
    UserDto createUser(UserDto userDto);
}

// File: application/port/out/UserPersistencePort.java
package com.example.app.application.port.out;

import com.example.app.domain.model.User;
import java.util.List;

public interface UserPersistencePort {
    List<User> loadAllUsers();
    User saveUser(User user);
}

// File: application/usecase/UserUseCaseImpl.java
package com.example.app.application.usecase;

import com.example.app.application.port.in.UserUseCase;
import com.example.app.application.port.in.dto.UserDto;
import com.example.app.application.port.out.UserPersistencePort;
import com.example.app.domain.model.User;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserUseCaseImpl implements UserUseCase {

    private final UserPersistencePort persistencePort;

    public UserUseCaseImpl(UserPersistencePort persistencePort) {
        this.persistencePort = persistencePort;
    }

    @Override
    public List<UserDto> getUsers() {
        return persistencePort.loadAllUsers().stream()
            .map(u -> new UserDto(u.getId(), u.getName()))
            .collect(Collectors.toList());
    }

    @Override
    public UserDto createUser(UserDto userDto) {
        User user = new User();
        user.setName(userDto.getName());
        User saved = persistencePort.saveUser(user);
        return new UserDto(saved.getId(), saved.getName());
    }
}

// File: application/port/in/dto/UserDto.java
package com.example.app.application.port.in.dto;

public class UserDto {
    private Long id;
    private String name;

    public UserDto() {}
    public UserDto(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    // getters and setters
}

// ===== Adapter Layer =====
// File: adapter/web/UserController.java
package com.example.app.adapter.web;

import com.example.app.application.port.in.UserUseCase;
import com.example.app.application.port.in.dto.UserDto;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {

    private final UserUseCase userUseCase;

    public UserController(UserUseCase userUseCase) {
        this.userUseCase = userUseCase;
    }

    @GetMapping
    public List<UserDto> getAll() {
        return userUseCase.getUsers();
    }

    @PostMapping
    public UserDto create(@RequestBody UserDto dto) {
        return userUseCase.createUser(dto);
    }
}

// File: adapter/persistence/UserRepositoryAdapter.java
package com.example.app.adapter.persistence;

import com.example.app.application.port.out.UserPersistencePort;
import com.example.app.domain.model.User;
import com.example.app.adapter.persistence.entity.UserEntity;
import com.example.app.adapter.persistence.repository.UserJpaRepository;
import org.springframework.stereotype.Component;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class UserRepositoryAdapter implements UserPersistencePort {

    private final UserJpaRepository jpaRepository;

    public UserRepositoryAdapter(UserJpaRepository jpaRepository) {
        this.jpaRepository = jpaRepository;
    }

    @Override
    public List<User> loadAllUsers() {
        return jpaRepository.findAll().stream()
            .map(e -> new User(e.getId(), e.getName()))
            .collect(Collectors.toList());
    }

    @Override
    public User saveUser(User user) {
        UserEntity entity = new UserEntity();
        entity.setName(user.getName());
        UserEntity saved = jpaRepository.save(entity);
        return new User(saved.getId(), saved.getName());
    }
}

// ===== Persistence Entities & Repositories =====
// File: adapter/persistence/entity/UserEntity.java
package com.example.app.adapter.persistence.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;

    // getters and setters
}

// File: adapter/persistence/repository/UserJpaRepository.java
package com.example.app.adapter.persistence.repository;

import com.example.app.adapter.persistence.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserJpaRepository extends JpaRepository<UserEntity, Long> {
}
