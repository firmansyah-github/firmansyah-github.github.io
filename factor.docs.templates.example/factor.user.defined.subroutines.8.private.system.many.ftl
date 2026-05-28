====================================================================================================================================
-- Apache FreeMarker 2.3.26 - Factor User Defined Subroutines - Private System Many Generation Example -------
====================================================================================================================================
<#--
${PRV_SYS_GEN_PATH|many-path/main/java/[class]/[table]/[instance]/test/[base]|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.user.defined.subroutines.8.private.system.many.[table].[base].[class].[instance].txt|Private System placeholder for define file name that need to be generated, if required to be different with template name. }
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PRV_SYS_JAVA_PACKAGE|id.co.factor.[class].[table].[instance].[base]|Private System placeholder for define package name and auto create directory based on value definition}
-->
PRV_SYS_GEN_PATH 		= ${PRV_SYS_GEN_PATH}
PRV_SYS_GEN_TYPE 		= ${PRV_SYS_GEN_TYPE}
PRV_SYS_GEN_FILENAME 	= ${PRV_SYS_GEN_FILENAME}
PRV_SYS_IS_REPLACE 		= ${PRV_SYS_IS_REPLACE}
PRV_SYS_JAVA_PACKAGE    = ${PRV_SYS_JAVA_PACKAGE}

====================================================================================================================================
A. Many Generation Type Logic Rule
====================================================================================================================================
1. Applicable only to files and not folders.
2. Folders will always undergo the copy operation.
3. File Name Handling:
   a. Remove the '.ftl' file extension if it is present at the end of the file name. For example, "Person.java.ftl" will become "Person.java."
   b. File names may contain placeholders, such as "[phType]Model.java.ftl" or "Domain[phType]DTO.java.ftl." The available options for "[phType]" are:
      - "[table]"  : to be replaced by the table name
      - "[base]"   : to be replaced by the base name
      - "[class]"  : to be replaced by the class name
      - "[instance]": to be replaced by the instance name
4. Applicable Private System Attributes for Files:
   a. PRV_SYS_GEN_TYPE: 
      A private system placeholder to define generation type options (one, many, copy). Used 'many' for this case.
      If not provided, the default generation type used is 'copy.'
      
   b. PRV_SYS_GEN_PATH:
      A private system placeholder to define the generated relative path relative to the Root Directory Deployment as the base path. 
      If not provided, no custom path is created; it is rendered on the Root Directory Deployment. 
      Directories are automatically created based on the defined values.
      - "[table]"  : replaced by the table name
      - "[base]"   : replaced by the base name
      - "[class]"  : replaced by the class name
      - "[instance]": replaced by the instance name
      Example : "many-path/main/java/[class]/[table]/[instance]/test/[base]"
      
   c. PRV_SYS_GEN_FILENAME:
      A private system placeholder to define the file name that needs to be generated. 
      If a custom file name is required, it should be specified. 
      The '.ftl' file extension is removed if it exists at the end of the file name. If not provided, the file name remains as is.
      
   d. PRV_SYS_IS_REPLACE:
      A private system placeholder to determine whether to replace the file (true or false). 
      If set to 'false,' an additional suffix is added to the file name. 
      If not provided, the default value is 'false.'
      
   e. PRV_SYS_JAVA_PACKAGE:
      A private system placeholder to define the package name and automatically create directories based on the defined values. 
      For example: "id.co.factor.[table].[base].[class].[instance]"
      - "[table]"  : replaced by the table name
      - "[base]"   : replaced by the base name
      - "[class]"  : replaced by the class name
      - "[instance]": replaced by the instance name
5. All Factor FreeMarker Directives, Predefined Subroutines, User-Defined Subroutines, Public and Private System Attributes, Public Attributes, and Private (File) Attributes will have their values replaced, rendered, and changed.
6. The full path of the gnerated file is created according to the following pattern:
   [Root Directory Deployment] + [PRV_SYS_GEN_PATH] + [PRV_SYS_JAVA_PACKAGE] + [PRV_SYS_GEN_FILENAME]
   Ensure the path combination between PRV_SYS_GEN_PATH and PRV_SYS_JAVA_PACKAGE is correctly configured.

====================================================================================================================================
B. AI Prompt Many Generation Type Logic Rule
====================================================================================================================================
Here's a **succinct summary** of the FreeMarker data model and logic you provided, optimized for prompting an AI to understand and utilize it correctly:

---

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

This summary is now ready to be used as a **prompt primer** or documentation snippet to guide AI or dev tools when working with FreeMarker-based file generation templates. Let me know if you want the same structure for `one` or `copy` types.
