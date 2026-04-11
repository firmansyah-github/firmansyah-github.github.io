Micronaut is a **modern, JVM-based, full-stack microservices framework** designed for building **modular, fast, and cloud-native applications** with **low memory usage**, **fast startup**, and **compile-time dependency injection (DI)**.

It is **natively designed for GraalVM, reactive programming**, and integrates with many libraries via modular extensions.

Below is a **complete list and categorization** of Java libraries/modules inside the **Micronaut framework**, grouped by purpose.

---

## 🔧 1. **Core Framework & Dependency Injection**

| Module/Lib          | Description                                                      |
| ------------------- | ---------------------------------------------------------------- |
| `micronaut-core`    | Core API: context, beans, AOP, DI, reflection-free architecture. |
| `micronaut-inject`  | Compile-time DI container (alternative to Spring’s runtime DI).  |
| `micronaut-aop`     | AOP support: proxies, interceptors, annotations.                 |
| `micronaut-context` | Application context, lifecycle, and configuration.               |
| `micronaut-runtime` | Runtime bootstrap and CLI entry point.                           |

---

## 🌐 2. **HTTP, REST, and Web**

| Module                        | Description                                          |
| ----------------------------- | ---------------------------------------------------- |
| `micronaut-http-server-netty` | Netty-based HTTP server (default).                   |
| `micronaut-http-client`       | Fully reactive, non-blocking HTTP client.            |
| `micronaut-router`            | Annotation-based routing (@Controller, @Get, etc.).  |
| `micronaut-http`              | Core HTTP abstractions (request, response, cookies). |
| `micronaut-http-validation`   | Bean validation integration for HTTP requests.       |
| `micronaut-views-*`           | View templating support: Thymeleaf, Freemarker, etc. |
| `micronaut-sse`               | Server-Sent Events support.                          |
| `micronaut-websocket`         | WebSocket server and client support.                 |

---

## 🗃️ 3. **Data Access (ORM, SQL, NoSQL)**

| Module                         | Description                                             |
| ------------------------------ | ------------------------------------------------------- |
| `micronaut-data`               | ORM framework built for compile-time queries and speed. |
| `micronaut-data-jdbc`          | JDBC integration for SQL databases.                     |
| `micronaut-data-jpa`           | JPA-compatible annotations for Hibernate-style ORM.     |
| `micronaut-data-hibernate-jpa` | Hibernate JPA support (with reactive option).           |
| `micronaut-data-r2dbc`         | Reactive database access using R2DBC.                   |
| `micronaut-data-mongodb`       | MongoDB (sync and reactive) using Micronaut Data.       |
| `micronaut-mongo-sync`         | Classic MongoDB sync driver.                            |
| `micronaut-redis-lettuce`      | Redis support using Lettuce client.                     |
| `micronaut-flyway`             | Flyway DB migration support.                            |
| `micronaut-liquibase`          | Liquibase migration support.                            |

---

## 🧵 4. **Reactive & Messaging**

| Module                          | Description                               |
| ------------------------------- | ----------------------------------------- |
| `micronaut-reactor`             | Project Reactor support.                  |
| `micronaut-rxjava2` / `rxjava3` | RxJava support (optional).                |
| `micronaut-mqtt`                | MQTT messaging protocol support.          |
| `micronaut-kafka`               | Apache Kafka support (producer/consumer). |
| `micronaut-rabbitmq`            | AMQP 0.9 RabbitMQ integration.            |
| `micronaut-nats`                | NATS messaging system support.            |
| `micronaut-stomp`               | STOMP protocol support (community).       |

---

## 🔐 5. **Security & Identity**

| Module                           | Description                                              |
| -------------------------------- | -------------------------------------------------------- |
| `micronaut-security`             | Core security features: JWT, Basic Auth, OAuth2, etc.    |
| `micronaut-jwt`                  | JWT token generation, parsing, verification.             |
| `micronaut-oauth2`               | OAuth2 client support (Google, Facebook, Keycloak, etc). |
| `micronaut-session`              | Session management (in-memory or Redis).                 |
| `micronaut-ldap`                 | LDAP authentication.                                     |
| `micronaut-security-annotations` | Custom role and policy annotations.                      |

---

## ☁️ 6. **Cloud & Kubernetes Integration**

| Module                       | Description                                          |
| ---------------------------- | ---------------------------------------------------- |
| `micronaut-discovery-client` | Common interface for service discovery.              |
| `micronaut-kubernetes`       | Kubernetes service discovery and config map support. |
| `micronaut-aws-*`            | AWS Lambda, DynamoDB, S3, Secrets Manager, etc.      |
| `micronaut-gcp-*`            | Google Cloud support: GCP Pub/Sub, Firestore, GCE.   |
| `micronaut-azure-*`          | Azure Functions, Key Vault, CosmosDB, etc.           |
| `micronaut-consul`           | Service discovery using HashiCorp Consul.            |
| `micronaut-etcd`             | Service discovery with etcd.                         |
| `micronaut-vault`            | Secrets and config from HashiCorp Vault.             |

---

## 🧪 7. **Testing**

| Module                        | Description                                            |
| ----------------------------- | ------------------------------------------------------ |
| `micronaut-test`              | Unit & integration test support with JUnit 5 or Spock. |
| `micronaut-test-junit5`       | JUnit 5 test integration.                              |
| `micronaut-test-spock`        | Spock framework support.                               |
| `micronaut-test-rest-assured` | REST Assured integration for testing HTTP APIs.        |
| `micronaut-test-resources`    | Testcontainers and ephemeral services.                 |

---

## ⚙️ 8. **Configuration, Events, and Lifecycle**

| Module                         | Description                                          |
| ------------------------------ | ---------------------------------------------------- |
| `micronaut-runtime`            | Lifecycle and event hooks.                           |
| `micronaut-configuration-yaml` | YAML-based config loader.                            |
| `micronaut-env`                | Environment-specific configuration loading.          |
| `micronaut-refresh`            | Dynamic configuration refresh from external sources. |
| `micronaut-bootstrap`          | Bootstrap property loading for cloud-native apps.    |

---

## 📊 9. **Monitoring, Logging, and Metrics**

| Module                            | Description                          |
| --------------------------------- | ------------------------------------ |
| `micronaut-logging`               | SLF4J/Logback/Log4j support.         |
| `micronaut-micrometer-core`       | Micrometer metrics core.             |
| `micronaut-micrometer-prometheus` | Prometheus exporter.                 |
| `micronaut-micrometer-graphite`   | Graphite support.                    |
| `micronaut-management`            | Health, metrics, and info endpoints. |
| `micronaut-opentelemetry`         | Tracing with OpenTelemetry.          |
| `micronaut-tracing-jaeger`        | Jaeger tracer.                       |

---

## 🎨 10. **GraphQL**

| Module                    | Description                          |
| ------------------------- | ------------------------------------ |
| `micronaut-graphql`       | GraphQL server using `graphql-java`. |
| `micronaut-graphql-tools` | Schema-first GraphQL development.    |

---

## 🛠️ 11. **Developer Tools**

| Module                                     | Description                            |
| ------------------------------------------ | -------------------------------------- |
| `micronaut-cli`                            | Micronaut CLI for project scaffolding. |
| `micronaut-gradle-plugin` / `maven-plugin` | Build and native image support.        |
| `micronaut-launch`                         | Web-based project generator.           |
| `micronaut-openapi`                        | OpenAPI and Swagger UI generator.      |
| `micronaut-docs`                           | API and user documentation tools.      |

---

## ✅ Summary by Category

| Category           | Example Modules                                        |
| ------------------ | ------------------------------------------------------ |
| Core/DI            | `core`, `inject`, `aop`, `context`                     |
| Web/HTTP           | `http-client`, `http-server-netty`, `sse`, `websocket` |
| Database/ORM       | `data-jdbc`, `data-jpa`, `mongo`, `r2dbc`              |
| Messaging/Reactive | `kafka`, `rabbitmq`, `mqtt`, `rxjava`, `reactor`       |
| Security           | `security`, `oauth2`, `jwt`, `ldap`                    |
| Cloud/K8s          | `aws`, `gcp`, `kubernetes`, `consul`, `vault`          |
| Config             | `configuration-yaml`, `bootstrap`, `refresh`           |
| Testing            | `test`, `test-junit5`, `testcontainers`                |
| Monitoring         | `micrometer`, `management`, `opentelemetry`            |
| GraphQL            | `graphql`, `graphql-tools`                             |
| Dev Tools          | `cli`, `openapi`, `gradle-plugin`, `launch`            |

---

Would you like:

* A **starter project** setup (Maven/Gradle)?
* A comparison between **Micronaut, Quarkus, and Spring Boot**?
* Or **visual diagram** of this framework?

Let me know how deep you'd like to go.
