--Create by @iscenigmax
--Date: 280413
--Description: Search text contents of a stored procedure name
IF OBJECT_ID ( 'sp_SearchStoredProcedureByText', 'P' ) IS NOT NULL 
    DROP PROCEDURE sp_SearchStoredProcedureByText;
GO
CREATE PROCEDURE sp_SearchStoredProcedureByText
(
	@TEXTSEARCH VARCHAR(100) = ''
)
AS
BEGIN
	SELECT OBJECT_NAME(OBJECT_ID) AS [OBJECT_NAME] FROM sys.sql_modules WHERE [DEFINITION] LIKE '%' + @TEXTSEARCH + '%';
END;
GO
GRANT EXEC ON sp_SearchStoredProcedureByText TO Public;