-- staging.store: staging temporal para tiendas
CREATE TABLE staging.store (
    StoreID INT,
    StoreName NVARCHAR(255),
    Address NVARCHAR(255),
    City NVARCHAR(100),
    State NVARCHAR(100),
    Country NVARCHAR(100),
    Phone NVARCHAR(50),
    IsActive BIT
);
