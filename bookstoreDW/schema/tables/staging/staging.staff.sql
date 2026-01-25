-- staging.staff: staging temporal para empleados/vendedores
CREATE TABLE [staging].[staff] (
    StaffID INT,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(255),
    Phone NVARCHAR(50),
    Position NVARCHAR(100),
    StoreID INT,
    IsActive BIT
);
