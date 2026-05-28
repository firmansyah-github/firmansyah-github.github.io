<#--
${PRV_SYS_GEN_PATH|predefined-subroutines|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.predefined.subroutines.3.loop.hashes.specialVariable.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->

=====================================================================================================================
-- Apache FreeMarker 2.3.26 - Predefined Subroutines - Loop variable Example               --------------------------
=====================================================================================================================

=====================================================================================================================
Expression or Script   										-> RESULT
=====================================================================================================================

===================
1. counter Expression or Script
==================== 
<#noparse> 
<#list ['a', 'b', 'c'] as i>
${i?counter}: ${i}
</#list>
</#noparse> 
	|||
	VVV
====================
1. counter RESULT
====================
<#list ['a', 'b', 'c'] as i>
${i?counter}: ${i}
</#list>


===================
2. has_next Expression or Script
==================== 
<#noparse>
<#list ['a', 'b', 'c'] as i>
${i?has_next?c} 
</#list>
</#noparse>
    |||
	VVV
====================
2. has_next RESULT
====================
<#list ['a', 'b', 'c'] as i>
${i?has_next?c} 
</#list>

===================
3. index Expression or Script
==================== 
<#noparse>
<#list ['a', 'b', 'c'] as i>
${i?index}: ${i}
</#list>
</#noparse>
    |||
	VVV
====================
3. index RESULT
====================
<#list ['a', 'b', 'c'] as i>
${i?index}: ${i}
</#list>


===================
4. is_even_item Expression or Script
==================== 
<#noparse>
<#list ['a', 'b', 'c', 'd'] as i>
${i?is_even_item?c} 
</#list>
</#noparse>
    |||
	VVV
====================
4. is_even_item RESULT
====================
<#list ['a', 'b', 'c', 'd'] as i>
${i?is_even_item?c} 
</#list>

===================
5. is_first Expression or Script
==================== 
<#noparse>
<#list ['a', 'b', 'c'] as i>
${i?is_first?c} 
</#list>
</#noparse>
    |||
	VVV
====================
5. is_first RESULT
====================
<#list ['a', 'b', 'c'] as i>
${i?is_first?c} 
</#list>

===================
6. is_last Expression or Script
==================== 
<#noparse>
<#list ['a', 'b', 'c'] as i>$
{i?is_last?c} 
</#list>
</#noparse>
    |||
	VVV
====================
6. is_last RESULT
====================
<#list ['a', 'b', 'c'] as i>
${i?is_last?c} 
</#list>

===================
7. is_odd_item Expression or Script
==================== 
<#noparse>
<#list ['a', 'b', 'c', 'd'] as i>
${i?is_odd_item?c} 
</#list>
</#noparse>
    |||
	VVV
====================
7. is_odd_item RESULT
====================
<#list ['a', 'b', 'c', 'd'] as i>
${i?is_odd_item?c} 
</#list>

===================
8. item_cycle Expression or Script
==================== 
<#noparse>
<#list ['a', 'b', 'c', 'd', 'e', 'f', 'g'] as i>
<tr class="${i?item_cycle('row1', 'row2', 'row3')}">${i}</tr><
/#list>
</#noparse>
    |||
	VVV
====================
8. item_cycle RESULT
====================
<#list ['a', 'b', 'c', 'd', 'e', 'f', 'g'] as i>
<tr class="${i?item_cycle('row1', 'row2', 'row3')}">${i}</tr>
</#list>

===================
9. item_parity Expression or Script
====================     
<#noparse>
<#list ['a', 'b', 'c', 'd'] as i>
<tr class="${i?item_parity}Row">${i}</tr>
</#list>
</#noparse>
    |||
	VVV
====================
9. item_parity RESULT
====================
<#list ['a', 'b', 'c', 'd'] as i>
<tr class="${i?item_parity}Row">${i}</tr>
</#list>

===================
10. item_parity_cap Expression or Script
====================     
<#noparse>
<#list ['a', 'b', 'c', 'd'] as i>
<tr class="row${i?item_parity_cap}">${i}</tr>
</#list>
</#noparse> 
    |||
	VVV
====================
10. item_parity_cap RESULT
====================
<#list ['a', 'b', 'c', 'd'] as i>
<tr class="row${i?item_parity_cap}">${i}</tr>
</#list>

=====================================================================================================================
-- Apache FreeMarker 2.3.26 - Predefined Subroutines - Hashes/Type independent/Seldom used and Expert Example -------
=====================================================================================================================
===================
1. keys Expression or Script
==================== 
<#noparse>
<#assign myHash = { "name": "mouse", "price": 50 }>
<#list myHash?keys as k>
  ${k}
</#list>
</#noparse> 
    |||
	VVV
====================
1. keys RESULT
====================
<#assign myHash = { "name": "mouse", "price": 50 }>
<#list myHash?keys as k>
  ${k}
</#list>

===================
2. values Expression or Script
====================
<#noparse>
<#assign myHash = { "name": "mouse", "price": 50 }>
<#list myHash?values as v>
  ${v}
</#list>
</#noparse> 
    |||
	VVV
====================
2. values RESULT
==================== 
<#assign myHash = { "name": "mouse", "price": 50 }>
<#list myHash?values as v>
  ${v}
</#list>


===================
3. switch Expression or Script
====================
<#noparse>
<#list ['r', 'w', 'x', 's'] as flag>
  ${flag?switch('r', 'readable', 'w' 'writable', 'x', 'executable', 'unknown flag: ' + flag)}
</#list>
</#noparse> 
    |||
	VVV
====================
3. switch RESULT
==================== 
<#list ['r', 'w', 'x', 's'] as flag>
  ${flag?switch('r', 'readable', 'w' 'writable', 'x', 'executable', 'unknown flag: ' + flag)}
</#list>

<#noparse>${"1+2"?eval}</#noparse> 												-> ${"1+2"?eval}

<#noparse>${""?has_content?c}</#noparse> 										-> ${""?has_content?c}

<#noparse><#assign x=["a", "b", "c"]></#noparse> 								-> <#assign x=["a", "b", "c"]>
<#noparse><#assign templateSource = r"<#list x as y>${y}</#list>"></#noparse> 	-> <#assign templateSource = r"<#list x as y>${y}</#list>">
<#-- Note: That r was needed so that the ${y} is not interpreted above -->
<#noparse><#assign inlineTemplate = templateSource?interpret></#noparse> 		-> <#assign inlineTemplate = templateSource?interpret>
<#noparse><@inlineTemplate /></#noparse> 										-> <@inlineTemplate />


=====================================================================================================================
-- Apache FreeMarker 2.3.26 - Predefined Subroutines - Special Variable Reference Example -------
=====================================================================================================================

<#noparse><#ftl output_format="HTML" auto_esc=false></#noparse>

<#noparse>Today is ${.now?date}</#noparse> 		-> Today is ${.now?date}
<#noparse>"Page generated: ${.now}"</#noparse> 	-> "Page generated: ${.now}"

