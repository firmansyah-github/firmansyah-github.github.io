<#--
${PRV_SYS_GEN_PATH|directive|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.directives.5.if.elseif.else.import.include.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->

10. if, elseif, else Directive ----------------------------------------------------------------------------------------->
====================
10.1.Expression or Script
==================== 
<#noparse>
<#assign x = 10 y=-10>
<#if x == 1>
  x is 1
<#elseif x == 2>
  x is 2
<#elseif x == 3>
  x is 3
<#elseif x == 4>
  x is 4
<#else>
  x is not 1 nor 2 nor 3 nor 4
</#if>


<#if x == 1>
  x is 1
  <#if y == 1>
    and y is 1 too
  <#else>
    but y is not
  </#if>
<#else>
  x is not 1
  <#if y < 0>
    and y is less than 0
  </#if>
</#if>
</#noparse>
	|||
	VVV
====================
10.1.RESULT
==================== 
<#assign x = 10 y=-10>
<#if x == 1>
  x is 1
<#elseif x == 2>
  x is 2
<#elseif x == 3>
  x is 3
<#elseif x == 4>
  x is 4
<#else>
  x is not 1 nor 2 nor 3 nor 4
</#if>

<#if x == 1>
  x is 1
  <#if y == 1>
    and y is 1 too
  <#else>
    but y is not
  </#if>
<#else>
  x is not 1
  <#if y < 0>
    and y is less than 0
  </#if>
</#if>


11. import Directive --------------------------------------------------------------------------------------------------->
====================
11.1.Expression or Script
==================== 
<#noparse>
<#import "/lib/mylib.ftl" as my>

Some Web page...
<@my.copyright date="1999-2002"/>
${my.mail}
</#noparse>

	|||
	VVV
====================
11.1.RESULT
==================== 
<#import "/lib/mylib.ftl" as my>

Some Web page...
<@my.copyright date="1999-2002"/>
${my.mail}


12. include Directive ------------------------------------------------------------------------------------------------->
====================
12.1.Expression or Script
==================== 
<#noparse>
<#assign me = "Juila Smith">
<h1>Some test</h1>
<p>Yeah.
<hr>
<#include "/lib/myInclude.ftl">

<#include "/lib/myInclude.ftl" parse=false encoding="Shift_JIS" ignore_missing=true>
</#noparse>

	|||
	VVV
====================
12.1.RESULT
==================== 
<#assign me = "Juila Smith">
<h1>Some test</h1>
<p>Yeah.
<hr>
<#include "/lib/myInclude.ftl">

<#include "/lib//myInclude.ftl" parse=false encoding="Shift_JIS" ignore_missing=true>
