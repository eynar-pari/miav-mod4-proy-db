CREATE PROCEDURE [dbo].[UpdateLastPackageRowVersion]
(
	@tableName VARCHAR(50),
	@lastRowVersion BIGINT
)
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE [dbo].[PackageConfig]
	SET LastRowVersion = @lastRowVersion,
	    LastLoadDate = GETDATE()
	WHERE TableName = @tableName;
	
	-- Si no existe el registro, lo insertamos
	IF @@ROWCOUNT = 0
	BEGIN
		INSERT INTO [dbo].[PackageConfig] (TableName, LastRowVersion, LastLoadDate, IsActive)
		VALUES (@tableName, @lastRowVersion, GETDATE(), 1);
	END
END
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Actualiza el último RowVersion procesado para una tabla específica en el proceso ETL',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'PROCEDURE', @level1name = N'UpdateLastPackageRowVersion';
GO
