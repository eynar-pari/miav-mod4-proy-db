CREATE PROCEDURE [dbo].[GetLastPackageRowVersion]
(
	@tableName VARCHAR(50)
)
AS
BEGIN
	SELECT COALESCE(
		(SELECT LastRowVersion FROM [dbo].[PackageConfig] WHERE TableName = @tableName),
		0
	) AS LastRowVersion;
END
GO
