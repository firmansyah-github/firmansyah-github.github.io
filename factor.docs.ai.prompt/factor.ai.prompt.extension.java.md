# AI Prompt Extension: Java & Database-Specific Specifications for The Factor

This document is a formal **Java & Database Relational Extension** to the core, language-agnostic [factor.ai.prompt.basic.md](file:///Users/firmansyah.profess/factor-workspace/firmansyah-github.github.io/factor.docs.ai.prompt/factor.ai.prompt.basic.md). When tasked with generating FreeMarker templates specifically for Java classes, Spring Framework components, SQL DDL scripts, or related relational structures, combine this extension with the core specification.

---

## 1. Java-Specific Data Model Specifications

When compiling Java code templates, the logical properties defined in the core data model map to the following Java language conventions:

### 1.1. Entity Object Naming Conventions
* `${entity.className}` – PascalCase Java-compliant Class name (e.g., `UserProfile`).
* `${entity.instanceName}` – camelCase Java-compliant instance or local variable name (e.g., `userProfile`).
* `${entity.packageName!'null'}` – Root Java package name containing the generated file (may return a null string).
* `${entity.fullPackageName}` – Full qualified dot-separated Java package path for the class.

### 1.2. Java Dependency & Import Managers
The code generation engine parses table structure requirements to auto-determine necessary classes to import:
* `${entity.importClassNameList}` – Iterable list of short class wrapper names that require package imports (e.g., `BigDecimal`, `LocalDateTime`).
* `${entity.importDeclarations}` – Complete pre-formatted Java import statements ready to place directly under package headers:
  ```ftl
  <#list entity.importDeclarations as import>
  ${import}
  </#list>
  ```

---

## 2. PostgreSQL-to-Java Enterprise Data Type Mapping (`PUB_SYS_DTM`)

Use the public system data type mapping (`PUB_SYS_DTM`) directive inside the FreeMarker comment header of your templates to bind target database types to Java objects.

### 2.1. Mapping Configuration Block
To standardly map a PostgreSQL database schema to clean Enterprise Java wrappers, copy and paste this block into the comment section of your `.ftl` templates:

```freemarker
<#--
${PUB_SYS_DTM@smallint|Short|Short numeric type mapping}
${PUB_SYS_DTM@integer|Integer|Integer type mapping}
${PUB_SYS_DTM@int4|Integer|Integer type mapping}
${PUB_SYS_DTM@bigint|Long|Long type mapping}
${PUB_SYS_DTM@int8|Long|Long type mapping}
${PUB_SYS_DTM@decimal|java.math.BigDecimal|BigDecimal type mapping}
${PUB_SYS_DTM@numeric|java.math.BigDecimal|BigDecimal type mapping}
${PUB_SYS_DTM@real|Float|Float type mapping}
${PUB_SYS_DTM@double|Double|Double type mapping}
${PUB_SYS_DTM@character|String|String type mapping}
${PUB_SYS_DTM@char|String|String type mapping}
${PUB_SYS_DTM@varchar|String|String type mapping}
${PUB_SYS_DTM@text|String|String type mapping}
${PUB_SYS_DTM@bytea|byte[]|Binary byte array mapping}
${PUB_SYS_DTM@date|java.time.LocalDate|Modern LocalDate API mapping}
${PUB_SYS_DTM@time|java.time.LocalTime|Modern LocalTime API mapping}
${PUB_SYS_DTM@timestamp|java.time.LocalDateTime|Modern LocalDateTime API mapping}
${PUB_SYS_DTM@timestamptz|java.time.LocalDateTime|Modern LocalDateTime API mapping}
${PUB_SYS_DTM@interval|String|Standard string fallback}
${PUB_SYS_DTM@boolean|Boolean|Boolean mapping}
${PUB_SYS_DTM@uuid|java.util.UUID|Java UUID wrapper mapping}
${PUB_SYS_DTM@json|String|Raw string mapping for json}
${PUB_SYS_DTM@jsonb|String|Raw string mapping for jsonb}
${PUB_SYS_DTM@enum|String|Standard string fallback for enum types}
-->
```

---

## 3. Java-Specific System Generation Properties

These variables utilize the core private system attributes to handle packaging and directory creation tailored to Java builds:

* `PRV_SYS_JAVA_PACKAGE` – Used exclusively when `PRV_SYS_GEN_TYPE` is `many`. It defines the class package and auto-generates matching physical folders.
  * *Example Definition*:
    ```ftl
    <#-- ${PRV_SYS_JAVA_PACKAGE|com.company.project.model|Default entity package} -->
    ```
  * *Engine Slashed Pathing*: The engine translates dots (e.g. `com.company.project.model`) into path separators (e.g. `com/company/project/model`) and appends it to the base generation path (`PRV_SYS_GEN_PATH`).
* `PUB_APP_PKG` – Set globally to represent the root app namespace (e.g., `com.company.project`).

---

## 4. End-to-End Java Generation Code Recipes

### Recipe 1: Standard Enterprise Java Entity Model (`many` type)
Generates an independent, serialized POJO matching the introspected table structure:

```ftl
<#--
${PRV_SYS_GEN_TYPE|many|Multi-file strategy}
${PRV_SYS_GEN_PATH|src/main/java|Java source root}
${PRV_SYS_GEN_FILENAME|[class].java|PascalCase filename}
${PRV_SYS_JAVA_PACKAGE|com.example.model|Target entity model package}
${PRV_SYS_IS_REPLACE|true|Replace existing outputs}

${PUB_SYS_DTM@integer|Integer|Integer mapping}
${PUB_SYS_DTM@varchar|String|Varchar mapping}
${PUB_SYS_DTM@text|String|Text mapping}
${PUB_SYS_DTM@boolean|Boolean|Boolean mapping}
${PUB_SYS_DTM@timestamp|java.time.LocalDateTime|DateTime mapping}
${PUB_SYS_DTM@decimal|java.math.BigDecimal|BigDecimal mapping}
-->
package ${PRV_SYS_JAVA_PACKAGE};

import java.io.Serializable;
<#list entity.importDeclarations as import>
${import}
</#list>

/**
 * Auto-generated model representation for database table: ${entity.tableName}
 * Remarks: ${entity.remarks!'No comments found.'}
 */
public class ${entity.className} implements Serializable {

    private static final long serialVersionUID = 1L;

    // Table Fields
    <#list entity.fieldListSortByOrdinalPosition as field>
    // Database Column: ${field.columnName} (Size: ${field.columnSize}, Nullable: ${field.nullable?c})
    private ${field.simpleFieldType} ${field.fieldName};
    </#list>

    /**
     * Default Constructor
     */
    public ${entity.className}() {
        super();
    }

    // Getters and Setters
    <#list entity.fieldList as field>
    /**
     * Get ${field.fieldName}
     */
    public ${field.simpleFieldType} ${field.getterMethodName}() {
        return this.${field.fieldName};
    }

    /**
     * Set ${field.fieldName}
     */
    public void ${field.setterMethodName}(${field.simpleFieldType} ${field.fieldName}) {
        this.${field.fieldName} = ${field.fieldName};
    }
    </#list>

    @Override
    public String toString() {
        return "${entity.className}{" +
            <#list entity.toStringFieldList as field>
            "${field.fieldName}=" + ${field.fieldName} +
            <#if field_has_next>", " +</#if>
            </#list>
            '}';
    }
}
```

---

### Recipe 2: Spring Data JPA Repository Interface (`many` type)
Generates highly targeted Jpa interfaces matching primary key dimensions:

```ftl
<#--
${PRV_SYS_GEN_TYPE|many|Multi-file strategy}
${PRV_SYS_GEN_PATH|src/main/java|Java source root}
${PRV_SYS_GEN_FILENAME|[class]Repository.java|Repository interface name}
${PRV_SYS_JAVA_PACKAGE|com.example.repository|Repository target package}
${PRV_SYS_IS_REPLACE|true|Replace existing outputs}
-->
package ${PRV_SYS_JAVA_PACKAGE};

import com.example.model.${entity.className};
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Spring Data JPA Repository interface for table: ${entity.tableName}
 */
@Repository
public interface ${entity.className}Repository extends JpaRepository<${entity.className}, <#if entity.hasPrimaryKeySingle><#list entity.primaryKeyFieldList as pk>${pk.simpleFieldType}</#list><#else>Object</#if>> {
<#list entity.fieldList as field>
    <#if field.unique>

    /**
     * Find single record by unique constraint ${field.columnName}
     */
    ${entity.className} findBy${field.firstCapFieldName}(${field.simpleFieldType} ${field.fieldName});
    </#if>
</#list>
}
```

---

### Recipe 3: PostgreSQL Schema Migration Script (`one` type)
Uses relational key convenience configurations to build clean compound mappings:

```ftl
<#--
${PRV_SYS_GEN_TYPE|one|Single file output strategy}
${PRV_SYS_GEN_PATH|src/main/resources/db/migration|Migration target path}
${PRV_SYS_GEN_FILENAME|V1__init_schema.sql|Output migration name}
${PRV_SYS_IS_REPLACE|true|Replace existing schema files}

${PUB_DB_TYPE|postgresql|Primary database engine}
-->
-- Introspected Database Schema Creation Script
-- Engine Target: ${PUB_DB_TYPE}
-- Build Date: ${adv.buildDate?datetime}

<#list adv.entities as entity>
-- Table definition: ${entity.tableName}
CREATE TABLE ${entity.tableName} (
<#list entity.fieldListSortByOrdinalPosition as field>
    ${field.columnName} ${field.columnType}<#if field.columnSize gt 0 && field.columnType != "text" && field.columnType != "jsonb">(${field.columnSize})</#if><#if !field.nullable> NOT NULL</#if><#if field.autoincrement> GENERATED ALWAYS AS IDENTITY</#if><#sep>,</#sep>
</#list>
<#if entity.hasPrimaryKey>
    , CONSTRAINT pk_${entity.tableName} PRIMARY KEY (<#list entity.primaryKeyFieldList as pk>${pk.columnName}<#sep>, </#sep></#list>)
</#if>
);

</#list>

-- Foreign Key Constraints Declarations
<#list adv.entities as entity>
<#if entity.hasForeignKey>
<#list entity.importedKeys as key>
ALTER TABLE ${entity.tableName} 
  ADD CONSTRAINT ${key.fkName} 
  FOREIGN KEY (${key.fkColumnName}) 
  REFERENCES ${key.pkTableName} (${key.pkColumnName})
  ON UPDATE <#if key.updateRule == 0>CASCADE<#else>RESTRICT</#if>
  ON DELETE <#if key.deleteRule == 0>CASCADE<#else>RESTRICT</#if>;

</#list>
</#if>
</#list>
```
