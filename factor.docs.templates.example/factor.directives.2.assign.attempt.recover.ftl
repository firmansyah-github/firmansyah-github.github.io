<#--
${PRV_SYS_GEN_PATH|directive|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.directives.2.assign.attempt.recover.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->
3. Assign Directive -------------------------------------------------------------------------------------------------->
====================
3.1.Expression or Script
==================== 
<#noparse>
<#assign seq = ["foo", "bar", "baz"] >
<#assign x = (x!0) + 1>
<#assign seq = ["foo", "bar", "baz"] x++>
x = ${x}

<#list seq as i>
  ${i?counter}: ${i}
</#list>
</#noparse>
	|||
	VVV
====================
3.1.RESULT
====================
<#assign seq = ["foo", "bar", "baz"] >
<#assign x = (x!0) + 1>
<#assign seq = ["foo", "bar", "baz"] x++>
x = ${x}

<#list seq as i>
  ${i?counter}: ${i}
</#list> 

====================
3.2.Expression or Script
==================== 
<#noparse>
<#import "/lib/mylib.ftl" as my>
<#assign bgColor="red" in my>
${my.bgColor}
</#noparse>
	|||
	VVV
====================
3.2.RESULT
====================
<#import "/lib/mylib.ftl" as my>
<#assign bgColor="red" in my>
${my.bgColor}

====================
3.3.Expression or Script
==================== 
<#noparse>
<#macro myMacro>foo</#macro>
<#assign x>
  <#list 1..3 as n>
    ${n} <@myMacro />
  </#list>
</#assign>
Number of words: ${x?word_list?size}
${x}
</#noparse>
	|||
	VVV
====================
3.3.RESULT
====================
<#macro myMacro>foo</#macro>
<#assign x>
  <#list 1..3 as n>
    ${n} <@myMacro />
  </#list>
</#assign>
Number of words: ${x?word_list?size}
${x}


4. attempt, recover Directive ----------------------------------------------------------------------------------------->
====================
4.1.Expression or Script
==================== 
<#noparse>
Primary content
<#attempt>
  Optional content: ${thisMayFails}
<#recover>
  Ops! The optional content is not available.
</#attempt>
Primary content continued
</#noparse>
	|||
	VVV
====================
4.1.RESULT
==================== 
Primary content
<#attempt>
  Optional content: ${thisMayFails}
<#recover>
  Ops! The optional content is not available.
</#attempt>
Primary content continued

