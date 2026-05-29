create ai prompt from below FreeMarker data model and all information on below content, so then i will  use it to prompt to ai like chatgpt, deepseek, copilot, gemini, and then ai will easy to understand it and use it, please to list all attributes from the object, because the prompt will be use many time without loosing all thing, the prompt will be use by ai for generating freemarker file that i want:

### ✅ **FreeMarker Database Data Model Summary (`dbs`)**

#### 🔹 **Collection Fields (Iterable Lists)**

Each can be iterated using `<#list>` in FreeMarker templates:

* `dbs.catalogs` → list of catalogs
* `dbs.schemas` → list of schemas
* `dbs.tableTypes` → list of table types
* `dbs.tableTypesList` → another list of table types

**Usage:**

```ftl
<#list dbs.catalogs as i>
  ${i?counter}: ${i}
</#list>
```

---

#### 🔹 **Single Field Access (Properties)**

These are simple property reads:

```ftl
${dbs.catalog}
${dbs.create?c}
${dbs.driverClassName}
${dbs.driverFile}
${dbs.name}
${dbs.password}
${dbs.profileName}
${dbs.schema}
${dbs.tablePattern}
${dbs.tableType}
${dbs.url}
${dbs.user}
```

---

#### 🔹 **Setters (Overriding Data Programmatically in Template)**

These can be used to override values from within `.ftl` templates:

| Property       | Setter Example                         | Usage Output          |
| -------------- | -------------------------------------- | --------------------- |
| `catalog`      | `${dbs.setCatalog('catalog')}`         | `${dbs.catalog}`      |
| `create`       | `${dbs.setCreate(true)}`               | `${dbs.create?c}`     |
| `name`         | `${dbs.setName('name')}`               | `${dbs.name}`         |
| `password`     | `${dbs.setPassword('password')}`       | `${dbs.password}`     |
| `profileName`  | `${dbs.setProfileName('profileName')}` | `${dbs.profileName}`  |
| `schema`       | `${dbs.setSchema('schema')}`           | `${dbs.schema}`       |
| `tablePattern` | `${dbs.setTablePattern('pattern')}`    | `${dbs.tablePattern}` |
| `tableType`    | `${dbs.setTableType('type')}`          | `${dbs.tableType}`    |

---

### 🔍 **Usage Context**

* You pass a `dbs` Java object into FreeMarker as part of the data model.
* The template accesses fields or modifies them using getters/setters.
* Lists are rendered with `<#list>`, and individual values use `${}` syntax.
* Setters are usually discouraged in pure presentation logic but can be used for quick override scenarios.

---

## 🟢 **A. Reading Data from the `adv` Object (No Modification)**

These expressions are used to **access** or **check** data inside the `adv` object and its nested `generation` object:

| FreeMarker Expression                            | Description                                                  |
| ------------------------------------------------ | ------------------------------------------------------------ |
| `${adv.buildDate?datetime}`                      | Format the `buildDate` as a datetime                         |
| `${adv.comment}`                                 | Output the comment string                                    |
| `${adv.generation.create?c}`                     | Check if `create` is true (`?c` = boolean as "true"/"false") |
| `${adv.generation.outputDir?has_content?c}`      | Check if `outputDir` has content and return "true"/"false"   |
| `${adv.generation.packageName?has_content?c}`    | Check if `packageName` has content and return "true"/"false" |
| `${adv.generation.rootDir}`                      | Output the `rootDir` value                                   |
| `${adv.generation.specifyTemplateDir?c}`         | Boolean check on `specifyTemplateDir`                        |
| `${adv.generation.superClassName?has_content?c}` | Check if `superClassName` has content                        |
| `${adv.generation.templateDir}`                  | Output the `templateDir` value                               |

✅ **Purpose**: These are **read-only** template expressions used for displaying or checking the current state of the `adv` data model.

---

## 🔴 **B. Writing or Modifying Data via Method Calls (Java Object Binding)**

These expressions **call setter methods** on the Java objects behind the `adv` model to **mutate data**:

| FreeMarker Expression                             | Description                                            |
| ------------------------------------------------- | ------------------------------------------------------ |
| `${adv.setBuildDate(.now)}`                       | Sets `buildDate` to the current time                   |
| `${adv.setComment('TEST COMMENT ADDITIONAL')}`    | Sets the comment string                                |
| `${adv.generation.setCreate(true)}`               | Sets `create` flag to true                             |
| `${adv.generation.setOutputDir('outputDir')}`     | Sets the output directory (commented out in your note) |
| `${adv.generation.setPackageName('packageName')}` | Sets the package name                                  |
| `${adv.generation.setRootDir('rootDir')}`         | Sets the root directory                                |
| `${adv.generation.setSpecifyTemplateDir(true)}`   | Enables specifying a template directory                |
| `${adv.generation.setSuperClassName('...')}`      | Sets the super class name                              |
| `${adv.generation.setTemplateDir('templateDir')}` | Sets the template directory path                       |

⚠️ Some expressions were marked with `<!-- DO NOT USE -->` or commented out, suggesting they’re not intended for normal template execution (possibly due to restrictions or side effects).

✅ **Purpose**: These are **mutator calls**, allowed because FreeMarker can call **public Java methods** on data model objects.

---

## ✅ Final Summary

| Section          | Purpose                                                                     |
| ---------------- | --------------------------------------------------------------------------- |
| **A. Read-only** | Output or check the state of the `adv` object                               |
| **B. Modifying** | Call methods on `adv` or `adv.generation` to set values (Java-side effects) |

---

## ✅ **A. Accessing Data (Read-Only Use of FreeMarker Expressions)**

### 🔹 **Direct Field Access with Defaults & Conversions**

You are safely accessing fields of `adv.draftTemplate` using FreeMarker expressions:

| Expression                         | Purpose                                             |
| ---------------------------------- | --------------------------------------------------- |
| `${adv.draftTemplate.appDir!''}`   | Displays `appDir`, or empty string if null.         |
| `${adv.draftTemplate.create?c}`    | Displays `create` boolean as `"true"` or `"false"`. |
| `${adv.draftTemplate.draftDir!''}` | Displays `draftDir`, or empty string if null.       |

---

### 🔹 **Iterating a List: `draftTemplateKeyValue`**

You're looping over a list and printing multiple fields:

```ftl
<#list adv.draftTemplateKeyValue as dtkv>
  ${dtkv.create?c}
  ${dtkv.name}
  ${dtkv.no}
  ${dtkv.selected?c}
  ${dtkv.value}
</#list>
```

| Field                 | Description                                     |
| --------------------- | ----------------------------------------------- |
| `create?c`            | Coerces boolean `create` to `"true"`/`"false"`. |
| `name`, `no`, `value` | Regular string/number values.                   |
| `selected?c`          | Another boolean field rendered as string.       |

---

## ⚠️ **B. Mutating Data via Java Method Calls (Not Recommended)**

You're referencing **Java method calls inside FTL**, which is generally **discouraged**:

| Expression                                     | Meaning                                 |
| ---------------------------------------------- | --------------------------------------- |
| `${adv.draftTemplate.setAppDir('appDir')}`     | Calls Java setter method (side effect). |
| `${adv.draftTemplate.setCreate(true)}`         | Sets a boolean value.                   |
| `${adv.draftTemplate.setDraftDir('draftDir')}` | Sets another field.                     |

> ⚠️ **Warning:** FreeMarker is meant for **presentation (read-only)**, not modifying Java objects. Method calls with side effects (like setters) are **not recommended** inside `.ftl` files.

---

## 📌 Summary

| Section                  | Description                                                                                                                             |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------- |
| **A. Read-Only Access**  | Safely extracts values from Java objects and lists using FreeMarker syntax with defaults and formatting (`!''`, `?c`). ✅ Best practice. |
| **B. Java Method Calls** | Invokes Java methods (e.g., `setXXX`) from the template. ⚠️ Not recommended – violates separation of concerns.                          |


### 🔍 **Overview:**

**AI Prompt: Data Model Description for Database Entities**

This prompt describes a data model representing database entities, their relationships, and their fields. The data is structured as a list of `Entity` objects, each containing various attributes and nested lists of related objects (e.g., `ExportedKey`, `ImportedKey`, `Field`).

---

**Root Object: `adv.entities` (List of `Entity` Objects)**

Each item `i` in `adv.entities` is an `Entity` object with the following attributes:

**`Entity` Object Attributes:**

* **`baseName`**: (String) The base name of the entity.
* **`className`**: (String) The class name derived from the entity.
* **`allFieldSelection`**: (Boolean) Indicates if all fields are selected.
* **`create`**: (Boolean) Indicates if the entity is set for creation.
* **`emptyBaseName`**: (Boolean) Indicates if the base name is empty.
* **`emptyTableName`**: (Boolean) Indicates if the table name is empty.

* **`haveSpaceTableName`**: (Boolean) Indicates if the table name contains spaces.
* **`instanceName`**: (String) The instance name of the entity.

* **`remarks`**: (String) General remarks or comments about the entity. (Defaults to 'null' if not present).
* **`reservedWordBaseName`**: (Boolean) Indicates if the base name is a reserved word.
* **`selected`**: (Boolean) Indicates if the entity is selected.
* **`tableName`**: (String) The name of the database table.
* **`validPatternBaseName`**: (Boolean) Indicates if the base name follows a valid pattern.
* **`hasAttachFileField`**: (Boolean) Indicates if the entity has an attached file field (derived from `hasAttachFileField()`).
* **`hasDuplicateFieldName`**: (Boolean) Indicates if the entity has duplicate field names (derived from `hasDuplicateFieldName()`).
* **`hasLob`**: (Boolean) Indicates if the entity has Large Object (LOB) fields (derived from `hasLob()`).
* **`toStringStatement`**: (String) A string representation statement for the entity.
* **`Test`**: (String) A test attribute derived from `getTest('${i.tableName}')`.

**Nested Lists within `Entity` Object:**

1.  **`exportedKeys`**: (List of `ExportedKey` Objects)
    Each item `m` in `exportedKeys` is an `ExportedKey` object with the following attributes:
    * **`pkTableName`**: (String) Primary key table name.
    * **`pkBaseName`**: (String) Primary key base name.
    * **`pkColumnName`**: (String) Primary key column name.
    * **`fkTableName`**: (String) Foreign key table name.
    * **`fkBaseName`**: (String) Foreign key base name.
    * **`fkColumnName`**: (String) Foreign key column name.
    * **`fkSequence`**: (Integer) Foreign key sequence.
    * **`updateRule`**: (Integer) Update rule for the foreign key.
    * **`deleteRule`**: (Integer) Delete rule for the foreign key.
    * **`fkName`**: (String) Foreign key name.
    * **`pkName`**: (String) Primary key name.
    * **`create`**: (Boolean) Indicates if the key is set for creation.
    * **`exported`**: (Boolean) Indicates if the key is exported. (Defaults to `false`).
    * **`selected`**: (Boolean) Indicates if the key is selected. (Defaults to `false`).

2.  **`importedKeys`**: (List of `ImportedKey` Objects)
    Each item `m` in `importedKeys` is an `ImportedKey` object with the same attributes as `ExportedKey`:
    * **`pkTableName`**: (String) Primary key table name.
    * **`pkBaseName`**: (String) Primary key base name.
    * **`pkColumnName`**: (String) Primary key column name.
    * **`fkTableName`**: (String) Foreign key table name.
    * **`fkBaseName`**: (String) Foreign key base name.
    * **`fkColumnName`**: (String) Foreign key column name.
    * **`fkSequence`**: (Integer) Foreign key sequence.
    * **`updateRule`**: (Integer) Update rule for the foreign key.
    * **`deleteRule`**: (Integer) Delete rule for the foreign key.
    * **`fkName`**: (String) Foreign key name.
    * **`pkName`**: (String) Primary key name.
    * **`create`**: (Boolean) Indicates if the key is set for creation.
    * **`exported`**: (Boolean) Indicates if the key is exported. (Defaults to `false`).
    * **`selected`**: (Boolean) Indicates if the key is selected. (Defaults to `false`).

3.  **`attachFileFieldList`**: (List of `Field` Objects)
    Each item `k` in `attachFileFieldList` is a `Field` object with the following attributes:
    * **`create`**: (Boolean) Indicates if the field is set for creation.
    * **`lob`**: (Boolean) Indicates if the field is a Large Object (LOB).
    * **`nullable`**: (Boolean) Indicates if the field is nullable.
    * **`pkPosition`**: (Integer) Primary key position.
    * **`fieldType`**: (String) The field's Java type.
    * **`fieldName`**: (String) The field's name (Java camelCase).
    * **`columnSize`**: (Integer) The column's size.
    * **`columnType`**: (String) The column's SQL type.
    * **`columnName`**: (String) The column's name in the database.
    * **`remarks`**: (String) Remarks or comments about the field. (Defaults to 'null').
    * **`autoincrement`**: (Boolean) Indicates if the field is auto-incrementing.
    * **`ordinalPosition`**: (Integer) The ordinal position of the column.
    * **`columnDataType`**: (Integer) The SQL data type code.
    * **`attachFileType`**: (Boolean) Indicates if it's an attachment file type.
    * **`emptyColumnName`**: (Boolean) Indicates if the column name is empty.
    * **`emptyColumnType`**: (Boolean) Indicates if the column type is empty.
    * **`emptyFieldName`**: (Boolean) Indicates if the field name is empty.
    * **`emptyFieldType`**: (Boolean) Indicates if the field type is empty.
    * **`firstCapFieldName`**: (String) The field name with the first letter capitalized.
    * **`getterMethodName`**: (String) The getter method name for the field.
    * **`haveSpaceColumnName`**: (Boolean) Indicates if the column name contains spaces.
    * **`haveSpaceColumnType`**: (Boolean) Indicates if the column type contains spaces.
    * **`hasNullValue`**: (Boolean) Indicates if the field can have a null value (derived from `hasNullValue()`).
    * **`nullValue`**: (String) The string representation of a null value for the field. (Defaults to 'null').
    * **`primitiveType`**: (Boolean) Indicates if the field is a primitive Java type.
    * **`reservedFieldName`**: (Boolean) Indicates if the field name is a reserved word.
    * **`setterMethodName`**: (String) The setter method name for the field.
    * **`simpleFieldType`**: (String) The simple Java type of the field (without package).
    * **`simpleObjectClassName`**: (String) The simple object class name for the field.
    * **`toPrimitiveMethod`**: (String) The method to convert to a primitive type. (Defaults to 'null').
    * **`unique`**: (Boolean) Indicates if the field has a unique constraint.
    * **`validColumnSize`**: (Boolean) Indicates if the column size is valid.
    * **`validFieldType`**: (Boolean) Indicates if the field type is valid.
    * **`validNullable`**: (Boolean) Indicates if the nullable attribute is valid.
    * **`validPatternFieldName`**: (Boolean) Indicates if the field name follows a valid pattern.
    * **`validPatternFieldType`**: (Boolean) Indicates if the field type follows a valid pattern.

4.  **`fieldList`**: (List of `Field` Objects)
    Each item `k` in `fieldList` is a `Field` object with the same attributes as `attachFileFieldList`.

5.  **`fieldListExceptLob`**: (List of `Field` Objects)
    Each item `k` in `fieldListExceptLob` is a `Field` object with the same attributes as `attachFileFieldList`. This list specifically excludes LOB fields.

6.  **`primaryKeyFieldList`**: (List of `Field` Objects)
    Each item `k` in `primaryKeyFieldList` is a `Field` object with the same attributes as `attachFileFieldList`. This list contains only the primary key fields.

7.  **`fieldListExceptForeignKey`**: (List of `Field` Objects)
    Each item `k` in `fieldListExceptForeignKey` is a `Field` object with the same attributes as `attachFileFieldList`. This list excludes foreign key fields.

8.  **`fieldListSortByOrdinalPosition`**: (List of `Field` Objects)
    Each item `k` in `fieldListSortByOrdinalPosition` is a `Field` object with the same attributes as `attachFileFieldList`. This list contains fields sorted by their ordinal position.

9.  **`importClassNameList`**: (List of Strings)
    Each item `n` is a `String` representing a class name to be imported.

10. **`importDeclarations`**: (List of Strings)
    Each item `o` is a `String` representing an import declaration statement.

11. **`toStringFieldList`**: (List of `Field` Objects)
    Each item `k` in `toStringFieldList` is a `Field` object with the same attributes as `attachFileFieldList`. This list contains fields relevant for the `toString()` method.

---

**Example of how the AI can interpret and use this data:**

"Given the `Entity` data model, generate a Java class for an `Entity` where `tableName` is 'Users', and then list all its `primaryKeyFieldList`'s `fieldName` and `fieldType`."

The AI can then easily parse the structured data to identify the `Entity` with `tableName` "Users", access its `primaryKeyFieldList`, and extract the `fieldName` and `fieldType` for each `Field` object within that list.

### ✅ **FreeMarker Data Model Summary**

The `adv` object contains the following nested structures:

---

#### 🔹 `adv.fileDefaultAttrs`

* **Type:** Map (or Hash)
* **Usage:** Iterate with `<#list adv.fileDefaultAttrs as k, v>`
* **Example Output:**

  ```
  key1, value1  
  key2, value2  
  ```

---

#### 🔹 `adv.filePublicAttrs`

* **Type:** Map (or Hash)
* **Usage:** Same as `fileDefaultAttrs`
* **Example Output:**

  ```
  keyA, valueA  
  keyB, valueB  
  ```

---

#### 🔹 `adv.fileTmplts`

* **Type:** List of objects

* **Each object (`k`) contains:**

  * `absolutePath` (String)
  * `allFileAttrSelected` (Boolean)
  * `create` (Boolean)
  * `generatedPath` (String)
  * `generatedType` (String)
  * `name` (String)
  * `path` (String)
  * `relativePath` (String)
  * `selected` (Boolean)
  * `size` (Number)

* **Nested List (`k.fileAttrList`) with:**

  * `allFileAttrSelected` (Boolean)
  * `create` (Boolean)
  * `desc` (String)
  * `name` (String)
  * `no` (Number or String)
  * `value` (String)

---

### 📌 Notes for AI usage

* `${var?c}`: Coerces Boolean to `true/false` string.
* `${var!''}`: Null-safe fallback to empty string.
* `${k.name}`: Standard variable access for fields.

---


---

### ✅ **FreeMarker Data Model Summary: Private System Copy Generation**

#### 🔧 **1. Variable Definitions (Used in FTL Comments)**

* Values are defined in a comment block using this pattern:
  `${VAR_NAME|value|description}`
* Example:

  ```freemarker
  <#--
  ${PRV_SYS_GEN_PATH|copy-path|Private System placeholder for create generated relative path}
  ${PRV_SYS_GEN_TYPE|copy|Please choose one option from this Private Gen type list: one, many, copy}
  -->
  ```

#### 📌 **2. Key Private System Variables**

* `PRV_SYS_GEN_TYPE`

  * Defines the generation type (e.g., `one`, `many`, `copy`).
  * Default is `copy` if not provided.
* `PRV_SYS_GEN_PATH`

  * Defines a relative path for generated output.
  * If not provided, outputs to root deployment directory.

#### 🔄 **3. Copy Generation Logic Rules**

* Applies to both files and folders.
* Always copy as-is:

  * Files: name and content remain unchanged.
  * Folders: entire folder (including substructure) is copied.
* Always overwrite (replace existing).
* Only `PRV_SYS_GEN_TYPE` and `PRV_SYS_GEN_PATH` affect the behavior.
* All other system or file attributes (public/private) have **no effect**.
* **No FreeMarker directives, functions, or macros** will be evaluated — they will render as raw code.

---

### 💡 Summary Use Prompt (for AI)

> "This FreeMarker template uses a data model with private system attributes `PRV_SYS_GEN_TYPE` and `PRV_SYS_GEN_PATH`. These are defined in comments using the syntax `${VAR|value|description}`. When `PRV_SYS_GEN_TYPE` is `'copy'`, files or folders are copied as-is to the path specified in `PRV_SYS_GEN_PATH`, defaulting to root if not set. Only these two variables affect generation behavior. All FreeMarker logic (directives/macros/expressions) is rendered as literal text."

### ✅ **FreeMarker Private System Data Model Summary**

This data model controls how files are generated based on metadata embedded in template comments using this syntax:

```
<#-- ${VAR_NAME|value|description} -->
```

Each variable has:

* **Name**: used in the template as `${VAR_NAME}`
* **Value**: used in rendering
* **Description**: human-readable purpose

---

### 📦 **Main Variables (Private System Attributes)**

| Variable               | Purpose                                                                             | Default (if not set) |
| ---------------------- | ----------------------------------------------------------------------------------- | -------------------- |
| `PRV_SYS_GEN_TYPE`     | Defines how the file should be generated: `one`, `many`, or `copy`.                 | `copy`               |
| `PRV_SYS_GEN_PATH`     | Relative path from the root deployment directory where the file will be placed.     | root directory       |
| `PRV_SYS_GEN_FILENAME` | Custom file name for output (removes `.ftl` extension if present).                  | uses template name   |
| `PRV_SYS_IS_REPLACE`   | Whether to overwrite existing file (`true`) or add suffix for uniqueness (`false`). | `false`              |

---

### 📘 **"One" Generation Type Rules**

1. Applies to files only — folders are always copied.
2. `.ftl` file extension is stripped from output file name.
3. Each variable behaves as described above and will be substituted during template rendering.
4. All FreeMarker directives, macros, and attribute placeholders are evaluated before output.

---

### 🧩 **Variable Declaration Format Pattern**

Variables are defined in template comments using this pattern:

```freemarker
<#-- ${VAR_NAME|value|description} -->
```

Example:

```freemarker
<#-- ${PRV_SYS_GEN_TYPE|one|Generation type: one, many, copy} -->
```


### ✅ **FreeMarker Private System Attribute Model Summary**

FreeMarker template uses embedded comments to define **private system attributes** for code generation. These attributes control how files are generated, named, placed, and packaged. The values are passed using a **pipe-delimited syntax**:

```freemarker
<#--
${VARIABLE_NAME|value|description}
-->
```

### 🔧 **Core Attributes**

| Variable               | Description                                                                                                               |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `PRV_SYS_GEN_PATH`     | Relative path pattern for the generated file. Can contain placeholders like `[class]`, `[table]`, `[instance]`, `[base]`. |
| `PRV_SYS_GEN_TYPE`     | Generation type: `one`, `many`, or `copy`. Default is `copy`. Use `many` for generating multiple files.                   |
| `PRV_SYS_GEN_FILENAME` | Target file name to generate (e.g., `MyClass.java`). Supports placeholders. Removes `.ftl` extension automatically.       |
| `PRV_SYS_IS_REPLACE`   | `true` to overwrite existing files, `false` to create a unique file name. Default is `false`.                             |
| `PRV_SYS_JAVA_PACKAGE` | Defines Java package and auto-creates directory structure based on placeholders.                                          |

---

### 📦 **Placeholders in Paths and Filenames**

* `[class]` → Class name
* `[table]` → Table name
* `[instance]` → Instance name
* `[base]` → Base name

These placeholders are dynamically replaced during rendering.

---

### 📁 **Generation Logic for `many` Type**

* Applies only to **files**, not folders.
* Folders are always copied directly.
* `.ftl` extension is stripped from filenames.
* If no values are set for system attributes, defaults are applied.

---

### 🛠 **Final Generated Path Pattern**

```text
[Root Directory Deployment] + [PRV_SYS_GEN_PATH] + [PRV_SYS_JAVA_PACKAGE] + [PRV_SYS_GEN_FILENAME]
```

Ensure the values of `PRV_SYS_GEN_PATH` and `PRV_SYS_JAVA_PACKAGE` are compatible and don't result in conflicting or redundant folder structures.

---

### ✅ **FreeMarker Data Model Summary (Public System Data Type Mapping)**

This logic defines how to map database types to programming language types (e.g., Java) within a FreeMarker template engine, using a customizable and override-friendly system:

---

#### 🔹 **Core Mapping Rule**

* A default mapping exists between **DB data types** and **Java data types**.
* This can be:

  * **Customized** in the field editor.
  * **Overridden** via a logic block called `Public System Data Type Mapping`.

---

#### 🔹 **Mapping Syntax**

```freemarker
${PUB_SYS_DTM@<DB_DT_TYPE>|<PL_DT_TYPE>|<Description>}
```

* `DB_DT_TYPE` = source DB type (e.g., `integer`, `text`)
* `PL_DT_TYPE` = target programming type (e.g., `Integer`, `String`)
* `PUB_SYS_DTM` = special marker for the public mapping rule.

---

#### 🔹 **Condition for Application**

* Applied only when: `PRV_SYS_GEN_TYPE` is set to `'one'` or `'many'`.

---

#### 🔹 **Postgres → Java Mapping Examples**

| **Postgres Type**  | **Java Type(s)**             | **Category**   |
| ------------------ | ---------------------------- | -------------- |
| `integer`          | `int`, `Integer`             | Numeric        |
| `bigint`           | `long`, `Long`               | Numeric        |
| `decimal`          | `BigDecimal`                 | Numeric        |
| `text` / `varchar` | `String`                     | Character/Text |
| `date`             | `java.sql.Date`, `LocalDate` | Date/Time      |
| `timestamp`        | `LocalDateTime`, `Timestamp` | Date/Time      |
| `boolean`          | `boolean`, `Boolean`         | Boolean        |
| `uuid`             | `java.util.UUID`             | UUID           |
| `json`, `jsonb`    | `String`                     | JSON           |
| `bytea`            | `byte[]`                     | Binary         |
| `enum`             | `String`                     | Enum           |

*(Full mapping list available if needed.)*

---

#### 🔹 **Usage in Template**

Iterating over entity fields and accessing their mapped types:

```freemarker
<#list adv.entities as i>
  ${i.tableName}
  <#list i.fieldList as k>
    ${k.fieldType} - ${k.fieldName} - ${k.columnType} - ${k.columnName}
  </#list>
</#list>
```

---

### ✅ **FreeMarker Data Model Summary (for AI)**

#### 🔒 **Private Attributes**

Used internally by the system to control file generation behavior:

* `${PRV_SYS_GEN_PATH}`: Relative output path
* `${PRV_SYS_GEN_TYPE}`: Generation type (`one`, `many`, `copy`)
* `${PRV_SYS_GEN_FILENAME}`: Custom filename (optional override)
* `${PRV_SYS_IS_REPLACE}`: Replace existing file (`true`/`false`)

#### 🌐 **Public Attributes**

Used as dynamic inputs across templates. Can be customized per project or environment:

* `${PUB_DB_TYPE}`: Database type (e.g., `postgresql`, `oracle`)
* `${PUB_APP_IP}`: App server IP
* `${PUB_DB_IP}`: Database IP
* `${PUB_DB_PORT}`: Port number based on DB type
* `${PUB_DB_USER}`: Database user
* `${PUB_DB_NAME}`: Database name
* `${PUB_DB_PASS}`: Database password
* `${PUB_APP_PKG}`: Application package or module name

#### 📐 **Public Attribute Rules**

1. **Pattern**: Use format `${PUB_XXXXX|VALUE|Description}`

   * Customize `XXXXX` freely; keep `PUB_` prefix.
   * `VALUE` is the default value; `Description` is optional documentation.

2. **Multiple Template Support**:

   * Same public attribute can appear in multiple templates.
   * Final value is taken from the most recently updated template.

3. **Override Behavior**:

   * Public attribute values can be centrally updated in a master attribute table.
   * These overrides take precedence over individual template values.

---

### FreeMarker Data Model Summary

* **Private (File) Attributes**

  * Use a naming pattern starting with `PRV_` prefix, e.g., `${PRV_XXXXX|VALUE|Description}`.
  * `XXXXX` is customizable; `VALUE` is the attribute’s value; `Description` is optional documentation.
  * These private attributes can appear in multiple template files, each file can have its own values.
  * Attribute values can be overridden centrally in a "Private (File) Attributes" table, which takes precedence over file-defined values.
  * Common private attributes include file-generation settings like path, filename, generation type, replace flag, etc.

* **Public Attributes**

  * Represent commonly used environment or system settings exposed to templates, e.g.:

    * `PRV_DB_TYPE` (e.g., postgresql, oracle)
    * `PRV_APP_IP`, `PRV_DB_IP` (host IP addresses)
    * `PRV_DB_PORT`, `PRV_DB_USER`, `PRV_DB_NAME`, `PRV_DB_PASS` (database connection info)
    * `PRV_APP_PKG` (application package name)
  * These are accessed in the template like `${PRV_DB_TYPE}` and provide context or configuration data.

---

