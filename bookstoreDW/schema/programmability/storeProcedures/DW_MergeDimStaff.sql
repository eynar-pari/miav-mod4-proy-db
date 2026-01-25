-- DW_MergeDimStaff: Carga de DimStaff desde staging
CREATE PROCEDURE [dbo].[DW_MergeDimStaff]
AS
BEGIN
    MERGE INTO dbo.DimStaff AS target
    USING staging.staff AS source
    ON target.StaffID = source.StaffID
    WHEN MATCHED THEN
        UPDATE SET
            FirstName = source.FirstName,
            LastName = source.LastName,
            Email = source.Email,
            Phone = source.Phone,
            Position = source.Position,
            StoreID = source.StoreID,
            IsActive = source.IsActive
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (StaffID, FirstName, LastName, Email, Phone, Position, StoreID, IsActive, StartDate)
        VALUES (source.StaffID, source.FirstName, source.LastName, source.Email, source.Phone, source.Position, source.StoreID, source.IsActive, GETDATE());
END;
