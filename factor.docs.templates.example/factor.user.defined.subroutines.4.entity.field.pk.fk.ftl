<#--
${PRV_SYS_GEN_PATH|user-defined-subroutines|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|factor.user.defined.subroutines.4.entity.field.pk.fk.txt|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->



=====================================================================================================================
-- Apache FreeMarker 2.3.26 - Factor User Defined Subroutines - Entity, Field, PK, FK Example -------
=====================================================================================================================
=====================================================================================================================
A. Entity, Field, PK, FK - Factor Subroutines -----------------------------------------------------------------------
=====================================================================================================================

=====================================================================================================================
Expression or Script   										-> RESULT
=====================================================================================================================
<#list adv.entities as i>                                                   
  	${i?counter}: 
                baseName          	: ${i.baseName}
                className         	: ${i.className}
                allFieldSelection 	: ${i.allFieldSelection?c}
                create            	: ${i.create?c} 
                emptyBaseName     	: ${i.emptyBaseName?c}
                emptyTableName    	: ${i.emptyTableName?c}
                fullPackageName     : ${i.fullPackageName}
                haveSpaceTableName  : ${i.haveSpaceTableName?c} 
                instanceName        : ${i.instanceName}
                packageName         : ${i.packageName!'null'}
                remarks             : ${i.remarks!'null'}
                reservedWordBaseName  : ${i.reservedWordBaseName?c}
                selected            : ${i.selected?c}
                tableName           : ${i.tableName}
                validPatternBaseName  : ${i.validPatternBaseName?c}
                hasAttachFileField  : ${i.hasAttachFileField()?c}
                hasDuplicateFieldName : ${i.hasDuplicateFieldName()?c}
                hasLob  			: ${i.hasLob()?c}
                toStringStatement   : ${i.toStringStatement}
                
                
                --- Derived Methods ---
                getFieldListExceptPrimaryKey             : ${i.getFieldListExceptPrimaryKey()?join(", ")}
                getFieldListExceptPrimaryKeyAndForeignKey: ${i.getFieldListExceptPrimaryKeyAndForeignKey()?join(", ")}
                getForeignKeyFieldList                   : ${i.getForeignKeyFieldList()?join(", ")}
                getPrimaryKeyCount                       : ${i.getPrimaryKeyCount()}
                getForeignKeyCount                       : ${i.getForeignKeyCount()}
                hasPrimaryKey                            : ${i.hasPrimaryKey()?c}
                hasPrimaryKeySingle                      : ${i.hasPrimaryKeySingle()?c}
                hasPrimaryKeyCompound                    : ${i.hasPrimaryKeyCompound()?c}
                hasForeignKey                            : ${i.hasForeignKey()?c}
                hasForeignKeySingle                      : ${i.hasForeignKeySingle()?c}
                hasForeignKeyCompound                    : ${i.hasForeignKeyCompound()?c}
                
                exportedKeys      :
                <#list i.exportedKeys as m>
                    pkTableName      : ${m.pkTableName}
                    pkBaseName       : ${m.pkBaseName}
                    pkColumnName     : ${m.pkColumnName}
                    fkTableName      : ${m.fkTableName}
                    fkBaseName       : ${m.fkBaseName}
                    fkColumnName     : ${m.fkColumnName}
                    fkSequence       : ${m.fkSequence}
                    updateRule       : ${m.updateRule}
                    deleteRule       : ${m.deleteRule}
                    fkName           : ${m.fkName}
                    pkName           : ${m.pkName}
                    create           : ${m.create?c}
                    exported         : ${m.exported!false?c}
                    selected         : ${m.selected!false?c}
                </#list>  
                
                importedKeys                 : 
                <#list i.importedKeys as m>
                    pkTableName      : ${m.pkTableName}
                    pkBaseName       : ${m.pkBaseName}
                    pkColumnName     : ${m.pkColumnName}
                    fkTableName      : ${m.fkTableName}
                    fkBaseName       : ${m.fkBaseName}
                    fkColumnName     : ${m.fkColumnName}
                    fkSequence       : ${m.fkSequence}
                    updateRule       : ${m.updateRule}
                    deleteRule       : ${m.deleteRule}
                    fkName           : ${m.fkName}
                    pkName           : ${m.pkName}
                    create           : ${m.create?c}
                    exported         : ${m.exported!false?c}
                    selected         : ${m.selected!false?c}
                </#list>
                
                attachFileFieldList :
                <#list i.attachFileFieldList as k>
                    create              -->  ${k.create?c}         
                    lob                 -->  ${k.lob?c}            
                    nullable            -->  ${k.nullable?c}       
                    pkPosition          -->  ${k.pkPosition}     
                    fieldType           -->  ${k.fieldType}      
                    fieldName           -->  ${k.fieldName}      
                    columnSize          -->  ${k.columnSize}     
                    columnType          -->  ${k.columnType}     
                    columnName          -->  ${k.columnName}     
                    remarks             -->  ${k.remarks!'null'}        
                    autoincrement       -->  ${k.autoincrement?c}  
                    ordinalPosition     -->  ${k.ordinalPosition}
                    columnDataType      -->  ${k.columnDataType}
                    attachFileType      -->  ${k.attachFileType?c}
                    emptyColumnName     -->  ${k.emptyColumnName?c}
                    emptyColumnType     -->  ${k.emptyColumnType?c}
                    emptyFieldName      -->  ${k.emptyFieldName?c}
                    emptyFieldType      -->  ${k.emptyFieldType?c}
                    firstCapFieldName   -->  ${k.firstCapFieldName}
                    getterMethodName    -->  ${k.getterMethodName}
                    haveSpaceColumnName -->  ${k.haveSpaceColumnName?c}
                    haveSpaceColumnType -->  ${k.haveSpaceColumnType?c}
                    hasNullValue 		-->  ${k.hasNullValue()?c}
                    lob      			-->  ${k.lob?c}
                    nullValue      		-->  ${k.nullValue!'null'}
                    nullable      		-->  ${k.nullable?c}
                    primitiveType      	-->  ${k.primitiveType?c}
                    reservedFieldName   -->  ${k.reservedFieldName?c}
                    setterMethodName    -->  ${k.setterMethodName}
                    simpleFieldType     -->  ${k.simpleFieldType}
                    simpleObjectClassName  -->  ${k.simpleObjectClassName}
                    toPrimitiveMethod   -->  ${k.toPrimitiveMethod!'null'}
                    unique   			-->  ${k.unique?c}
                    validColumnSize     -->  ${k.validColumnSize?c}
                    validFieldType      -->  ${k.validFieldType?c}
                    validNullable      	-->  ${k.validNullable?c}
                    validPatternFieldName   -->  ${k.validPatternFieldName?c}
                    validPatternFieldType   -->  ${k.validPatternFieldType?c}
                </#list> 
                
                
                fieldList                    : 
                <#list i.fieldList as k>
                    create              -->  ${k.create?c}         
                    lob                 -->  ${k.lob?c}            
                    nullable            -->  ${k.nullable?c}       
                    pkPosition          -->  ${k.pkPosition}     
                    fieldType           -->  ${k.fieldType}      
                    fieldName           -->  ${k.fieldName}      
                    columnSize          -->  ${k.columnSize}     
                    columnType          -->  ${k.columnType}     
                    columnName          -->  ${k.columnName}     
                    remarks             -->  ${k.remarks!'null'}        
                    autoincrement       -->  ${k.autoincrement?c}  
                    ordinalPosition     -->  ${k.ordinalPosition}
                    columnDataType      -->  ${k.columnDataType}
                    attachFileType      -->  ${k.attachFileType?c}
                    emptyColumnName     -->  ${k.emptyColumnName?c}
                    emptyColumnType     -->  ${k.emptyColumnType?c}
                    emptyFieldName      -->  ${k.emptyFieldName?c}
                    emptyFieldType      -->  ${k.emptyFieldType?c}
                    firstCapFieldName   -->  ${k.firstCapFieldName}
                    getterMethodName    -->  ${k.getterMethodName}
                    haveSpaceColumnName -->  ${k.haveSpaceColumnName?c}
                    haveSpaceColumnType -->  ${k.haveSpaceColumnType?c}
                    hasNullValue 		-->  ${k.hasNullValue()?c}
                    lob      			-->  ${k.lob?c}
                    nullValue      		-->  ${k.nullValue!'null'}
                    nullable      		-->  ${k.nullable?c}
                    primitiveType      	-->  ${k.primitiveType?c}
                    reservedFieldName   -->  ${k.reservedFieldName?c}
                    setterMethodName    -->  ${k.setterMethodName}
                    simpleFieldType     -->  ${k.simpleFieldType}
                    simpleObjectClassName  -->  ${k.simpleObjectClassName}
                    toPrimitiveMethod   -->  ${k.toPrimitiveMethod!'null'}
                    unique   			-->  ${k.unique?c}
                    validColumnSize     -->  ${k.validColumnSize?c}
                    validFieldType      -->  ${k.validFieldType?c}
                    validNullable      	-->  ${k.validNullable?c}
                    validPatternFieldName   -->  ${k.validPatternFieldName?c}
                    validPatternFieldType   -->  ${k.validPatternFieldType?c}
                </#list> 
                
                
                fieldListExceptLob           : 
                <#list i.fieldListExceptLob as k>
                    create              -->  ${k.create?c}         
                    lob                 -->  ${k.lob?c}            
                    nullable            -->  ${k.nullable?c}       
                    pkPosition          -->  ${k.pkPosition}     
                    fieldType           -->  ${k.fieldType}      
                    fieldName           -->  ${k.fieldName}      
                    columnSize          -->  ${k.columnSize}     
                    columnType          -->  ${k.columnType}     
                    columnName          -->  ${k.columnName}     
                    remarks             -->  ${k.remarks!'null'}        
                    autoincrement       -->  ${k.autoincrement?c}  
                    ordinalPosition     -->  ${k.ordinalPosition}
                    columnDataType      -->  ${k.columnDataType}
                    attachFileType      -->  ${k.attachFileType?c}
                    emptyColumnName     -->  ${k.emptyColumnName?c}
                    emptyColumnType     -->  ${k.emptyColumnType?c}
                    emptyFieldName      -->  ${k.emptyFieldName?c}
                    emptyFieldType      -->  ${k.emptyFieldType?c}
                    firstCapFieldName   -->  ${k.firstCapFieldName}
                    getterMethodName    -->  ${k.getterMethodName}
                    haveSpaceColumnName -->  ${k.haveSpaceColumnName?c}
                    haveSpaceColumnType -->  ${k.haveSpaceColumnType?c}
                    hasNullValue 		-->  ${k.hasNullValue()?c}
                    lob      			-->  ${k.lob?c}
                    nullValue      		-->  ${k.nullValue!'null'}
                    nullable      		-->  ${k.nullable?c}
                    primitiveType      	-->  ${k.primitiveType?c}
                    reservedFieldName   -->  ${k.reservedFieldName?c}
                    setterMethodName    -->  ${k.setterMethodName}
                    simpleFieldType     -->  ${k.simpleFieldType}
                    simpleObjectClassName  -->  ${k.simpleObjectClassName}
                    toPrimitiveMethod   -->  ${k.toPrimitiveMethod!'null'}
                    unique   			-->  ${k.unique?c}
                    validColumnSize     -->  ${k.validColumnSize?c}
                    validFieldType      -->  ${k.validFieldType?c}
                    validNullable      	-->  ${k.validNullable?c}
                    validPatternFieldName   -->  ${k.validPatternFieldName?c}
                    validPatternFieldType   -->  ${k.validPatternFieldType?c}
                </#list>
                
                primaryKeyFieldList          : 
                <#list i.primaryKeyFieldList as k>
                    create              -->  ${k.create?c}         
                    lob                 -->  ${k.lob?c}            
                    nullable            -->  ${k.nullable?c}       
                    pkPosition          -->  ${k.pkPosition}     
                    fieldType           -->  ${k.fieldType}      
                    fieldName           -->  ${k.fieldName}      
                    columnSize          -->  ${k.columnSize}     
                    columnType          -->  ${k.columnType}     
                    columnName          -->  ${k.columnName}     
                    remarks             -->  ${k.remarks!'null'}        
                    autoincrement       -->  ${k.autoincrement?c}  
                    ordinalPosition     -->  ${k.ordinalPosition}
                    columnDataType      -->  ${k.columnDataType}
                    attachFileType      -->  ${k.attachFileType?c}
                    emptyColumnName     -->  ${k.emptyColumnName?c}
                    emptyColumnType     -->  ${k.emptyColumnType?c}
                    emptyFieldName      -->  ${k.emptyFieldName?c}
                    emptyFieldType      -->  ${k.emptyFieldType?c}
                    firstCapFieldName   -->  ${k.firstCapFieldName}
                    getterMethodName    -->  ${k.getterMethodName}
                    haveSpaceColumnName -->  ${k.haveSpaceColumnName?c}
                    haveSpaceColumnType -->  ${k.haveSpaceColumnType?c}
                    hasNullValue 		-->  ${k.hasNullValue()?c}
                    lob      			-->  ${k.lob?c}
                    nullValue      		-->  ${k.nullValue!'null'}
                    nullable      		-->  ${k.nullable?c}
                    primitiveType      	-->  ${k.primitiveType?c}
                    reservedFieldName   -->  ${k.reservedFieldName?c}
                    setterMethodName    -->  ${k.setterMethodName}
                    simpleFieldType     -->  ${k.simpleFieldType}
                    simpleObjectClassName  -->  ${k.simpleObjectClassName}
                    toPrimitiveMethod   -->  ${k.toPrimitiveMethod!'null'}
                    unique   			-->  ${k.unique?c}
                    validColumnSize     -->  ${k.validColumnSize?c}
                    validFieldType      -->  ${k.validFieldType?c}
                    validNullable      	-->  ${k.validNullable?c}
                    validPatternFieldName   -->  ${k.validPatternFieldName?c}
                    validPatternFieldType   -->  ${k.validPatternFieldType?c}
                </#list>
                
                fieldListExceptForeignKey           : 
                <#list i.fieldListExceptForeignKey as k>
                    create              -->  ${k.create?c}         
                    lob                 -->  ${k.lob?c}            
                    nullable            -->  ${k.nullable?c}       
                    pkPosition          -->  ${k.pkPosition}     
                    fieldType           -->  ${k.fieldType}      
                    fieldName           -->  ${k.fieldName}      
                    columnSize          -->  ${k.columnSize}     
                    columnType          -->  ${k.columnType}     
                    columnName          -->  ${k.columnName}     
                    remarks             -->  ${k.remarks!'null'}        
                    autoincrement       -->  ${k.autoincrement?c}  
                    ordinalPosition     -->  ${k.ordinalPosition}
                    columnDataType      -->  ${k.columnDataType}
                    attachFileType      -->  ${k.attachFileType?c}
                    emptyColumnName     -->  ${k.emptyColumnName?c}
                    emptyColumnType     -->  ${k.emptyColumnType?c}
                    emptyFieldName      -->  ${k.emptyFieldName?c}
                    emptyFieldType      -->  ${k.emptyFieldType?c}
                    firstCapFieldName   -->  ${k.firstCapFieldName}
                    getterMethodName    -->  ${k.getterMethodName}
                    haveSpaceColumnName -->  ${k.haveSpaceColumnName?c}
                    haveSpaceColumnType -->  ${k.haveSpaceColumnType?c}
                    hasNullValue 		-->  ${k.hasNullValue()?c}
                    lob      			-->  ${k.lob?c}
                    nullValue      		-->  ${k.nullValue!'null'}
                    nullable      		-->  ${k.nullable?c}
                    primitiveType      	-->  ${k.primitiveType?c}
                    reservedFieldName   -->  ${k.reservedFieldName?c}
                    setterMethodName    -->  ${k.setterMethodName}
                    simpleFieldType     -->  ${k.simpleFieldType}
                    simpleObjectClassName  -->  ${k.simpleObjectClassName}
                    toPrimitiveMethod   -->  ${k.toPrimitiveMethod!'null'}
                    unique   			-->  ${k.unique?c}
                    validColumnSize     -->  ${k.validColumnSize?c}
                    validFieldType      -->  ${k.validFieldType?c}
                    validNullable      	-->  ${k.validNullable?c}
                    validPatternFieldName   -->  ${k.validPatternFieldName?c}
                    validPatternFieldType   -->  ${k.validPatternFieldType?c}
                </#list>
                
                
                fieldListSortByOrdinalPosition           : 
                <#list i.fieldListSortByOrdinalPosition as k>
                    create              -->  ${k.create?c}         
                    lob                 -->  ${k.lob?c}            
                    nullable            -->  ${k.nullable?c}       
                    pkPosition          -->  ${k.pkPosition}     
                    fieldType           -->  ${k.fieldType}      
                    fieldName           -->  ${k.fieldName}      
                    columnSize          -->  ${k.columnSize}     
                    columnType          -->  ${k.columnType}     
                    columnName          -->  ${k.columnName}     
                    remarks             -->  ${k.remarks!'null'}        
                    autoincrement       -->  ${k.autoincrement?c}  
                    ordinalPosition     -->  ${k.ordinalPosition}
                    columnDataType      -->  ${k.columnDataType}
                    attachFileType      -->  ${k.attachFileType?c}
                    emptyColumnName     -->  ${k.emptyColumnName?c}
                    emptyColumnType     -->  ${k.emptyColumnType?c}
                    emptyFieldName      -->  ${k.emptyFieldName?c}
                    emptyFieldType      -->  ${k.emptyFieldType?c}
                    firstCapFieldName   -->  ${k.firstCapFieldName}
                    getterMethodName    -->  ${k.getterMethodName}
                    haveSpaceColumnName -->  ${k.haveSpaceColumnName?c}
                    haveSpaceColumnType -->  ${k.haveSpaceColumnType?c}
                    hasNullValue 		-->  ${k.hasNullValue()?c}
                    lob      			-->  ${k.lob?c}
                    nullValue      		-->  ${k.nullValue!'null'}
                    nullable      		-->  ${k.nullable?c}
                    primitiveType      	-->  ${k.primitiveType?c}
                    reservedFieldName   -->  ${k.reservedFieldName?c}
                    setterMethodName    -->  ${k.setterMethodName}
                    simpleFieldType     -->  ${k.simpleFieldType}
                    simpleObjectClassName  -->  ${k.simpleObjectClassName}
                    toPrimitiveMethod   -->  ${k.toPrimitiveMethod!'null'}
                    unique   			-->  ${k.unique?c}
                    validColumnSize     -->  ${k.validColumnSize?c}
                    validFieldType      -->  ${k.validFieldType?c}
                    validNullable      	-->  ${k.validNullable?c}
                    validPatternFieldName   -->  ${k.validPatternFieldName?c}
                    validPatternFieldType   -->  ${k.validPatternFieldType?c}
                </#list>
                
                importClassNameList          : 
                <#list i.importClassNameList as n>
                    ${n}
                </#list> 
                
                importDeclarations           :
                <#list i.importDeclarations as o>
                    ${o}
                </#list>
                
                
                
                
                toStringFieldList			:
                <#list i.toStringFieldList as k>
                    create              -->  ${k.create?c}         
                    lob                 -->  ${k.lob?c}            
                    nullable            -->  ${k.nullable?c}       
                    pkPosition          -->  ${k.pkPosition}     
                    fieldType           -->  ${k.fieldType}      
                    fieldName           -->  ${k.fieldName}      
                    columnSize          -->  ${k.columnSize}     
                    columnType          -->  ${k.columnType}     
                    columnName          -->  ${k.columnName}     
                    remarks             -->  ${k.remarks!'null'}        
                    autoincrement       -->  ${k.autoincrement?c}  
                    ordinalPosition     -->  ${k.ordinalPosition}
                    columnDataType      -->  ${k.columnDataType}
                    attachFileType      -->  ${k.attachFileType?c}
                    emptyColumnName     -->  ${k.emptyColumnName?c}
                    emptyColumnType     -->  ${k.emptyColumnType?c}
                    emptyFieldName      -->  ${k.emptyFieldName?c}
                    emptyFieldType      -->  ${k.emptyFieldType?c}
                    firstCapFieldName   -->  ${k.firstCapFieldName}
                    getterMethodName    -->  ${k.getterMethodName}
                    haveSpaceColumnName -->  ${k.haveSpaceColumnName?c}
                    haveSpaceColumnType -->  ${k.haveSpaceColumnType?c}
                    hasNullValue 		-->  ${k.hasNullValue()?c}
                    lob      			-->  ${k.lob?c}
                    nullValue      		-->  ${k.nullValue!'null'}
                    nullable      		-->  ${k.nullable?c}
                    primitiveType      	-->  ${k.primitiveType?c}
                    reservedFieldName   -->  ${k.reservedFieldName?c}
                    setterMethodName    -->  ${k.setterMethodName}
                    simpleFieldType     -->  ${k.simpleFieldType}
                    simpleObjectClassName  -->  ${k.simpleObjectClassName}
                    toPrimitiveMethod   -->  ${k.toPrimitiveMethod!'null'}
                    unique   			-->  ${k.unique?c}
                    validColumnSize     -->  ${k.validColumnSize?c}
                    validFieldType      -->  ${k.validFieldType?c}
                    validNullable      	-->  ${k.validNullable?c}
                    validPatternFieldName   -->  ${k.validPatternFieldName?c}
                    validPatternFieldType   -->  ${k.validPatternFieldType?c}
                </#list>
                
                
                Test: : ${i.getTest('${i.tableName}')}
                
                                                                            
</#list> 

=====================================================================================================================
B. AI Prompts Entity, Field, PK, FK - Factor Subroutines -----------------------------------------------------------------------
=====================================================================================================================
<#--
To make this FreeMarker data model easily understandable and usable by AI models like ChatGPT, DeepSeek, Copilot, and Gemini, I will convert it into a structured, descriptive format. This format will clearly list all attributes and their types, including nested objects and arrays.

Here's an AI-friendly prompt format:

---

**AI Prompt: Data Model Description for Database Entities**

This prompt describes a data model representing database entities, their relationships, and their fields. The data is structured as a list of `Entity` objects, each containing various attributes and nested lists of related objects (e.g., `ExportedKey`, `ImportedKey`, `Field`).

---

**Root Object: `adv.entities` (List of `Entity` Objects)**

Each item `i` in `adv.entities` is an `Entity` object with the following attributes:

**`Entity` Object Attributes:**

* **`baseName`**: (String) The base name of the entity.
* **`className`**: (String) The class name derived from the entity.
* **`allFieldSelection`**: (Boolean) Indicates if all fields are selected.
* **`create`**: (Boolean) Indicates if the entity is set for creation.
* **`emptyBaseName`**: (Boolean) Indicates if the base name is empty.
* **`emptyTableName`**: (Boolean) Indicates if the table name is empty.
* **`fullPackageName`**: (String) The full package name of the entity.
* **`haveSpaceTableName`**: (Boolean) Indicates if the table name contains spaces.
* **`instanceName`**: (String) The instance name of the entity.
* **`packageName`**: (String) The package name of the entity. (Defaults to 'null' if not present).
* **`remarks`**: (String) General remarks or comments about the entity. (Defaults to 'null' if not present).
* **`reservedWordBaseName`**: (Boolean) Indicates if the base name is a reserved word.
* **`selected`**: (Boolean) Indicates if the entity is selected.
* **`tableName`**: (String) The name of the database table.
* **`validPatternBaseName`**: (Boolean) Indicates if the base name follows a valid pattern.
* **`hasAttachFileField`**: (Boolean) Indicates if the entity has an attached file field (derived from `hasAttachFileField()`).
* **`hasDuplicateFieldName`**: (Boolean) Indicates if the entity has duplicate field names (derived from `hasDuplicateFieldName()`).
* **`hasLob`**: (Boolean) Indicates if the entity has Large Object (LOB) fields (derived from `hasLob()`).
* **`toStringStatement`**: (String) A string representation statement for the entity.
* **`Test`**: (String) A test attribute derived from `getTest('${i.tableName}')`.

**Nested Lists within `Entity` Object:**

1.  **`exportedKeys`**: (List of `ExportedKey` Objects)
    Each item `m` in `exportedKeys` is an `ExportedKey` object with the following attributes:
    * **`pkTableName`**: (String) Primary key table name.
    * **`pkBaseName`**: (String) Primary key base name.
    * **`pkColumnName`**: (String) Primary key column name.
    * **`fkTableName`**: (String) Foreign key table name.
    * **`fkBaseName`**: (String) Foreign key base name.
    * **`fkColumnName`**: (String) Foreign key column name.
    * **`fkSequence`**: (Integer) Foreign key sequence.
    * **`updateRule`**: (Integer) Update rule for the foreign key.
    * **`deleteRule`**: (Integer) Delete rule for the foreign key.
    * **`fkName`**: (String) Foreign key name.
    * **`pkName`**: (String) Primary key name.
    * **`create`**: (Boolean) Indicates if the key is set for creation.
    * **`exported`**: (Boolean) Indicates if the key is exported. (Defaults to `false`).
    * **`selected`**: (Boolean) Indicates if the key is selected. (Defaults to `false`).

2.  **`importedKeys`**: (List of `ImportedKey` Objects)
    Each item `m` in `importedKeys` is an `ImportedKey` object with the same attributes as `ExportedKey`:
    * **`pkTableName`**: (String) Primary key table name.
    * **`pkBaseName`**: (String) Primary key base name.
    * **`pkColumnName`**: (String) Primary key column name.
    * **`fkTableName`**: (String) Foreign key table name.
    * **`fkBaseName`**: (String) Foreign key base name.
    * **`fkColumnName`**: (String) Foreign key column name.
    * **`fkSequence`**: (Integer) Foreign key sequence.
    * **`updateRule`**: (Integer) Update rule for the foreign key.
    * **`deleteRule`**: (Integer) Delete rule for the foreign key.
    * **`fkName`**: (String) Foreign key name.
    * **`pkName`**: (String) Primary key name.
    * **`create`**: (Boolean) Indicates if the key is set for creation.
    * **`exported`**: (Boolean) Indicates if the key is exported. (Defaults to `false`).
    * **`selected`**: (Boolean) Indicates if the key is selected. (Defaults to `false`).

3.  **`attachFileFieldList`**: (List of `Field` Objects)
    Each item `k` in `attachFileFieldList` is a `Field` object with the following attributes:
    * **`create`**: (Boolean) Indicates if the field is set for creation.
    * **`lob`**: (Boolean) Indicates if the field is a Large Object (LOB).
    * **`nullable`**: (Boolean) Indicates if the field is nullable.
    * **`pkPosition`**: (Integer) Primary key position.
    * **`fieldType`**: (String) The field's Java type.
    * **`fieldName`**: (String) The field's name (Java camelCase).
    * **`columnSize`**: (Integer) The column's size.
    * **`columnType`**: (String) The column's SQL type.
    * **`columnName`**: (String) The column's name in the database.
    * **`remarks`**: (String) Remarks or comments about the field. (Defaults to 'null').
    * **`autoincrement`**: (Boolean) Indicates if the field is auto-incrementing.
    * **`ordinalPosition`**: (Integer) The ordinal position of the column.
    * **`columnDataType`**: (Integer) The SQL data type code.
    * **`attachFileType`**: (Boolean) Indicates if it's an attachment file type.
    * **`emptyColumnName`**: (Boolean) Indicates if the column name is empty.
    * **`emptyColumnType`**: (Boolean) Indicates if the column type is empty.
    * **`emptyFieldName`**: (Boolean) Indicates if the field name is empty.
    * **`emptyFieldType`**: (Boolean) Indicates if the field type is empty.
    * **`firstCapFieldName`**: (String) The field name with the first letter capitalized.
    * **`getterMethodName`**: (String) The getter method name for the field.
    * **`haveSpaceColumnName`**: (Boolean) Indicates if the column name contains spaces.
    * **`haveSpaceColumnType`**: (Boolean) Indicates if the column type contains spaces.
    * **`hasNullValue`**: (Boolean) Indicates if the field can have a null value (derived from `hasNullValue()`).
    * **`nullValue`**: (String) The string representation of a null value for the field. (Defaults to 'null').
    * **`primitiveType`**: (Boolean) Indicates if the field is a primitive Java type.
    * **`reservedFieldName`**: (Boolean) Indicates if the field name is a reserved word.
    * **`setterMethodName`**: (String) The setter method name for the field.
    * **`simpleFieldType`**: (String) The simple Java type of the field (without package).
    * **`simpleObjectClassName`**: (String) The simple object class name for the field.
    * **`toPrimitiveMethod`**: (String) The method to convert to a primitive type. (Defaults to 'null').
    * **`unique`**: (Boolean) Indicates if the field has a unique constraint.
    * **`validColumnSize`**: (Boolean) Indicates if the column size is valid.
    * **`validFieldType`**: (Boolean) Indicates if the field type is valid.
    * **`validNullable`**: (Boolean) Indicates if the nullable attribute is valid.
    * **`validPatternFieldName`**: (Boolean) Indicates if the field name follows a valid pattern.
    * **`validPatternFieldType`**: (Boolean) Indicates if the field type follows a valid pattern.

4.  **`fieldList`**: (List of `Field` Objects)
    Each item `k` in `fieldList` is a `Field` object with the same attributes as `attachFileFieldList`.

5.  **`fieldListExceptLob`**: (List of `Field` Objects)
    Each item `k` in `fieldListExceptLob` is a `Field` object with the same attributes as `attachFileFieldList`. This list specifically excludes LOB fields.

6.  **`primaryKeyFieldList`**: (List of `Field` Objects)
    Each item `k` in `primaryKeyFieldList` is a `Field` object with the same attributes as `attachFileFieldList`. This list contains only the primary key fields.

7.  **`fieldListExceptForeignKey`**: (List of `Field` Objects)
    Each item `k` in `fieldListExceptForeignKey` is a `Field` object with the same attributes as `attachFileFieldList`. This list excludes foreign key fields.

8.  **`fieldListSortByOrdinalPosition`**: (List of `Field` Objects)
    Each item `k` in `fieldListSortByOrdinalPosition` is a `Field` object with the same attributes as `attachFileFieldList`. This list contains fields sorted by their ordinal position.

9.  **`importClassNameList`**: (List of Strings)
    Each item `n` is a `String` representing a class name to be imported.

10. **`importDeclarations`**: (List of Strings)
    Each item `o` is a `String` representing an import declaration statement.

11. **`toStringFieldList`**: (List of `Field` Objects)
    Each item `k` in `toStringFieldList` is a `Field` object with the same attributes as `attachFileFieldList`. This list contains fields relevant for the `toString()` method.

---

**Example of how the AI can interpret and use this data:**

"Given the `Entity` data model, generate a Java class for an `Entity` where `tableName` is 'Users', and then list all its `primaryKeyFieldList`'s `fieldName` and `fieldType`."

The AI can then easily parse the structured data to identify the `Entity` with `tableName` "Users", access its `primaryKeyFieldList`, and extract the `fieldName` and `fieldType` for each `Field` object within that list.

This detailed breakdown ensures that the AI understands the hierarchy, data types, and purpose of each attribute, making it robust for various code generation or data analysis tasks.
-->