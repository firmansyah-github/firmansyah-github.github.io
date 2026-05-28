<#-- FreeMarker Template for Generating Valid SQL Table Creation Scripts -->
<#macro generateTable dataTypes>
    <#list 1..dataTypes?size as r>
        <#assign combinations = getCombinations(dataTypes, r)>
        <#list combinations as combination>
            CREATE TABLE "Table_${r}_${combination?join("_")?replace("[^a-zA-Z0-9_]", "_", "r")}" (
                <#list combination as type>
                    column${type?counter} ${type}<#sep>,</#sep>
                </#list>
                <#if combination?size != 0>,</#if>
                PRIMARY KEY (<#list combination as type>column${type?counter}<#sep>, </#sep></#list>)
            );
        </#list>
    </#list>
</#macro>

<#-- Function to generate unique permutations (order-sensitive combinations) -->
<#function getCombinations list size>
    <#if size == 1>
        <#return list?map(it -> [it])>
    <#else>
        <#assign result = []>
        <#list list as item>
            <#assign remaining = list?filter(it -> it != item)>
            <#list getCombinations(remaining, size - 1) as subset>
                <#assign result += [[item] + subset]>
            </#list>
        </#list>
        <#return result>
    </#if>
</#function>

<#-- Define the available data types -->
<#assign dataTypes = ["NUMBER(10,0)", "RAW(16)", "VARCHAR2(255)", "CHAR(36)", "BINARY(16)"] />

<#-- Call the macro to generate table creation scripts -->
<@generateTable dataTypes/>