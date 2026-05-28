Apache **Vert.x** is a **reactive toolkit** for building **reactive, event-driven, non-blocking applications** on the JVM. It is **polyglot**, modular, and scalable, and it provides a rich set of Java libraries (modules) grouped into specific categories.

Below is a **comprehensive list and categorization** of major Java libraries and components in **Vert.x**, grouped by their **functional categories**.

---

## 🔧 **1. Core Libraries**

These are the foundational libraries for Vert.x applications.

| Library / Module        | Description                                                             |
| ----------------------- | ----------------------------------------------------------------------- |
| `vertx-core`            | Core module: event loop, verticles, event bus, buffer, future, context. |
| `vertx-codegen`         | Code generation support for Vert.x (mainly for polyglot support).       |
| `vertx-hazelcast`       | Hazelcast-based cluster manager for event bus clustering.               |
| `vertx-infinispan`      | Infinispan-based cluster manager.                                       |
| `vertx-zookeeper`       | Zookeeper-based cluster manager.                                        |
| `vertx-service-proxy`   | Generate service proxies to use event bus services across JVM/polyglot. |
| `vertx-circuit-breaker` | Circuit breaker implementation for fault tolerance.                     |

---

## 🌐 **2. Web and HTTP**

Modules to create REST APIs, web apps, and handle HTTP traffic.

| Library / Module         | Description                                                            |
| ------------------------ | ---------------------------------------------------------------------- |
| `vertx-web`              | Router, middleware, request/response handling, cookies, sessions.      |
| `vertx-web-client`       | Reactive HTTP/HTTPS client.                                            |
| `vertx-http-proxy`       | HTTP proxying capabilities.                                            |
| `vertx-web-templ-*`      | Template engine integrations (Thymeleaf, Handlebars, FreeMarker, etc). |
| `vertx-web-validation`   | HTTP request validation and JSON schema support.                       |
| `vertx-web-api-contract` | OpenAPI 3 support for defining REST APIs.                              |
| `vertx-auth-*`           | Authentication and authorization handlers (JWT, OAuth2, Shiro, etc).   |
| `vertx-session`          | HTTP session support.                                                  |
| `vertx-static-handler`   | Serve static resources (HTML, JS, CSS).                                |

---

## 🧵 **3. Concurrency and Asynchronous Utilities**

Tools for reactive programming and thread coordination.

| Library / Module                   | Description                                                      |
| ---------------------------------- | ---------------------------------------------------------------- |
| `vertx-futures`                    | Compositional asynchronous programming using `Future`/`Promise`. |
| `vertx-rx-java` / `vertx-rx-java3` | RxJava 2/3 support.                                              |
| `vertx-reactive-streams`           | Integrates Vert.x with Reactive Streams.                         |
| `vertx-sync`                       | Provides Kotlin-style coroutines in Java via `await()`.          |

---

## 🗃️ **4. Data Access**

Modules to interact with databases, data stores, and data formats.

| Library / Module         | Description                                     |
| ------------------------ | ----------------------------------------------- |
| `vertx-jdbc-client`      | JDBC-based database client.                     |
| `vertx-sql-client`       | Reactive SQL client (PostgreSQL, MySQL, MSSQL). |
| `vertx-mysql-client`     | MySQL reactive client.                          |
| `vertx-pg-client`        | PostgreSQL reactive client.                     |
| `vertx-mongo-client`     | MongoDB reactive client.                        |
| `vertx-redis-client`     | Redis reactive client.                          |
| `vertx-cassandra-client` | Cassandra DB client.                            |
| `vertx-kafka-client`     | Kafka producer and consumer support.            |
| `vertx-db2-client`       | IBM DB2 client (based on SQL client).           |
| `vertx-oracle-client`    | Oracle SQL client.                              |

---

## 🔐 **5. Security**

Libraries for authentication, encryption, and secure communications.

| Library / Module        | Description                              |
| ----------------------- | ---------------------------------------- |
| `vertx-auth-jwt`        | JWT-based authentication.                |
| `vertx-auth-oauth2`     | OAuth2 support (Google, Facebook, etc).  |
| `vertx-auth-shiro`      | Apache Shiro integration.                |
| `vertx-auth-properties` | File-based user/password authentication. |
| `vertx-auth-htdigest`   | HTDigest file-based authentication.      |
| `vertx-auth-htpasswd`   | HTPasswd-based authentication.           |

---

## 🧪 **6. Testing**

Support for testing Vert.x applications.

| Library / Module | Description                               |
| ---------------- | ----------------------------------------- |
| `vertx-unit`     | Unit testing for Vert.x (based on JUnit). |
| `vertx-junit5`   | JUnit 5 integration with Vert.x.          |

---

## ☁️ **7. Messaging and Event Bus Integration**

Modules to work with messaging protocols and event bus extensions.

| Library / Module            | Description                                        |
| --------------------------- | -------------------------------------------------- |
| `vertx-amqp-bridge`         | AMQP protocol bridge for event bus.                |
| `vertx-stomp`               | STOMP protocol support (WebSocket over event bus). |
| `vertx-mqtt`                | MQTT protocol support.                             |
| `vertx-tcp-eventbus-bridge` | TCP bridge to connect to event bus.                |
| `vertx-redis-client`        | Pub/Sub or key-value communication.                |

---

## ⚙️ **8. Config & Deployment**

Tools for configuration management and deployment automation.

| Library / Module         | Description                                                                              |
| ------------------------ | ---------------------------------------------------------------------------------------- |
| `vertx-config`           | Unified configuration for Vert.x apps. Supports JSON, YAML, environment vars, file, etc. |
| `vertx-config-git`       | Load config from Git repositories.                                                       |
| `vertx-config-zookeeper` | Load config from Zookeeper.                                                              |
| `vertx-config-hocon`     | Support for HOCON format.                                                                |
| `vertx-launcher`         | CLI tool to launch Vert.x verticles with custom lifecycle hooks.                         |

---

## 📦 **9. Service Discovery & Consul**

Discovery of services and metadata across distributed systems.

| Library / Module                            | Description                                            |
| ------------------------------------------- | ------------------------------------------------------ |
| `vertx-service-discovery`                   | General service discovery (HTTP, EventBus, JDBC, etc). |
| `vertx-service-discovery-backend-consul`    | Integration with HashiCorp Consul.                     |
| `vertx-service-discovery-backend-zookeeper` | Integration with Zookeeper.                            |

---

## 📡 **10. gRPC and API Gateway**

For building and consuming RPC-based services.

| Library / Module         | Description                       |
| ------------------------ | --------------------------------- |
| `vertx-grpc`             | gRPC support (server and client). |
| `vertx-web-api-contract` | OpenAPI-based gateway creation.   |

---

## 🔄 **11. Language Support (Polyglot)**

Allows you to use Vert.x in other JVM languages.

| Library / Module    | Description                   |
| ------------------- | ----------------------------- |
| `vertx-lang-kotlin` | Kotlin support.               |
| `vertx-lang-js`     | JavaScript (Nashorn) support. |
| `vertx-lang-groovy` | Groovy support.               |
| `vertx-lang-ruby`   | Ruby support.                 |
| `vertx-lang-scala`  | Scala support.                |

---

## 🎛️ **12. Monitoring and Metrics**

Integration with monitoring and observability tools.

| Library / Module           | Description                                    |
| -------------------------- | ---------------------------------------------- |
| `vertx-dropwizard-metrics` | Dropwizard metrics integration.                |
| `vertx-micrometer-metrics` | Micrometer support (Prometheus, Datadog, etc). |
| `vertx-health-check`       | HTTP-based health check endpoints.             |

---

## 🔍 **13. CLI & Dev Tools**

Useful for debugging, CLI usage, and developer productivity.

| Library / Module  | Description                          |
| ----------------- | ------------------------------------ |
| `vertx-shell`     | Interactive shell and CLI support.   |
| `vertx-dev-tools` | Live reload and development utility. |

---

## ✅ Summary Table (By Category)

| Category            | Example Modules                            |
| ------------------- | ------------------------------------------ |
| Core                | `vertx-core`, `vertx-service-proxy`        |
| Web                 | `vertx-web`, `vertx-web-client`            |
| Reactive Utils      | `vertx-futures`, `vertx-rx-java`           |
| Database            | `vertx-sql-client`, `vertx-mongo-client`   |
| Security            | `vertx-auth-jwt`, `vertx-auth-oauth2`      |
| Testing             | `vertx-unit`, `vertx-junit5`               |
| Messaging           | `vertx-stomp`, `vertx-mqtt`                |
| Config & Deployment | `vertx-config`, `vertx-launcher`           |
| Service Discovery   | `vertx-service-discovery`, `Consul`        |
| gRPC & OpenAPI      | `vertx-grpc`, `vertx-web-api-contract`     |
| Polyglot Support    | `vertx-lang-kotlin`, `vertx-lang-js`       |
| Metrics             | `vertx-micrometer-metrics`, `health-check` |
| CLI & Dev Tools     | `vertx-shell`, `vertx-dev-tools`           |

---

If you’d like, I can also create:

* A **visual diagram** of these modules,
* Or help you **select modules** based on your project use case (e.g., REST API with JWT, PostgreSQL, and Redis).

Would you like either?



Yes, **Vert.x** supports all of those features, though with **modular or external libraries** (some native, some community-maintained). Here's a breakdown for each:

---

## ✅ 1. **SSE (Server-Sent Events)**

**Supported** via Vert.x Web.

* Native support using HTTP streaming.
* Example:

```java
router.get("/events").handler(ctx -> {
  ctx.response()
     .putHeader("Content-Type", "text/event-stream")
     .putHeader("Cache-Control", "no-cache")
     .setChunked(true);

  vertx.setPeriodic(1000, id -> {
    ctx.response().write("data: Hello at " + System.currentTimeMillis() + "\n\n");
  });
});
```

---

## ✅ 2. **WebSocket**

**Fully supported** via `vertx-core` and `vertx-web`.

* Both client and server WebSocket API are non-blocking.
* Example (server):

```java
vertx.createHttpServer()
  .webSocketHandler(ws -> {
    ws.handler(data -> {
      System.out.println("Received: " + data.toString());
      ws.writeTextMessage("Echo: " + data.toString());
    });
  }).listen(8080);
```

---

## ✅ 3. **ORM (Object Relational Mapping)**

**Not directly built-in**, but **you can integrate** with popular Java ORM frameworks:

### Options:

| ORM Framework          | Status in Vert.x     | Notes                                                                |
| ---------------------- | -------------------- | -------------------------------------------------------------------- |
| **Hibernate ORM**      | Supported (external) | Use with caution due to Vert.x non-blocking nature.                  |
| **JOOQ**               | Supported (external) | Recommended for complex SQL, integrates well with Vert.x.            |
| **Ebean ORM**          | Community use        | Can be used but often blocking.                                      |
| **Hibernate Reactive** | ✅ Ideal choice       | Non-blocking ORM built for reactive systems, compatible with Vert.x. |

> 🔥 **Best fit:** [Hibernate Reactive](https://hibernate.org/reactive/) — non-blocking and works well with Vert.x.

---

## ✅ 4. **Transaction Management**

Vert.x doesn't provide traditional JTA or Spring-style declarative transactions, **but it supports programmatic transactions**, especially with:

### SQL Client Transactions:

```java
client.getConnection().compose(conn -> {
  return conn.begin()
    .compose(tx -> conn.query("INSERT INTO table ...").execute()
    .compose(res -> tx.commit()));
});
```

### MongoDB:

* Transactions supported with `vertx-mongo-client` (only for replica sets).

### Hibernate Reactive:

* Transaction-aware and built with reactive paradigm.

---

## ✅ 5. **Logging**

**Yes, fully supported** via `SLF4J` or `Log4j`, depending on your binding.

### Options:

| Logging Backend       | Supported         | Integration                |
| --------------------- | ----------------- | -------------------------- |
| `SLF4J`               | ✅ Native          | Recommended                |
| `Log4j / Log4j2`      | ✅ Native          | Use appropriate binding    |
| `java.util.logging`   | ✅ Native          | Default fallback           |
| `vertx-logger-config` | ✅ Optional config | Can route to custom logger |

```java
Logger logger = LoggerFactory.getLogger(YourClass.class);
logger.info("Vert.x is awesome!");
```

> 📦 Vert.x logs with `LoggerFactory` abstraction, so plug in your own backend (e.g., Logback or Log4j2).

---

## ✅ 6. **GraphQL**

**Not built-in**, but **available via community libraries**:

### Best Option:

| Library                                                              | Description                                                                                             |
| -------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| [`vertx-web-graphql`](https://vertx.io/docs/vertx-web-graphql/java/) | Official Vert.x GraphQL integration using [graphql-java](https://github.com/graphql-java/graphql-java). |

### Example:

```java
GraphQLHandler graphQLHandler = GraphQLHandler.create(graphQL);
router.post("/graphql").handler(graphQLHandler);
```

* Also supports GraphiQL and Apollo tooling.
* Fully asynchronous and reactive.

---

## ✅ Summary Table

| Feature     | Supported | Library/Approach                              |
| ----------- | --------- | --------------------------------------------- |
| SSE         | ✅ Yes     | Native HTTP streaming (`text/event-stream`)   |
| WebSocket   | ✅ Yes     | Native `HttpServer.webSocketHandler()`        |
| ORM         | ⚠️ Yes    | Best: `Hibernate Reactive` or `JOOQ`          |
| Transaction | ✅ Yes     | Programmatic (SQL, Mongo, Hibernate Reactive) |
| Logging     | ✅ Yes     | SLF4J / Log4j / JUL                           |
| GraphQL     | ✅ Yes     | `vertx-web-graphql`                           |

---

Would you like a **code example or Gradle dependencies** for any of these features?
