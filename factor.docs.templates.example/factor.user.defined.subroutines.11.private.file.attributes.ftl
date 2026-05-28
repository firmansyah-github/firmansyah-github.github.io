====================================================================================================================================
-- Apache FreeMarker 2.3.26 - Factor User Defined Subroutines - Private (File) Attributes Example -------
====================================================================================================================================
<#--
${PRV_SYS_GEN_PATH|one-path|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.user.defined.subroutines.11.private.file.attributes.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name. }
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}


${PRV_DB_TYPE|postgresql|db2, postgresql, oracle, sqlserver, mysql }
${PRV_APP_IP|localhost|Description}
${PRV_DB_IP|localhost|Description}
${PRV_DB_PORT|5432|db2-50000, postgresql-5432, oracle-1521, sqlserver-1433, mysql-3306}
${PRV_DB_USER|postgres|db2-dbadm, postgresql-postgres, oracle-system, sqlserver-sa, mysql-myuser}
${PRV_DB_NAME|postgres|db2-MYDB, postgresql-postgres, oracle-ORCLPDB1, sqlserver-Express, mysql-mydb}
${PRV_DB_PASS|P@ssw0rd|Description}
${PRV_APP_PKG|realworld-api-quarkus|Description}
-->

====================================================================================================================================
A. Private (File) Attributes Logic Rule
====================================================================================================================================

1. Private (File) Attributes Pattern:
   a. Use the following pattern: <#noparse>"${PRV_XXXXX|VALUE|Description}"</#noparse>.
   b. You have the flexibility to customize "XXXXX" within "PRV_XXXXX" to your preferred name, but retain the "PRV_" prefix.
   c. Replace "VALUE" with the desired value of your choice.
   d. You can also replace "Description" with any description that suits your documentation needs.

2. The Same Private (File) Attribute Definitions in Multiple File Templates:
   a. Private (File) attribute definitions can exist within multiple file templates.
   b. The values of these Private (File) attributes are derived from value in each file template.

3. Modifying Private (File) Attributes:
   a. You can modify the values of Private (File) attributes within the Private (File) Attributes table.
   b. These modified values take precedence over those in the individual files.
   
====================================================================================================================================
B. Private Attributes
====================================================================================================================================
PRV_DB_TYPE	: ${PRV_DB_TYPE}
PRV_APP_IP	: ${PRV_APP_IP}
PRV_DB_IP	: ${PRV_DB_IP}
PRV_DB_PORT	: ${PRV_DB_PORT}
PRV_DB_USER	: ${PRV_DB_USER}
PRV_DB_NAME	: ${PRV_DB_NAME}
PRV_DB_PASS	: ${PRV_DB_PASS}
PRV_APP_PKG	: ${PRV_APP_PKG}    


====================================================================================================================================
C. AI Prompt Public Attributes
====================================================================================================================================
Here’s a concise summary of your FreeMarker data model description, ready to prompt an AI for easy understanding and use:

---

### FreeMarker Data Model Summary

* **Private (File) Attributes**

  * Use a naming pattern starting with `PRV_` prefix, e.g., `${PRV_XXXXX|VALUE|Description}`.
  * `XXXXX` is customizable; `VALUE` is the attribute’s value; `Description` is optional documentation.
  * These private attributes can appear in multiple template files, each file can have its own values.
  * Attribute values can be overridden centrally in a "Private (File) Attributes" table, which takes precedence over file-defined values.
  * Common private attributes include file-generation settings like path, filename, generation type, replace flag, etc.

* **Private Attributes**

  * Represent commonly used environment or system settings exposed to templates, e.g.:

    * `PRV_DB_TYPE` (e.g., postgresql, oracle)
    * `PRV_APP_IP`, `PRV_DB_IP` (host IP addresses)
    * `PRV_DB_PORT`, `PRV_DB_USER`, `PRV_DB_NAME`, `PRV_DB_PASS` (database connection info)
    * `PRV_APP_PKG` (application package name)
  * These are accessed in the template like `${PRV_DB_TYPE}` and provide context or configuration data.

---

This summary clarifies the role of private vs public attributes, naming conventions, scope, and usage patterns in the FreeMarker data model.

Let me know if you want it shorter or more technical!
