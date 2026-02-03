CREATE PROCEDURE [dbo].[UpdateLastPackageRowVersion]
(
	@tableName VARCHAR(50),
	@lastRowVersion BIGINT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM [dbo].[PackageConfig] WHERE TableName = @tableName)
	BEGIN
		UPDATE [dbo].[PackageConfig]
		SET LastRowVersion = @lastRowVersion
		WHERE TableName = @tableName;
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[PackageConfig] (TableName, LastRowVersion, LastLoadDate, IsActive)
		VALUES (@tableName, @lastRowVersion, NULL, 1);
	END
END
GO
