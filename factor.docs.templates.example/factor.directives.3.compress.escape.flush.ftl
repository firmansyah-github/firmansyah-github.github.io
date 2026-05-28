<#--
${PRV_SYS_GEN_PATH|directive|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.directives.3.compress.escape.flush.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->

5. compress Directive ------------------------------------------------------------------------------------------------->
====================
5.1.Expression or Script
==================== 
<#noparse>
<#assign moo = "    moo  \n\n   ">
(<#compress>
  1 2  3   4    5
  ${moo}
  test only

  I said, test only

</#compress>)
</#noparse>
	|||
	VVV
====================
5.1.RESULT
==================== 
<#assign moo = "    moo  \n\n   ">
(<#compress>
  1 2  3   4    5
  ${moo}
  test only

  I said, test only

</#compress>)

6. escape Directive --------------------------------------------------------------------------------------------------->
====================
6.1.Expression or Script
==================== 
<#noparse>
<#assign x = "<test>">
<#macro m1>
  m1: ${x}
</#macro>

<#escape x as x?html>
  <#macro m2>m2: ${x}</#macro>
  ${x}
  <@m1/>
</#escape>
${x}
<@m2/>

<#escape x as x?html>
  From: ${x}
  Subject: This is Subject
  <#noescape>Message: <b> This is Message </b> of ${x}</#noescape>
  ...
</#escape>

<#escape x as x?html>
  Customer Name: ${x}
  Items to ship:
  <#escape x as x>
    ${x}
  </#escape>
</#escape>
</#noparse>

	|||
	VVV
====================
6.1.RESULT
==================== 
<#assign x = "<test>">
<#macro m1>
  m1: ${x}
</#macro>

<#escape x as x?html>
  <#macro m2>m2: ${x}</#macro>
  ${x}
  <@m1/>
</#escape>
${x}
<@m2/>

<#escape x as x?html>
  From: ${x}
  Subject: This is Subject
  <#noescape>Message: <b> This is Message </b> of ${x}</#noescape>
  ...
</#escape>

<#escape x as x?html>
  Customer Name: ${x}
  Items to ship:
  <#escape x as x>
    ${x}
  </#escape>
</#escape>

7. flush Directive ---------------------------------------------------------------------------------------------------->
<#flush>
