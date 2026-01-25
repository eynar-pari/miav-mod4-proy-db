-- DW_MergeFactOrders: Carga de FactOrders desde staging
CREATE PROCEDURE [dbo].[DW_MergeFactOrders]
AS
BEGIN
    MERGE INTO dbo.FactOrders AS target
    USING staging.orders AS source
    ON target.OrderID = source.OrderID
    WHEN MATCHED THEN
        UPDATE SET
            Quantity = source.Quantity,
            TotalAmount = source.TotalAmount,
            Discount = source.Discount,
            OrderStatus = source.OrderStatus
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (OrderID, DateKey, CustomerKey, ProductKey, StoreKey, StaffKey, Quantity, TotalAmount, Discount, OrderStatus)
        VALUES (
            source.OrderID,
            CONVERT(INT, CONVERT(CHAR(8), source.OrderDate, 112)),
            (SELECT CustomerKey FROM dbo.DimCustomer WHERE CustomerID = source.CustomerID),
            (SELECT ProductKey FROM dbo.DimProduct WHERE ProductID = source.ProductID),
            (SELECT StoreKey FROM dbo.DimStore WHERE StoreID = source.StoreID),
            (SELECT StaffKey FROM dbo.DimStaff WHERE StaffID = source.StaffID),
            source.Quantity,
            source.TotalAmount,
            source.Discount,
            source.OrderStatus
        );
END;
