<#--
${PRV_SYS_GEN_PATH|predefined-subroutines|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.predefined.subroutines.1.string.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->

=====================================================================================================================
-- Apache FreeMarker 2.3.26 - Predefined Subroutines - String Example -----------------------------------------------
=====================================================================================================================

=====================================================================================================================
Expression or Script   										-> RESULT
=====================================================================================================================
<#noparse>${true?c}</#noparse> 								-> ${true?c} 
<#noparse>${true?string("yes","no")}</#noparse> 			-> ${true?string("yes","no")}
<#noparse>${'example'?cap_first}</#noparse> 				-> ${'example'?cap_first}
<#noparse>${"example  example"?capitalize}</#noparse> 		-> ${"example  example"?capitalize}
<#noparse>${"example\nexample"?chop_linebreak}</#noparse> 	-> ${"example\nexample"?chop_linebreak}
<#noparse>${"piceous"?contains("ice")}?c</#noparse> 		-> ${"piceous"?contains("ice")?c}

<#noparse>${"Oct 25, 1995"?date}</#noparse> 				-> ${"Oct 25, 1995"?date}
<#noparse>${"3:05:30 PM"?time}</#noparse> 					-> ${"3:05:30 PM"?time}
<#noparse>${"Oct 25, 1995, 03:05:00 PM"?datetime("MMM d, y, h:mm:ss a")}</#noparse> -> ${"Oct 25, 1995, 03:05:00 PM"?datetime("MMM d, y, h:mm:ss a")}

-- Changing the setting value changes the expected format: --
==============================================================
<#setting datetime_format="iso">
<#noparse>${"1995-10-25T15:05"?datetime}</#noparse> 		-> ${"1995-10-25T15:05"?datetime}

-- Parsing XML Schema xs:date, xs:time and xs:dateTime values: --
==============================================================
<#noparse>${"1995-10-25"?date.xs}</#noparse> 				-> ${"1995-10-25"?date.xs}
<#noparse>${"15:05:30"?time.xs}</#noparse> 					-> ${"15:05:30"?time.xs}
<#noparse>${"1995-10-25T15:05:00"?datetime.xs}</#noparse> 	-> ${"1995-10-25T15:05:00"?datetime.xs}

-- Parsing ISO 8601 (both extended and basic formats): 	--
==============================================================
<#noparse>${"1995-10-25T15:05"?datetime.iso}</#noparse> 	-> ${"1995-10-25T15:05"?datetime.iso}
<#noparse>${"19951025T1505"?datetime.iso}</#noparse> 		-> ${"19951025T1505"?datetime.iso}

-- Parsing with SimpleDateFormat patterns: --
==============================================================
<#noparse>${"10/25/1995"?date("MM/dd/yyyy")}</#noparse> 	-> ${"10/25/1995"?date("MM/dd/yyyy")}
<#noparse>${"15:05:30"?time("HH:mm:ss")}</#noparse> 		-> ${"15:05:30"?time("HH:mm:ss")}
<#noparse>${"1995-10-25 03:05 PM"?datetime("yyyy-MM-dd hh:mm a")}</#noparse> -> ${"1995-10-25 03:05 PM"?datetime("yyyy-MM-dd hh:mm a")}

<#noparse>${"ahead"?ends_with("head")}</#noparse> 			-> ${"ahead"?ends_with("head")?c}

<#noparse>${"foo"?ensure_ends_with("/")}</#noparse> 		-> ${"foo"?ensure_ends_with("/")}
<#noparse>${"foo/"?ensure_ends_with("/")}</#noparse> 		-> ${"foo/"?ensure_ends_with("/")} 

<#noparse>${"foo"?ensure_starts_with("/")}</#noparse> 		-> ${"foo"?ensure_starts_with("/")}
<#noparse>${"/foo"?ensure_starts_with("/")}</#noparse> 		-> ${"/foo"?ensure_starts_with("/")}

<#noparse>${"abc://"?ensure_starts_with("[a-zA-Z]+://", "http://")}</#noparse> -> ${"abc://"?ensure_starts_with("[a-zA-Z]+://", "http://")}
<#noparse>${"abc://"?ensure_starts_with("[a-zA-Z]+://", "http://","r")}</#noparse> -> ${"abc://"?ensure_starts_with("[a-zA-Z]+://", "http://","r")}
<#noparse>${"abc://"?ensure_starts_with("[a-zA-Z]+://", "http://","i")}</#noparse> -> ${"abc://"?ensure_starts_with("[a-zA-Z]+://", "http://","i")}

<#noparse>${"abcabc"?index_of("bc")}</#noparse> 				-> 	 ${"abcabc"?index_of("bc")} 
<#noparse>${"The 'foo' bean."?j_string}             </#noparse> ->   ${"The 'foo' bean."?j_string}                       
<#noparse>${ "Big Joe's \"right hand\""?js_string}  </#noparse> ->   ${ "Big Joe's \"right hand\""?js_string}  
<#noparse>${ "Big Joe's \"right hand\""?json_string}</#noparse> ->   ${ "Big Joe's \"right hand\""?json_string}

<#noparse>${"abcdefgh"?keep_after("de")}</#noparse> 				-> ${"abcdefgh"?keep_after("de")}
<#noparse>${"foo : bar"?keep_after(r"\s*:\s*", "r")}</#noparse> 	-> ${"foo : bar"?keep_after(r"\s*:\s*", "r")}
<#noparse>${"foo.bar.txt"?keep_after_last(".")}</#noparse> 			-> ${"foo.bar.txt"?keep_after_last(".")}
<#noparse>${"abcdef"?keep_before("de")}</#noparse> 					-> ${"abcdef"?keep_before("de")}
<#noparse>${"foo : bar"?keep_before(r"\s*:\s*", "r")}</#noparse> 	-> ${"foo : bar"?keep_before(r"\s*:\s*", "r")}
<#noparse>${"foo.bar.txt"?keep_after_last(".")}</#noparse> 			-> ${"foo.bar.txt"?keep_after_last(".")}

<#noparse>${"abcabc"?last_index_of("ab")}</#noparse> 	-> ${"abcabc"?last_index_of("ab")}
<#noparse>${"abcabc"?last_index_of("ab", 2)}</#noparse> -> ${"abcabc"?last_index_of("ab", 2)}

<#noparse>[${""?left_pad(5)}]</#noparse>  ->               [${""?left_pad(5)}]           
<#noparse>[${"a"?left_pad(5)}]</#noparse>  ->              [${"a"?left_pad(5)}]          
<#noparse>[${"ab"?left_pad(5)}]</#noparse>  ->             [${"ab"?left_pad(5)}]         
<#noparse>[${"abc"?left_pad(5)}]</#noparse>  ->            [${"abc"?left_pad(5)}]        
<#noparse>[${"abcd"?left_pad(5)}]</#noparse>  ->           [${"abcd"?left_pad(5)}]       
<#noparse>[${"abcde"?left_pad(5)}]</#noparse>  ->          [${"abcde"?left_pad(5)}]      
<#noparse>[${"abcdef"?left_pad(5)}]</#noparse>  ->         [${"abcdef"?left_pad(5)}]     
<#noparse>[${"abcdefg"?left_pad(5)}]</#noparse>  ->        [${"abcdefg"?left_pad(5)}]    
<#noparse>[${"abcdefgh"?left_pad(5)}]</#noparse>  ->       [${"abcdefgh"?left_pad(5)}] 
<#noparse>${"abcdefgh"?left_pad(5)}</#noparse> -> ${"abcdefgh"?left_pad(5)}

<#noparse>[${""?left_pad(5, "-")}]</#noparse>  ->          [${""?left_pad(5, "-")}]      
<#noparse>[${"a"?left_pad(5, "-")}]</#noparse>  ->         [${"a"?left_pad(5, "-")}]     
<#noparse>[${"ab"?left_pad(5, "-")}]</#noparse>  ->        [${"ab"?left_pad(5, "-")}]    
<#noparse>[${"abc"?left_pad(5, "-")}]</#noparse>  ->       [${"abc"?left_pad(5, "-")}]   
<#noparse>[${"abcd"?left_pad(5, "-")}]</#noparse>  ->      [${"abcd"?left_pad(5, "-")}]  
<#noparse>[${"abcde"?left_pad(5, "-")}]</#noparse>  ->     [${"abcde"?left_pad(5, "-")}]
<#noparse>${"abcde"?left_pad(5, "-")}</#noparse> -> ${"abcde"?left_pad(5, "-")}

<#noparse>[${""?left_pad(8, ".oO")}]</#noparse>  ->        [${""?left_pad(8, ".oO")}]    
<#noparse>[${"a"?left_pad(8, ".oO")}]</#noparse>  ->       [${"a"?left_pad(8, ".oO")}]   
<#noparse>[${"ab"?left_pad(8, ".oO")}]</#noparse>  ->      [${"ab"?left_pad(8, ".oO")}]  
<#noparse>[${"abc"?left_pad(8, ".oO")}]</#noparse>  ->     [${"abc"?left_pad(8, ".oO")}] 
<#noparse>[${"abcd"?left_pad(8, ".oO")}]</#noparse>  ->    [${"abcd"?left_pad(8, ".oO")}]
<#noparse>${"abcd"?left_pad(8, ".oO")}</#noparse> -> ${"abcd"?left_pad(8, ".oO")}

<#noparse>${"example"?length}</#noparse> 				->  ${"example"?length}
<#noparse>${"GrEeN MoUsE"?lower_case}</#noparse> 		->  ${"GrEeN MoUsE"?lower_case}

--Boolean--
==============================================================
<#noparse>${"fooo"?matches("fo*")?c}</#noparse> -> ${"fooo"?matches("fo*")?c}
<#noparse>${"fooo bar"?matches("fo*")?c}</#noparse> -> ${"fooo bar"?matches("fo*")?c}

--Sequence--
-- This built-in determines if the string exactly matches the pattern. Also, it returns the list of matching sub-strings. --
============================================================================================================================
<#noparse>${"foo bar fyo"?matches("f.?o")?c}</#noparse> 			-> ${"foo bar fyo"?matches("f.?o")?c}
<#noparse><#assign mt = "foo bar fyo"?matches("f.?o")></#noparse> 	-> <#assign mt = "foo bar fyo"?matches("f.?o")>
<#noparse><#list mt as m></#noparse>
<#list mt as m> 
- <#noparse>${m}</#noparse> -> ${m}
</#list>       

--regular expression contains groups (parentheses)--
--1. Entire input match --
==============================================================
<#noparse>${"John Doe"?matches(r"(\w+) (\w+)")?c}</#noparse> 			-> ${"John Doe"?matches(r"(\w+) (\w+)")?c}
<#noparse><#assign res = "John Doe"?matches(r"(\w+) (\w+)")></#noparse> -> <#assign res = "John Doe"?matches(r"(\w+) (\w+)")>
First name: <#noparse>${res?groups[1]}</#noparse> 						-> ${res?groups[1]}
Second name: <#noparse>${res?groups[2]}</#noparse> 						-> ${res?groups[2]}

--2. Subtring matches  --
==============================================================
<#noparse>${"aa/rx; ab/r;"?matches("(.+?)/*(.+?);")?c}</#noparse> 		-> ${"aa/rx; ab/r;"?matches("(.+?)/*(.+?);")?c}
<#noparse><#assign res = "aa/rx; ab/r;"?matches("(.+?)/*(.+?);")></#noparse>
<#noparse><#list res as m></#noparse> 
<#list res as m>
  <#noparse>${m}</#noparse> -> ${m}
  <#noparse>${m?groups[1]}</#noparse> -> ${m?groups[1]}
  <#noparse>${m?groups[2]}</#noparse> -> ${m?groups[2]}
</#list><

<#noparse>${"1.23E6"?number}</#noparse> 	-> ${"1.23E6"?number}
<#noparse>${"1.5e-8"?number}</#noparse> 	-> ${"1.5e-8"?number}
<#noparse>${"NaN"?number}</#noparse> 		-> ${"NaN"?number}
<#noparse>${"INF"?number}</#noparse> 		-> ${"INF"?number}
<#noparse>${"-INF"?number}</#noparse> 		-> ${"-INF"?number}
<#noparse>${"Infinity"?number}</#noparse> 	-> ${"Infinity"?number}
<#noparse>${"-Infinity"?number}</#noparse> 	-> ${"-Infinity"?number}

<#noparse>${"this is a car acarus"?replace("car", "bulldozer")}</#noparse> 	-> ${"this is a car acarus"?replace("car", "bulldozer")}
<#noparse>${"foo"?replace("","|")}</#noparse> 								-> ${"foo"?replace("","|")}
<#noparse>${"foo : bar"?replace(r"\s*:\s*", "x","r")}</#noparse> 			-> ${"foo : bar"?replace(r"\s*:\s*", "x","r")}

<#noparse>[${""?right_pad(5)}]</#noparse>  ->               [${""?right_pad(5)}]           
<#noparse>[${"a"?right_pad(5)}]</#noparse>  ->              [${"a"?right_pad(5)}]          
<#noparse>[${"ab"?right_pad(5)}]</#noparse>  ->             [${"ab"?right_pad(5)}]         
<#noparse>[${"abc"?right_pad(5)}]</#noparse>  ->            [${"abc"?right_pad(5)}]        
<#noparse>[${"abcd"?right_pad(5)}]</#noparse>  ->           [${"abcd"?right_pad(5)}]       
<#noparse>[${"abcde"?right_pad(5)}]</#noparse>  ->          [${"abcde"?right_pad(5)}]      
<#noparse>[${"abcdef"?right_pad(5)}]</#noparse>  ->         [${"abcdef"?right_pad(5)}]     
<#noparse>[${"abcdefg"?right_pad(5)}]</#noparse>  ->        [${"abcdefg"?right_pad(5)}]    
<#noparse>[${"abcdefgh"?right_pad(5)}]</#noparse>  ->       [${"abcdefgh"?right_pad(5)}]   
            
<#noparse>[${""?right_pad(8, ".oO")}]</#noparse>  ->        [${""?right_pad(8, ".oO")}]    
<#noparse>[${"a"?right_pad(8, ".oO")}]</#noparse>  ->       [${"a"?right_pad(8, ".oO")}]   
<#noparse>[${"ab"?right_pad(8, ".oO")}]</#noparse>  ->      [${"ab"?right_pad(8, ".oO")}]  
<#noparse>[${"abc"?right_pad(8, ".oO")}]</#noparse>  ->     [${"abc"?right_pad(8, ".oO")}] 
<#noparse>[${"abcd"?right_pad(8, ".oO")}]</#noparse>  ->    [${"abcd"?right_pad(8, ".oO")}]

<#noparse>${"abcdef"?remove_beginning("abc")}</#noparse> -> ${"abcdef"?remove_beginning("abc")}
<#noparse>${"foobar"?remove_beginning("abc")}</#noparse> -> ${"foobar"?remove_beginning("abc")}

<#noparse>${"abcdef"?remove_ending("def")}</#noparse> -> ${"abcdef"?remove_ending("def")}
<#noparse>${"foobar"?remove_ending("def")}</#noparse> -> ${"foobar"?remove_ending("def")}

<#noparse><#list "someMOOtestMOOtext"?split("MOO") as x></#noparse>
<#list "someMOOtestMOOtext"?split("MOO") as x>
- <#noparse>${x}</#noparse> -> ${x}
</#list>

<#noparse><#list "some,,test,text,"?split(",") as x></#noparse> 
<#list "some,,test,text,"?split(",") as x>
- <#noparse>${x}</#noparse> -> ${x}
</#list>

<#noparse>${"redirect"?starts_with("red")?c}</#noparse> 	-> ${"redirect"?starts_with("red")?c} 
<#noparse>${"red"?starts_with("red")?c}</#noparse> 			-> ${"red"?starts_with("red")?c}

<#noparse>${"example"?string}</#noparse>   					->  ${"example"?string}
<#noparse>${1234455?string}</#noparse> 						->  ${1234455?string}
<#noparse>${"1234455"?string}</#noparse>   					->  ${"1234455"?string}
<#noparse>${true?string}</#noparse>    						->  ${true?string}
<#noparse>${false?string}}</#noparse>  						->  ${false?string}}

(<#noparse>${"  green mouse  "?trim}</#noparse>) 			->  (${"  green mouse  "?trim})

(<#noparse>${"  green mouse"?uncap_first}</#noparse>)    	->  (${"  green mouse"?uncap_first})
(<#noparse>${"GreEN mouse"?uncap_first}</#noparse>)  		->  (${"GreEN mouse"?uncap_first})
(<#noparse>${"- green mouse"?uncap_first}</#noparse>)    	->  (${"- green mouse"?uncap_first})

<#noparse>${"GrEeN MoUsE"?upper_case}</#noparse>    		-> ${"GrEeN MoUsE"?upper_case}

<#noparse>${"a/b c"?url("utf-8")}</#noparse>   				-> ${"a/b c"?url("utf-8")}
<#noparse>${"a/b c"?url_path("utf-8")}</#noparse>   		-> ${"a/b c"?url_path("utf-8")}

<#-- ${"a/b c"?url("ISO-8895-2")} 
${"a/b c"?url_path("ISO-8895-2")}-->

<#noparse><#setting url_escaping_charset="UTF-8"></#noparse>  	-> <#setting url_escaping_charset="UTF-8">
<#noparse>${"a/b c"?url}</#noparse>   							-> ${"a/b c"?url}
<#noparse>${"a/b c"?url_path}</#noparse>   						-> ${"a/b c"?url_path}


<#noparse><#assign words = " a bcd, . 1-2-3"?word_list></#noparse>  -> <#assign words = " a bcd, . 1-2-3"?word_list>
<#noparse><#list words as word> </#noparse>  
<#list words as word>
[<#noparse>${word}</#noparse>]   ->[${word}]
</#list>

