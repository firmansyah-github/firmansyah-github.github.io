<#--
${PRV_SYS_GEN_PATH|user-defined-subroutines|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.user.defined.subroutines.2.generation.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->


=====================================================================================================================
-- Apache FreeMarker 2.3.26 - Factor User Defined Subroutines - Generation Example -------
=====================================================================================================================
=====================================================================================================================
A. Generation - Factor Subroutines ------------------------------------------------------------------------------------
=====================================================================================================================

=====================================================================================================================
Expression or Script   										-> RESULT
=====================================================================================================================
<#noparse>${adv.buildDate?datetime}</#noparse>							->	${adv.buildDate?datetime}
                                                                              
<#noparse>${adv.comment}</#noparse>    									->	${adv.comment}
                                                                              
<#noparse>${adv.generation.create?c}</#noparse>							->	${adv.generation.create?c}
                                                                              
<#noparse>${adv.generation.outputDir?has_content?c}</#noparse>			->	${adv.generation.outputDir?has_content?c}
                                                                              
<#noparse>${adv.generation.packageName?has_content?c}</#noparse> 		->	${adv.generation.packageName?has_content?c}
                                                                              
<#noparse>${adv.generation.rootDir}</#noparse>							->	${adv.generation.rootDir}
                                                                              
<#noparse>${adv.generation.specifyTemplateDir?c}</#noparse>				->	${adv.generation.specifyTemplateDir?c}
                                                                              
<#noparse>${adv.generation.superClassName?has_content?c}</#noparse>		->	${adv.generation.superClassName?has_content?c}
                                                                              
<#noparse>${adv.generation.templateDir}</#noparse>						->	${adv.generation.templateDir}


=====================================================================================================================
B. [WARNING] Override Generation - Factor Subroutines -----------------------------------------------------------------
=====================================================================================================================
=====================================================================================================================
Expression or Script   										-> RESULT
=====================================================================================================================
<#noparse>${adv.setBuildDate(.now)}</#noparse>							->	${adv.setBuildDate(.now)}
<#noparse>${adv.buildDate?datetime}</#noparse>							->	${adv.buildDate?datetime}

<#noparse>${adv.setComment('TEST COMMENT ADDITIONAL')}</#noparse>		->	${adv.setComment('TEST COMMENT ADDITIONAL')}
<#noparse>${adv.comment}</#noparse>    									->	${adv.comment}

<#noparse>${adv.generation.setCreate(true)}</#noparse>					->	${adv.generation.setCreate(true)}
<#noparse>${adv.generation.create?c}</#noparse>							->	${adv.generation.create?c}

<#-- DO NOT USED -->
<#-- IF YOU WANT TO TRY REMOVE THIS LINE COMMENTS 
<#noparse>${adv.generation.setOutputDir('outputDir')}</#noparse>		->	${adv.generation.setOutputDir('outputDir')}
<#noparse>${adv.generation.outputDir}</#noparse>						->	${adv.generation.outputDir}


<#noparse>${adv.generation.setPackageName('packageName')}</#noparse>	->	${adv.generation.setPackageName('packageName')}
<#noparse>${adv.generation.packageName}</#noparse> 						->	${adv.generation.packageName}


<#noparse>${adv.generation.setRootDir('rootDir')}</#noparse>			->	${adv.generation.setRootDir('rootDir')}
<#noparse>${adv.generation.rootDir}</#noparse>							->	${adv.generation.rootDir}


<#noparse>${adv.generation.setSpecifyTemplateDir(true)}</#noparse>		->	${adv.generation.setSpecifyTemplateDir(true)}
<#noparse>${adv.generation.specifyTemplateDir?c}</#noparse>				->	${adv.generation.specifyTemplateDir?c}


<#noparse>${adv.generation.setSuperClassName('superClassName')}</#noparse>	->	${adv.generation.setSuperClassName('superClassName')}
<#noparse>${adv.generation.superClassName}</#noparse>					->	${adv.generation.superClassName}


<#noparse>${adv.generation.setTemplateDir('templateDir')}</#noparse>	->	${adv.generation.setTemplateDir('templateDir')}
<#noparse>${adv.generation.templateDir}</#noparse>						->	${adv.generation.templateDir}

IF YOU WANT TO TRY REMOVE THIS LINE COMMENTS -->





=====================================================================================================================
C. NOT USED Generation - Factor Subroutines ---------------------------------------------------------------------------
=====================================================================================================================
=====================================================================================================================
Expression or Script   										-> RESULT
=====================================================================================================================
<#noparse>${adv.generation.addPropertyChangeListener(null)}</#noparse>	->	${adv.generation.addPropertyChangeListener(null)}

<#noparse>${adv.generation.addValueModifyListener(null)}</#noparse>		->	${adv.generation.addValueModifyListener(null)}

<#noparse>${adv.generation.propertyChange(null)}</#noparse>				->	${adv.generation.propertyChange(null)}

<#noparse>${adv.generation.removePropertyChangeListener(null)}</#noparse>	->	${adv.generation.removePropertyChangeListener(null)}

<#-- DO NOT USED -->
<#--
<#noparse>${adv.generation.valueModified()}</#noparse>	->	${adv.generation.valueModified()}
-->




=====================================================================================================================
D. AI Prompts Generation - Factor Subroutines ---------------------------------------------------------------------------
=====================================================================================================================
Here's a **clear summary** of the **FreeMarker data model (adv)** usage you shared, grouped into **two main parts**:

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

Let me know if you want to export this to PDF or add more details like expected Java method signatures (`setX()`, `getX()`) behind this model.
