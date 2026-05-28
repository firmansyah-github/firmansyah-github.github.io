<#--
${PRV_SYS_GEN_PATH|predefined-subroutines|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.predefined.subroutines.2.booleans.date.time.numbers.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->

=====================================================================================================================
-- Apache FreeMarker 2.3.26 - Predefined Subroutines - Booleans/Date/Time/Numbers Example ---------------------------
=====================================================================================================================

=====================================================================================================================
Expression or Script   										-> RESULT
=====================================================================================================================

<#noparse>${true?c}</#noparse> 								-> ${true?c}
<#noparse>${true?string("yes","no")}</#noparse> 			-> ${true?string("yes","no")}

<#noparse><#assign foo=true></#noparse> 					-> <#assign foo=true>
<#noparse>${foo?then('Y','N')}</#noparse> 					-> ${foo?then('Y','N')}

<#noparse><#assign foo=false></#noparse> 					-> <#assign foo=false>
<#noparse>${foo?then('Y','N')}</#noparse> 					-> ${foo?then('Y','N')}

<#noparse><#assign x=10></#noparse> 						-> <#assign x=10>
<#noparse><#assign y=20></#noparse> 						-> <#assign y=20>

<#--Prints100plusthemaximumofxandy: -->  
<#noparse>${100+(x>y)?then(x,y)}</#noparse> 				-> ${100+(x>y)?then(x,y)}

<#noparse><#setting datetime_format="MMM dd, yyyy"></#noparse> 	-> <#setting datetime_format="MMM dd, yyyy">
<#noparse>${'Oct 25, 1995'?date?date_if_unknown}</#noparse> 	-> ${'Oct 25, 1995'?date?date_if_unknown}
<#noparse>${'3:05:30 PM'?time?time_if_unknown}</#noparse> 		-> ${'3:05:30 PM'?time?time_if_unknown}
<#noparse><#setting datetime_format="MMM dd,yyyy hh:mm:ss a"></#noparse> 		-> <#setting datetime_format="MMM dd,yyyy hh:mm:ss a">
<#noparse>${'Oct 25, 1995 03:05:00 PM'?datetime?datetime_if_unknown}</#noparse> -> ${'Oct 25, 1995 03:05:00 PM'?datetime?datetime_if_unknown}

 
--Predefined format names: --
===================================================================
<#noparse><#setting datetime_format="MMM dd,yyyy hh:mm:ss a"></#noparse> 	-> <#setting datetime_format="MMM dd,yyyy hh:mm:ss a">
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.short}</#noparse> 	-> ${"Oct 25,1995 03:05:00 PM"?datetime?string.short}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.medium}</#noparse> 	-> ${"Oct 25,1995 03:05:00 PM"?datetime?string.medium}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.long}</#noparse> 		-> ${"Oct 25,1995 03:05:00 PM"?datetime?string.long}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.full}</#noparse> 		-> ${"Oct 25,1995 03:05:00 PM"?datetime?string.full}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.xs}</#noparse> 		-> <#--XSDxs:time --> ${"Oct 25,1995 03:05:00 PM"?datetime?string.xs}<#--XSDxs:time --> 
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.iso}</#noparse> 		-> <#--ISO8601time --> ${"Oct 25,1995 03:05:00 PM"?datetime?string.iso}<#--ISO8601time --> 

<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.short}</#noparse> 	-> ${"Oct 25,1995 03:05:00 PM"?datetime?string.short}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.medium}</#noparse> 	-> ${"Oct 25,1995 03:05:00 PM"?datetime?string.medium}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.long}</#noparse> 		-> ${"Oct 25,1995 03:05:00 PM"?datetime?string.long}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.full}</#noparse> 		-> ${"Oct 25,1995 03:05:00 PM"?datetime?string.full}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.xs}</#noparse> 		-> <#--XSDxs:date --> ${"Oct 25,1995 03:05:00 PM"?datetime?string.xs}<#--XSDxs:date --> 
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.iso}</#noparse> 		-> <#--ISO8601date --> ${"Oct 25,1995 03:05:00 PM"?datetime?string.iso}<#--ISO8601date --> 

<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.short}</#noparse> 	-> ${"Oct 25,1995 03:05:00 PM"?datetime?string.short}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.medium}</#noparse> 	-> ${"Oct 25,1995 03:05:00 PM"?datetime?string.medium}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.long}</#noparse> 		-> ${"Oct 25,1995 03:05:00 PM"?datetime?string.long}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.full}</#noparse> 		-> ${"Oct 25,1995 03:05:00 PM"?datetime?string.full}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.medium_short}</#noparse> -> <#--mediumdate,shorttime --> ${"Oct 25,1995 03:05:00 PM"?datetime?string.medium_short}<#--mediumdate,shorttime --> 
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.xs}</#noparse> 		-> <#--XSDxs:dateTime --> ${"Oct 25,1995 03:05:00 PM"?datetime?string.xs}<#--XSDxs:dateTime --> 
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.iso}</#noparse> 		-> <#--ISO8601combineddateandtime --> ${"Oct 25,1995 03:05:00 PM"?datetime?string.iso}<#--ISO8601combineddateandtime --> 

--Advanced ISO 8601 and XSD formatting: --
===================================================================
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.iso_m_u}</#noparse>   -> ${"Oct 25,1995 03:05:00 PM"?datetime?string.iso_m_u}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.xs_ms_nz}</#noparse>  -> ${"Oct 25,1995 03:05:00 PM"?datetime?string.xs_ms_nz}

--Simple Date Format patterns: -- 
===================================================================
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string["dd.MM.yyyy,HH:mm"]}</#noparse> 					-> ${"Oct 25,1995 03:05:00 PM"?datetime?string["dd.MM.yyyy,HH:mm"]}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string["EEEE,MMMMdd,yyyy,hh:mma'('zzz')'"]}</#noparse> 	-> ${"Oct 25,1995 03:05:00 PM"?datetime?string["EEEE,MMMMdd,yyyy,hh:mma'('zzz')'"]}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string["EEE,MMMd,''yy"]}</#noparse> 						-> ${"Oct 25,1995 03:05:00 PM"?datetime?string["EEE,MMMd,''yy"]}
<#noparse>${"Oct 25,1995 03:05:00 PM"?datetime?string.yyyy}</#noparse> --> <#--Sameas${"Oct 25,1995 03:05:00 PM"?string["yyyy"]} -->  --> ${"Oct 25,1995 03:05:00 PM"?datetime?string.yyyy}<#--Sameas${"Oct 25,1995 03:05:00 PM"?string["yyyy"]} --> 

<#noparse>${-5?abs}</#noparse> 										-> ${-5?abs}

<#noparse>${300000000?c}</#noparse> 								-> ${300000000?c}

<#noparse>${10000000000000000000000000000?is_infinite?c}</#noparse> -> ${10000000000000000000000000000?is_infinite?c}

<#noparse>${10000000000000000000000000000?is_nan?c}</#noparse> 		-> ${10000000000000000000000000000?is_nan?c}

<#noparse><#list 1..30 as n>${n?lower_abc} </#list></#noparse> 		-> <#list 1..30 as n>${n?lower_abc} </#list>


<#noparse><#assign testlist=[0, 1, -1, 0.5, 1.5, -0.5,-1.5, 0.25, -0.25, 1.75, -1.75]></#noparse>  -->  <#assign testlist=[0, 1, -1, 0.5, 1.5, -0.5,-1.5, 0.25, -0.25, 1.75, -1.75]>
<#noparse><#list testlist as result>${result}?floor=${result?floor}?ceiling=${result?ceiling}?round=${result?round}</#list></#noparse> --> 
<#list testlist as result>
${result}?floor=${result?floor}?ceiling=${result?ceiling}?round=${result?round}
</#list>

<#noparse><#assign x=42></#noparse> 			-> <#assign x=42>
<#noparse>${x}</#noparse> 						-> ${x}
<#noparse>${x?string}</#noparse> 				-> <#--the same as ${x} --> ${x?string} --> 
<#noparse>${x?string.number}</#noparse> 		-> ${x?string.number}
<#noparse>${x?string.currency}</#noparse> 		-> ${x?string.currency}
<#noparse>${x?string.percent}</#noparse> 		-> ${x?string.percent}
<#noparse>${x?string.computer}</#noparse> 		-> ${x?string.computer}

<#noparse><#setting number_format="currency"></#noparse> 	-> <#setting number_format="currency">
<#noparse><#assign x=42></#noparse> 						-> <#assign x=42>
<#noparse>${x}</#noparse> 									-> ${x}
<#noparse>${x?string}</#noparse> 							-> <#--the same as ${x} --> ${x?string} --> 
<#noparse>${x?string.number}</#noparse> 					-> ${x?string.number}
<#noparse>${x?string.currency}</#noparse> 					-> ${x?string.currency}
<#noparse>${x?string.percent}</#noparse> 					-> ${x?string.percent}


<#noparse><#assign x=1.234></#noparse>						-> <#assign x=1.234>
<#noparse>${x?string["0"]}</#noparse> 						-> ${x?string["0"]}
<#noparse>${x?string["0.#"]}</#noparse> 					-> ${x?string["0.#"]}
<#noparse>${x?string["0.##"]}</#noparse> 					-> ${x?string["0.##"]}
<#noparse>${x?string["0.###"]}</#noparse> 					-> ${x?string["0.###"]}
<#noparse>${x?string["0.####"]}</#noparse> 					-> ${x?string["0.####"]}

<#noparse>${1?string["000.00"]}</#noparse> 					-> ${1?string["000.00"]}
<#noparse>${12.1?string["000.00"]}</#noparse> 				-> ${12.1?string["000.00"]}
<#noparse>${123.456?string["000.00"]}</#noparse> 			-> ${123.456?string["000.00"]}

<#noparse>${1.2?string["0"]}</#noparse> 					-> ${1.2?string["0"]}
<#noparse>${1.8?string["0"]}</#noparse> 					-> ${1.8?string["0"]}
<#noparse>${1.5?string["0"]}</#noparse> 					-> <--1.5, rounded towards even neighbor
<#noparse>${2.5?string["0"]}</#noparse> 					-> <--2.5,rounded towards even neighbor

<#noparse>${12345?string["0.##E0"]}</#noparse> 				-> ${12345?string["0.##E0"]}

<#noparse>${12345?string("0.#")}</#noparse> 				-> ${12345?string("0.#")}
<#noparse>${12345?string["0.#"]}</#noparse> 				-> ${12345?string["0.#"]}

<#noparse><#setting number_format="0.##"></#noparse> 		-> <#setting number_format="0.##">
<#noparse>${1.234}</#noparse> 								-> ${1.234}


<#noparse><#setting number_format=",##0.00"></#noparse> 	-> <#setting number_format=",##0.00">
<#noparse><#setting locale="en_US"></#noparse> 				-> <#setting locale="en_US">
US people write:<#noparse>${12345678}</#noparse> 			-> US people write:${12345678}
<#noparse><#setting locale="hu"></#noparse> 				-> <#setting locale="hu">
German people write:<#noparse>${12345678}</#noparse> 		-> German people write:${12345678}

<#setting locale="en_US"> --> 
<#noparse>${10002.5?string[",000"]}</#noparse> 				-> ${10002.5?string[",000"]}
<#noparse>${10002.5?string[",000;; roundingMode=halfUp groupingSeparator=_"]}</#noparse> --> ${10002.5?string[",000;; roundingMode=halfUp groupingSeparator=_"]}

<#noparse><#list 1..30 as n>${n?upper_abc} </#list></#noparse> 	-> <#list 1..30 as n>${n?upper_abc} </#list>

<#noparse>${1305575275540?number_to_datetime}</#noparse> 		-> ${1305575275540?number_to_datetime}
<#noparse>${1305575275540?number_to_date}</#noparse> 			-> ${1305575275540?number_to_date}
<#noparse>${1305575275540?number_to_time}</#noparse> 			-> ${1305575275540?number_to_time}


