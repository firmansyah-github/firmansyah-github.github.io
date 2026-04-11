# 1. CRUD springboot application

create freemarker templates based on above info and with following requirement:
freemarker files for generate CRUD springboot code application 
Layered Architecture (N-Tier / MVC):
```
src/main/java/
└── com.example.app/
    ├── controller/
    ├── service/
    │   └── impl/
    ├── repository/
    ├── model/
    │   ├── entity/
    │   └── dto/
    ├── config/
    ├── exception/
    └── Application.java
```
support Primary key and Foreign key including compound PK and FK. 
Using FreeMarker 2.3.33.

Tests or API documentation
All file must be in one downloadable zip file.

# 2. JAVA: Consistency between declared Java packages and FreeMarker templates
[JAVA]:

Please carefully check the consistency between the declared Java packages and the `${PRV_SYS_GEN_PATH}` values in my FreeMarker templates. Use the following placeholder-to-variable mapping to evaluate path replacements:

| PRV_SYS_GEN_PATH Placeholder | Java Package Variable Reference |
| ------------------------------- | ------------------------------- |
| `[table]`                       | `${entity.tableName}`           |
| `[base]`                        | `${entity.baseName}`            |
| `[class]`                       | `${entity.className}`           |
| `[instance]`                    | `${entity.instanceName}`        |

Ensure that:

1. The final resolved path from `${PRV_SYS_GEN_PATH}` **matches the declared Java package structure**.

2. If the value of `${PRV_SYS_GEN_PATH}` contains any of the placeholders listed above, then the Java `package` statement **must include** the corresponding Java Package Variable Reference, as mapped in the table.

---

**Example 1:**
If `${PRV_SYS_GEN_PATH}` is:

```
src/main/java/com/example/demo/model/[class]
```

then the expected Java package must be like:

```java
package com.example.demo.model.${entity.className};
```

---

**Example 2:**
If `${PRV_SYS_GEN_PATH}` is:

```
src/main/java/com/example/demo/[base]/[class]/[instance]
```

then the expected Java package must be like:

```java
package com.example.demo.${entity.baseName}.${entity.className}.${entity.instanceName};
```
Report any mismatch and suggest the correct path or package adjustment.

