**Helidon** is a set of **cloud-native Java libraries** for building microservices. It comes in two flavors:

1. **Helidon SE**: Low-level, functional, reactive style (like Vert.x).
2. **Helidon MP**: MicroProfile-based, more traditional, annotation-driven (like Spring or Jakarta EE).

Helidon is modular, and integrates many Java libraries across **Web**, **Security**, **Config**, **Metrics**, and **Cloud-Native tooling**.

---

## 🔧 1. **Core & Runtime Modules**

| Module                   | Description                                                    |
| ------------------------ | -------------------------------------------------------------- |
| `helidon-common`         | Shared utility classes across modules.                         |
| `helidon-config`         | Type-safe configuration API (from YAML, properties, env vars). |
| `helidon-service-loader` | SPI-based service loader helpers.                              |
| `helidon-inject`         | Lightweight DI framework for Helidon SE.                       |
| `helidon-builder`        | Compile-time metadata model for fluent API building.           |
| `helidon-start`          | CLI and code generator (starter projects).                     |

---

## 🌐 2. **Web Server & HTTP API**

### Helidon SE (Reactive Style):

| Module                             | Description                         |
| ---------------------------------- | ----------------------------------- |
| `helidon-webserver`                | Fully reactive HTTP server.         |
| `helidon-webserver-static-content` | Serve static files.                 |
| `helidon-webserver-json`           | JSON support via Jackson or JSON-B. |
| `helidon-webserver-access-log`     | Access log support for HTTP server. |
| `helidon-webserver-cors`           | CORS support.                       |
| `helidon-webserver-graphql`        | GraphQL server support.             |
| `helidon-webserver-observe`        | Observability endpoints.            |

### Helidon MP (MicroProfile Style):

| Module                             | Description                                 |
| ---------------------------------- | ------------------------------------------- |
| `helidon-microprofile-server`      | MicroProfile-compliant server engine.       |
| `helidon-microprofile-openapi`     | OpenAPI integration.                        |
| `helidon-microprofile-rest-client` | Type-safe REST clients (JAX-RS client API). |
| `helidon-microprofile-jsonb`       | JSON-B serialization.                       |

---

## 🧵 3. **Reactive & Messaging**

| Module                               | Description                                       |
| ------------------------------------ | ------------------------------------------------- |
| `helidon-reactive-webclient`         | Reactive HTTP client.                             |
| `helidon-messaging`                  | Messaging API with connectors (Kafka, JMS, etc.). |
| `helidon-messaging-kafka`            | Kafka support via reactive messaging.             |
| `helidon-reactive-streams-operators` | Integration with Reactive Streams and publishers. |

---

## 🗃️ 4. **Data Access (SQL, NoSQL)**

Helidon doesn’t have its own ORM/DB layer but allows integration with:

| Integration                 | Description                                        |
| --------------------------- | -------------------------------------------------- |
| JDBC (via Helidon SE or MP) | Use HikariCP, JPA, or plain JDBC directly.         |
| Hibernate / JPA             | Supported in Helidon MP via JPA extension.         |
| MongoDB                     | Use any Java MongoDB client (no built-in module).  |
| Redis                       | Use third-party Java Redis client (e.g., Lettuce). |

For persistence, **Helidon relies on standard Java clients**, and doesn’t bundle something like Spring Data or Micronaut Data.

---

## 🔐 5. **Security & Identity**

| Module                                   | Description                                               |
| ---------------------------------------- | --------------------------------------------------------- |
| `helidon-security`                       | Core security framework (authentication + authorization). |
| `helidon-security-providers-http-auth`   | Basic and digest authentication.                          |
| `helidon-security-providers-jwt`         | JWT bearer token authentication.                          |
| `helidon-security-providers-oidc`        | OpenID Connect integration.                               |
| `helidon-security-providers-abac`        | Attribute-based access control.                           |
| `helidon-security-integration-webserver` | WebServer security filters.                               |
| `helidon-security-integration-mp`        | Security integration with JAX-RS in Helidon MP.           |

---

## ☁️ 6. **Cloud Native & Observability**

| Module                               | Description                                |
| ------------------------------------ | ------------------------------------------ |
| `helidon-microprofile-health`        | Liveness and readiness probes.             |
| `helidon-microprofile-metrics`       | Metrics and Micrometer support.            |
| `helidon-observability`              | Tracing, logging, metrics in Helidon SE.   |
| `helidon-tracing`                    | Jaeger, Zipkin, and OpenTelemetry support. |
| `helidon-integrations-prometheus`    | Prometheus metrics exporter.               |
| `helidon-integrations-opentracing`   | OpenTracing support.                       |
| `helidon-integrations-opentelemetry` | OpenTelemetry SDK integration.             |

---

## ⚙️ 7. **Configuration & Secrets**

| Module                            | Description                                     |
| --------------------------------- | ----------------------------------------------- |
| `helidon-config`                  | Config from files, env vars, system props, etc. |
| `helidon-config-hocon`            | HOCON format support.                           |
| `helidon-integrations-vault`      | HashiCorp Vault integration.                    |
| `helidon-integrations-kubernetes` | Config from Kubernetes config maps/secrets.     |

---

## 📜 8. **GraphQL**

| Module                         | Description                                             |
| ------------------------------ | ------------------------------------------------------- |
| `helidon-graphql`              | GraphQL API support based on graphql-java.              |
| `helidon-webserver-graphql`    | GraphQL over WebServer in Helidon SE.                   |
| `helidon-microprofile-graphql` | GraphQL support via MicroProfile GraphQL in Helidon MP. |

---

## 📊 9. **OpenAPI & Documentation**

| Module                         | Description                              |
| ------------------------------ | ---------------------------------------- |
| `helidon-openapi`              | OpenAPI generation for Helidon SE.       |
| `helidon-microprofile-openapi` | OpenAPI auto-generation via annotations. |
| `helidon-swagger-ui`           | Optional Swagger UI integration.         |

---

## 🧪 10. **Testing**

| Module                         | Description                                |
| ------------------------------ | ------------------------------------------ |
| `helidon-testing-junit5`       | JUnit 5 testing support (Helidon SE & MP). |
| `helidon-testing-integration`  | Helpers for integration testing.           |
| `helidon-microprofile-testing` | Testing support in Helidon MP.             |

---

## 🧰 11. **Developer Tools**

| Tool                 | Description                                         |
| -------------------- | --------------------------------------------------- |
| `helidon-cli`        | CLI to generate and manage Helidon projects.        |
| `helidon-archetypes` | Maven archetypes for project scaffolding.           |
| `helidon-launcher`   | Web project generator similar to Spring Initializr. |

---

## ✅ Summary by Category

| Category                 | Modules                                                       |
| ------------------------ | ------------------------------------------------------------- |
| **Core & Runtime**       | `helidon-core`, `helidon-common`, `helidon-config`            |
| **Web / HTTP**           | `helidon-webserver`, `microprofile-server`, `graphql`, `cors` |
| **Reactive / Messaging** | `reactive-webclient`, `messaging`, `kafka`                    |
| **Persistence**          | External libs: JDBC, JPA, MongoDB                             |
| **Security**             | `helidon-security`, `jwt`, `oidc`, `abac`                     |
| **Observability**        | `metrics`, `tracing`, `opentelemetry`, `health`               |
| **Config & Secrets**     | `config`, `vault`, `k8s`, `hocon`                             |
| **GraphQL**              | `graphql`, `webserver-graphql`, `mp-graphql`                  |
| **OpenAPI & Docs**       | `openapi`, `swagger-ui`, `mp-openapi`                         |
| **Testing**              | `testing-junit5`, `mp-testing`                                |
| **Dev Tools**            | `helidon-cli`, `archetypes`, `launcher`                       |

---

## 📌 Helidon SE vs MP

| Feature      | Helidon SE                          | Helidon MP                                      |
| ------------ | ----------------------------------- | ----------------------------------------------- |
| Programming  | Functional/Reactive (like Vert.x)   | Annotation-driven (like Spring, Jakarta EE)     |
| API Style    | Java API                            | MicroProfile APIs                               |
| Use Case     | Fine-grained control, reactive apps | Enterprise-style with faster onboarding         |
| DI Framework | Helidon Inject                      | CDI (Jakarta Contexts and Dependency Injection) |

---

Would you like a **starter project template**, a **comparison between Helidon vs Micronaut vs Quarkus**, or a **deployment diagram**?

Let me know!
