-- staging.product: staging temporal para productos/libros
CREATE TABLE [staging].[product] (
    ProductID INT,
    Title NVARCHAR(255),
    Author NVARCHAR(255),
    ISBN NVARCHAR(50),
    Category NVARCHAR(100),
    Publisher NVARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT,
    IsActive BIT
);
