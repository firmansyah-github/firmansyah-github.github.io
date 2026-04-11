Below are **tree views of package layouts** for each of the **13 Spring Boot architectures**. Each structure shows folders (packages) and representative Java class types only — no implementation code.

---

### 1. **Layered Architecture (N-Tier / MVC)**

```
com.example.app
├── controller
│   └── UserController.java
├── service
│   └── UserService.java
├── repository
│   └── UserRepository.java
├── model
│   └── User.java
├── dto
│   └── UserDto.java
├── config
│   └── WebConfig.java
└── Application.java
```

---

### 2. **Hexagonal Architecture (Ports and Adapters)**

```
com.example.app
├── domain
│   ├── model
│   └── service
├── application
│   ├── port
│   │   ├── in
│   │   └── out
│   └── usecase
├── adapter
│   ├── web
│   │   └── UserController.java
│   └── persistence
│       └── UserRepositoryAdapter.java
├── config
└── Application.java
```

---

### 3. **Modular Monolith**

```
com.example.app
├── module
│   ├── user
│   │   ├── controller
│   │   ├── service
│   │   ├── repository
│   │   └── model
│   ├── product
│   │   ├── controller
│   │   ├── service
│   │   ├── repository
│   │   └── model
├── common
│   └── util
└── Application.java
```

---

### 4. **Microservices Architecture**

(Each service is its own Spring Boot application)

```
user-service
└── com.example.user
    ├── controller
    ├── service
    ├── repository
    ├── model
    └── Application.java

product-service
└── com.example.product
    ├── controller
    ├── service
    ├── repository
    ├── model
    └── Application.java
```

---

### 5. **Feature-Based Architecture**

```
com.example.app
├── user
│   ├── UserController.java
│   ├── UserService.java
│   ├── UserRepository.java
│   ├── User.java
│   └── UserDto.java
├── product
│   ├── ProductController.java
│   ├── ProductService.java
│   ├── ProductRepository.java
│   ├── Product.java
│   └── ProductDto.java
└── Application.java
```

---

### 6. **Plugin-Based Architecture**

```
com.example.app
├── core
│   ├── PluginManager.java
│   └── CommonService.java
├── plugins
│   ├── pluginA
│   │   ├── PluginAController.java
│   │   └── PluginAService.java
│   ├── pluginB
│   │   ├── PluginBController.java
│   │   └── PluginBService.java
└── Application.java
```

---

### 7. **Event-Driven Architecture**

```
com.example.app
├── controller
├── service
├── event
│   ├── UserCreatedEvent.java
│   └── OrderCompletedEvent.java
├── listener
│   └── EventListener.java
├── publisher
│   └── EventPublisher.java
└── Application.java
```

---

### 8. **CQRS + Event Sourcing**

```
com.example.app
├── command
│   ├── handler
│   └── model
├── query
│   ├── handler
│   └── model
├── event
│   ├── store
│   └── publisher
├── controller
└── Application.java
```

---

### 9. **Serverless / Function-Based**

(Using Spring Cloud Function or AWS Lambda style)

```
com.example.app
├── function
│   ├── UserCreateFunction.java
│   └── ProductProcessFunction.java
├── model
└── Application.java
```

---

### 10. **Clean Architecture**

```
com.example.app
├── domain
│   ├── model
│   └── service
├── application
│   └── usecase
├── interfaceadapter
│   ├── controller
│   └── repositoryadapter
├── infrastructure
│   ├── db
│   └── config
└── Application.java
```

---

### 11. **Onion Architecture**

```
com.example.app
├── domain
│   └── entity
├── application
│   ├── service
│   └── interface
├── infrastructure
│   ├── controller
│   └── repository
└── Application.java
```

---

### 12. **DDD (Domain-Driven Design)**

```
com.example.app
├── domain
│   ├── model
│   ├── service
│   └── event
├── application
│   ├── service
│   └── command
├── infrastructure
│   ├── controller
│   └── persistence
└── Application.java
```

---

### 13. **Hybrid: Onion + DDD + Microservice**

```
order-service
└── com.example.order
    ├── domain
    │   ├── model
    │   └── service
    ├── application
    │   └── usecase
    ├── adapter
    │   ├── controller
    │   └── persistence
    └── Application.java
```

---

Let me know if you want these as a downloadable PDF or visualized in diagrams.
