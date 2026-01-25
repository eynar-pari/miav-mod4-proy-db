-- DimStore: Dimensión de tiendas
CREATE TABLE dbo.DimStore (
    StoreKey INT IDENTITY(1,1) PRIMARY KEY,
    StoreID INT,
    StoreName NVARCHAR(255),
    Address NVARCHAR(255),
    City NVARCHAR(100),
    State NVARCHAR(100),
    Country NVARCHAR(100),
    Phone NVARCHAR(50),
    IsActive BIT,
    StartDate DATE,
    EndDate DATE
);
