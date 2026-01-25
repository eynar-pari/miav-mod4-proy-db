-- staging.orders: staging temporal para ventas/pedidos
CREATE TABLE [staging].[orders] (
    OrderID INT,
    OrderDate DATE,
    CustomerID INT,
    ProductID INT,
    StoreID INT,
    StaffID INT,
    Quantity INT,
    TotalAmount DECIMAL(12,2),
    Discount DECIMAL(10,2),
    OrderStatus NVARCHAR(50)
);
