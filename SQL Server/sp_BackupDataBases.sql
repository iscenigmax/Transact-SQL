DECLARE @nombreBBDD VARCHAR(255)

SET @nombreBBDD = 'AssistBrain' --Nombre de la base de datos para respaldar

DECLARE miCursor CURSOR FOR SELECT name FROM sys.databases WHERE name = @nombreBBDD

OPEN miCursor

FETCH miCursor INTO @nombreBBDD

WHILE(@@FETCH_STATUS =0)

BEGIN

DECLARE @fecha VARCHAR(255);    

SET @fecha = CONVERT(VARCHAR(255),DATEPART(d,GETDATE()))

SET @fecha = @fecha +'_'+CONVERT(VARCHAR(255),DATEPART(m,GETDATE()))

SET @fecha = @fecha +'_'+CONVERT(VARCHAR(255),DATEPART(yyyy,GETDATE()))

DECLARE @nombreArchivoBackup VARCHAR(255)

SET @nombreArchivoBackup = 'C:\temp\'+@nombreBBDD+'_'+@fecha+'.bak'

DECLARE @existe INT

EXEC xp_fileexist @nombreArchivoBackup, @existe OUTPUT

DECLARE @comandoBorrado VARCHAR(300)

SET @comandoBorrado = 'del '+@nombreArchivoBackup

IF @existe = 1

EXEC xp_cmdshell @comandoBorrado

BACKUP DATABASE @nombreBBDD TO DISK=@nombreArchivoBackup

FETCH miCursor INTO @nombreBBDD

END

CLOSE miCursor

DEALLOCATE miCursor

No olvidemos activar el cmdshell, nos vemos pronto:

--Desactivar

EXEC sp_configure 'show advanced options',1

RECONFIGURE

EXEC sp_configure xp_cmdshell,1

RECONFIGURE

--Activar

EXEC sp_configure xp_cmdshell,0

RECONFIGURE

EXEC sp_configure 'show advanced options',0

RECONFIGURE

