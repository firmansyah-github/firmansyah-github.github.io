Here's the Java file structure for a **Clean Architecture** Spring Boot application:

### Package Structure
```
src/main/java/
└── com/
    └── example/
        └── clean/
            ├── domain/
            │   ├── model/
            │   │   └── User.java
            │   ├── repository/
            │   │   └── UserRepository.java
            │   └── service/
            │       └── UserValidationService.java
            ├── application/
            │   ├── dto/
            │   │   ├── UserInputDto.java
            │   │   └── UserOutputDto.java
            │   ├── service/
            │   │   └── UserService.java
            │   └── usecase/
            │       ├── CreateUserUseCase.java
            │       └── GetUserUseCase.java
            ├── infrastructure/
            │   ├── controllers/
            │   │   └── UserController.java
            │   ├── persistence/
            │   │   ├── adapter/
            │   │   │   └── UserRepositoryAdapter.java
            │   │   ├── entity/
            │   │   │   └── UserEntity.java
            │   │   └── repository/
            │   │       └── UserJpaRepository.java
            │   └── config/
            │       └── MapperConfig.java
            └── CleanApplication.java
```

### Java File Contents

1. **Main Application Class**
```java
// CleanApplication.java
package com.example.clean;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CleanApplication {
    public static void main(String[] args) {
        SpringApplication.run(CleanApplication.class, args);
    }
}
```

2. **Domain Layer (Core Business Rules)**
```java
// User.java
package com.example.clean.domain.model;

import java.util.UUID;

public class User {
    private UUID id;
    private String username;
    private String email;
    
    public User(UUID id, String username, String email) {
        this.id = id;
        this.username = username;
        this.email = email;
    }
    
    // Getters only - immutable domain object
    public UUID getId() { return id; }
    public String getUsername() { return username; }
    public String getEmail() { return email; }
}
```

```java
// UserRepository.java
package com.example.clean.domain.repository;

import com.example.clean.domain.model.User;
import java.util.Optional;
import java.util.UUID;

public interface UserRepository {
    User save(User user);
    Optional<User> findById(UUID id);
}
```

```java
// UserValidationService.java
package com.example.clean.domain.service;

import com.example.clean.domain.model.User;

public interface UserValidationService {
    boolean isValid(User user);
}
```

3. **Application Layer (Use Cases & Business Logic)**
```java
// UserInputDto.java
package com.example.clean.application.dto;

public record UserInputDto(String username, String email) {}
```

```java
// UserOutputDto.java
package com.example.clean.application.dto;

import java.util.UUID;

public record UserOutputDto(UUID id, String username, String email) {}
```

```java
// CreateUserUseCase.java
package com.example.clean.application.usecase;

import com.example.clean.application.dto.UserInputDto;
import com.example.clean.application.dto.UserOutputDto;

public interface CreateUserUseCase {
    UserOutputDto createUser(UserInputDto input);
}
```

```java
// GetUserUseCase.java
package com.example.clean.application.usecase;

import com.example.clean.application.dto.UserOutputDto;
import java.util.UUID;

public interface GetUserUseCase {
    UserOutputDto getUser(UUID id);
}
```

```java
// UserService.java
package com.example.clean.application.service;

import com.example.clean.application.usecase.CreateUserUseCase;
import com.example.clean.application.usecase.GetUserUseCase;
import com.example.clean.application.dto.UserInputDto;
import com.example.clean.application.dto.UserOutputDto;
import com.example.clean.domain.model.User;
import com.example.clean.domain.repository.UserRepository;
import com.example.clean.domain.service.UserValidationService;
import org.springframework.stereotype.Service;
import java.util.UUID;

@Service
public class UserService implements CreateUserUseCase, GetUserUseCase {

    private final UserRepository userRepository;
    private final UserValidationService validationService;

    public UserService(
        UserRepository userRepository, 
        UserValidationService validationService
    ) {
        this.userRepository = userRepository;
        this.validationService = validationService;
    }

    @Override
    public UserOutputDto createUser(UserInputDto input) {
        User user = new User(UUID.randomUUID(), input.username(), input.email());
        if (!validationService.isValid(user)) {
            throw new IllegalArgumentException("Invalid user data");
        }
        User saved = userRepository.save(user);
        return toOutputDto(saved);
    }

    @Override
    public UserOutputDto getUser(UUID id) {
        return userRepository.findById(id)
                .map(this::toOutputDto)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }

    private UserOutputDto toOutputDto(User user) {
        return new UserOutputDto(user.getId(), user.getUsername(), user.getEmail());
    }
}
```

4. **Infrastructure Layer (External Implementations)**
```java
// UserController.java
package com.example.clean.infrastructure.controllers;

import com.example.clean.application.dto.UserInputDto;
import com.example.clean.application.dto.UserOutputDto;
import com.example.clean.application.usecase.CreateUserUseCase;
import com.example.clean.application.usecase.GetUserUseCase;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.UUID;

@RestController
@RequestMapping("/api/users")
public class UserController {

    private final CreateUserUseCase createUserUseCase;
    private final GetUserUseCase getUserUseCase;

    public UserController(
        CreateUserUseCase createUserUseCase,
        GetUserUseCase getUserUseCase
    ) {
        this.createUserUseCase = createUserUseCase;
        this.getUserUseCase = getUserUseCase;
    }

    @PostMapping
    public ResponseEntity<UserOutputDto> createUser(@RequestBody UserInputDto input) {
        return ResponseEntity.ok(createUserUseCase.createUser(input));
    }

    @GetMapping("/{id}")
    public ResponseEntity<UserOutputDto> getUser(@PathVariable UUID id) {
        return ResponseEntity.ok(getUserUseCase.getUser(id));
    }
}
```

```java
// UserEntity.java
package com.example.clean.infrastructure.persistence.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import java.util.UUID;

@Entity
public class UserEntity {
    @Id
    private UUID id;
    private String username;
    private String email;

    // Required by JPA
    public UserEntity() {}

    public UserEntity(UUID id, String username, String email) {
        this.id = id;
        this.username = username;
        this.email = email;
    }

    // Getters
    public UUID getId() { return id; }
    public String getUsername() { return username; }
    public String getEmail() { return email; }
}
```

```java
// UserJpaRepository.java
package com.example.clean.infrastructure.persistence.repository;

import com.example.clean.infrastructure.persistence.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.UUID;

@Repository
public interface UserJpaRepository extends JpaRepository<UserEntity, UUID> {}
```

```java
// UserRepositoryAdapter.java
package com.example.clean.infrastructure.persistence.adapter;

import com.example.clean.domain.model.User;
import com.example.clean.domain.repository.UserRepository;
import com.example.clean.infrastructure.persistence.entity.UserEntity;
import com.example.clean.infrastructure.persistence.repository.UserJpaRepository;
import org.springframework.stereotype.Component;
import java.util.Optional;
import java.util.UUID;

@Component
public class UserRepositoryAdapter implements UserRepository {

    private final UserJpaRepository jpaRepository;
    private final EntityMapper mapper;

    public UserRepositoryAdapter(
        UserJpaRepository jpaRepository,
        EntityMapper mapper
    ) {
        this.jpaRepository = jpaRepository;
        this.mapper = mapper;
    }

    @Override
    public User save(User user) {
        UserEntity entity = mapper.toEntity(user);
        UserEntity saved = jpaRepository.save(entity);
        return mapper.toDomain(saved);
    }

    @Override
    public Optional<User> findById(UUID id) {
        return jpaRepository.findById(id)
                .map(mapper::toDomain);
    }
}
```

```java
// UserValidationServiceImpl.java
package com.example.clean.infrastructure.service;

import com.example.clean.domain.model.User;
import com.example.clean.domain.service.UserValidationService;
import org.springframework.stereotype.Service;

@Service
public class UserValidationServiceImpl implements UserValidationService {
    @Override
    public boolean isValid(User user) {
        return user.getEmail() != null && user.getEmail().contains("@");
    }
}
```

```java
// MapperConfig.java
package com.example.clean.infrastructure.config;

import com.example.clean.domain.model.User;
import com.example.clean.infrastructure.persistence.entity.UserEntity;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MapperConfig {
    
    @Bean
    public EntityMapper entityMapper() {
        return new EntityMapper();
    }
    
    public static class EntityMapper {
        public UserEntity toEntity(User domain) {
            return new UserEntity(
                domain.getId(), 
                domain.getUsername(), 
                domain.getEmail()
            );
        }
        
        public User toDomain(UserEntity entity) {
            return new User(
                entity.getId(), 
                entity.getUsername(), 
                entity.getEmail()
            );
        }
    }
}
```

### Key Features of Clean Architecture:

1. **Dependency Rule**:
   - Inner layers (domain) have no dependencies on outer layers
   - Dependencies flow inward: Infrastructure → Application → Domain

2. **Layer Responsibilities**:
   - **Domain**: Enterprise business rules (entities, validation)
   - **Application**: Use cases, application-specific business rules
   - **Infrastructure**: Technical implementations (web, persistence)

3. **Decoupling Mechanisms**:
   - Interfaces in domain layer (ports)
   - Adapters in infrastructure layer (implement ports)
   - Dependency inversion principle (DIP) in action

4. **Testability**:
   - Domain and application layers can be tested without infrastructure
   - Mock implementations of interfaces for unit testing
   - Core business logic is framework-agnostic

5. **Maintainability**:
   - Clear boundaries between business rules and technical details
   - Easier to change frameworks (e.g., switch from JPA to NoSQL)
   - Independent evolution of layers

6. **Key Components**:
   - **Entities**: Core business objects (domain)
   - **Use Cases**: Application-specific workflows
   - **Controllers**: Handle I/O (infrastructure)
   - **Gateways**: Interface implementations (infrastructure)
   - **DTOs**: Data transfer objects between layers

This structure ensures that business rules remain at the core of the application, independent of frameworks, databases, or UI concerns. The application's business logic is completely decoupled from technical implementation details.