====================================================================================================================================
-- Apache FreeMarker 2.3.26 - Factor User Defined Subroutines - Public Attributes Example -------
====================================================================================================================================
<#--
${PRV_SYS_GEN_PATH|one-path|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.user.defined.subroutines.10.public.attributes.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name. }
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}


${PUB_DB_TYPE|postgresql|db2, postgresql, oracle, sqlserver, mysql }
${PUB_APP_IP|localhost|Description}
${PUB_DB_IP|localhost|Description}
${PUB_DB_PORT|5432|db2-50000, postgresql-5432, oracle-1521, sqlserver-1433, mysql-3306}
${PUB_DB_USER|postgres|db2-dbadm, postgresql-postgres, oracle-system, sqlserver-sa, mysql-myuser}
${PUB_DB_NAME|postgres|db2-MYDB, postgresql-postgres, oracle-ORCLPDB1, sqlserver-Express, mysql-mydb}
${PUB_DB_PASS|P@ssw0rd|Description}
${PUB_APP_PKG|realworld-api-quarkus|Description}
-->

====================================================================================================================================
A. Public Attributes Logic Rule
====================================================================================================================================

1. Public Attributes Pattern:
   a. Use the following pattern: <#noparse>"${PUB_XXXXX|VALUE|Description}"</#noparse>.
   b. You have the flexibility to customize "XXXXX" within "PUB_XXXXX" to your preferred name, but retain the "PUB_" prefix.
   c. Replace "VALUE" with the desired value of your choice.
   d. You can also replace "Description" with any description that suits your documentation needs.

2. The Same Public Attribute Definitions in Multiple File Templates:
   a. Public attribute definitions can exist within multiple file templates.
   b. The values of these public attributes are derived from the most recently modified file template.

3. Modifying Public Attributes:
   a. You can modify the values of public attributes within the Public Attributes table.
   b. These modified values take precedence over those in the individual files.
   
====================================================================================================================================
B. Public Attributes
====================================================================================================================================
PUB_DB_TYPE	: ${PUB_DB_TYPE}
PUB_APP_IP	: ${PUB_APP_IP}
PUB_DB_IP	: ${PUB_DB_IP}
PUB_DB_PORT	: ${PUB_DB_PORT}
PUB_DB_USER	: ${PUB_DB_USER}
PUB_DB_NAME	: ${PUB_DB_NAME}
PUB_DB_PASS	: ${PUB_DB_PASS}
PUB_APP_PKG	: ${PUB_APP_PKG}    

====================================================================================================================================
C. AI Prompt Public Attributes
====================================================================================================================================

Here is a concise **summary** of your FreeMarker **data model logic** and usage rules, optimized for AI understanding and prompting:

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

Let me know if you want this turned into a FreeMarker helper doc or converted to Markdown or JSON for automation.
