====================================================================================================================================
-- Apache FreeMarker 2.3.26 - Factor User Defined Subroutines - Private System One Generation Example -------
====================================================================================================================================
<#--
${PRV_SYS_GEN_PATH|one-path|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.user.defined.subroutines.7.private.system.one.change-filename.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name. }
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->
PRV_SYS_GEN_PATH 		= ${PRV_SYS_GEN_PATH}
PRV_SYS_GEN_TYPE 		= ${PRV_SYS_GEN_TYPE}
PRV_SYS_GEN_FILENAME 	= ${PRV_SYS_GEN_FILENAME}
PRV_SYS_IS_REPLACE 		= ${PRV_SYS_IS_REPLACE}


====================================================================================================================================
A. One Generation Type Logic Rule
====================================================================================================================================
1. This applies to files but not folders.
2. Folders will always undergo a copy operation.
3. File Name Handling:
   - Remove the '.ftl' file extension if it exists at the end of the file name. For example, 'Person.java.ftl' will become 'Person.java.'
4. Applicable Private System Attributes for Files:
   a. PRV_SYS_GEN_TYPE:
      - A private system placeholder to define Generation Type options (one, many, copy). Used 'one' for this case.
      - If not provided, it will default to 'copy' generation.
   b. PRV_SYS_GEN_PATH:
      - A private system placeholder to create a generated relative path, relative to the Root Directory Deployment as the base path.
      - If not provided, it will not create any custom path and will be rendered in the Root Directory Deployment.
   c. PRV_SYS_GEN_FILENAME:
      - A private system placeholder to define the file name that needs to be generated, if it's required to be different from the template name.
      - Remove the '.ftl' file extension if it exists at the end of the file name.
      - If not provided, it will use the filename as is.
   d. PRV_SYS_IS_REPLACE:
      - A private system placeholder to determine whether the file should be replaced (true or false). If set to false, an additional suffix will be added to the file name.
      - If not provided, it will default to 'false.'
5. All Factor FreeMarker Directives, Predefined Subroutines, User-Defined Subroutines, Public and Private System Attributes, Public Attributes, and Private (File) Attributes will be replaced by their values, rendered, and changed.

====================================================================================================================================
B. AI Prompt One Generation Type Logic Rule
====================================================================================================================================

Here is a concise and clear **summary of the FreeMarker data model** you described, tailored for AI understanding and reuse:

---

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

---

You can now use this summary to easily instruct an AI or developer on how this FreeMarker data model works and how to interpret or populate `.ftl` templates accordingly.
