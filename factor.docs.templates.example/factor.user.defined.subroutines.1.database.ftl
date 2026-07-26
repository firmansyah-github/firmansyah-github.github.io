<#--
${PRV_SYS_GEN_PATH|user-defined-subroutines|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.user.defined.subroutines.1.database.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->


=====================================================================================================================
-- Apache FreeMarker 2.3.26 - Factor User Defined Subroutines - Database Example -------
=====================================================================================================================
=====================================================================================================================
A. Database - Factor Subroutines ------------------------------------------------------------------------------------
=====================================================================================================================

===================
1. catalogs Expression or Script
====================                                                                                  
<#noparse>
<#list adv.database.catalogs as i>                                                         
  ${i?counter}: ${i}                                                                
</#list> 
</#noparse>

	|||
	VVV
====================
1. catalogs RESULT
====================
<#list adv.database.catalogs as i>                                                         
  ${i?counter}: ${i}                                                                
</#list>     

===================
2. schemas Expression or Script
====================   
<#noparse>
<#list adv.database.schemas as i>                                                          
  ${i?counter}: ${i}                                                                
</#list> 
</#noparse> 
	|||
	VVV
====================
2. schemas RESULT
====================
<#list adv.database.schemas as i>                                                          
  ${i?counter}: ${i}                                                                
</#list>  

    
===================
3. tableTypes Expression or Script
==================== 
<#noparse>
<#list adv.database.tableTypes as i>                                                       
  ${i?counter}: ${i}                                                                
</#list> 
</#noparse>  
	|||
	VVV
====================
3. tableTypes RESULT
====================
<#list adv.database.tableTypes as i>                                                       
  ${i?counter}: ${i}                                                                
</#list>    

===================
4. tableTypesList Expression or Script
==================== 
<#noparse>
<#list adv.database.tableTypesList as i>                                                   
  ${i?counter}: ${i}                                                                
</#list> 
</#noparse>  
	|||
	VVV
====================
4. tableTypesList RESULT
====================
<#list adv.database.tableTypesList as i>                                                   
  ${i?counter}: ${i}                                                                
</#list>                          

=====================================================================================================================
Expression or Script   										-> RESULT
=====================================================================================================================
<#noparse>${adv.database.catalog}</#noparse>                       	->  ${adv.database.catalog}                                      
                                                                                  
<#noparse>${adv.database.create?c}</#noparse>                       	->  ${adv.database.create?c}
                                                                                  
<#noparse>${adv.database.driverClassName}</#noparse>                 ->  ${adv.database.driverClassName}
                                                                                  
<#noparse>${adv.database.driverFile}</#noparse>                      ->  ${adv.database.driverFile}
                                                                                  
<#noparse>${adv.database.name}</#noparse>                       		->  ${adv.database.name}
                                                                                  
<#noparse>${adv.database.password}</#noparse>                       	->  ${adv.database.password}
                                                                                  
<#noparse>${adv.database.profileName}</#noparse>                     ->  ${adv.database.profileName}
                                                                                  
<#noparse>${adv.database.schema}</#noparse>                       	->  ${adv.database.schema}
                                                                                  
<#noparse>${adv.database.tablePattern}</#noparse>                    ->  ${adv.database.tablePattern}
                                                                                  
<#noparse>${adv.database.tableType}</#noparse>                       ->  ${adv.database.tableType}
                                                                                  
<#noparse>${adv.database.url}</#noparse>                       		->  ${adv.database.url}
                                                                                  
<#noparse>${adv.database.user}</#noparse>                       		->  ${adv.database.user}


=====================================================================================================================
B. [WARNING] Override Database - Factor Subroutines -----------------------------------------------------------------
=====================================================================================================================
=====================================================================================================================
Expression or Script   										-> RESULT
=====================================================================================================================
<#-- IF YOU WANT TO TRY REMOVE THIS LINE COMMENTS 
===================
1. catalog Expression or Script
====================                                                                                  
<#noparse>
${adv.database.setCatalog('catalog')}
${adv.database.catalog} 
</#noparse>

	|||
	VVV
====================
1. catalog RESULT
====================

===================
2. create Expression or Script
====================                                                                                  
<#noparse>
${adv.database.setCreate(true)}
${adv.database.create} 
</#noparse>

	|||
	VVV
====================
2. create RESULT
====================
${adv.database.setCreate(true)}
${adv.database.create?c} 

    
===================
3. name Expression or Script
====================                                                                                  
<#noparse>
${adv.database.setName('name')}
${adv.database.name} 
</#noparse>

	|||
	VVV
====================
3. name RESULT
====================
${adv.database.setName('name')}
${adv.database.name} 

    
        
===================
4. password Expression or Script
====================                                                                                  
<#noparse>
${adv.database.setPassword('password')}
${adv.database.password} 
</#noparse>

	|||
	VVV
====================
4. password RESULT
====================
${adv.database.setPassword('password')}
${adv.database.password} 

    
===================
5. profileName Expression or Script
====================                                                                                  
<#noparse>
${adv.database.setProfileName('profileName')}
${adv.database.profileName} 
</#noparse>

	|||
	VVV
====================
5. profileName RESULT
====================
${adv.database.setProfileName('profileName')}
${adv.database.profileName} 

  
===================
6. schema Expression or Script
====================                                                                                  
<#noparse>
${adv.database.setSchema('schema')}
${adv.database.schema} 
</#noparse>

	|||
	VVV
====================
6. schema RESULT
====================
${adv.database.setSchema('schema')}
${adv.database.schema}  

 
===================
7. tablePattern Expression or Script
====================                                                                                  
<#noparse>
${adv.database.setTablePattern('tablePattern')}
${adv.database.tablePattern} 
</#noparse>

	|||
	VVV
====================
7. tablePattern RESULT
====================
${adv.database.setTablePattern('tablePattern')}
${adv.database.tablePattern} 

===================
8. tableType Expression or Script
====================                                                                                  
<#noparse>
${adv.database.setTableType('tableType')}
${adv.database.tableType} 
</#noparse>

	|||
	VVV
====================
8. tableType RESULT
====================
${adv.database.setTableType('tableType')}
${adv.database.tableType} 

IF YOU WANT TO TRY REMOVE THIS LINE COMMENTS -->


=====================================================================================================================
C. NOT USED Database - Factor Subroutines ---------------------------------------------------------------------------
=====================================================================================================================
=====================================================================================================================
Expression or Script   										-> RESULT
=====================================================================================================================
<#noparse>`
${adv.database.profileConnector}
${adv.database.addPropertyChangeListener(null)}
${adv.database.addValueModifyListener(null)}
${adv.database.do('firmansyah')}
${adv.database.propertyChange(null)}
${adv.database.removePropertyChangeListener(null)} 
</#noparse>


=====================================================================================================================
D. AI Prompts - Factor Subroutines ---------------------------------------------------------------------------
=====================================================================================================================
Here is a **concise summary** of the FreeMarker Data Model for `adv.database` (Database object), formatted for easy use in prompts to other AIs or developers:

---

### ✅ **FreeMarker Database Data Model Summary (`adv.database`)**

#### 🔹 **Collection Fields (Iterable Lists)**

Each can be iterated using <#noparse>`<#list>`</#noparse> in FreeMarker templates:

* `adv.database.catalogs` → list of catalogs
* `adv.database.schemas` → list of schemas
* `adv.database.tableTypes` → list of table types
* `adv.database.tableTypesList` → another list of table types

**Usage:**

```ftl
<#list adv.database.catalogs as i>
  ${i?counter}: ${i}
</#list>
```

---

#### 🔹 **Single Field Access (Properties)**

These are simple property reads:

```ftl
${adv.database.catalog}
${adv.database.create?c}
${adv.database.driverClassName}
${adv.database.driverFile}
${adv.database.name}
${adv.database.password}
${adv.database.profileName}
${adv.database.schema}
${adv.database.tablePattern}
${adv.database.tableType}
${adv.database.url}
${adv.database.user}
```

---

#### 🔹 **Setters (Overriding Data Programmatically in Template)**

These can be used to override values from within `.ftl` templates:

| Property       | Setter Example                         | Usage Output          |
| -------------- | -------------------------------------- | --------------------- |
| `catalog`      | `${adv.database.setCatalog('catalog')}`         | `${adv.database.catalog}`      |
| `create`       | `${adv.database.setCreate(true)}`               | `${adv.database.create?c}`     |
| `name`         | `${adv.database.setName('name')}`               | `${adv.database.name}`         |
| `password`     | `${adv.database.setPassword('password')}`       | `${adv.database.password}`     |
| `profileName`  | `${adv.database.setProfileName('profileName')}` | `${adv.database.profileName}`  |
| `schema`       | `${adv.database.setSchema('schema')}`           | `${adv.database.schema}`       |
| `tablePattern` | `${adv.database.setTablePattern('pattern')}`    | `${adv.database.tablePattern}` |
| `tableType`    | `${adv.database.setTableType('type')}`          | `${adv.database.tableType}`    |

---

### 🔍 **Usage Context**

* You pass a `adv.database` Java object into FreeMarker as part of the data model.
* The template accesses fields or modifies them using getters/setters.
* Lists are rendered with <#noparse>`<#list>`</#noparse>, and individual values use <#noparse>`${}`</#noparse> syntax.
* Setters are usually discouraged in pure presentation logic but can be used for quick override scenarios.

---

Let me know if you want this structured in **JSON**, or if you'd like to turn this into a **reusable macro template**.
