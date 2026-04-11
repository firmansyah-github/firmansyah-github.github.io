**Jakarta EE** (formerly Java EE) is a **specification-based framework** for enterprise-grade Java applications. It defines a set of **APIs** and **interfaces**, not implementations. Each specification (API) has one or more implementations provided by application servers like:

* Eclipse GlassFish (reference implementation)
* WildFly (Red Hat)
* Payara
* Open Liberty (IBM)
* TomEE (Apache)

Below is a **comprehensive list of Jakarta EE specifications (Java libraries/modules)**, categorized by their purpose.

---

## 🔧 1. **Core & Dependency Injection (CDI)**

| Specification                               | API (Module)                 | Description                                           |
| ------------------------------------------- | ---------------------------- | ----------------------------------------------------- |
| **CDI** (Contexts and Dependency Injection) | `jakarta.enterprise.cdi-api` | Provides DI, scopes, events, interceptors, and more.  |
| **Common Annotations**                      | `jakarta.annotation-api`     | Core annotations like `@PostConstruct`, `@Resource`.  |
| **Interceptors**                            | `jakarta.interceptor-api`    | Method interceptors like AOP (`@AroundInvoke`).       |
| **EL** (Expression Language)                | `jakarta.el-api`             | Expression parsing (`${...}`), used in JSP, JSF, etc. |

---

## 🌐 2. **Web / REST / HTTP**

| Specification                | API (Module)            | Description                                            |
| ---------------------------- | ----------------------- | ------------------------------------------------------ |
| **Servlet**                  | `jakarta.servlet-api`   | Base API for HTTP request/response handling.           |
| **JSP** (JavaServer Pages)   | `jakarta.jsp-api`       | Templating for HTML via Java in `.jsp` files.          |
| **Faces (JSF)**              | `jakarta.faces-api`     | Component-based UI framework for server-rendered apps. |
| **REST (JAX-RS)**            | `jakarta.ws.rs-api`     | RESTful web services (with `@Path`, `@GET`, etc.).     |
| **WebSocket**                | `jakarta.websocket-api` | Real-time, full-duplex communication over TCP.         |
| **SSE** (Server-Sent Events) | Built into JAX-RS       | Reactive streaming via `@SseEventSink`.                |

---

## 🗃️ 3. **Persistence (ORM / SQL / NoSQL)**

| Specification                     | API (Module)              | Description                                                                    |
| --------------------------------- | ------------------------- | ------------------------------------------------------------------------------ |
| **JPA** (Jakarta Persistence API) | `jakarta.persistence-api` | ORM and entity mapping to relational databases.                                |
| **JDBC**                          | Part of Java SE           | Used via DataSource (`@Resource`) in Jakarta EE.                               |
| **JTA** (Jakarta Transactions)    | `jakarta.transaction-api` | Declarative and programmatic transaction control.                              |
| **Bean Validation**               | `jakarta.validation-api`  | `@NotNull`, `@Size`, etc., with validation providers like Hibernate Validator. |

---

## ✉️ 4. **Messaging & Event-Driven**

| Specification               | API (Module)               | Description                                             |
| --------------------------- | -------------------------- | ------------------------------------------------------- |
| **JMS** (Jakarta Messaging) | `jakarta.jms-api`          | Messaging with queues/topics (asynchronous, decoupled). |
| **CDI Events**              | `jakarta.enterprise.event` | Event-based programming within app.                     |
| **Batch**                   | `jakarta.batch-api`        | Batch job processing (CSV, database, etc.).             |

---

## 🔐 5. **Security & Authentication**

| Specification              | API (Module)                        | Description                                  |
| -------------------------- | ----------------------------------- | -------------------------------------------- |
| **Jakarta Security**       | `jakarta.security.enterprise-api`   | HTTP security, identity store, roles.        |
| **Jakarta Authentication** | `jakarta.security.auth.message-api` | Pluggable auth mechanisms (JASPIC).          |
| **Jakarta Authorization**  | `jakarta.authorization-api`         | Fine-grained access control (JSR-115).       |
| **Servlet Security**       | Built into Servlet API              | Declarative and programmatic security rules. |

---

## ☁️ 6. **Cloud Native / Config**

| Specification                  | API                    | Description                                                      |
| ------------------------------ | ---------------------- | ---------------------------------------------------------------- |
| **Jakarta Config** *(planned)* | N/A (Coming soon)      | Cloud-native configuration (similar to MicroProfile Config).     |
| **Jakarta REST Client**        | N/A in core Jakarta EE | Use **MicroProfile REST Client** for client-side REST if needed. |

---

## 📊 7. **Monitoring, Management & Logging**

| Specification                | API (Module)                  | Description                                               |
| ---------------------------- | ----------------------------- | --------------------------------------------------------- |
| **Jakarta Management (JMX)** | Java SE                       | Expose MBeans for monitoring.                             |
| **Jakarta Logging**          | Java SE (`java.util.logging`) | Used with `@Resource` and loggers in application servers. |

> 📝 Note: Jakarta EE doesn’t define metrics, tracing, or health checks — those are covered in **MicroProfile**.

---

## 📜 8. **GraphQL & OpenAPI**

Jakarta EE itself does **not** define GraphQL or OpenAPI standards.

For these:

* Use **Eclipse MicroProfile GraphQL** (`org.eclipse.microprofile.graphql`)
* Use **Eclipse MicroProfile OpenAPI** for Swagger/OpenAPI generation.

---

## 🧪 9. **Testing**

| Approach            | Tooling                                | Description                                      |
| ------------------- | -------------------------------------- | ------------------------------------------------ |
| Embedded Containers | Payara Embedded, Open Liberty Dev Mode | Run Jakarta EE in tests.                         |
| Integration Testing | Arquillian                             | Jakarta EE-native integration testing framework. |
| Unit Testing        | JUnit, Mockito                         | Standard Java test tools apply.                  |

---

## ✅ Summary Table by Category

| Category        | Key Jakarta EE Specs (Modules)                                                                              |
| --------------- | ----------------------------------------------------------------------------------------------------------- |
| **Core/DI**     | `jakarta.enterprise.cdi-api`, `jakarta.annotation-api`, `jakarta.interceptor-api`                           |
| **Web**         | `jakarta.servlet-api`, `jakarta.ws.rs-api`, `jakarta.websocket-api`, `jakarta.faces-api`, `jakarta.jsp-api` |
| **Persistence** | `jakarta.persistence-api`, `jakarta.transaction-api`, `jakarta.validation-api`                              |
| **Messaging**   | `jakarta.jms-api`, `jakarta.batch-api`                                                                      |
| **Security**    | `jakarta.security.enterprise-api`, `jakarta.authorization-api`                                              |
| **Management**  | Java SE JMX, `java.util.logging`                                                                            |
| **Testing**     | Arquillian, embedded containers, JUnit                                                                      |
| **Extensions**  | MicroProfile APIs (Config, Metrics, GraphQL, JWT, OpenAPI, etc.)                                            |

---

## ✅ Popular Application Servers that Implement Jakarta EE

| Server                | Notes                                    |
| --------------------- | ---------------------------------------- |
| **Eclipse GlassFish** | Reference implementation.                |
| **WildFly** (Red Hat) | Rich feature set, modern deployments.    |
| **Payara**            | GlassFish fork with enterprise support.  |
| **Open Liberty**      | IBM's lightweight, cloud-native runtime. |
| **Apache TomEE**      | Tomcat + EE APIs (lightweight).          |

---

## ➕ Extension: MicroProfile APIs (Often Used with Jakarta EE)

| Spec                     | Use                            |
| ------------------------ | ------------------------------ |
| MicroProfile Config      | Dynamic external configuration |
| MicroProfile Health      | Liveness & readiness endpoints |
| MicroProfile Metrics     | Prometheus-style metrics       |
| MicroProfile JWT         | JWT-based auth                 |
| MicroProfile OpenAPI     | Swagger/OpenAPI docs           |
| MicroProfile REST Client | Type-safe REST client          |
| MicroProfile GraphQL     | GraphQL over JAX-RS            |

---

Would you like:

* A **starter Maven/Gradle template** for Jakarta EE?
* A **comparison with Spring Boot, Quarkus, or Micronaut**?
* Or a **visual architecture diagram** for Jakarta EE?

Let me know what direction you’d like to explore.
