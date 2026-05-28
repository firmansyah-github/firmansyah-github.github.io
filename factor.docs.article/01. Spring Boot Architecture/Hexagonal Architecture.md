Here's the Java file structure for a **Hexagonal Architecture** Spring Boot application:

### Package Structure
```
src/main/java/
└── com/
    └── example/
        └── hexagonal/
            ├── core/
            │   ├── domain/
            │   │   └── User.java
            │   ├── port/
            │   │   ├── input/
            │   │   │   └── UserServicePort.java
            │   │   └── output/
            │   │       └── UserRepositoryPort.java
            │   └── service/
            │       └── UserServiceImpl.java
            ├── adapter/
            │   ├── input/
            │   │   └── web/
            │   │       ├── UserController.java
            │   │       └── dto/
            │   │           ├── UserRequest.java
            │   │           └── UserResponse.java
            │   └── output/
            │       └── persistence/
            │           ├── UserPersistenceAdapter.java
            │           ├── entity/
            │           │   └── UserEntity.java
            │           └── repository/
            │               └── UserRepository.java
            ├── config/
            │   └── BeanConfig.java
            └── HexagonalApplication.java
```

### Java File Contents

1. **Main Application Class**
```java
// HexagonalApplication.java
package com.example.hexagonal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class HexagonalApplication {
    public static void main(String[] args) {
        SpringApplication.run(HexagonalApplication.class, args);
    }
}
```

2. **Domain Model (Core)**
```java
// User.java
package com.example.hexagonal.core.domain;

import java.util.UUID;

public class User {
    private UUID id;
    private String username;
    private String email;
    
    // Constructors
    public User() {}
    
    public User(String username, String email) {
        this.id = UUID.randomUUID();
        this.username = username;
        this.email = email;
    }
    
    // Getters and Setters
    public UUID getId() { return id; }
    public String getUsername() { return username; }
    public String getEmail() { return email; }
}
```

3. **Port Interfaces (Core)**
```java
// UserServicePort.java
package com.example.hexagonal.core.port.input;

import com.example.hexagonal.core.domain.User;
import java.util.List;
import java.util.UUID;

public interface UserServicePort {
    User createUser(User user);
    User getUserById(UUID id);
    List<User> getAllUsers();
}
```

```java
// UserRepositoryPort.java
package com.example.hexagonal.core.port.output;

import com.example.hexagonal.core.domain.User;
import java.util.List;
import java.util.UUID;

public interface UserRepositoryPort {
    User save(User user);
    User findById(UUID id);
    List<User> findAll();
}
```

4. **Core Service Implementation**
```java
// UserServiceImpl.java
package com.example.hexagonal.core.service;

import com.example.hexagonal.core.domain.User;
import com.example.hexagonal.core.port.input.UserServicePort;
import com.example.hexagonal.core.port.output.UserRepositoryPort;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserServicePort {

    private final UserRepositoryPort userRepositoryPort;

    public UserServiceImpl(UserRepositoryPort userRepositoryPort) {
        this.userRepositoryPort = userRepositoryPort;
    }

    @Override
    public User createUser(User user) {
        return userRepositoryPort.save(user);
    }

    @Override
    public User getUserById(UUID id) {
        return userRepositoryPort.findById(id);
    }

    @Override
    public List<User> getAllUsers() {
        return userRepositoryPort.findAll();
    }
}
```

5. **Input Adapter (REST Controller)**
```java
// UserController.java
package com.example.hexagonal.adapter.input.web;

import com.example.hexagonal.adapter.input.web.dto.UserRequest;
import com.example.hexagonal.adapter.input.web.dto.UserResponse;
import com.example.hexagonal.core.domain.User;
import com.example.hexagonal.core.port.input.UserServicePort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/users")
public class UserController {

    private final UserServicePort userServicePort;

    public UserController(UserServicePort userServicePort) {
        this.userServicePort = userServicePort;
    }

    @PostMapping
    public ResponseEntity<UserResponse> createUser(@RequestBody UserRequest request) {
        User user = new User(request.getUsername(), request.getEmail());
        User created = userServicePort.createUser(user);
        return ResponseEntity.ok(toResponse(created));
    }

    @GetMapping("/{id}")
    public ResponseEntity<UserResponse> getUserById(@PathVariable UUID id) {
        User user = userServicePort.getUserById(id);
        return ResponseEntity.ok(toResponse(user));
    }

    @GetMapping
    public ResponseEntity<List<UserResponse>> getAllUsers() {
        List<UserResponse> users = userServicePort.getAllUsers().stream()
                .map(this::toResponse)
                .collect(Collectors.toList());
        return ResponseEntity.ok(users);
    }

    private UserResponse toResponse(User user) {
        return new UserResponse(user.getId(), user.getUsername(), user.getEmail());
    }
}
```

6. **Input Adapter DTOs**
```java
// UserRequest.java
package com.example.hexagonal.adapter.input.web.dto;

import lombok.Data;

@Data
public class UserRequest {
    private String username;
    private String email;
}
```

```java
// UserResponse.java
package com.example.hexagonal.adapter.input.web.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.UUID;

@Data
@AllArgsConstructor
public class UserResponse {
    private UUID id;
    private String username;
    private String email;
}
```

7. **Output Adapter (Persistence)**
```java
// UserPersistenceAdapter.java
package com.example.hexagonal.adapter.output.persistence;

import com.example.hexagonal.core.domain.User;
import com.example.hexagonal.core.port.output.UserRepositoryPort;
import org.springframework.stereotype.Component;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Component
public class UserPersistenceAdapter implements UserRepositoryPort {

    private final UserRepository userRepository;
    
    public UserPersistenceAdapter(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User save(User user) {
        UserEntity entity = toEntity(user);
        UserEntity saved = userRepository.save(entity);
        return toDomain(saved);
    }

    @Override
    public User findById(UUID id) {
        Optional<UserEntity> entity = userRepository.findById(id);
        return entity.map(this::toDomain).orElse(null);
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll().stream()
                .map(this::toDomain)
                .collect(Collectors.toList());
    }

    private UserEntity toEntity(User user) {
        return new UserEntity(user.getId(), user.getUsername(), user.getEmail());
    }

    private User toDomain(UserEntity entity) {
        return new User(entity.getId(), entity.getUsername(), entity.getEmail());
    }
}
```

8. **Persistence Entity and Repository**
```java
// UserEntity.java
package com.example.hexagonal.adapter.output.persistence.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

import java.util.UUID;

@Entity
@Data
public class UserEntity {
    @Id
    private UUID id;
    private String username;
    private String email;
    
    public UserEntity() {}
    
    public UserEntity(UUID id, String username, String email) {
        this.id = id;
        this.username = username;
        this.email = email;
    }
}
```

```java
// UserRepository.java
package com.example.hexagonal.adapter.output.persistence.repository;

import com.example.hexagonal.adapter.output.persistence.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, UUID> {
}
```

9. **Configuration**
```java
// BeanConfig.java
package com.example.hexagonal.config;

import org.springframework.context.annotation.Configuration;

@Configuration
public class BeanConfig {
    // Additional beans can be defined here if needed
}
```

### Key Features of Hexagonal Architecture:
1. **Core Domain Isolation**:
   - Domain model and business rules in `core.domain`
   - Technology-agnostic ports in `core.port`

2. **Ports & Adapters**:
   - **Input Ports**: Define how external actors interact with the system (`UserServicePort`)
   - **Output Ports**: Define how the system interacts with external services (`UserRepositoryPort`)
   - **Adapters**: Implement ports for specific technologies (REST controllers, JPA repositories)

3. **Dependency Inversion**:
   - Core depends on abstractions (ports), not implementations
   - Adapters implement port interfaces
   - Dependency flow: Framework → Adapters → Core

4. **Technology Agnostic Core**:
   - Core domain doesn't reference any framework annotations
   - No Spring dependencies in domain model
   - Easy to swap implementations (e.g., switch from JPA to MongoDB)

5. **Adapter Responsibilities**:
   - Input adapters: Transform external requests to domain objects
   - Output adapters: Transform domain objects to persistence formats
   - Adapters contain all technology-specific code

6. **Benefits**:
   - Improved testability (core can be tested without infrastructure)
   - Framework independence
   - Clear separation of concerns
   - Easier technology migrations
   - Better alignment with business requirements

This structure ensures the core business logic remains pure and unaffected by technical implementation details, making the application more maintainable and adaptable to change.