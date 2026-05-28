<#--
${PRV_SYS_GEN_PATH|user-defined-subroutines|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.user.defined.subroutines.3.draftTemplate.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->


=====================================================================================================================
-- Apache FreeMarker 2.3.26 - Factor User Defined Subroutines - Draft Template Example -------
This Draft Template User Defined Subroutines is not used for generating template.
Only used by the process of scanning existing source code and generating draft template.
=====================================================================================================================
=====================================================================================================================
A. Draft Template - Factor Subroutines ------------------------------------------------------------------------------------
=====================================================================================================================

=====================================================================================================================
Expression or Script   										-> RESULT
=====================================================================================================================
<#noparse>${adv.draftTemplate.appDir!''}</#noparse>							->	${adv.draftTemplate.appDir!''}
                                                                              
<#noparse>${adv.draftTemplate.create?c}</#noparse>    						->	${adv.draftTemplate.create?c}
                                                                              
<#noparse>${adv.draftTemplate.draftDir!''}</#noparse>						->	${adv.draftTemplate.draftDir!''}


===================
1. draftTemplateKeyValue Expression or Script
====================     
<#noparse>
<#list adv.draftTemplateKeyValue as dtkv>
  ${dtkv.create?c}
  ${dtkv.name}
  ${dtkv.no}
  ${dtkv.selected?c}
  ${dtkv.value}
</#list>
</#noparse>	
	|||
	VVV
====================
1. draftTemplateKeyValue RESULT
====================					
<#list adv.draftTemplateKeyValue as dtkv>
  ${dtkv.create?c}
  ${dtkv.name}
  ${dtkv.no}
  ${dtkv.selected?c}
  ${dtkv.value}
</#list>


=====================================================================================================================
B. [WARNING] Override Generation - Factor Subroutines -----------------------------------------------------------------
=====================================================================================================================
=====================================================================================================================
Expression or Script   										-> RESULT
=====================================================================================================================


<#-- DO NOT USED -->
<#-- IF YOU WANT TO TRY REMOVE THIS LINE COMMENTS 
<#noparse>${adv.draftTemplate.setAppDir('appDir')}</#noparse>				->	${adv.draftTemplate.setAppDir('appDir')}
<#noparse>${adv.draftTemplate.appDir}</#noparse>							->	${adv.draftTemplate.appDir}
                                                                              
<#noparse>${adv.draftTemplate.setCreate(true)}</#noparse>    				->	${adv.draftTemplate.setCreate(true)}
<#noparse>${adv.draftTemplate.create?c}</#noparse>    						->	${adv.draftTemplate.create?c}
                                                                              
<#noparse>${adv.draftTemplate.setDraftDir('draftDir')}</#noparse>			->	${adv.draftTemplate.setDraftDir('draftDir')}
<#noparse>${adv.draftTemplate.draftDir}</#noparse>							->	${adv.draftTemplate.draftDir}
IF YOU WANT TO TRY REMOVE THIS LINE COMMENTS  -->





=====================================================================================================================
C. NOT USED Generation - Factor Subroutines ---------------------------------------------------------------------------
=====================================================================================================================
=====================================================================================================================
Expression or Script   										-> RESULT
=====================================================================================================================
<#noparse>${adv.draftTemplate.addPropertyChangeListener(null)}</#noparse>	->	${adv.draftTemplate.addPropertyChangeListener(null)}

<#noparse>${adv.draftTemplate.addValueModifyListener(null)}</#noparse>		->	${adv.draftTemplate.addValueModifyListener(null)}

<#noparse>${adv.draftTemplate.propertyChange(null)}</#noparse>				->	${adv.draftTemplate.propertyChange(null)}

<#noparse>${adv.draftTemplate.removePropertyChangeListener(null)}</#noparse>	->	${adv.draftTemplate.removePropertyChangeListener(null)}

<#-- DO NOT USED -->
<#--
<#noparse>${adv.draftTemplate.valueModified()}</#noparse>	->	${adv.draftTemplate.valueModified()}
-->


=====================================================================================================================
D. AI Prompts Generation - Factor Subroutines ---------------------------------------------------------------------------
=====================================================================================================================

Here's a summarized explanation of your FreeMarker data model usage (`adv` object structure), grouped by category:

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

Let me know if you want help refactoring part B into safer practices.
