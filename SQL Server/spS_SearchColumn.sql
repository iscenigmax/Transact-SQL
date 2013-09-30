IF EXISTS (SELECT name FROM sysobjects WHERE name = 'spS_SearchColumn' AND type = 'P')
	DROP PROCEDURE spS_SearchColumn;
GO
CREATE PROCEDURE spS_SearchColumn
(
	@SEARCH VARCHAR(MAX)
)
AS
BEGIN
	SELECT
		SO.name AS TABLE_NAME,
		SC.name AS COLUMN_NAME,
		ST.name AS DATATYPE, 
		SC.LENGTH
	FROM 
		sysobjects AS SO
		INNER JOIN syscolumns AS SC ON SO.id=SC.id 
		INNER JOIN systypes AS ST ON SC.xtype=ST.xtype
	WHERE 
		SO.xtype = 'U' 
		AND UPPER(SC.name) LIKE UPPER('%'+@SEARCH+'%')
	ORDER BY 
		SO.name,
		SC.colid
END