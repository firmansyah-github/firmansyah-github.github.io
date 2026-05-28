**AI Prompt: Comprehensive FreeMarker Data Model Reference & Generation Logic**

This document provides a comprehensive reference to the FreeMarker data models available within the application, alongside a detailed explanation of the Java code (`GenerateFileJob`) responsible for rendering these FreeMarker templates into final output files. This dual perspective will enable AI models to understand not just the data structure but also the operational context and generation rules.

-----

## **1. Data Models Reference**

### **1.1. Database Entities Data Model (`adv.entities`)**

The `adv.entities` object represents a list of database entities. Each item in this list is an `Entity` object, containing detailed information about a database table, its fields, and relationships.

#### **`Entity` Object Attributes:**

  * **`baseName`**: (String) The base name derived from the entity.
  * **`className`**: (String) The Java class name for the entity.
  * **`allFieldSelection`**: (Boolean) `true` if all fields of the entity are selected.
  * **`create`**: (Boolean) `true` if the entity is marked for creation.
  * **`emptyBaseName`**: (Boolean) `true` if the `baseName` is empty.
  * **`emptyTableName`**: (Boolean) `true` if the `tableName` is empty.
  * **`haveSpaceTableName`**: (Boolean) `true` if the `tableName` contains spaces.
  * **`instanceName`**: (String) The instance name for the entity.
  * **`remarks`**: (String, defaults to 'null') General comments or description of the entity.
  * **`reservedWordBaseName`**: (Boolean) `true` if `baseName` is a reserved keyword.
  * **`selected`**: (Boolean) `true` if the entity is selected.
  * **`tableName`**: (String) The database table name.
  * **`validPatternBaseName`**: (Boolean) `true` if `baseName` follows a valid naming pattern.
  * **`hasAttachFileField`**: (Boolean) `true` if the entity includes a file attachment field (derived from `hasAttachFileField()`).
  * **`hasDuplicateFieldName`**: (Boolean) `true` if any field names within the entity are duplicated (derived from `hasDuplicateFieldName()`).
  * **`hasLob`**: (Boolean) `true` if the entity contains Large Object (LOB) fields (derived from `hasLob()`).
  * **`toStringStatement`**: (String) A statement used for generating the `toString()` method.

#### **Nested Lists within `Entity` Object:**

All nested lists (`exportedKeys`, `importedKeys`, `attachFileFieldList`, `fieldList`, `fieldListExceptLob`, `primaryKeyFieldList`, `fieldListExceptForeignKey`, `fieldListSortByOrdinalPosition`, `toStringFieldList`) contain objects with consistent attribute sets.

##### **1.1.1. `ExportedKey` / `ImportedKey` Objects (in `exportedKeys` and `importedKeys` lists):**

  * **`pkTableName`**: (String) Primary key table name.
  * **`pkBaseName`**: (String) Primary key base name.
  * **`pkColumnName`**: (String) Primary key column name.
  * **`fkTableName`**: (String) Foreign key table name.
  * **`fkBaseName`**: (String) Foreign key base name.
  * **`fkColumnName`**: (String) Foreign key column name.
  * **`fkSequence`**: (Integer) Foreign key sequence number.
  * **`updateRule`**: (Integer) Update rule for the foreign key.
  * **`deleteRule`**: (Integer) Delete rule for the foreign key.
  * **`fkName`**: (String) Foreign key name.
  * **`pkName`**: (String) Primary key name.
  * **`create`**: (Boolean) `true` if the key is marked for creation.
  * **`exported`**: (Boolean, defaults to `false`) `true` if the key is exported.
  * **`selected`**: (Boolean, defaults to `false`) `true` if the key is selected.

##### **1.1.2. `Field` Objects (in `attachFileFieldList`, `fieldList`, `fieldListExceptLob`, `primaryKeyFieldList`, `fieldListExceptForeignKey`, `fieldListSortByOrdinalPosition`, `toStringFieldList` lists):**

  * **`create`**: (Boolean) `true` if the field is marked for creation.
  * **`lob`**: (Boolean) `true` if the field is a Large Object (LOB) type.
  * **`nullable`**: (Boolean) `true` if the field can store null values.
  * **`pkPosition`**: (Integer) The position of the field if it's part of the primary key.
  * **`fieldType`**: (String) The programming language (e.g., Java) type of the field.
  * **`fieldName`**: (String) The programmatic (camelCase) name of the field.
  * **`columnSize`**: (Integer) The maximum size of the column.
  * **`columnType`**: (String) The SQL data type name of the column.
  * **`columnName`**: (String) The actual column name in the database.
  * **`remarks`**: (String, defaults to 'null') Comments or description for the column.
  * **`autoincrement`**: (Boolean) `true` if the column is auto-incrementing.
  * **`ordinalPosition`**: (Integer) The sequential position of the column in the table.
  * **`columnDataType`**: (Integer) The JDBC `java.sql.Types` integer code for the column's data type.
  * **`attachFileType`**: (Boolean) `true` if the field is specifically for attached files.
  * **`emptyColumnName`**: (Boolean) `true` if `columnName` is empty.
  * **`emptyColumnType`**: (Boolean) `true` if `columnType` is empty.
  * **`emptyFieldName`**: (Boolean) `true` if `fieldName` is empty.
  * **`emptyFieldType`**: (Boolean) `true` if `fieldType` is empty.
  * **`firstCapFieldName`**: (String) The field name with its first letter capitalized.
  * **`getterMethodName`**: (String) The generated getter method name.
  * **`haveSpaceColumnName`**: (Boolean) `true` if `columnName` contains spaces.
  * **`haveSpaceColumnType`**: (Boolean) `true` if `columnType` contains spaces.
  * **`hasNullValue`**: (Boolean) `true` if the field's value is null (derived from `hasNullValue()`).
  * **`nullValue`**: (String, defaults to 'null') The string representation of a null value for this field's type.
  * **`primitiveType`**: (Boolean) `true` if `fieldType` is a Java primitive type.
  * **`reservedFieldName`**: (Boolean) `true` if `fieldName` is a reserved word.
  * **`setterMethodName`**: (String) The generated setter method name.
  * **`simpleFieldType`**: (String) The simple class name of `fieldType` (without package).
  * **`simpleObjectClassName`**: (String) The simple object class name for the field.
  * **`toPrimitiveMethod`**: (String, defaults to 'null') The method name to convert the field to a primitive type.
  * **`unique`**: (Boolean) `true` if the field has a unique constraint.
  * **`validColumnSize`**: (Boolean) `true` if `columnSize` is valid.
  * **`validFieldType`**: (Boolean) `true` if `fieldType` is valid.
  * **`validNullable`**: (Boolean) `true` if `nullable` is valid.
  * **`validPatternFieldName`**: (Boolean) `true` if `fieldName` follows a valid pattern.
  * **`validPatternFieldType`**: (Boolean) `true` if `fieldType` follows a valid pattern.

##### **1.1.3. `importClassNameList`**: (List of Strings)

Each item `n` is a `String` representing a fully qualified class name that needs to be imported.

##### **1.1.4. `importDeclarations`**: (List of Strings)

Each item `o` is a `String` representing a full import statement (e.g., `import java.util.List;`).

-----

### **1.2. Database Connection Data Model (`dbs`)**

The `dbs` object provides access to database connection and metadata properties.

#### **1.2.1. Collection Fields (Iterable Lists):**

These can be iterated using `<#list dbs.<listName> as i>`.

  * **`dbs.catalogs`**: (List of Strings) List of available database catalogs.
  * **`dbs.schemas`**: (List of Strings) List of available database schemas.
  * **`dbs.tableTypes`**: (List of Strings) List of supported table types (e.g., `TABLE`, `VIEW`).
  * **`dbs.tableTypesList`**: (List of Strings) Another list of supported table types, potentially for a different context or format.

#### **1.2.2. Single Field Access (Properties):**

These are direct property reads using `${dbs.<propertyName>}`.

  * **`dbs.catalog`**: (String) The currently selected database catalog.
  * **`dbs.create`**: (Boolean) Indicates a creation flag for the database context.
  * **`dbs.driverClassName`**: (String) The JDBC driver class name.
  * **`dbs.driverFile`**: (String) The path to the JDBC driver file.
  * **`dbs.name`**: (String) The database connection name.
  * **`dbs.password`**: (String) The database user's password.
  * **`dbs.profileName`**: (String) The name of the database profile.
  * **`dbs.schema`**: (String) The currently selected database schema.
  * **`dbs.tablePattern`**: (String) A pattern used to filter tables.
  * **`dbs.tableType`**: (String) The selected table type.
  * **`dbs.url`**: (String) The JDBC connection URL.
  * **`dbs.user`**: (String) The database username.

#### **1.2.3. Setters (Programmatic Overrides):**

These methods can be called from FreeMarker to modify `dbs` properties.
**(Note: Using setters in FreeMarker templates is generally discouraged for separation of concerns.)**

  * `dbs.setCatalog(String)`
  * `dbs.setCreate(Boolean)`
  * `dbs.setName(String)`
  * `dbs.setPassword(String)`
  * `dbs.setProfileName(String)`
  * `dbs.setSchema(String)`
  * `dbs.setTablePattern(String)`
  * `dbs.setTableType(String)`

-----

### **1.3. Application Generation Data Model (`adv` and `adv.generation`)**

This section describes attributes related to overall application generation settings.

#### **1.3.1. Reading Data from `adv` and `adv.generation` (Read-Only):**

  * **`adv.buildDate`**: (Datetime) The build date of the application.
  * **`adv.comment`**: (String) A general comment string for the application.
  * **`adv.generation.create`**: (Boolean) `true` if the generation process is set to create output.
  * **`adv.generation.outputDir`**: (String) The output directory for generated files. `?has_content` can check if it's set.
  * **`adv.generation.packageName`**: (String) The base package name for generated code. `?has_content` can check if it's set.
  * **`adv.generation.rootDir`**: (String) The root directory for the generation process.
  * **`adv.generation.specifyTemplateDir`**: (Boolean) `true` if a specific template directory is being used.
  * **`adv.generation.superClassName`**: (String) The superclass name for generated classes. `?has_content` can check if it's set.
  * **`adv.generation.templateDir`**: (String) The directory where templates are located.

#### **1.3.2. Modifying Data via Method Calls (Mutators):**

These expressions call setter methods on the Java objects backing the `adv` model to change data.
**(Note: These are generally not recommended for use within FreeMarker templates due to side effects.)**

  * `adv.setBuildDate(Date)`
  * `adv.setComment(String)`
  * `adv.generation.setCreate(Boolean)`
  * `adv.generation.setOutputDir(String)`
  * `adv.generation.setPackageName(String)`
  * `adv.generation.setRootDir(String)`
  * `adv.generation.setSpecifyTemplateDir(Boolean)`
  * `adv.generation.setSuperClassName(String)`
  * `adv.generation.setTemplateDir(String)`

-----

### **1.4. Draft Template Configuration (`adv.draftTemplate`)**

This model controls settings for draft template generation.

#### **1.4.1. Direct Field Access (Read-Only):**

  * **`adv.draftTemplate.appDir`**: (String, defaults to '') The application directory.
  * **`adv.draftTemplate.create`**: (Boolean) `true` if the draft template is set for creation.
  * **`adv.draftTemplate.draftDir`**: (String, defaults to '') The draft directory.

#### **1.4.2. Iterating `draftTemplateKeyValue` List:**

The `adv.draftTemplateKeyValue` is a list of objects, each containing:

  * **`create`**: (Boolean) `true` if the key-value pair is set for creation.
  * **`name`**: (String) The name of the key-value pair.
  * **`no`**: (Number or String) A sequence number or identifier.
  * **`selected`**: (Boolean) `true` if the key-value pair is selected.
  * **`value`**: (String) The value associated with the key.

#### **1.4.3. Mutating Data via Java Method Calls:**

**(Note: These are generally discouraged for use within FreeMarker templates.)**

  * `adv.draftTemplate.setAppDir(String)`
  * `adv.draftTemplate.setCreate(Boolean)`
  * `adv.draftTemplate.setDraftDir(String)`

-----

### **1.5. File and Private System Attributes (`adv.file*` and `PRV_SYS_*`)**

These models provide configurations for generated files and system-level private attributes.

#### **1.5.1. File-Specific Data (`adv.fileDefaultAttrs`, `adv.filePublicAttrs`, `adv.fileTmplts`)**

  * **`adv.fileDefaultAttrs`**: (Map) Default attributes for files. Iterated as `key, value` pairs.
  * **`adv.filePublicAttrs`**: (Map) Public attributes for files. Iterated as `key, value` pairs.
  * **`adv.fileTmplts`**: (List of Objects) Each object `k` in this list represents a template file with:
      * **`absolutePath`**: (String) The absolute path of the template.
      * **`allFileAttrSelected`**: (Boolean) `true` if all file attributes are selected.
      * **`create`**: (Boolean) `true` if the file is marked for creation.
      * **`generatedPath`**: (String) The path where the file will be generated.
      * **`generatedType`**: (String) The type of generation (e.g., `one`, `many`, `copy`).
      * **`name`**: (String) The name of the template file.
      * **`path`**: (String) The path of the template.
      * **`relativePath`**: (String) The relative path of the template.
      * **`selected`**: (Boolean) `true` if the file is selected.
      * **`size`**: (Number) The size of the file.
      * **`k.fileAttrList`**: (Nested List) Each item in this list has:
          * **`allFileAttrSelected`**: (Boolean)
          * **`create`**: (Boolean)
          * **`desc`**: (String) Description.
          * **`name`**: (String) Attribute name.
          * **`no`**: (Number or String) Sequence number.
          * **`value`**: (String) Attribute value.

#### **1.5.2. Private System Attributes (`PRV_SYS_*`)**

These attributes are defined within FreeMarker comments using the format `<#-- ${VAR_NAME|value|description} -->`. They control low-level generation behavior.

  * **`PRV_SYS_GEN_TYPE`**: (String, default `copy`) Defines how a file/folder is generated:
      * `'one'`: Single file generation.
      * `'many'`: Multiple file generation (per entity/field).
      * `'copy'`: Direct copy without FreeMarker evaluation.
  * **`PRV_SYS_GEN_PATH`**: (String, default root directory) Relative path for generated output.
  * **`PRV_SYS_GEN_FILENAME`**: (String, default template name) Custom output file name (strips `.ftl`).
  * **`PRV_SYS_IS_REPLACE`**: (Boolean, default `false`) `true` to overwrite existing files, `false` to create unique names.
  * **`PRV_SYS_JAVA_PACKAGE`**: (String) Defines the Java package and auto-creates directory structure based on placeholders.

##### **Placeholders (for `PRV_SYS_GEN_PATH`, `PRV_SYS_GEN_FILENAME`, `PRV_SYS_JAVA_PACKAGE`):**

  * `[class]`: Replaced by the class name.
  * `[table]`: Replaced by the table name.
  * `[instance]`: Replaced by the instance name.
  * `[base]`: Replaced by the the base name.

##### **Rules for `PRV_SYS_GEN_TYPE = 'copy'`:**

  * Files and folders are copied as-is (content and name unchanged).
  * Always overwrites existing files/folders.
  * Only `PRV_SYS_GEN_TYPE` and `PRV_SYS_GEN_PATH` apply.
  * **No FreeMarker directives, functions, or macros are evaluated; they render as raw text.**

##### **Rules for `PRV_SYS_GEN_TYPE = 'one'`:**

  * Applies only to files. Folders are always copied.
  * `.ftl` extension is stripped from output file name.
  * All `PRV_SYS_*` variables are substituted.
  * All FreeMarker directives, macros, and attribute placeholders are evaluated.

##### **Rules for `PRV_SYS_GEN_TYPE = 'many'`:**

  * Applies only to files. Folders are always copied directly.
  * `.ftl` extension is stripped from filenames.
  * If no values are set for system attributes, defaults are applied.
  * All FreeMarker directives, macros, and attribute placeholders are evaluated.

##### **Final Generated Path Pattern (conceptual):**

`[Root Directory Deployment] + [PRV_SYS_GEN_PATH] + [PRV_SYS_JAVA_PACKAGE] + [PRV_SYS_GEN_FILENAME]`

-----

### **1.6. Public System Data Type Mapping (`PUB_SYS_DTM`)**

This system allows customizing how database types are mapped to programming language types (e.g., Java).

#### **1.6.1. Core Mapping Rule:**

  * Default mappings exist (e.g., `integer` to `Integer`).
  * Can be customized via a field editor.
  * Can be overridden using the `Public System Data Type Mapping` logic block in templates.

#### **1.6.2. Mapping Syntax:**

```freemarker
${PUB_SYS_DTM@<DB_DT_TYPE>|<PL_DT_TYPE>|<Description>}
```

  * **`DB_DT_TYPE`**: The source database data type (e.g., `integer`, `text`).
  * **`PL_DT_TYPE`**: The target programming language data type (e.g., `Integer`, `String`).
  * **`PUB_SYS_DTM`**: A special marker indicating a public data type mapping rule.

#### **1.6.3. Condition for Application:**

  * This mapping is applied only when `PRV_SYS_GEN_TYPE` is set to `'one'` or `'many'`.

#### **1.6.4. Example Mappings (Postgres to Java):**

| **Postgres Type** | **Java Type(s)** |
| :---------------- | :--------------------------- |
| `integer`         | `int`, `Integer`             |
| `bigint`          | `long`, `Long`               |
| `decimal`         | `BigDecimal`                 |
| `text` / `varchar` | `String`                     |
| `date`            | `java.sql.Date`, `LocalDate` |
| `timestamp`       | `LocalDateTime`, `Timestamp` |
| `boolean`         | `boolean`, `Boolean`         |
| `uuid`            | `java.util.UUID`             |
| `json`, `jsonb`   | `String`                     |
| `bytea`           | `byte[]`                     |
| `enum`            | `String`                     |

-----

### **1.7. Public Attributes (`PUB_`)**

These are dynamic inputs and configuration settings that can be customized per project or environment.

#### **1.7.1. Public Attributes List:**

  * **`PUB_DB_TYPE`**: (String) Database type (e.g., `postgresql`, `oracle`).
  * **`PUB_APP_IP`**: (String) Application server IP address.
  * **`PUB_DB_IP`**: (String) Database server IP address.
  * **`PUB_DB_PORT`**: (String) Database port number.
  * **`PUB_DB_USER`**: (String) Database username.
  * **`PUB_DB_NAME`**: (String) Database name.
  * **`PUB_DB_PASS`**: (String) Database password.
  * **`PUB_APP_PKG`**: (String) Application package or module name.

#### **1.7.2. Public Attribute Rules:**

1.  **Pattern**: Defined using the format `${PUB_XXXXX|VALUE|Description}` in template comments.
      * `XXXXX` can be freely customized (must start with `PUB_`).
      * `VALUE` is the default value.
      * `Description` is optional documentation.
2.  **Multiple Template Support**: The same public attribute can appear in multiple templates. The final value is taken from the most recently updated template.
3.  **Override Behavior**: Public attribute values can be centrally updated in a master attribute table, which takes precedence over individual template values.

-----

## **2. FreeMarker Template Generation Logic (`GenerateFileJob.java`)**

The `GenerateFileJob` class is a core component that orchestrates the generation of files using FreeMarker templates. It prepares the data model, applies generation rules based on various attributes, and performs the actual merging of templates with data.

### **2.1. Key Components & Data Flow:**

  * **`runInternal(IProgressMonitor monitor)` method:** This is the main execution entry point for the file generation process, executed asynchronously by the UI thread.
  * **Data Model Retrieval:** It retrieves the primary data models from a `ParentFormEditor` instance:
      * `entityList`: `List<Entity>` (accessed via `pfe.getAdvCrudGenDomain().getEntities()`)
      * `fileTempList`: `List<FileTmplt>` (accessed via `pfe.getAdvCrudGenDomain().getFileTmplts()`)
      * `filePublicAttrList`: `HashMap<String, FilePublicAttr>` (accessed via `pfe.getAdvCrudGenDomain().getFilePublicAttrs()`) - This map stores the `PUB_` attributes.
      * `database`: `Database` (accessed via `pfe.getAdvCrudGenDomain().getDatabase()`)
      * `generation`: `Generation` (accessed via `pfe.getAdvCrudGenDomain().getGeneration()`)
      * `adv`: The root domain object (`pfe.getAdvCrudGenDomain()`) which contains all other data models.
  * **Template Iteration:** The job iterates through each `FileTmplt` object in `fileTempList` that is explicitly marked for creation (`fileTmplt.isCreate()`).

### **2.2. Private System Attribute Resolution:**

For each `FileTmplt` being processed, the job extracts values for **Private System Attributes (`PRV_SYS_*`)** that are embedded within the template's comments (`fileTmplt.getFileAttrList()`). These attributes control specific generation behaviors:

  * **`PRV_SYS_GEN_PATH`**: The output sub-directory for the generated file. (Identified by `GenerateFileJob.prv.sys.gen.path` message key).
  * **`PRV_SYS_JAVA_PACKAGE`**: The Java package structure for the generated code. (Identified by `GenerateFileJob.prv.sys.java.package` message key).
  * **`PRV_SYS_GEN_TYPE`**: The generation strategy (`copy`, `one`, `many`). If not found in file attributes, it defaults to `fileTmplt.getGeneratedType()`. (Identified by `GenerateFileJob.prv.sys.gen.type` message key).
  * **`PRV_SYS_GEN_FILENAME`**: The desired name of the final output file. If not found, it defaults to `fileTmplt.getName()`. (Identified by `GenerateFileJob.prv.sys.gen.filename` message key).
  * **`PRV_SYS_IS_REPLACE`**: A boolean flag (`true`/`false`) indicating whether to overwrite an existing file or generate a unique name. (Identified by `GenerateFileJob.prv.sys.gen.isReplace` message key).

### **2.3. Generation Type Logic:**

The core file generation logic dynamically branches based on the resolved `PRV_SYS_GEN_TYPE` for each template:

#### **2.3.1. `copy` Type (from `FileTmpltGeneratedTypeEditingSupport.copy`):**

  * **Purpose:** The template file (or folder) is directly copied to the target location without any FreeMarker processing.
  * **Output Path:** The destination is constructed as `strDeployLoc + File.separator + strSysGenPath + File.separator + strSysGenFileName`.
  * **Overwrite Behavior:** The `FileUtils.copy` operation performs an unconditional overwrite of any existing file at the destination. (The `blnSysIsReplace` check is present in the original code but appears to be made redundant by the `FileUtils.copy` utility, which typically overwrites).
  * **Content:** The generated file is an exact, literal copy of the template file; no FreeMarker directives or expressions are evaluated.

#### **2.3.2. `one` Type (from `FileTmpltGeneratedTypeEditingSupport.one`):**

  * **Purpose:** Generates a single output file by processing the FreeMarker template. If `entityList` is available, it uses the *first* `Entity` object (`entityList.get(0)`) as the primary context.
  * **Folder Handling:** If the source `fileTmplt` refers to a directory, it's treated as a `copy` operation instead of a template rendering.
  * **Output Filename:** The `strSysGenFileName` is used. If it ends with `.ftl`, this extension is removed from the generated file name.
  * **Output Path:** The final output file is placed at `strDeployLoc + File.separator + strSysGenPath + File.separator + resolvedFileName`.
  * **Duplicate File Handling:** If the target file already exists and `blnSysIsReplace` is `false`, the `getFileNameForDup()` utility appends a timestamp (`_YYYYMMDD.HHMMSS.SSS`) to the filename to ensure uniqueness.
  * **FreeMarker Processing:** The `freeMarkerEngine()` method is invoked to merge the template with the data model, including the (first) `Entity` object.

#### **2.3.3. `many` Type (Default behavior if not `copy` or `one`):**

  * **Purpose:** Generates multiple output files, typically one for each `Entity` object present in the `entityList` that is marked for creation (`entity.isCreate()`).
  * **License Limitation:** The generation process includes a license check (`FactorLicenseKey.getValidLimitTable()`). If the number of processed entities exceeds this limit, a warning is logged, and further generation is stopped.
  * **Folder Handling:** If the source `fileTmplt` is a directory, it is skipped for `many` type processing.
  * **Dynamic Paths and Filenames:**
      * For each `entity` in `entityList`, the `strSysGenFileName` and `strSysGenPath` are dynamically transformed using `replaceWithEntity()`. This method replaces placeholders like `[table]`, `[base]`, `[class]`, and `[instance]` with the current entity's corresponding values.
      * The `.ftl` extension is always removed from the generated filename.
  * **Java Package Path Integration:** If `strSysJavaPkg` (the `PRV_SYS_JAVA_PACKAGE`) is defined, its value is also dynamically resolved using `replaceWithEntity()` and then converted into a file path (e.g., `com.example` becomes `com/example`). This package path is appended to the `dirForEachEntity` path.
  * **Directory Creation:** Necessary output directories (e.g., `strDeployLoc + File.separator + dirForEachEntity + File.separator + strJavaPkgClear`) are created if they don't exist.
  * **Output File Path:** The final output file is constructed based on `strDeployLoc`, the resolved directory path, the resolved package path (if any), and the resolved filename.
  * **Duplicate File Handling:** Similar to the `one` type, `getFileNameForDup()` is used if the file exists and `blnSysIsReplace` is `false`.
  * **FreeMarker Processing:** The `freeMarkerEngine()` method is called for each `Entity`, providing that specific `Entity` object as context for the template.

### **2.4. Utility Methods:**

  * **`replaceWithEntity(String strName, Entity entity)`:**
      * **Purpose:** Replaces specific placeholders within a string (`strName`) with corresponding attribute values from an `Entity` object.
      * **Placeholders Handled:**
          * `[table]` is replaced by `entity.getTableName()`.
          * `[base]` is replaced by `entity.getBaseName()`.
          * `[class]` is replaced by `entity.getClassName()`.
          * `[instance]` is replaced by `entity.getInstanceName()`.
      * **Return:** The string with all recognized placeholders replaced.
  * **`getFileNameForDup(File fDeploy)`:**
      * **Purpose:** Generates a unique filename for a given `File` object to prevent overwriting when `PRV_SYS_IS_REPLACE` is `false`.
      * **Mechanism:** It appends a precise timestamp (`_YYYYMMDD.HHMMSS.SSS`) before the file's extension (if any).
      * **Return:** A new `File` object representing the unique path.

### **2.5. FreeMarker Engine (`freeMarkerEngine`):**

This private method is central to the FreeMarker integration. It configures the FreeMarker engine, prepares the data model, and performs the template-data merge.

  * **FreeMarker Configuration (`cfg`):**
      * **Initialization:** Configured only once (`isFirstTimeFreeMarker` flag ensures this).
      * `setDefaultEncoding("UTF-8")`: Sets the character encoding for templates.
      * `setTemplateExceptionHandler(TemplateExceptionHandler.DEBUG_HANDLER)`: Configures how template exceptions are handled, typically for detailed logging during development.
      * `setLogTemplateExceptions(true)`: Ensures template-related exceptions are logged.
  * **Data Model Preparation (`root` Map):**
      * **Core Data:** `database` (as "dbs"), `generation` (as "gen"), and `advCrudGenDomain` (as "adv") are always added to the root data model.
      * **Private File Attributes (`FileAttrList`):** It iterates through `fileTmplt.getFileAttrList()`:
          * If an attribute's name is `PRV_SYS_JAVA_PACKAGE` (`GenerateFileJob.prv.sys.java.package`) and a specific `Entity` is currently in context (for `one` or `many` types), its value is dynamically resolved using `replaceWithEntity()` before being added to `root`.
          * All other `FileAttr` (non-`PRV_SYS_JAVA_PACKAGE`) names and their values are directly added to the `root` map, making them accessible in the template.
      * **Public Attributes (`FilePublicAttrList` - `PUB_`):**
          * **Dynamic Data Type Mapping (`PUB_SYS_DTM`):** This is a critical pre-processing step. The code iterates through `filePublicAttrList`:
              * If a public attribute's key starts with `PUB_SYS_DTM@` (e.g., `PUB_SYS_DTM@integer`), it signifies a database-to-programming-language data type mapping rule.
              * The `DB_DT_TYPE` part (e.g., "integer") is extracted from the key.
              * Then, for **every `Entity` in `entityList` and every `Field` within that entity's `fieldList`**, if a field's `columnType` matches the `DB_DT_TYPE`, that `Field` object's `fieldType` (its Java type) is **updated** to the `PL_DT_TYPE` defined by the `FilePublicAttr`'s `value`.
              * This means that `PUB_SYS_DTM` rules can effectively *mutate* the `fieldType` attribute of `Field` objects in the data model *before* the template rendering begins, ensuring custom type mappings are applied.
          * **General Public Attributes:** All other `FilePublicAttr` (e.g., `PUB_DB_TYPE`) are added to the FreeMarker configuration as *shared variables* (`cfg.setSharedVariable`), making them globally accessible in all templates without needing to be explicitly passed in the `root` map for each merge.
      * **Entity Lists and Single Entity:**
          * The complete `entityList` is put into the `root` map as "ents".
          * If a single `Entity` object is being processed (e.g., in `one` type generation or during an iteration of `many` type), that specific `Entity` is also put into the `root` map as "entity".
  * **Template Loading Path:** FreeMarker's template loading directory is set to the parent directory of the current `fileTmplt`, allowing templates to reference other files relative to themselves.
  * **Template Processing:**
      * `cfg.getTemplate(fileTmplt.getName())` retrieves the FreeMarker template.
      * `temp.process(root, out)` performs the actual merge operation, rendering the template content with the prepared `root` data model and writing the output to the target file (`fDeploy`).
  * **Empty File Deletion:** After processing, if the generated file (`fDeploy`) has a length of 0 bytes, it is automatically deleted.
  * **Error Handling:** Includes robust `try-catch` blocks for `IOException` and `TemplateException` during template loading and processing, logging errors and re-throwing them to be handled by the job's main error mechanism.

-----

This complete prompt now encapsulates both the static data model definitions and the dynamic processing logic, giving an AI a holistic understanding of how your system generates files. This will be invaluable for tasks like:

  * **Generating FreeMarker templates:** The AI will know which variables are available and how they are populated.
  * **Debugging template issues:** Understanding the data flow and attribute resolution.
  * **Proposing new template features:** Knowing the capabilities and limitations of the generation process.
  * **Explaining system behavior:** Providing insights into how specific attributes influence the output.

Just said understand and No explain.