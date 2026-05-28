<#--
${PRV_SYS_GEN_PATH|directive|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.directives.7.local.macro.nested.return.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->

14. local Directive --------------------------------------------------------------------------------------------------->
====================
14.1.Expression or Script
==================== 
<#noparse>
<#function sum>
  <#local num = 0, num2=2>
  <#return num2>
</#function>
${sum()}
</#noparse>

	|||
	VVV
====================
14.1.RESULT
==================== 
<#function sum>
  <#local num = 0, num2=2>
  <#return num2>
</#function>
${sum()}


====================
14.2.Expression or Script
==================== 
<#noparse>
<#macro test>
  <#local num>
  <p>Copyright (C)Someone. All rights reserved.</p>
  </#local>
  ${num}
</#macro>
<@test/>
</#noparse>
	|||
	VVV
====================
14.2.RESULT
==================== 
<#macro test>
  <#local num>
  <p>Copyright (C)Someone. All rights reserved.</p>
  </#local>
  ${num}
</#macro>
<@test/>



15. macro, nested, return Directive ----------------------------------------------------------------------------------->
====================
15.1.Expression or Script
==================== 
<#noparse>
<#macro test>
  Test text
</#macro>
<#-- call the macro: -->
<@test/>
</#noparse>

	|||
	VVV
====================
15.1.RESULT
==================== 
<#macro test>
  Test text
</#macro>
<#-- call the macro: -->
<@test/>


====================
15.2.Expression or Script
==================== 
<#noparse>
<#macro test foo bar baaz>
  Test text, and the params: ${foo}, ${bar}, ${baaz}
</#macro>
<#-- call the macro: -->
<@test foo="a" bar="b" baaz=5*5-2/>
</#noparse>

	|||
	VVV
====================
15.2.RESULT
====================
<#macro test foo bar baaz>
  Test text, and the params: ${foo}, ${bar}, ${baaz}
</#macro>
<#-- call the macro: -->
<@test foo="a" bar="b" baaz=5*5-2/>



====================
15.3.Expression or Script
==================== 
<#noparse>
<#macro test foo bar="Bar" baaz=-1>
  Test text, and the params: ${foo}, ${bar}, ${baaz}
</#macro>
<@test foo="a" bar="b" baaz=5*5-2/>
<@test foo="a" bar="b"/>
<@test foo="a" baaz=5*5-2/>
<@test foo="a"/>
</#noparse>

	|||
	VVV
====================
15.3.RESULT
====================
<#macro test foo bar="Bar" baaz=-1>
  Test text, and the params: ${foo}, ${bar}, ${baaz}
</#macro>
<@test foo="a" bar="b" baaz=5*5-2/>
<@test foo="a" bar="b"/>
<@test foo="a" baaz=5*5-2/>
<@test foo="a"/>

====================
15.4.Expression or Script
==================== 
<#noparse>
<#macro list title items>
  <p>${title?cap_first}:
  <ul>
    <#list items as x>
      <li>${x?cap_first}
    </#list>
  </ul>
</#macro>
<@list items=["mouse", "elephant", "python"] title="Animals"/>
</#noparse>

	|||
	VVV
====================
15.4.RESULT
====================
<#macro list title items>
  <p>${title?cap_first}:
  <ul>
    <#list items as x>
      <li>${x?cap_first}
    </#list>
  </ul>
</#macro>
<@list items=["mouse", "elephant", "python"] title="Animals"/>




====================
15.5.Expression or Script
==================== 
<#noparse>
<#macro img src extra...>
  <img src="/myapp${src?ensure_starts_with('/')}"
    <#list extra as attrName, attrVal>
      ${attrName}="${attrVal}"
    </#list>
  >
</#macro>
<@img src="/images/test.png" width=100 height=50 alt="Test"/>
</#noparse>

	|||
	VVV
====================
15.5.RESULT
====================
<#macro img src extra...>
  <img src="/myapp${src?ensure_starts_with('/')}"
    <#list extra as attrName, attrVal>
      ${attrName}="${attrVal}"
    </#list>
  >
</#macro>
<@img src="/images/test.png" width=100 height=50 alt="Test"/>


====================
15.6.Expression or Script
==================== 
<#noparse>
<#macro m a b ext...>
  a = ${a}
  b = ${b}
  <#if ext?is_sequence>
    <#list ext as e>
      ${e?index} = ${e}
    </#list>
  <#else>
    <#list ext as k, v>
      ${k} = ${v}
    </#list>
  </#if>
</#macro>

<@m 1 2 3 4 5 />

<@m a=1 b=2 c=3 d=4 e=5 data\-foo=6 myns\:bar=7 />
</#noparse>

	|||
	VVV
====================
15.6.RESULT
====================
<#macro m a b ext...>
  a = ${a}
  b = ${b}
  <#if ext?is_sequence>
    <#list ext as e>
      ${e?index} = ${e}
    </#list>
  <#else>
    <#list ext as k, v>
      ${k} = ${v}
    </#list>
  </#if>
</#macro>

<@m 1 2 3 4 5 />

<@m a=1 b=2 c=3 d=4 e=5 data\-foo=6 myns\:bar=7 />


====================
15.7.Expression or Script
==================== 
<#noparse>
<#macro do_twice>
  1. <#nested>
  2. <#nested>
</#macro>
<@do_twice>something</@do_twice>
</#noparse>

	|||
	VVV
====================
15.7.RESULT
====================
<#macro do_twice>
  1. <#nested>
  2. <#nested>
</#macro>
<@do_twice>something</@do_twice>


====================
15.8.Expression or Script
==================== 
<#noparse>
<#macro do_thrice>
  <#nested 1>
  <#nested 2>
  <#nested 3>
</#macro>
<@do_thrice ; x>
  ${x} Anything.
</@do_thrice>
</#noparse>

	|||
	VVV
====================
15.8.RESULT
====================
<#macro do_thrice>
  <#nested 1>
  <#nested 2>
  <#nested 3>
</#macro>
<@do_thrice ; x>
  ${x} Anything.
</@do_thrice>



====================
15.9.Expression or Script
==================== 
<#noparse>
 <#macro repeat count>
  <#list 1..count as x>
    <#nested x, x/2, x==count>
  </#list>
</#macro>
<@repeat count=4 ; c, halfc, last>
  ${c}. ${halfc}<#if last> Last!</#if>
</@repeat>
</#noparse>

	|||
	VVV
====================
15.9.RESULT
====================
 <#macro repeat count>
  <#list 1..count as x>
    <#nested x, x/2, x==count>
  </#list>
</#macro>
<@repeat count=4 ; c, halfc, last>
  ${c}. ${halfc}<#if last> Last!</#if>
</@repeat>

====================
15.10.Expression or Script
==================== 
<#noparse> 
 <#macro test>
  Test text
  <#return>
  Will not be printed.
</#macro>
<@test/>
</#noparse>

	|||
	VVV
====================
15.10.RESULT
====================
 <#macro test>
  Test text
  <#return>
  Will not be printed.
</#macro>
<@test/>

====================
15.11.Expression or Script
==================== 
<#noparse> 
<#macro heading title level>
  <p>${title?cap_first}:
  <p>${level}:  
</#macro> 
<@heading "Preface", 1/> is equivalent with 
<@heading title="Preface" level=1/> or 
<@heading level=1 title="Preface"/>
</#noparse>

	|||
	VVV
====================
15.11.RESULT
====================
<#macro heading title level>
  <p>${title?cap_first}:
  <p>${level}:  
</#macro> 
<@heading "Preface", 1/> is equivalent with 
<@heading title="Preface" level=1/> or 
<@heading level=1 title="Preface"/>
