<#-- FreeMarker Template for Generating Valid SQL Table Creation Scripts -->
<#macro generateTable db dataTypes openQuote closeQuote>
    <#list 1..dataTypes?size as r>
        <#assign combinations = getCombinations(dataTypes, r)>
        <#list combinations as combination>
            CREATE TABLE ${openQuote}Table_${db}_${r}_${combination?join("_")?replace("[^a-zA-Z0-9_]", "_", "r")}${closeQuote} (
                <#list combination as type>
                    ${openQuote}column${type?counter}${closeQuote} ${type}<#sep>,</#sep>
                </#list>,
                PRIMARY KEY (<#list combination as type>${openQuote}column${type?counter}${closeQuote}<#sep>, </#sep></#list>)
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

<#-- Database configurations -->
<#assign dbConfig = {
    "oracle": {
        "dataTypes": ["NUMBER(10,0)", "RAW(16)", "VARCHAR2(255)", "CHAR(36)", "BINARY(16)"],
        "openQuote": "\"",
        "closeQuote": "\""
    },
    "sqlserver": {
        "dataTypes": ["INT", "UNIQUEIDENTIFIER", "VARCHAR(255)", "CHAR(36)", "BINARY(16)"],
        "openQuote": "[",
        "closeQuote": "]"
    },
    "mysql": {
        "dataTypes": ["INT", "BINARY(16)", "VARCHAR(255)", "CHAR(36)", "VARBINARY(16)"],
        "openQuote": "`",
        "closeQuote": "`"
    },
    "postgresql": {
        "dataTypes": ["INTEGER", "UUID", "VARCHAR(255)", "CHAR(36)", "BYTEA"],
        "openQuote": "\"",
        "closeQuote": "\""
    }
}>

<#-- Generate tables for all databases -->
<#list dbConfig?keys as db>
    <#assign config = dbConfig[db]>
    <@generateTable 
        db=db 
        dataTypes=config.dataTypes 
        openQuote=config.openQuote 
        closeQuote=config.closeQuote 
    />
</#list>