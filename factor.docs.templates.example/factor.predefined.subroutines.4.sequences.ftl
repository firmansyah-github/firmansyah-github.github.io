<#--
${PRV_SYS_GEN_PATH|predefined-subroutines|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.predefined.subroutines.4.sequences.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->


=====================================================================================================================
-- Apache FreeMarker 2.3.26 - Predefined Subroutines - Sequences Example -------
=====================================================================================================================

===================
1. chunk Expression or Script
==================== 
<#noparse> 
<#assign seq = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']>

<#list seq?chunk(4) as row>
  <#list row as cell>${cell} </#list>
</#list>

<#list seq?chunk(4, '-') as row>
  <#list row as cell>${cell} </#list>
</#list>
</#noparse>

	|||
	VVV
====================
1. chunk RESULT
====================
<#assign seq = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']>

<#list seq?chunk(4) as row>
  <#list row as cell>${cell} </#list>
</#list>

<#list seq?chunk(4, '-') as row>
  <#list row as cell>${cell} </#list>
</#list>



===================
2. first Expression or Script
==================== 
<#noparse> 
<#assign ls = ["whale", "Barbara", "zeppelin", "aardvark", "beetroot"]?sort?reverse?first>
${ls}
</#noparse>

	|||
	VVV
====================
2. first RESULT
====================
<#assign ls = ["whale", "Barbara", "zeppelin", "aardvark", "beetroot"]?sort?reverse?first>
${ls}

===================
3. join Expression or Script
==================== 
<#noparse> 
<#assign colors = ["red", "green", "blue"]>
${colors?join(", ")}
${colors?join(", ", "-")}
${[]?join(", ", "-")}

${colors?join(", ", "-", ".")}
${[]?join(", ", "-", ".")}
</#noparse>

	|||
	VVV
====================
3. join RESULT
====================
<#assign colors = ["red", "green", "blue"]>
${colors?join(", ")}
${colors?join(", ", "-")}
${[]?join(", ", "-")}

${colors?join(", ", "-", ".")}
${[]?join(", ", "-", ".")}


===================
4. last Expression or Script
==================== 
<#noparse> 
<#assign ls = ["whale", "Barbara", "zeppelin", "aardvark", "beetroot"]?sort?reverse?last>
${ls}
</#noparse>

	|||
	VVV
====================
4. last RESULT
====================
<#assign ls = ["whale", "Barbara", "zeppelin", "aardvark", "beetroot"]?sort?reverse?last>
${ls}


===================
5. reverse Expression or Script
==================== 
<#noparse> 
<#assign ls = ["whale", "Barbara", "zeppelin", "aardvark", "beetroot"]?sort?reverse>
<#list ls as i>${i} </#list>
</#noparse>

	|||
	VVV
====================
5. reverse RESULT
====================
<#assign ls = ["whale", "Barbara", "zeppelin", "aardvark", "beetroot"]?sort?reverse>
<#list ls as i>${i} </#list>


===================
6. seq_contains Expression or Script
==================== 
<#noparse> 
<#assign x = ["red", 16, "blue", "cyan"]>
"blue": ${x?seq_contains("blue")?string("yes", "no")}
"yellow": ${x?seq_contains("yellow")?string("yes", "no")}
16: ${x?seq_contains(16)?string("yes", "no")}
"16": ${x?seq_contains("16")?string("yes", "no")}
</#noparse>

	|||
	VVV
====================
6. seq_contains RESULT
====================
<#assign x = ["red", 16, "blue", "cyan"]>
"blue": ${x?seq_contains("blue")?string("yes", "no")}
"yellow": ${x?seq_contains("yellow")?string("yes", "no")}
16: ${x?seq_contains(16)?string("yes", "no")}
"16": ${x?seq_contains("16")?string("yes", "no")}


===================
7. seq_index_of Expression or Script
==================== 
<#noparse> 
<#assign colors = ["red", "green", "blue"]>
${colors?seq_index_of("blue")}
${colors?seq_index_of("red")}
${colors?seq_index_of("purple")}
</#noparse>

	|||
	VVV
====================
7. seq_index_of RESULT
====================
<#assign colors = ["red", "green", "blue"]>
${colors?seq_index_of("blue")}
${colors?seq_index_of("red")}
${colors?seq_index_of("purple")}

===================
8. seq_index_of Expression or Script
==================== 
<#noparse> 
<#assign names = ["Joe", "Fred", "Joe", "Susan"]>
No 2nd param: ${names?seq_index_of("Joe")}
-2: ${names?seq_index_of("Joe", -2)}
-1: ${names?seq_index_of("Joe", -1)}
 0: ${names?seq_index_of("Joe", 0)}
 1: ${names?seq_index_of("Joe", 1)}
 2: ${names?seq_index_of("Joe", 2)}
 3: ${names?seq_index_of("Joe", 3)}
 4: ${names?seq_index_of("Joe", 4)}
</#noparse>

	|||
	VVV
====================
8. seq_index_of RESULT
====================
<#assign names = ["Joe", "Fred", "Joe", "Susan"]>
No 2nd param: ${names?seq_index_of("Joe")}
-2: ${names?seq_index_of("Joe", -2)}
-1: ${names?seq_index_of("Joe", -1)}
 0: ${names?seq_index_of("Joe", 0)}
 1: ${names?seq_index_of("Joe", 1)}
 2: ${names?seq_index_of("Joe", 2)}
 3: ${names?seq_index_of("Joe", 3)}
 4: ${names?seq_index_of("Joe", 4)}

 
===================
9. seq_last_index_of Expression or Script
==================== 
<#noparse>  
<#assign names = ["Joe", "Fred", "Joe", "Susan"]>
No 2nd param: ${names?seq_last_index_of("Joe")}
-2: ${names?seq_last_index_of("Joe", -2)}
-1: ${names?seq_last_index_of("Joe", -1)}
 0: ${names?seq_last_index_of("Joe", 0)}
 1: ${names?seq_last_index_of("Joe", 1)}
 2: ${names?seq_last_index_of("Joe", 2)}
 3: ${names?seq_last_index_of("Joe", 3)}
 4: ${names?seq_last_index_of("Joe", 4)}
</#noparse>

	|||
	VVV
====================
9. seq_last_index_of RESULT
====================
<#assign names = ["Joe", "Fred", "Joe", "Susan"]>
No 2nd param: ${names?seq_last_index_of("Joe")}
-2: ${names?seq_last_index_of("Joe", -2)}
-1: ${names?seq_last_index_of("Joe", -1)}
 0: ${names?seq_last_index_of("Joe", 0)}
 1: ${names?seq_last_index_of("Joe", 1)}
 2: ${names?seq_last_index_of("Joe", 2)}
 3: ${names?seq_last_index_of("Joe", 3)}
 4: ${names?seq_last_index_of("Joe", 4)}

 
===================
10. sort Expression or Script
==================== 
<#noparse>    
<#assign ls = ["whale", "Barbara", "zeppelin", "aardvark", "beetroot"]?sort>
 <#list ls as i>${i} </#list>
${ls?size}


<#assign ls = ["whale", "Barbara", "zeppelin", "aardvark", "beetroot"]?sort>
<#list ls as i>${i} </#list>
</#noparse>

	|||
	VVV
====================
10. sort RESULT
====================
<#assign ls = ["whale", "Barbara", "zeppelin", "aardvark", "beetroot"]?sort>
 <#list ls as i>${i} </#list>
${ls?size}


<#assign ls = ["whale", "Barbara", "zeppelin", "aardvark", "beetroot"]?sort>
<#list ls as i>${i} </#list>

===================
11. sort_by Expression or Script
==================== 
<#noparse>  
<#assign ls = [
  {"name":"whale", "weight":2000},
  {"name":"Barbara", "weight":53},
  {"name":"zeppelin", "weight":-200},
  {"name":"aardvark", "weight":30},
  {"name":"beetroot", "weight":0.3}
]>
Order by name:
<#list ls?sort_by("name") as i>
- ${i.name}: ${i.weight}
</#list>

Order by weight:
<#list ls?sort_by("weight") as i>
- ${i.name}: ${i.weight}
</#list>
</#noparse>

	|||
	VVV
====================
11. sort_by RESULT
====================
<#assign ls = [
  {"name":"whale", "weight":2000},
  {"name":"Barbara", "weight":53},
  {"name":"zeppelin", "weight":-200},
  {"name":"aardvark", "weight":30},
  {"name":"beetroot", "weight":0.3}
]>
Order by name:
<#list ls?sort_by("name") as i>
- ${i.name}: ${i.weight}
</#list>

Order by weight:
<#list ls?sort_by("weight") as i>
- ${i.name}: ${i.weight}
</#list>





===================
12. sort_by Expression or Script
==================== 
<#noparse>  
<#assign members = [
    {"name": {"first": "Joe", "last": "Smith"}, "age": 40},
    {"name": {"first": "Fred", "last": "Crooger"}, "age": 35},
    {"name": {"first": "Amanda", "last": "Fox"}, "age": 25}]>
Sorted by name.last:
<#list members?sort_by(['name', 'last']) as m>
- ${m.name.last}, ${m.name.first}: ${m.age} years old
</#list>
</#noparse>

	|||
	VVV
====================
12. sort_by RESULT
====================
<#assign members = [
    {"name": {"first": "Joe", "last": "Smith"}, "age": 40},
    {"name": {"first": "Fred", "last": "Crooger"}, "age": 35},
    {"name": {"first": "Amanda", "last": "Fox"}, "age": 25}]>
Sorted by name.last:
<#list members?sort_by(['name', 'last']) as m>
- ${m.name.last}, ${m.name.first}: ${m.age} years old
</#list>

