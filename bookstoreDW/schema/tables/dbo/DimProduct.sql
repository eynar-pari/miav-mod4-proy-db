-- DimProduct: Dimensión de productos/libros
CREATE TABLE dbo.DimProduct (
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    Title NVARCHAR(255),
    Author NVARCHAR(255),
    ISBN NVARCHAR(50),
    Category NVARCHAR(100),
    Publisher NVARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT,
    IsActive BIT,
    StartDate DATE,
    EndDate DATE
);
