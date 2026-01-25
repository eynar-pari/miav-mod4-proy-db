CREATE TABLE [dbo].[PackageConfig]
(
    [TableName] VARCHAR(50) NOT NULL PRIMARY KEY,
    [LastRowVersion] BIGINT NULL,
    [LastLoadDate] DATETIME NULL,
    [IsActive] BIT DEFAULT 1
)
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Tabla de configuración para control de cargas incrementales ETL',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE',  @level1name = N'PackageConfig';
GO
