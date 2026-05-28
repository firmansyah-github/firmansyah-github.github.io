<#--
${PRV_SYS_GEN_PATH|directive|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.directives.8.stop.switch.case.default.break.trim.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->



16. stop Directive ---------------------------------------------------------------------------------------------------->
====================
16.1.Expression or Script
==================== 
<#noparse> 
<#stop "I want to stop">
</#noparse>

	|||
	VVV
====================
16.1.RESULT
====================
<#-- <#stop "I want to stop"> -->

 
17. switch, case, default, break Directive ---------------------------------------------------------------------------->
====================
17.1.Expression or Script
==================== 
<#noparse> 
<#assign animal="small">
<#switch animal>
  <#case "small">
     This will be processed if it is small
     <#break>
  <#case "medium">
     This will be processed if it is medium
     <#break>
  <#case "large">
     This will be processed if it is large
     <#break>
  <#default>
     This will be processed if it is neither
</#switch>
</#noparse>

	|||
	VVV
====================
17.1.RESULT
====================
<#assign animal="small">
<#switch animal>
  <#case "small">
     This will be processed if it is small
     <#break>
  <#case "medium">
     This will be processed if it is medium
     <#break>
  <#case "large">
     This will be processed if it is large
     <#break>
  <#default>
     This will be processed if it is neither
</#switch>


===================
17.2.Expression or Script
==================== 
<#noparse> 
<#assign x=5>
<#switch x>
  <#case 1>
    1
  <#case 2>
    2
  <#default>
    d
</#switch>
</#noparse>

	|||
	VVV
====================
17.2.RESULT
====================
<#assign x=5>
<#switch x>
  <#case 1>
    1
  <#case 2>
    2
  <#default>
    d
</#switch>



18. trim Directive ---------------------------------------------------------------------------->
===================
18.1.Expression or Script
==================== 
<#noparse> 
  1 <#t>
  2<#t>
  3<#lt>
  4
  5<#rt>
  6
</#noparse>

	|||
	VVV
====================
18.1.RESULT
====================

  1 <#t>
  2<#t>
  3<#lt>
  4
  5<#rt>
  6
