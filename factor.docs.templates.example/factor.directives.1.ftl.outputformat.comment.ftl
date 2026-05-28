<#ftl output_format="HTML" auto_esc=false>
<#--

${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.directives.1.ftl.outputformat.comment.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->
1. outputformat Directive------------------------------------------------------------------------------------------------->
====================
1.1.Expression or Script
==================== 
<#noparse>
<#ftl output_format="HTML" auto_esc=false>
XML escaping: ${"&{}"}

<#outputformat "RTF">
  RTF escaping: ${"&{}"}
</#outputformat>

<#outputformat "plainText">
  No escsaping: ${"&{}"}
</#outputformat>

XML escsaping: ${"&{}"}
</#noparse>

	|||
	VVV
====================
1.1.RESULT
====================
XML escaping: ${"&{}"}

<#outputformat "RTF">
  RTF escaping: ${"&{}"}
</#outputformat>

<#outputformat "plainText">
  No escsaping: ${"&{}"}
</#outputformat>

XML escsaping: ${"&{}"}


====================
1.2.Expression or Script            -> RESULT
==================== 
<#noparse>${"R&D"}</#noparse> 		-> ${"R&D"}
<#noparse>${"R&D"?esc}</#noparse> 	-> ${"R&D"?esc}

====================
1.3.Expression or Script
==================== 
<#noparse>
<#autoesc>
  ${"&"}
  ...
  ${"&"}
</#autoesc>
</#noparse>

	|||
	VVV
====================
1.3.RESULT
====================
<#autoesc>
  ${"&"}
  ...
  ${"&"}
</#autoesc>


====================
1.4.Expression or Script						-> Result
==================== 
<#noparse>${"<b>Test</b>"}</#noparse> 			-> ${"<b>Test</b>"}
<#noparse>${"<b>Test</b>"?no_esc}</#noparse> 	-> ${"<b>Test</b>"?no_esc}

2. comment Directive--------------------------------------------------------------------------------------------->
====================
2.1.Expression or Script
==================== 
<#noparse>
<#-- 
<#ftl output_format="XML">
${"'{}"}
<#outputformat "HTML">
  ${"'{}"}
  <#outputformat "RTF">
    ${"'{}"}
  </#outputformat>
</#outputformat>


<#ftl outputFormat="XML">
${"'{}"}
<#outputFormat "{HTML}"><#-- Same as "XML{HTML}" --
  ${"'{}"}
  <#outputFormat '{RTF}'><#-- Same as "XML{HTML{RTF}}" --
    ${"'{}"}
  </#outputFormat>
</#outputFormat>

 -->
</#noparse>

	|||
	VVV
====================
1.3.RESULT
====================
<#-- 
<#ftl output_format="XML">
${"'{}"}
<#outputformat "HTML">
  ${"'{}"}
  <#outputformat "RTF">
    ${"'{}"}
  </#outputformat>
</#outputformat>


<#ftl outputFormat="XML">
${"'{}"}
<#outputFormat "{HTML}"><#-- Same as "XML{HTML}" --
  ${"'{}"}
  <#outputFormat '{RTF}'><#-- Same as "XML{HTML{RTF}}" --
    ${"'{}"}
  </#outputFormat>
</#outputFormat>

 -->