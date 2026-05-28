<#--
${PRV_SYS_GEN_PATH|directive|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.directives.9.html_escape.setting.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->

19. html_escape Directive -------------------------------------------------------------------------------------------->
===================
19.1.Expression or Script
==================== 
<#noparse> 
<@html_escape>
  a < b
  Romeo & Juliet
</@html_escape>
</#noparse>

	|||
	VVV
====================
19.1.RESULT
====================
<@html_escape>
  a < b
  Romeo & Juliet
</@html_escape>


20. setting Directive ------------------------------------------------------------------------------------------------->
===================
20.1.Expression or Script   									-> RESULT
==================== 
<#noparse><#setting datetime_format="iso"></#noparse> 			-> <#setting datetime_format="iso">
<#noparse>${"1995-10-25T15:05"?datetime}</#noparse> 			-> ${"1995-10-25T15:05"?datetime}>

<#noparse><#setting url_escaping_charset="UTF-8"></#noparse>    -> <#setting url_escaping_charset="UTF-8">
<#noparse>${"a/b c"?url}</#noparse>   							-> ${"a/b c"?url}
<#noparse>${"a/b c"?url_path}</#noparse>   						-> ${"a/b c"?url_path}

<#noparse><#setting datetime_format="MMM dd, yyyy"></#noparse> 	-> <#setting datetime_format="MMM dd, yyyy">
<#noparse>${'Oct 25, 1995'?date?date_if_unknown}</#noparse> 	-> ${'Oct 25, 1995'?date?date_if_unknown}
<#noparse>${'3:05:30 PM'?time?time_if_unknown}</#noparse> 		-> ${'3:05:30 PM'?time?time_if_unknown}

<#noparse><#setting number_format="currency"></#noparse> 		-> <#setting number_format="currency">
<#noparse><#assign x=42></#noparse> 							-> <#assign x=42>
<#noparse>${x}</#noparse> 										-> ${x}

<#noparse><#setting number_format="0.##"></#noparse> 			-> <#setting number_format="0.##">
<#noparse>${1.234}</#noparse> 									-> ${1.234}

<#noparse><#setting number_format=",##0.00"></#noparse> 		-> <#setting number_format=",##0.00">
<#noparse><#setting locale="en_US"></#noparse> 					-> <#setting locale="en_US">
US people write:<#noparse>${12345678}</#noparse> 				-> US people write:${12345678}
<#noparse><#setting locale="hu"></#noparse> 					-> <#setting locale="hu">
German people write:<#noparse>${12345678}</#noparse> 			-> German people write:${12345678}

<#noparse><#setting locale="en_US"></#noparse> 					-> <#setting locale="en_US">
<#noparse>${10002.5?string[",000"]}</#noparse> 					-> ${10002.5?string[",000"]}
<#noparse>${10002.5?string[",000;; roundingMode=halfUp groupingSeparator=_"]}</#noparse> -> ${10002.5?string[",000;; roundingMode=halfUp groupingSeparator=_"]}
