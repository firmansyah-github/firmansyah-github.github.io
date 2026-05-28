<#--
${PRV_SYS_GEN_PATH|directive|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.directives.4.function.return.global.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->

8. function, return Directive ----------------------------------------------------------------------------------------->
====================
8.1.Expression or Script
==================== 
<#noparse>
<#function avg x y>
  <#return (x + y) / 2>
</#function>
${avg(10, 20)}
</#noparse>

	|||
	VVV
====================
8.1.RESULT
==================== 
<#function avg x y>
  <#return (x + y) / 2>
</#function>
${avg(10, 20)}

====================
8.2.Expression or Script
==================== 
<#noparse>
<#function avg nums...>
  <#local sum = 0>
  <#list nums as num>
    <#local sum += num>
  </#list>
  <#if nums?size != 0>
    <#return sum / nums?size>
  </#if>
</#function>
${avg(10, 20)}
${avg(10, 20, 30, 40)}
${avg()!"N/A"}
</#noparse>

	|||
	VVV
====================
8.2.RESULT
==================== 
<#function avg nums...>
  <#local sum = 0>
  <#list nums as num>
    <#local sum += num>
  </#list>
  <#if nums?size != 0>
    <#return sum / nums?size>
  </#if>
</#function>
${avg(10, 20)}
${avg(10, 20, 30, 40)}
${avg()!"N/A"}
 
  
   
====================
8.3.Expression or Script
==================== 
<#noparse>     
<#function avg x y>
  <#return (x + y) / 2>
</#function>
${avg(10, 20)}
</#noparse>

	|||
	VVV
====================
8.3.RESULT
==================== 
<#function avg x y>
  <#return (x + y) / 2>
</#function>
${avg(10, 20)}


====================
8.4.Expression or Script
==================== 
<#noparse>     
<#function avg nums...>
  <#local sum = 0>
  <#list nums as num>
    <#local sum += num>
  </#list>
  <#if nums?size != 0>
    <#return sum / nums?size>
  </#if>
</#function>
${avg(10, 20)}
${avg(10, 20, 30, 40)}
${avg()!"N/A"}
</#noparse>

	|||
	VVV
====================
8.4.RESULT
==================== 
<#function avg nums...>
  <#local sum = 0>
  <#list nums as num>
    <#local sum += num>
  </#list>
  <#if nums?size != 0>
    <#return sum / nums?size>
  </#if>
</#function>
${avg(10, 20)}
${avg(10, 20, 30, 40)}
${avg()!"N/A"}


9. global Directive --------------------------------------------------------------------------------------------------->
====================
9.1.Expression or Script
==================== 
<#noparse>
<#global name="value">
<#global name1="value1" name2=2 >
<#global name3>
  capture this
</#global>

${name}
${name1}
${name2}
${name3}
</#noparse>

	|||
	VVV
====================
9.1.RESULT
==================== 
<#global name="value">
<#global name1="value1" name2=2 >
<#global name3>
  capture this
</#global>

${name}
${name1}
${name2}
${name3}
