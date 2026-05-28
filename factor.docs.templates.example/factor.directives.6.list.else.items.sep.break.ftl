<#--
${PRV_SYS_GEN_PATH|directive|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.directives.6.list.else.items.sep.break.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->

13. list, else, items, sep, break Directive --------------------------------------------------------------------------->
====================
13.1.Expression or Script
==================== 
<#noparse>
<#assign users= ['Joe', 'Kate', 'Fred']> 
<#list users as user>
  <p>${user}
</#list>
<#list users>
  <ul>
    <#items as user>
      <li>${user}</li>
    </#items>
  </ul>
<#else>
  <p>No users
</#list>

<#list users as user>${user}<#sep>, </#list>

<#list users>
  <table>
    <#items as user>
      <tr class="${user?item_parity}Row">
        <td>${user?counter}
        <td>${user}
    </#items>
  </table>
</#list>
</#noparse>

	|||
	VVV
====================
13.1.RESULT
====================
<#assign users= ['Joe', 'Kate', 'Fred']> 
<#list users as user>
  <p>${user}
</#list> 
<#list users>
  <ul>
    <#items as user>
      <li>${user}</li>
    </#items>
  </ul>
<#else>
  <p>No users
</#list>

<#list users as user>${user}<#sep>, </#list>

<#list users>
  <table>
    <#items as user>
      <tr class="${user?item_parity}Row">
        <td>${user?counter}
        <td>${user}
    </#items>
  </table>
</#list>


====================
13.2.Expression or Script
==================== 
<#noparse>
<#assign products= { "apple": 5, "banana": 10, "kiwi": 15 }>
<#list products as name, price>
  <p>${name}: ${price}
</#list>
</#noparse>

	|||
	VVV
====================
13.2.RESULT
====================
<#assign products= { "apple": 5, "banana": 10, "kiwi": 15 }>
<#list products as name, price>
  <p>${name}: ${price}
</#list>


====================
13.3.Expression or Script
==================== 
<#noparse>
<#list 1..10 as x>
  ${x}
  <#if x == 3>
    <#break>
  </#if>
</#list>
</#noparse>

	|||
	VVV
====================
13.3.RESULT
====================
<#list 1..10 as x>
  ${x}
  <#if x == 3>
    <#break>
  </#if>
</#list>

====================
13.4.Expression or Script
==================== 
<#noparse>
<#list 1..2 as i>
  <#list 1..3 as j>
    i = ${i}, j = ${j}
  </#list>
</#list>
</#noparse>

	|||
	VVV
====================
13.4.RESULT
====================
<#list 1..2 as i>
  <#list 1..3 as j>
    i = ${i}, j = ${j}
  </#list>
</#list>

====================
13.5.Expression or Script
==================== 
<#noparse>
<#list 1..2 as i>
  Outer: ${i}
  <#list 10..12 as i>
    Inner: ${i}
  </#list>
  Outer again: ${i}
</#list>
</#noparse>

	|||
	VVV
====================
13.5.RESULT
====================
<#list 1..2 as i>
  Outer: ${i}
  <#list 10..12 as i>
    Inner: ${i}
  </#list>
  Outer again: ${i}
</#list>

