-- PackageConfig: Tabla de configuración para ETL incremental
CREATE TABLE [dbo].[PackageConfig]
(
	[PackageID] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_PackageConfig PRIMARY KEY,
	[TableName] [varchar](50) NOT NULL,
	[LastRowVersion] [bigint] NULL,
	[LastLoadDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT DF_PackageConfig_IsActive DEFAULT (1)
);
GO
