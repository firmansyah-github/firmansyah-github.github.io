# The Factor — AI Prompt: FreeMarker Template Generation for Java

## Table of Contents

1. [System Context](#system-context)
2. [Core Data Model Objects](#core-data-model-objects)
   - [Database Connection (`dbs`)](#1-database-connection-object-dbs)
   - [Advanced Configuration (`adv`)](#2-advanced-configuration-object-adv)
   - [Entity Data Model (`entity` / `ents` / `adv.entities`)](#3-entity-data-model-object)
   - [Field Object](#4-field-object-properties)
   - [Foreign Key Relationships](#5-foreign-key-relationships)
   - [Import Statements](#6-import-statements)
   - [File Templates (`adv.fileTmplts`)](#7-file-templates-advfiletmplts)
   - [Attribute Maps (`adv.fileDefaultAttrs` / `adv.filePublicAttrs`)](#8-attribute-maps)
   - [Draft Template (`adv.draftTemplate`)](#9-draft-template-advdrafttemplate)
3. [File Template Data Model Objects](#file-template-data-model-objects)
   - [Reserved Private System Objects](#1-reserved-private-system-objects)
   - [Reserved Public System Objects (Data Type Mapping)](#2-reserved-public-system-objects-data-type-mapping)
   - [Public Objects](#3-public-objects)
   - [Private Objects](#4-private-objects)
4. [Generation Types — Behavior Rules](#generation-types--behavior-rules)
5. [FreeMarker Syntax Reference](#freemarker-syntax-reference)
6. [End-to-End Template Examples](#end-to-end-template-examples)
7. [Instructions for AI](#instructions-for-ai)

---

## System Context

**The Factor** (Firmansyah Advanced CRUD Generator) is an Eclipse-based code generation tool that uses **Apache FreeMarker 2.3.26** as its template engine. It reads database metadata (tables, columns, primary keys, foreign keys) via JDBC and exposes the metadata as a rich data model to FreeMarker `.ftl` template files. Templates are processed to generate source code files (Java classes, SQL scripts, configuration files, etc.) for any database-driven application.

### How It Works

1. **Connect to a database** — The Factor connects via JDBC and introspects the schema.
2. **Build the data model** — Table metadata is mapped to `Entity` objects; columns become `Field` objects; relationships become `ExportedKey` / `ImportedKey` objects. All of these are exposed to FreeMarker through the root-level objects `dbs`, `adv`, `ents`, and `entity`.
3. **Process templates** — Each `.ftl` template file contains FreeMarker expressions that consume the data model. Templates also declare **private system attributes** (in FreeMarker comments) that control how and where output files are generated.
4. **Generate output** — Output files are written to the configured deployment root directory, following the path and filename rules defined by the private system attributes.

### Key Terminology

| Term | Meaning |
|---|---|
| **Entity** | A Java-style representation of a database table. Has `baseName`, `className`, `tableName`, etc. |
| **Field** | A Java-style representation of a database column. Has `fieldName`, `fieldType`, `columnName`, `columnType`, etc. |
| **ExportedKey** | A foreign key relationship where the current table's primary key is referenced by another table. |
| **ImportedKey** | A foreign key relationship where the current table references another table's primary key. |
| **Generation Type** | Controls how a template is processed: `one` (single output file), `many` (one output file per entity), or `copy` (copy as-is without FreeMarker processing). |
| **Private System Attribute** | A reserved variable (e.g., `PRV_SYS_GEN_TYPE`) declared in template comments using pipe-delimited syntax that controls generation behavior. |
| **Public Attribute** | A user-defined variable (e.g., `PUB_DB_TYPE`) shared across all templates for project-level configuration. |
| **Private (File) Attribute** | A user-defined variable (e.g., `PRV_DB_TYPE`) scoped to a single template file. |
| **Data Type Mapping** | A system that maps database column types to programming language types (e.g., PostgreSQL `integer` → Java `Integer`). |

---

## Core Data Model Objects

The following objects are available at the root level of the FreeMarker data model during template processing.

### 1. Database Connection Object (`dbs`)

Represents the active JDBC database connection and its metadata.

#### Single Properties (Direct Access)

| Expression | Type | Description |
|---|---|---|
| `${dbs.catalog}` | String | Database catalog name |
| `${dbs.create?c}` | Boolean | Flag indicating if creation is enabled (use `?c` for boolean-to-string conversion) |
| `${dbs.driverClassName}` | String | Fully qualified JDBC driver class name (e.g., `org.postgresql.Driver`) |
| `${dbs.driverFile}` | String | File path to the JDBC driver JAR |
| `${dbs.name}` | String | Database connection name (user-assigned label) |
| `${dbs.password}` | String | Database connection password |
| `${dbs.profileName}` | String | Connection profile name |
| `${dbs.schema}` | String | Database schema name (e.g., `public`) |
| `${dbs.tablePattern}` | String | Table name pattern filter (e.g., `%` for all tables) |
| `${dbs.tableType}` | String | Table type filter (e.g., `TABLE`, `VIEW`) |
| `${dbs.url}` | String | JDBC connection URL (e.g., `jdbc:postgresql://localhost:5432/mydb`) |
| `${dbs.user}` | String | Database connection username |

#### Iterable Collections

| Expression | Type | Description |
|---|---|---|
| `${dbs.catalogs}` | List\<String\> | All available catalog names from the database |
| `${dbs.schemas}` | List\<String\> | All available schema names from the database |
| `${dbs.tableTypes}` | List\<String\> | All available table types (e.g., TABLE, VIEW, SYSTEM TABLE) |
| `${dbs.tableTypesList}` | List\<String\> | Alternative table types list |

**Iteration Example:**

```freemarker
<#list dbs.schemas as schema>
  ${schema?counter}: ${schema}
</#list>
```

#### Setter Methods (Template-Level Overrides)

These call Java setter methods on the `dbs` object. Use with caution — they mutate the underlying Java object:

| Setter | Getter After | Purpose |
|---|---|---|
| `${dbs.setCatalog('my_catalog')}` | `${dbs.catalog}` | Override catalog |
| `${dbs.setCreate(true)}` | `${dbs.create?c}` | Set creation flag |
| `${dbs.setName('new_name')}` | `${dbs.name}` | Override connection name |
| `${dbs.setPassword('pwd')}` | `${dbs.password}` | Override password |
| `${dbs.setProfileName('profile')}` | `${dbs.profileName}` | Override profile name |
| `${dbs.setSchema('public')}` | `${dbs.schema}` | Override schema |
| `${dbs.setTablePattern('%')}` | `${dbs.tablePattern}` | Override table pattern |
| `${dbs.setTableType('TABLE')}` | `${dbs.tableType}` | Override table type |

> ⚠️ **Warning:** Calling setters inside FreeMarker templates is generally discouraged because it violates the separation of presentation and logic. Use only when absolutely necessary.

---

### 2. Advanced Configuration Object (`adv`)

Contains build information, generation settings, draft template configuration, entity list, file templates, and attribute maps.

#### Build Information

| Expression | Type | Description |
|---|---|---|
| `${adv.buildDate?datetime}` | DateTime | Build timestamp, formatted as datetime |
| `${adv.comment}` | String | Build comment text |

**Setter Methods:**

| Setter | Purpose |
|---|---|
| `${adv.setBuildDate(.now)}` | Set build date to current time |
| `${adv.setComment('text')}` | Set build comment |

#### Generation Settings (`adv.generation`)

Controls the overall generation process:

| Expression | Type | Description |
|---|---|---|
| `${adv.generation.create?c}` | Boolean | Enable/disable code generation |
| `${adv.generation.outputDir}` | String | Output directory path for generated files |
| `${adv.generation.outputDir?has_content?c}` | Boolean | Check if output directory is set |
| `${adv.generation.packageName}` | String | Default Java package name for generated code |
| `${adv.generation.packageName?has_content?c}` | Boolean | Check if package name is set |
| `${adv.generation.rootDir}` | String | Root directory path (base deployment directory) |
| `${adv.generation.specifyTemplateDir?c}` | Boolean | Whether a custom template directory is used |
| `${adv.generation.superClassName}` | String | Default super class name for generated classes |
| `${adv.generation.superClassName?has_content?c}` | Boolean | Check if super class name is set |
| `${adv.generation.templateDir}` | String | Template directory path |

**Setter Methods:**

| Setter | Purpose |
|---|---|
| `${adv.generation.setCreate(true)}` | Enable code generation |
| `${adv.generation.setOutputDir('path')}` | Set output directory |
| `${adv.generation.setPackageName('com.example')}` | Set default package name |
| `${adv.generation.setRootDir('path')}` | Set root directory |
| `${adv.generation.setSpecifyTemplateDir(true)}` | Enable custom template directory |
| `${adv.generation.setSuperClassName('BaseEntity')}` | Set default super class |
| `${adv.generation.setTemplateDir('path')}` | Set template directory |

---

### 3. Entity Data Model Object

An **Entity** represents a single database table as a Java-style object. Entities can be accessed in three ways:

| Access Pattern | Context | Description |
|---|---|---|
| `<#list adv.entities as entity>` | Loop | Iterate over all entities via the `adv` object |
| `<#list ents as entity>` | Loop | `ents` is an **alias** for `adv.entities` — identical behavior |
| `${entity}` | Single | Direct reference to the current entity, typically when the generation type is `many` and the template is being processed once per entity |

> **Important:** When `PRV_SYS_GEN_TYPE` is `many`, the template is executed once per entity. In this context, `${entity}` refers to the **current entity** being processed, so you do NOT need to wrap code in a `<#list>` block.

#### Entity Object Properties

| Expression | Type | Description |
|---|---|---|
| `${entity.baseName}` | String | Base name of the entity (lowercase, no spaces). Example: `userprofile` |
| `${entity.className}` | String | Java class name (PascalCase). Example: `UserProfile` |
| `${entity.tableName}` | String | Original database table name. Example: `USER_PROFILES` |
| `${entity.instanceName}` | String | Java instance/variable name (camelCase). Example: `userProfile` |
| `${entity.fullPackageName}` | String | Full Java package name for the entity |
| `${entity.packageName!'null'}` | String | Package name (may be null, use `!'null'` for default) |
| `${entity.remarks!'null'}` | String | Table comments/remarks from database (default `'null'` if not present) |
| `${entity.toStringStatement}` | String | Auto-generated `toString()` method body code |

**Boolean Properties:**

| Expression | Description |
|---|---|
| `${entity.allFieldSelection?c}` | True if all fields are selected for generation |
| `${entity.create?c}` | True if the entity is enabled for code generation |
| `${entity.selected?c}` | True if the entity is selected in the UI |
| `${entity.emptyBaseName?c}` | True if the base name is empty |
| `${entity.emptyTableName?c}` | True if the table name is empty |
| `${entity.haveSpaceTableName?c}` | True if the table name contains spaces |
| `${entity.reservedWordBaseName?c}` | True if the base name is a Java/SQL reserved word |
| `${entity.validPatternBaseName?c}` | True if the base name follows a valid naming convention |
| `${entity.hasAttachFileField?c}` | True if the entity has at least one attachment file field |
| `${entity.hasDuplicateFieldName?c}` | True if the entity has duplicate field names |
| `${entity.hasLob?c}` | True if the entity has Large Object (LOB/BLOB/CLOB) fields |

> **Note:** `hasAttachFileField`, `hasDuplicateFieldName`, and `hasLob` can also be invoked as methods: `${entity.hasAttachFileField()?c}`, `${entity.hasDuplicateFieldName()?c}`, `${entity.hasLob()?c}`.

#### Primary Key and Foreign Key Convenience Properties

| Expression | Type | Description |
|---|---|---|
| `${entity.primaryKeyCount}` | Integer | Number of primary key columns |
| `${entity.foreignKeyCount}` | Integer | Number of foreign key columns |
| `${entity.hasPrimaryKey?c}` | Boolean | True if the entity has at least one primary key |
| `${entity.hasPrimaryKeySingle?c}` | Boolean | True if the entity has exactly one primary key |
| `${entity.hasPrimaryKeyCompound?c}` | Boolean | True if the entity has a composite primary key (2+ columns) |
| `${entity.hasForeignKey?c}` | Boolean | True if the entity has at least one foreign key |
| `${entity.hasForeignKeySingle?c}` | Boolean | True if the entity has exactly one foreign key |
| `${entity.hasForeignKeyCompound?c}` | Boolean | True if the entity has multiple foreign keys |

> **Note:** These can also be invoked as methods: `${entity.hasPrimaryKey()?c}`, `${entity.getPrimaryKeyCount()}`, etc.

#### Entity Field Lists

Each entity provides multiple filtered/sorted views of its fields. All lists contain **Field objects** (see [Field Object Properties](#4-field-object-properties) for the full property list).

| List Expression | Description |
|---|---|
| `entity.fieldList` | All fields of the entity |
| `entity.primaryKeyFieldList` | Only primary key fields |
| `entity.fieldListExceptLob` | All fields excluding LOB (Large Object) types |
| `entity.fieldListExceptForeignKey` | All fields excluding foreign key fields |
| `entity.fieldListExceptPrimaryKey` | All fields excluding primary key fields |
| `entity.fieldListExceptPrimaryKeyAndForeignKey` | All fields excluding both PK and FK fields |
| `entity.foreignKeyFieldList` | Only foreign key fields |
| `entity.fieldListSortByOrdinalPosition` | All fields sorted by their ordinal (database column) position |
| `entity.attachFileFieldList` | Only fields marked as attachment file types |
| `entity.toStringFieldList` | Fields used in the auto-generated `toString()` method |

**Iteration Example:**

```freemarker
<#list entity.fieldList as field>
  private ${field.fieldType} ${field.fieldName};
</#list>
```

---

### 4. Field Object Properties

Each item in any entity field list (e.g., `entity.fieldList`, `entity.primaryKeyFieldList`, etc.) is a **Field object** with the following properties:

#### Core Properties

| Expression | Type | Description |
|---|---|---|
| `${field.fieldName}` | String | Java field name (camelCase). Example: `firstName` |
| `${field.fieldType}` | String | Fully qualified Java type. Example: `java.lang.String` |
| `${field.simpleFieldType}` | String | Simple Java type (without package). Example: `String` |
| `${field.simpleObjectClassName}` | String | Simple wrapper class name. Example: `Integer` for `int` |
| `${field.columnName}` | String | Database column name. Example: `FIRST_NAME` |
| `${field.columnType}` | String | Database column type. Example: `varchar` |
| `${field.columnSize}` | Integer | Column size/length. Example: `255` |
| `${field.columnDataType}` | Integer | JDBC SQL data type code (from `java.sql.Types`) |
| `${field.ordinalPosition}` | Integer | Column position in the database table (1-based) |
| `${field.pkPosition}` | Integer | Position within the primary key (0 if not a PK) |
| `${field.remarks!'null'}` | String | Column comments from database (default `'null'`) |
| `${field.nullValue!'null'}` | String | String representation of null for this field type |

#### Derived Name Properties

| Expression | Type | Description |
|---|---|---|
| `${field.firstCapFieldName}` | String | Field name with first letter capitalized. Example: `FirstName` |
| `${field.getterMethodName}` | String | Getter method name. Example: `getFirstName` |
| `${field.setterMethodName}` | String | Setter method name. Example: `setFirstName` |
| `${field.toPrimitiveMethod!'null'}` | String | Method to convert wrapper to primitive (e.g., `intValue()`). Default `'null'` |

#### Boolean Properties

| Expression | Description |
|---|---|
| `${field.create?c}` | Field is enabled for code generation |
| `${field.lob?c}` | Field is a Large Object (LOB/BLOB/CLOB) |
| `${field.nullable?c}` | Field allows NULL values |
| `${field.autoincrement?c}` | Field is auto-incrementing (SERIAL, IDENTITY, etc.) |
| `${field.attachFileType?c}` | Field is an attachment/file upload type |
| `${field.primitiveType?c}` | Field maps to a Java primitive type (`int`, `long`, etc.) |
| `${field.unique?c}` | Field has a UNIQUE constraint |
| `${field.hasNullValue?c}` | Field can have a null value representation |

#### Validation Boolean Properties

| Expression | Description |
|---|---|
| `${field.emptyColumnName?c}` | Column name is empty |
| `${field.emptyColumnType?c}` | Column type is empty |
| `${field.emptyFieldName?c}` | Field name is empty |
| `${field.emptyFieldType?c}` | Field type is empty |
| `${field.haveSpaceColumnName?c}` | Column name contains spaces |
| `${field.haveSpaceColumnType?c}` | Column type contains spaces |
| `${field.reservedFieldName?c}` | Field name is a Java reserved word |
| `${field.validColumnSize?c}` | Column size is valid |
| `${field.validFieldType?c}` | Field type is valid |
| `${field.validNullable?c}` | Nullable attribute is valid |
| `${field.validPatternFieldName?c}` | Field name matches a valid naming pattern |
| `${field.validPatternFieldType?c}` | Field type matches a valid naming pattern |

> **Note:** `hasNullValue` can also be invoked as a method: `${field.hasNullValue()?c}`.

---

### 5. Foreign Key Relationships

#### Exported Keys (Current Table's PK Referenced by Other Tables)

```freemarker
<#list entity.exportedKeys as exportedKey>
  <!-- Each exportedKey represents a relationship where another table references this entity -->
</#list>
```

#### Imported Keys (Current Table References Another Table's PK)

```freemarker
<#list entity.importedKeys as importedKey>
  <!-- Each importedKey represents a relationship where this entity references another table -->
</#list>
```

#### Key Object Properties (Same for Both Exported and Imported)

| Expression | Type | Description |
|---|---|---|
| `${key.pkTableName}` | String | Primary key table name |
| `${key.pkBaseName}` | String | Primary key table base name (lowercase) |
| `${key.pkColumnName}` | String | Primary key column name |
| `${key.fkTableName}` | String | Foreign key table name |
| `${key.fkBaseName}` | String | Foreign key table base name (lowercase) |
| `${key.fkColumnName}` | String | Foreign key column name |
| `${key.fkSequence}` | Integer | Foreign key sequence number (for composite FKs) |
| `${key.updateRule}` | Integer | JDBC update rule constant (e.g., CASCADE=0, RESTRICT=1) |
| `${key.deleteRule}` | Integer | JDBC delete rule constant |
| `${key.fkName}` | String | Foreign key constraint name |
| `${key.pkName}` | String | Primary key constraint name |
| `${key.create?c}` | Boolean | Key is enabled for code generation |
| `${key.exported!false?c}` | Boolean | Key is exported (default `false`) |
| `${key.selected!false?c}` | Boolean | Key is selected in the UI (default `false`) |

---

### 6. Import Statements

The entity provides pre-computed Java import information:

```freemarker
<#-- List of simple class names that need importing -->
<#list entity.importClassNameList as className>
  ${className}  <#-- e.g., "BigDecimal", "LocalDateTime" -->
</#list>

<#-- List of complete import declaration statements -->
<#list entity.importDeclarations as declaration>
  ${declaration}  <#-- e.g., "import java.math.BigDecimal;" -->
</#list>
```

---

### 7. File Templates (`adv.fileTmplts`)

Represents all template files loaded into The Factor's project:

```freemarker
<#list adv.fileTmplts as fileTemplate>
  ${fileTemplate.name}          <#-- Template file name -->
  ${fileTemplate.path}          <#-- Template file path -->
  ${fileTemplate.relativePath}  <#-- Relative path from template root -->
  ${fileTemplate.absolutePath}  <#-- Absolute file system path -->
  ${fileTemplate.generatedPath} <#-- Output path after generation -->
  ${fileTemplate.generatedType} <#-- Generation type: one, many, or copy -->
  ${fileTemplate.size}          <#-- File size in bytes -->
  ${fileTemplate.allFileAttrSelected?c} <#-- All attributes selected -->
  ${fileTemplate.create?c}      <#-- Enabled for generation -->
  ${fileTemplate.selected?c}    <#-- Selected in the UI -->

  <#-- File-level attributes (Private/Public objects defined in this template) -->
  <#list fileTemplate.fileAttrList as attr>
    ${attr.name}  <#-- Attribute name (e.g., PRV_SYS_GEN_TYPE) -->
    ${attr.value} <#-- Attribute value (e.g., many) -->
    ${attr.desc}  <#-- Attribute description -->
    ${attr.no}    <#-- Attribute sequence number -->
    ${attr.allFileAttrSelected?c} <#-- All attributes selected -->
    ${attr.create?c}              <#-- Attribute is active -->
  </#list>
</#list>
```

---

### 8. Attribute Maps

These are key-value hash maps containing resolved attribute values:

#### `adv.fileDefaultAttrs`

Default system attributes. Iterated as a hash:

```freemarker
<#list adv.fileDefaultAttrs as key, value>
  ${key}: ${value}
</#list>
```

#### `adv.filePublicAttrs`

Public attributes resolved across all templates:

```freemarker
<#list adv.filePublicAttrs as key, value>
  ${key}: ${value}
</#list>
```

---

### 9. Draft Template (`adv.draftTemplate`)

Used for reverse-engineering: scanning existing source code to create draft templates. **Not used during normal code generation.**

| Expression | Type | Description |
|---|---|---|
| `${adv.draftTemplate.appDir!''}` | String | Application directory path |
| `${adv.draftTemplate.create?c}` | Boolean | Draft template creation enabled |
| `${adv.draftTemplate.draftDir!''}` | String | Draft output directory path |

#### Draft Template Key-Value Pairs

```freemarker
<#list adv.draftTemplateKeyValue as dtkv>
  ${dtkv.name}        <#-- Key name -->
  ${dtkv.value}       <#-- Key value -->
  ${dtkv.no}          <#-- Sequence number -->
  ${dtkv.create?c}    <#-- Enabled flag -->
  ${dtkv.selected?c}  <#-- Selected flag -->
</#list>
```

---

## File Template Data Model Objects

These objects control **how** output files are generated. They are defined inside FreeMarker comments at the top of each `.ftl` template file using a **pipe-delimited syntax**.

### Definition Syntax

All file template objects are defined inside a FreeMarker comment block using:

```
${OBJECT_NAME|<Value>|<Description>}
```

- **`OBJECT_NAME`**: The variable name (must follow the naming conventions below)
- **`<Value>`**: The default value (**must NOT contain `${...}` expressions**)
- **`<Description>`**: Human-readable explanation of purpose and usage

**Example template header:**

```freemarker
<#--
${PRV_SYS_GEN_TYPE|many|Generate multiple files, one per entity}
${PRV_SYS_GEN_PATH|src/main/java|Output path relative to deployment root}
${PRV_SYS_GEN_FILENAME|[class].java|Dynamic filename using entity class name}
${PRV_SYS_IS_REPLACE|true|Overwrite existing files}
${PRV_SYS_JAVA_PACKAGE|com.example.model|Java package name}

${PUB_DB_TYPE|postgresql|Target database type}
${PUB_APP_PKG|my-application|Application package identifier}

${PRV_TABLE_PREFIX|TBL_|Table prefix to strip from class names}
-->
```

> ⚠️ **Critical Rule:** The `<Value>` field must **never** contain `${...}` FreeMarker expressions. Only literal values are allowed.

---

### 1. Reserved Private System Objects

These are **predefined** system variables with fixed names that control file generation behavior.

#### 1.1. `PRV_SYS_GEN_TYPE` — Generation Type

Controls **how** the template is processed:

| Value | Behavior |
|---|---|
| **`one`** | Process the template with FreeMarker and generate **a single output file**. All FreeMarker expressions, directives, macros, and attribute placeholders are evaluated. |
| **`many`** | Process the template with FreeMarker and generate **one output file per entity**. The template is executed once per selected entity; inside the template, `${entity}` refers to the current entity. All FreeMarker expressions are evaluated. |
| **`copy`** | Copy the template file **as-is** with **no FreeMarker processing**. All FreeMarker directives, expressions, macros, and attribute placeholders remain as literal text in the output. |

**Default:** `copy` (if not specified).

**Definition Example:**

```freemarker
<#-- ${PRV_SYS_GEN_TYPE|many|Generate one file per database entity} -->
```

**Usage:** After definition, use `${PRV_SYS_GEN_TYPE}` anywhere in the template body to output its value.

---

#### 1.2. `PRV_SYS_GEN_PATH` — Output Folder Path

Defines the **folder path** (relative to the deployment root directory) where the generated output file(s) will be placed.

- If not specified, files are placed directly in the deployment root directory.
- Directories are **automatically created** if they don't exist.
- When `PRV_SYS_GEN_TYPE` is `many`, the value may contain **template placeholders** that are dynamically replaced per entity:

| Placeholder | Entity Property | Example Value |
|---|---|---|
| `[table]` | `${entity.tableName}` | `USER_PROFILES` |
| `[base]` | `${entity.baseName}` | `userprofile` |
| `[class]` | `${entity.className}` | `UserProfile` |
| `[instance]` | `${entity.instanceName}` | `userProfile` |

**Examples:**

```freemarker
<#-- For generation type 'one': -->
<#-- ${PRV_SYS_GEN_PATH|src/main/resources|Static output path} -->

<#-- For generation type 'many' with dynamic paths: -->
<#-- ${PRV_SYS_GEN_PATH|src/main/java/[class]/[instance]|Dynamic path per entity} -->
```

---

#### 1.3. `PRV_SYS_GEN_FILENAME` — Output File Name

Defines a **custom file name** for the generated output, overriding the template's own file name.

- If not specified, the template's filename is used (with `.ftl` extension removed for `one`/`many` types).
- The `.ftl` extension is **always stripped** automatically from the output filename.
- When `PRV_SYS_GEN_TYPE` is `many`, supports the same **template placeholders** as `PRV_SYS_GEN_PATH`:

| Placeholder | Entity Property |
|---|---|
| `[table]` | `${entity.tableName}` |
| `[base]` | `${entity.baseName}` |
| `[class]` | `${entity.className}` |
| `[instance]` | `${entity.instanceName}` |

**Examples:**

```freemarker
<#-- For 'one': fixed filename -->
<#-- ${PRV_SYS_GEN_FILENAME|application.properties|Configuration file} -->

<#-- For 'many': dynamic filename per entity -->
<#-- ${PRV_SYS_GEN_FILENAME|[class]Repository.java|Repository class per entity} -->
```

---

#### 1.4. `PRV_SYS_IS_REPLACE` — File Replacement Policy

Controls whether existing output files are overwritten:

| Value | Behavior |
|---|---|
| `true` | Overwrite (replace) existing files |
| `false` | Do NOT overwrite; add a unique suffix to the filename to avoid conflicts |

**Default:** `false` (if not specified).

**Example:**

```freemarker
<#-- ${PRV_SYS_IS_REPLACE|true|Always overwrite existing files} -->
```

---

#### 1.5. `PRV_SYS_JAVA_PACKAGE` — Java Package Name and Directory

Defines the **Java package name** and **automatically creates the corresponding directory structure** (dots converted to path separators).

- **Only valid** when `PRV_SYS_GEN_TYPE` is `many`.
- The package value is used both as the `package` declaration in Java files **and** to create the directory path.
- Supports the same **template placeholders** as `PRV_SYS_GEN_PATH`.

**Final Generated Path Formula:**

```
[Root Deployment Dir] + [PRV_SYS_GEN_PATH] + [PRV_SYS_JAVA_PACKAGE (dots→slashes)] + [PRV_SYS_GEN_FILENAME]
```

**Example:**

```freemarker
<#--
${PRV_SYS_GEN_TYPE|many|One file per entity}
${PRV_SYS_GEN_PATH|src/main/java|Java source root}
${PRV_SYS_JAVA_PACKAGE|com.example.model|Model package}
${PRV_SYS_GEN_FILENAME|[class].java|Entity class file}
-->

package ${PRV_SYS_JAVA_PACKAGE};
```

This would generate: `src/main/java/com/example/model/UserProfile.java` (for entity with className `UserProfile`).

---

### 2. Reserved Public System Objects (Data Type Mapping)

Allows overriding how database column types map to programming language types.

#### Definition Syntax

```
${PUB_SYS_DTM@<DB_TYPE>|<LANG_TYPE>|<Description>}
```

- **`PUB_SYS_DTM`**: Fixed keyword prefix
- **`@<DB_TYPE>`**: Source database data type (e.g., `integer`, `text`, `timestamp`)
- **`<LANG_TYPE>`**: Target programming language type (e.g., `Integer`, `String`, `LocalDateTime`)
- **`<Description>`**: Category or purpose description

> **Condition:** Only applied when `PRV_SYS_GEN_TYPE` is `one` or `many`.

> **Usage:** These are **definition-only** — they cannot be referenced with `${...}` in the template body. They configure the mapping system that determines `field.fieldType` and `field.simpleFieldType` values.

#### Complete PostgreSQL → Java Mapping Example

```freemarker
<#--
${PUB_SYS_DTM@smallint|Short|Numeric type mapping}
${PUB_SYS_DTM@integer|Integer|Numeric type mapping}
${PUB_SYS_DTM@bigint|Long|Numeric type mapping}
${PUB_SYS_DTM@decimal|BigDecimal|Numeric type mapping}
${PUB_SYS_DTM@numeric|BigDecimal|Numeric type mapping}
${PUB_SYS_DTM@real|Float|Numeric type mapping}
${PUB_SYS_DTM@double|Double|Numeric type mapping}
${PUB_SYS_DTM@character|String|Character type mapping}
${PUB_SYS_DTM@char|String|Character type mapping}
${PUB_SYS_DTM@varchar|String|Character type mapping}
${PUB_SYS_DTM@text|String|Character type mapping}
${PUB_SYS_DTM@bytea|byte[]|Binary type mapping}
${PUB_SYS_DTM@date|LocalDate|Date/Time type mapping}
${PUB_SYS_DTM@time|LocalTime|Date/Time type mapping}
${PUB_SYS_DTM@timestamp|LocalDateTime|Date/Time type mapping}
${PUB_SYS_DTM@interval|String|Date/Time type mapping}
${PUB_SYS_DTM@boolean|Boolean|Boolean type mapping}
${PUB_SYS_DTM@uuid|UUID|UUID type mapping}
${PUB_SYS_DTM@json|String|JSON type mapping}
${PUB_SYS_DTM@jsonb|String|JSON type mapping}
${PUB_SYS_DTM@enum|String|Enum type mapping}
-->
```

#### Reference: Database → Java Type Mapping Table

| DB Type | Java Type(s) | Category |
|---|---|---|
| `smallint` | `short`, `Short` | Numeric |
| `integer` | `int`, `Integer` | Numeric |
| `bigint` | `long`, `Long` | Numeric |
| `decimal`, `numeric` | `BigDecimal` | Numeric |
| `real` | `float`, `Float` | Numeric |
| `double` | `double`, `Double` | Numeric |
| `character`, `char`, `varchar`, `text` | `String` | Character |
| `bytea` | `byte[]` | Binary |
| `date` | `java.sql.Date`, `java.time.LocalDate` | Date/Time |
| `time` | `java.sql.Time`, `java.time.LocalTime` | Date/Time |
| `timestamp` | `java.time.LocalDateTime`, `java.sql.Timestamp` | Date/Time |
| `interval` | `String` | Date/Time |
| `boolean` | `boolean`, `Boolean` | Boolean |
| `uuid` | `java.util.UUID` | UUID |
| `json`, `jsonb` | `String` | JSON |
| `enum` | `String` | Enum |
| `bit` | `BitSet` | Bit |
| `tsvector`, `tsquery` | `String` | Text Search |
| `cidr`, `inet`, `macaddr` | `String` | Network Address |

---

### 3. Public Objects

Dynamic, user-defined configuration variables shared across **all** templates in the project.

#### Definition Rules

- **Prefix:** Must start with `PUB_` (e.g., `PUB_DB_TYPE`, `PUB_APP_PKG`)
- **Scope:** Global — the same `PUB_*` variable can appear in multiple templates
- **Value Resolution:** When defined in multiple templates, the value from the **most recently modified** template is used
- **Override:** Values can be centrally overridden in The Factor's Public Attributes table, which takes precedence over file-defined values
- **Condition:** Only evaluated when `PRV_SYS_GEN_TYPE` is `one` or `many`

#### Definition and Usage

```freemarker
<#-- Definition (in comment block): -->
<#--
${PUB_DB_TYPE|postgresql|Target database: db2, postgresql, oracle, sqlserver, mysql}
${PUB_APP_IP|localhost|Application server IP address}
${PUB_DB_IP|localhost|Database server IP address}
${PUB_DB_PORT|5432|Database port: db2-50000, postgresql-5432, oracle-1521, sqlserver-1433, mysql-3306}
${PUB_DB_USER|postgres|Database username}
${PUB_DB_NAME|postgres|Database name}
${PUB_DB_PASS|P@ssw0rd|Database password}
${PUB_APP_PKG|my-application|Application package/module name}
-->

<#-- Usage (in template body): -->
spring.datasource.url=jdbc:${PUB_DB_TYPE}://${PUB_DB_IP}:${PUB_DB_PORT}/${PUB_DB_NAME}
spring.datasource.username=${PUB_DB_USER}
spring.datasource.password=${PUB_DB_PASS}
```

---

### 4. Private Objects

Dynamic, user-defined configuration variables scoped to a **single** template file.

#### Definition Rules

- **Prefix:** Must start with `PRV_` (e.g., `PRV_DB_TYPE`, `PRV_TABLE_PREFIX`)
- **Must NOT** use reserved names (`PRV_SYS_GEN_TYPE`, `PRV_SYS_GEN_PATH`, `PRV_SYS_GEN_FILENAME`, `PRV_SYS_IS_REPLACE`, `PRV_SYS_JAVA_PACKAGE`)
- **Scope:** Per-file — the same `PRV_*` variable in different templates has its **own independent value**
- **Override:** Values can be overridden in The Factor's Private (File) Attributes table
- **Condition:** Only evaluated when `PRV_SYS_GEN_TYPE` is `one` or `many`

#### Definition and Usage

```freemarker
<#-- Definition (in comment block): -->
<#--
${PRV_DB_TYPE|postgresql|Database type for this specific template}
${PRV_TABLE_PREFIX|TBL_|Table prefix to strip}
${PRV_AUTHOR|Generated by Factor|Author annotation value}
-->

<#-- Usage (in template body): -->
/**
 * @author ${PRV_AUTHOR}
 * Database: ${PRV_DB_TYPE}
 */
```

---

## Generation Types — Behavior Rules

### `copy` — Copy As-Is

| Rule | Details |
|---|---|
| **Applies to** | Files AND folders |
| **FreeMarker processing** | **None** — all directives, expressions, macros render as literal text |
| **File name** | Unchanged |
| **Folder behavior** | Entire folder tree (including subfolders and files) is copied recursively |
| **Replacement** | Always overwrites |
| **Active system attributes** | Only `PRV_SYS_GEN_TYPE` and `PRV_SYS_GEN_PATH` |
| **All other attributes** | Ignored — no effect |

### `one` — Single File Generation

| Rule | Details |
|---|---|
| **Applies to** | Files only (folders are always copied) |
| **FreeMarker processing** | **Full** — all directives, expressions, macros, and attributes are evaluated |
| **`.ftl` extension** | Automatically removed from output filename |
| **Entity context** | No automatic entity — use `<#list adv.entities as entity>` or `<#list ents as entity>` to iterate |
| **Active system attributes** | All: `PRV_SYS_GEN_TYPE`, `PRV_SYS_GEN_PATH`, `PRV_SYS_GEN_FILENAME`, `PRV_SYS_IS_REPLACE` |
| **Other attributes** | All public (`PUB_*`), private (`PRV_*`), and data type mappings (`PUB_SYS_DTM@*`) are active |

### `many` — One File Per Entity

| Rule | Details |
|---|---|
| **Applies to** | Files only (folders are always copied) |
| **FreeMarker processing** | **Full** — all directives, expressions, macros, and attributes are evaluated |
| **`.ftl` extension** | Automatically removed from output filename |
| **Entity context** | `${entity}` refers to the **current entity** — template is executed once per selected entity. **No need** for `<#list>` to access the current entity. |
| **Placeholders** | `[table]`, `[base]`, `[class]`, `[instance]` in `PRV_SYS_GEN_PATH`, `PRV_SYS_GEN_FILENAME`, and `PRV_SYS_JAVA_PACKAGE` are dynamically replaced |
| **Active system attributes** | All: `PRV_SYS_GEN_TYPE`, `PRV_SYS_GEN_PATH`, `PRV_SYS_GEN_FILENAME`, `PRV_SYS_IS_REPLACE`, `PRV_SYS_JAVA_PACKAGE` |
| **Full path formula** | `[RootDir] + [PRV_SYS_GEN_PATH] + [PRV_SYS_JAVA_PACKAGE as path] + [PRV_SYS_GEN_FILENAME]` |

---

## FreeMarker Syntax Reference

Quick reference for Apache FreeMarker 2.3.26 syntax used in The Factor templates.

### Variable Output

```freemarker
${variable}                      <#-- Output variable value -->
${variable!'default'}            <#-- Output with default if null -->
${variable?c}                    <#-- Convert boolean to "true"/"false" string -->
${variable?has_content?c}        <#-- Check if variable has content (boolean string) -->
${variable?datetime}             <#-- Format as datetime -->
${variable?counter}              <#-- Loop counter (1-based, only inside <#list>) -->
${variable?index}                <#-- Loop index (0-based, only inside <#list>) -->
${variable?join(", ")}           <#-- Join list elements with separator -->
${variable?cap_first}            <#-- Capitalize first letter -->
${variable?lower_case}           <#-- Convert to lowercase -->
${variable?upper_case}           <#-- Convert to uppercase -->
${variable?length}               <#-- Get string length or list size -->
${variable?replace("a", "b")}    <#-- String replacement -->
${variable?trim}                 <#-- Trim whitespace -->
${variable?string("yes","no")}   <#-- Boolean to custom string -->
```

### Conditional Logic

```freemarker
<#if condition>
  content
<#elseif other_condition>
  other content
<#else>
  default content
</#if>
```

### List Iteration

```freemarker
<#list collection as item>
  ${item?counter}: ${item.property}
  <#if item?is_last>This is the last item</#if>
  <#if item?is_first>This is the first item</#if>
  <#sep>, </#sep>  <#-- Separator between items (not after last) -->
<#else>
  No items found   <#-- Shown if list is empty -->
</#list>
```

### Variable Assignment

```freemarker
<#assign myVar = "value">
<#assign myList = ["a", "b", "c"]>
<#assign myHash = {"key1": "val1", "key2": "val2"}>
```

### Macros and Functions

```freemarker
<#macro myMacro param1 param2="default">
  Output: ${param1}, ${param2}
</#macro>
<@myMacro param1="value1" />

<#function myFunc x y>
  <#return x + y>
</#function>
${myFunc(1, 2)}
```

### Include and Import

```freemarker
<#include "lib/myinclude.ftl">            <#-- Include another template -->
<#import "lib/mylib.ftl" as lib>          <#-- Import as namespace -->
<@lib.myMacro param="value" />            <#-- Call imported macro -->
```

### Escape Prevention

```freemarker
<#noparse>
  ${this.will.not.be.evaluated}   <#-- Rendered as literal text -->
</#noparse>
```

### Hash (Map) Iteration

```freemarker
<#list myHash as key, value>
  ${key}: ${value}
</#list>
```

---

## End-to-End Template Examples

### Example 1: Java Entity/Model Class (`many` type)

This template generates one Java POJO class per database table:

```freemarker
<#--
${PRV_SYS_GEN_TYPE|many|Generate one Java class per entity}
${PRV_SYS_GEN_PATH|src/main/java|Java source root}
${PRV_SYS_GEN_FILENAME|[class].java|Class file named after entity}
${PRV_SYS_IS_REPLACE|true|Overwrite existing files}
${PRV_SYS_JAVA_PACKAGE|com.example.model|Model package}

${PUB_SYS_DTM@integer|Integer|Integer type mapping}
${PUB_SYS_DTM@text|String|String type mapping}
${PUB_SYS_DTM@boolean|Boolean|Boolean type mapping}
${PUB_SYS_DTM@timestamp|LocalDateTime|DateTime type mapping}
${PUB_SYS_DTM@decimal|BigDecimal|BigDecimal type mapping}
${PUB_SYS_DTM@bigint|Long|Long type mapping}
${PUB_SYS_DTM@date|LocalDate|LocalDate type mapping}
${PUB_SYS_DTM@uuid|UUID|UUID type mapping}
-->
package ${PRV_SYS_JAVA_PACKAGE};

<#list entity.importDeclarations as import>
${import}
</#list>

/**
 * Entity class for table: ${entity.tableName}
 * <#if entity.remarks?has_content>Description: ${entity.remarks}</#if>
 */
public class ${entity.className} {

    // Fields
<#list entity.fieldList as field>
    private ${field.simpleFieldType} ${field.fieldName};<#if field.remarks?has_content> // ${field.remarks}</#if>
</#list>

    // Default constructor
    public ${entity.className}() {
    }

    // Getters and Setters
<#list entity.fieldList as field>
    public ${field.simpleFieldType} ${field.getterMethodName}() {
        return this.${field.fieldName};
    }

    public void ${field.setterMethodName}(${field.simpleFieldType} ${field.fieldName}) {
        this.${field.fieldName} = ${field.fieldName};
    }

</#list>
    @Override
    public String toString() {
        return "${entity.className}{" +
<#list entity.toStringFieldList as field>
            "${field.fieldName}=" + ${field.fieldName}<#sep> + ", " +</#sep>
</#list>
            + '}';
    }
}
```

**Output:** For a table `USER_PROFILES`, this generates `src/main/java/com/example/model/UserProfile.java`.

---

### Example 2: SQL DDL Script (`one` type)

This template generates a single SQL file containing CREATE TABLE statements for all entities:

```freemarker
<#--
${PRV_SYS_GEN_TYPE|one|Generate a single DDL script}
${PRV_SYS_GEN_PATH|src/main/resources/db|Database scripts directory}
${PRV_SYS_GEN_FILENAME|schema.sql|DDL script filename}
${PRV_SYS_IS_REPLACE|true|Overwrite existing file}

${PUB_DB_TYPE|postgresql|Target database type}
-->
-- Generated DDL Script
-- Database: ${PUB_DB_TYPE}
-- Schema: ${dbs.schema}
-- Generated: ${adv.buildDate?datetime}

<#list adv.entities as entity>
CREATE TABLE ${entity.tableName} (
<#list entity.fieldListSortByOrdinalPosition as field>
    ${field.columnName} ${field.columnType}<#if !field.nullable> NOT NULL</#if><#if field.autoincrement> GENERATED ALWAYS AS IDENTITY</#if><#sep>,</#sep>
</#list>
<#if entity.hasPrimaryKey>
    , PRIMARY KEY (<#list entity.primaryKeyFieldList as pk>${pk.columnName}<#sep>, </#sep></#list>)
</#if>
);

</#list>
```

---

### Example 3: Spring Data JPA Repository (`many` type)

```freemarker
<#--
${PRV_SYS_GEN_TYPE|many|One repository per entity}
${PRV_SYS_GEN_PATH|src/main/java|Java source root}
${PRV_SYS_GEN_FILENAME|[class]Repository.java|Repository interface}
${PRV_SYS_IS_REPLACE|true|Overwrite existing}
${PRV_SYS_JAVA_PACKAGE|com.example.repository|Repository package}
-->
package ${PRV_SYS_JAVA_PACKAGE};

import com.example.model.${entity.className};
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ${entity.className}Repository extends JpaRepository<${entity.className}, <#if entity.hasPrimaryKeySingle><#list entity.primaryKeyFieldList as pk>${pk.simpleFieldType}</#list><#else>Object</#if>> {
<#list entity.fieldList as field>
<#if field.unique>

    ${entity.className} findBy${field.firstCapFieldName}(${field.simpleFieldType} ${field.fieldName});
</#if>
</#list>
}
```

---

### Example 4: Configuration File (`copy` type)

```freemarker
<#--
${PRV_SYS_GEN_TYPE|copy|Copy as-is without processing}
${PRV_SYS_GEN_PATH|src/main/resources|Resources directory}
-->
# This file is copied as-is. FreeMarker expressions like ${this} are NOT evaluated.
spring.application.name=my-app
server.port=8080
```

---

## Instructions for AI

When generating FreeMarker (`.ftl`) templates for The Factor, follow these rules:

1. **Always use proper FreeMarker syntax** — `<#list>`, `<#if>`, `${variable}` expressions.
2. **Always include private system attributes** in a comment block at the top of the template. At minimum, include `PRV_SYS_GEN_TYPE`. Add other attributes as needed.
3. **Use null-safe operators** — `!'default'` for strings that may be null, `?has_content` to check for non-empty values.
4. **Convert booleans to strings** using `?c` (e.g., `${field.nullable?c}` outputs `"true"` or `"false"`).
5. **Access nested objects** using dot notation (e.g., `entity.fieldList`, `field.fieldName`).
6. **Iterate collections** using `<#list collection as item>` with proper `</#list>` closing tags.
7. **Use template placeholders** (`[table]`, `[base]`, `[class]`, `[instance]`) in `PRV_SYS_GEN_PATH`, `PRV_SYS_GEN_FILENAME`, and `PRV_SYS_JAVA_PACKAGE` for dynamic file paths when generation type is `many`.
8. **Include data type mappings** (`PUB_SYS_DTM@...`) in the comment block when generating type-specific code (e.g., Java classes).
9. **Include public attributes** (`PUB_*`) for environment/project configuration that should be shared across templates.
10. **Include private attributes** (`PRV_*`) for template-specific configuration.
11. **For `many` type templates**, access the current entity directly via `${entity}` — do NOT wrap in `<#list adv.entities as entity>`.
12. **For `one` type templates**, iterate entities explicitly: `<#list adv.entities as entity>` or `<#list ents as entity>`.
13. **Structure templates** with proper indentation for readability.
14. **Values in definitions must be literals** — never use `${...}` expressions inside the `<Value>` field of pipe-delimited attribute definitions.
15. **Use `<#sep>` for separators** in lists to avoid trailing commas or delimiters.

---

No explanation needed — just confirm "understood" and use this prompt for generating FreeMarker templates.
