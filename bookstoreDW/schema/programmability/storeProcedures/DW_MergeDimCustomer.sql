-- DW_MergeDimCustomer: Carga de DimCustomer desde staging
CREATE PROCEDURE [dbo].[DW_MergeDimCustomer]
AS
BEGIN
    MERGE INTO dbo.DimCustomer AS target
    USING staging.customer AS source
    ON target.CustomerID = source.CustomerID
    WHEN MATCHED THEN
        UPDATE SET
            FirstName = source.FirstName,
            LastName = source.LastName,
            Email = source.Email,
            Phone = source.Phone,
            Address = source.Address,
            City = source.City,
            State = source.State,
            Country = source.Country,
            ZipCode = source.ZipCode,
            IsActive = source.IsActive
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, Country, ZipCode, IsActive, StartDate)
        VALUES (source.CustomerID, source.FirstName, source.LastName, source.Email, source.Phone, source.Address, source.City, source.State, source.Country, source.ZipCode, source.IsActive, GETDATE());
END;
