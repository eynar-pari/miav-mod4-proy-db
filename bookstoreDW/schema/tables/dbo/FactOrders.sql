-- FactOrders: Tabla de hechos de ventas/pedidos
CREATE TABLE dbo.FactOrders (
    OrderKey INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    DateKey INT,
    CustomerKey INT,
    ProductKey INT,
    StoreKey INT,
    StaffKey INT,
    Quantity INT,
    TotalAmount DECIMAL(12,2),
    Discount DECIMAL(10,2),
    OrderStatus NVARCHAR(50),
    FOREIGN KEY (DateKey) REFERENCES dbo.DimDate(DateKey),
    FOREIGN KEY (CustomerKey) REFERENCES dbo.DimCustomer(CustomerKey),
    FOREIGN KEY (ProductKey) REFERENCES dbo.DimProduct(ProductKey),
    FOREIGN KEY (StoreKey) REFERENCES dbo.DimStore(StoreKey),
    FOREIGN KEY (StaffKey) REFERENCES dbo.DimStaff(StaffKey)
);
