Quarkus is a **Kubernetes-native Java framework** tailored for **GraalVM**, **cloud-native**, and **container-first** applications. It’s built on top of **popular Java standards and libraries**, optimized for fast startup, low memory usage, and reactive/microservice workloads.

Below is a complete breakdown of **Quarkus libraries** (extensions), **grouped by category**, with Java integration details.

---

## 🔧 1. **Core & Runtime**

| Extension                                   | Description                                                                 |
| ------------------------------------------- | --------------------------------------------------------------------------- |
| `quarkus-core`                              | Core runtime and injection framework, built on top of **Arc (CDI)**.        |
| `quarkus-arc`                               | CDI implementation used in Quarkus (like Spring DI).                        |
| `quarkus-config-yaml` / `config-properties` | Externalized configuration from `application.yaml` or `.properties`.        |
| `quarkus-bootstrap`                         | Bootstrapping logic for dev/runtime mode.                                   |
| `quarkus-launcher`                          | Starts your app inside Quarkus dev mode.                                    |
| `quarkus-logging`                           | SLF4J/Logback/Console support for structured, JSON, and file-based logging. |

---

## 🌐 2. **Web / REST / Reactive**

| Extension                               | Description                             |
| --------------------------------------- | --------------------------------------- |
| `quarkus-resteasy` / `resteasy-jackson` | Traditional JAX-RS (REST endpoints).    |
| `quarkus-resteasy-reactive`             | Reactive JAX-RS with lower overhead.    |
| `quarkus-reactive-routes`               | Functional routing like Express/Vert.x. |
| `quarkus-undertow`                      | Servlet support (if needed).            |
| `quarkus-vertx`                         | Full Vert.x support in Quarkus.         |
| `quarkus-websockets`                    | WebSocket server (based on Vert.x).     |
| `quarkus-sse`                           | Server-Sent Events support.             |
| `quarkus-graphql`                       | GraphQL support (via SmallRye GraphQL). |

---

## 🗃️ 3. **Data & ORM**

| Extension                                     | Description                                 |
| --------------------------------------------- | ------------------------------------------- |
| `quarkus-hibernate-orm`                       | Traditional Hibernate ORM + Panache API.    |
| `quarkus-hibernate-reactive`                  | Non-blocking ORM (ideal for reactive apps). |
| `quarkus-panache`                             | ActiveRecord-style ORM abstraction.         |
| `quarkus-jdbc-postgresql` / `mysql` / `mssql` | JDBC drivers for various databases.         |
| `quarkus-reactive-pg-client` / `mysql`        | Reactive SQL client (Vert.x based).         |
| `quarkus-flyway` / `liquibase`                | DB migration support.                       |
| `quarkus-mongodb-client`                      | MongoDB sync/async support.                 |
| `quarkus-mongodb-panache`                     | MongoDB with Panache-style access.          |
| `quarkus-redis-client`                        | Redis key/value client (non-blocking).      |

---

## 🧵 4. **Reactive & Messaging**

| Extension                             | Description                                           |
| ------------------------------------- | ----------------------------------------------------- |
| `quarkus-reactive-core`               | Reactive streams and APIs via Mutiny.                 |
| `quarkus-smallrye-reactive-messaging` | Message-driven microservices using Kafka, AMQP, MQTT. |
| `quarkus-kafka-client`                | Kafka producer/consumer (based on Apache Kafka).      |
| `quarkus-rabbitmq-client`             | AMQP 0.9 RabbitMQ integration.                        |
| `quarkus-stomp`                       | STOMP messaging (community extension).                |
| `quarkus-vertx`                       | Access to Vert.x event loop, streams, etc.            |

---

## 🔐 5. **Security & Identity**

| Extension                      | Description                                    |
| ------------------------------ | ---------------------------------------------- |
| `quarkus-oidc`                 | OpenID Connect client & bearer token auth.     |
| `quarkus-security`             | Identity provider abstraction.                 |
| `quarkus-jwt`                  | JWT token auth using MicroProfile JWT.         |
| `quarkus-basic-auth`           | HTTP Basic authentication.                     |
| `quarkus-elytron-security`     | Security framework integration (from WildFly). |
| `quarkus-credentials-provider` | Secrets from Vault, Kubernetes, etc.           |

---

## ⚙️ 6. **Configuration & Secrets**

| Extension                   | Description                              |
| --------------------------- | ---------------------------------------- |
| `quarkus-config-yaml`       | YAML config format support.              |
| `quarkus-config-consul`     | Pull configuration from Consul KV store. |
| `quarkus-config-vault`      | Secure secrets from HashiCorp Vault.     |
| `quarkus-kubernetes-config` | Use Kubernetes ConfigMaps or Secrets.    |

---

## ☁️ 7. **Cloud & Kubernetes Native**

| Extension                          | Description                                  |
| ---------------------------------- | -------------------------------------------- |
| `quarkus-kubernetes` / `openshift` | Generate manifests, native deployment YAMLs. |
| `quarkus-openshift-client`         | Access to OpenShift API via Fabric8.         |
| `quarkus-container-image-docker`   | Build container images using Docker or Jib.  |
| `quarkus-helm`                     | Helm chart generation.                       |
| `quarkus-k8s-client`               | Kubernetes Java client (Fabric8-based).      |

---

## 🧪 8. **Testing**

| Extension                | Description                                    |
| ------------------------ | ---------------------------------------------- |
| `quarkus-junit5`         | JUnit 5 test integration with Quarkus runtime. |
| `quarkus-test-h2`        | In-memory DB for testing.                      |
| `quarkus-test-security`  | Mock security context in tests.                |
| `quarkus-test-container` | Testcontainers integration.                    |
| `quarkus-mockk`          | Kotlin mocking integration.                    |

---

## 🕵️ 9. **Observability & Logging**

| Extension                          | Description                                     |
| ---------------------------------- | ----------------------------------------------- |
| `quarkus-logging-json`             | Structured JSON logging.                        |
| `quarkus-logging-gelf`             | Graylog-compatible log output.                  |
| `quarkus-micrometer`               | Metrics integration (Prometheus, Datadog, etc). |
| `quarkus-opentelemetry`            | Tracing integration (OTel, Jaeger).             |
| `quarkus-health`                   | Health checks (Liveness, Readiness).            |
| `quarkus-smallrye-fault-tolerance` | Circuit breaker (based on MicroProfile FT).     |

---

## 🧰 10. **Utilities & Misc**

| Extension                        | Description                                       |
| -------------------------------- | ------------------------------------------------- |
| `quarkus-scheduler`              | Cron/interval-style background jobs.              |
| `quarkus-mailer`                 | Send emails via SMTP (asynchronously).            |
| `quarkus-qute`                   | Templating engine like Thymeleaf/Freemarker.      |
| `quarkus-camel`                  | Apache Camel integration.                         |
| `quarkus-picocli`                | CLI support via [picocli](https://picocli.info/). |
| `quarkus-rest-client`            | Type-safe REST clients.                           |
| `quarkus-openapi` / `swagger-ui` | OpenAPI 3 and Swagger UI generation.              |

---

## 🧑‍💻 11. **Developer Tools**

| Extension                                | Description                        |
| ---------------------------------------- | ---------------------------------- |
| `quarkus-devtools`                       | Hot reload, `quarkus dev` support. |
| `quarkus-maven-plugin` / `gradle-plugin` | Build and manage Quarkus apps.     |
| `quarkus-ide-support`                    | LSP support, VSCode tooling.       |

---

## ✅ Summary by Category

| Category               | Key Extensions                                       |
| ---------------------- | ---------------------------------------------------- |
| **Core**               | `core`, `arc`, `bootstrap`                           |
| **Web/REST**           | `resteasy`, `reactive`, `graphql`, `websockets`      |
| **Database/ORM**       | `hibernate`, `panache`, `reactive`, `mongo`, `redis` |
| **Reactive/Messaging** | `reactive-core`, `kafka`, `rabbitmq`, `vertx`        |
| **Security**           | `oidc`, `jwt`, `basic-auth`                          |
| **Cloud/Kubernetes**   | `kubernetes`, `helm`, `vault`, `config-consul`       |
| **Monitoring**         | `micrometer`, `otel`, `health`, `fault-tolerance`    |
| **Testing**            | `junit5`, `test-container`, `mockk`                  |
| **Utilities**          | `scheduler`, `mailer`, `qute`, `camel`               |
| **Dev Tools**          | `devtools`, `maven-plugin`, `gradle-plugin`          |

---

If you're interested, I can:

* Show a **starter `pom.xml` or `build.gradle`** for a specific setup (e.g., REST + JWT + PostgreSQL),
* Or create a **diagram** of the Quarkus architecture/modules.

Would you like that?
