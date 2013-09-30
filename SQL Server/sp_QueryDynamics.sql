SELECT 

'ALTER TABLE ' +

rtrim(sysobjects.name) +

' ALTER COLUMN ' +

rtrim(syscolumns.name) +

' VARCHAR(' 

+ cast ( syscolumns.length as varchar(5))

+ ');'

FROM syscolumns,sysobjects

WHERE sysobjects.type='U'  AND  syscolumns.xtype=175 AND syscolumns.Id=sysobjects.Id

--Opcional al designar una tabla especifica

--AND sysobjects.name='clientes'





DECLARE @tabla VARCHAR(100);

SET @tabla = 'clientes';

EXEC ('SELECT * FROM ' + @tabla);

--Ejemplo #2

DECLARE @tabla VARCHAR(100);

DECLARE @campos VARCHAR(100);

DECLARE @condicion VARCHAR(100);

SELECT @campos='cliente_id,nom,dir',@tabla='clientes',@condicion='obs IS NOT NULL';

EXEC 

(

' SELECT ' + @campos +

' FROM   ' + @tabla +

' WHERE  ' + @condicion +

' ORDER BY 1;'

);




