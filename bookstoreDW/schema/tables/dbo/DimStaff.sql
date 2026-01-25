-- DimStaff: Dimensión de empleados/vendedores
CREATE TABLE dbo.DimStaff (
    StaffKey INT IDENTITY(1,1) PRIMARY KEY,
    StaffID INT,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(255),
    Phone NVARCHAR(50),
    Position NVARCHAR(100),
    StoreID INT,
    IsActive BIT,
    StartDate DATE,
    EndDate DATE
);
