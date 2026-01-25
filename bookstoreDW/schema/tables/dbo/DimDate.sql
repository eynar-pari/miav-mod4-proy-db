-- DimDate: Dimensión de fechas
CREATE TABLE dbo.DimDate (
    DateKey INT PRIMARY KEY,
    Date DATE,
    Day INT,
    Month INT,
    Year INT,
    Quarter INT,
    DayOfWeek INT,
    MonthName NVARCHAR(20),
    DayName NVARCHAR(20)
);
