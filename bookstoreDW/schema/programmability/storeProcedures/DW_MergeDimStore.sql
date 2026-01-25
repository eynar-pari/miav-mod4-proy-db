-- DW_MergeDimStore: Carga de DimStore desde staging
CREATE PROCEDURE [dbo].[DW_MergeDimStore]
AS
BEGIN
    MERGE INTO dbo.DimStore AS target
    USING staging.store AS source
    ON target.StoreID = source.StoreID
    WHEN MATCHED THEN
        UPDATE SET
            StoreName = source.StoreName,
            Address = source.Address,
            City = source.City,
            State = source.State,
            Country = source.Country,
            Phone = source.Phone,
            IsActive = source.IsActive
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (StoreID, StoreName, Address, City, State, Country, Phone, IsActive, StartDate)
        VALUES (source.StoreID, source.StoreName, source.Address, source.City, source.State, source.Country, source.Phone, source.IsActive, GETDATE());
END;
