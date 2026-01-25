CREATE PROCEDURE [dbo].[GetLastPackageRowVersion]
(
	@tableName VARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT LastRowVersion
	FROM [dbo].[PackageConfig]
	WHERE TableName = @tableName;
END
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Obtiene el último RowVersion procesado para una tabla específica en el proceso ETL',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'PROCEDURE', @level1name = N'GetLastPackageRowVersion';
GO
