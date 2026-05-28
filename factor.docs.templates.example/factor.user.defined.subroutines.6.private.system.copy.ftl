====================================================================================================================================
-- Apache FreeMarker 2.3.26 - Factor User Defined Subroutines - Private System Copy Generation Example -------
====================================================================================================================================
<#--
${PRV_SYS_GEN_PATH|copy-path|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|copy|Please choose one option from this Private Gen type list: one, many, copy}
-->
PRV_SYS_GEN_PATH = ${PRV_SYS_GEN_PATH}
PRV_SYS_GEN_TYPE = ${PRV_SYS_GEN_TYPE}

====================================================================================================================================
A. Copy Generation Type Logic Rule
====================================================================================================================================
1. Applicable to both files and folders.
2. Copy the file without making any changes to its name or content, and paste it into the specified "Generated Path."
3. Copy the entire folder, including all subfolders and files within it, and paste it into the specified "Generated Path."
4. Always perform a replacement.
5. Applicable to private system attributes of files:
   a. PRV_SYS_GEN_TYPE:
      - A private system attribute used to define generation type options (e.g., one, many, copy). Used 'copy' for this case.
      - If not provided, the default generation type is 'copy.'
   b. PRV_SYS_GEN_PATH:
      - A private system attribute used to create a generated relative path relative to the root directory deployment as the base path.
      - If not provided, no custom path will be created, and it will be rendered on the root directory deployment.
6. Other private system attributes of files will not have an impact.
7. All Factor FreeMarker Directives, Predefined Subroutines, User-Defined Subroutines, Public and Private System Attributes, Public Attributes, and Private (File) Attributes will not be replaced by their values. They will be rendered as is.

====================================================================================================================================
B. AI Prompt Copy Generation Type Logic Rule
====================================================================================================================================

Here is a **concise summary** of your FreeMarker data model and logic rules, designed to help AI understand and use it effectively:

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

Let me know if you want the same for `one` or `many` types too.
