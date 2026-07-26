<#--
${PRV_SYS_GEN_PATH|user-defined-subroutines|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.user.defined.subroutines.5.fileTemplate.attributes.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->



====================================================================================================================================
-- Apache FreeMarker 2.3.26 - Factor User Defined Subroutines - File Templates, Default Attr, Public Attr, File Attr Example -------
====================================================================================================================================
====================================================================================================================================
A. File Templates, Default Attr, Public Attr, File Attr - Factor Subroutines -----------------------------------------------------------------------
====================================================================================================================================

===================
1. fileDefaultAttrs Expression or Script
====================                                                                                  
<#noparse>
<#list adv.fileDefaultAttrs as k, v>                                                   
	${k}, ${v}
</#list>
</#noparse>
	|||
	VVV
====================
1. fileDefaultAttrs RESULT
====================
<#list adv.fileDefaultAttrs as k, v>                                                   
	${k}, ${v}
</#list>

===================
2. filePublicAttrs Expression or Script
====================                                                                                  
<#noparse>
<#list adv.filePublicAttrs as k, v>                                                   
  	${k}, ${v}
</#list>
</#noparse>
	|||
	VVV
====================
2. filePublicAttrs RESULT
====================
<#list adv.filePublicAttrs as k, v>                                                   
  	${k}, ${v}
</#list>


====================================================================================================================================
Expression or Script   										-> RESULT
====================================================================================================================================
<#list adv.fileTmplts as k>                                                   
	absolutePath			: ${k.absolutePath!''}
  	allFileAttrSelected		: ${k.allFileAttrSelected?c}
  	create					: ${k.create?c}
  	generatedPath			: ${k.generatedPath!''}
  	generatedType			: ${k.generatedType!''}
  	name					: ${k.name}
  	path					: ${k.path}
  	relativePath			: ${k.relativePath!''}
  	selected				: ${k.selected?c}
  	size					: ${k.size}
  	
  	<#list k.fileAttrList as l>
  		allFileAttrSelected	:  ${l.allFileAttrSelected?c}
  		create				:  ${l.create?c}
  		desc				:  ${l.desc}
  		name				:  ${l.name}
  		no					:  ${l.no}
  		value				:  ${l.value}
  	</#list>
  	
  	
                                                                            
</#list>  


====================================================================================================================================
B. AI Prompts File Templates, Default Attr, Public Attr, File Attr - Factor Subroutines -----------------------------------------------------------------------
====================================================================================================================================

Here's a **concise and AI-friendly summary** of your FreeMarker data model structure. You can use this to describe the model when prompting AI tools or developers:

---

### ✅ **FreeMarker Data Model Summary**

The `adv` object contains the following nested structures:

---

#### 🔹 `adv.fileDefaultAttrs`

* **Type:** Map (or Hash)
* **Usage:** Iterate with <#noparse>`<#list adv.fileDefaultAttrs as k, v>`</#noparse>
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

* <#noparse>`${var?c}`</#noparse>: Coerces Boolean to `true/false` string.
* <#noparse>`${var!''}`</#noparse>: Null-safe fallback to empty string.
* <#noparse>`${k.name}`</#noparse>: Standard variable access for fields.

---

Let me know if you want this converted to a visual tree diagram, JSON-style schema, or typed Java model.
