-- DW_MergeDimProduct: Carga de DimProduct desde staging
CREATE PROCEDURE [dbo].[DW_MergeDimProduct]
AS
BEGIN
    MERGE INTO dbo.DimProduct AS target
    USING staging.product AS source
    ON target.ProductID = source.ProductID
    WHEN MATCHED THEN
        UPDATE SET
            Title = source.Title,
            Author = source.Author,
            ISBN = source.ISBN,
            Category = source.Category,
            Publisher = source.Publisher,
            Price = source.Price,
            Stock = source.Stock,
            IsActive = source.IsActive
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (ProductID, Title, Author, ISBN, Category, Publisher, Price, Stock, IsActive, StartDate)
        VALUES (source.ProductID, source.Title, source.Author, source.ISBN, source.Category, source.Publisher, source.Price, source.Stock, source.IsActive, GETDATE());
END;
