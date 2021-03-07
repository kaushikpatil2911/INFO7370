/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Adventure Work DW DM1.DM1
 *
 * Date Created : Wednesday, September 30, 2020 16:05:14
 * Target DBMS : Microsoft SQL Server 2017
 */

USE Inventory
go
/* 
 * TABLE: DimDate 
 */

CREATE TABLE DimDate(
    DateKey                 int             NOT NULL,
    FullDateAlternateKey    date            NOT NULL,
    DayNumberOfWeek         tinyint         NOT NULL,
    EnglishDayNameOfWeek    nvarchar(10)    NOT NULL,
    SpanishDayNameOfWeek    nvarchar(10)    NOT NULL,
    FrenchDayNameOfWeek     nvarchar(10)    NOT NULL,
    DayNumberOfMonth        tinyint         NOT NULL,
    DayNumberOfYear         smallint        NOT NULL,
    WeekNumberOfYear        tinyint         NOT NULL,
    EnglishMonthName        nvarchar(10)    NOT NULL,
    SpanishMonthName        nvarchar(10)    NOT NULL,
    FrenchMonthName         nvarchar(10)    NOT NULL,
    MonthNumberOfYear       tinyint         NOT NULL,
    CalendarQuarter         tinyint         NOT NULL,
    CalendarYear            smallint        NOT NULL,
    CalendarSemester        tinyint         NOT NULL,
    FiscalQuarter           tinyint         NOT NULL,
    FiscalYear              smallint        NOT NULL,
    FiscalSemester          tinyint         NOT NULL,
    CONSTRAINT PK_DimDate_DateKey PRIMARY KEY NONCLUSTERED (DateKey)
)
go



IF OBJECT_ID('DimDate') IS NOT NULL
    PRINT '<<< CREATED TABLE DimDate >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimDate >>>'
go

/* 
 * TABLE: DimProduct 
 */

CREATE TABLE DimProduct(
    ProductKey               int               IDENTITY(1,1),
    ProductAlternateKey      nvarchar(25)      NULL,
    ProductSubcategoryKey    int               NULL,
    WeightUnitMeasureCode    nchar(3)          NULL,
    SizeUnitMeasureCode      nchar(3)          NULL,
    EnglishProductName       nvarchar(50)      NOT NULL,
    SpanishProductName       nvarchar(50)      NOT NULL,
    FrenchProductName        nvarchar(50)      NOT NULL,
    StandardCost             money             NULL,
    FinishedGoodsFlag        bit               NOT NULL,
    Color                    nvarchar(15)      NOT NULL,
    SafetyStockLevel         smallint          NULL,
    ReorderPoint             smallint          NULL,
    ListPrice                money             NULL,
    Size                     nvarchar(50)      NULL,
    SizeRange                nvarchar(50)      NULL,
    Weight                   float             NULL,
    DaysToManufacture        int               NULL,
    ProductLine              nchar(2)          NULL,
    DealerPrice              money             NULL,
    Class                    nchar(2)          NULL,
    Style                    nchar(2)          NULL,
    ModelName                nvarchar(50)      NULL,
    LargePhoto               varbinary(max)    NULL,
    EnglishDescription       nvarchar(400)     NULL,
    FrenchDescription        nvarchar(400)     NULL,
    ChineseDescription       nvarchar(400)     NULL,
    ArabicDescription        nvarchar(400)     NULL,
    HebrewDescription        nvarchar(400)     NULL,
    ThaiDescription          nvarchar(400)     NULL,
    GermanDescription        nvarchar(400)     NULL,
    JapaneseDescription      nvarchar(400)     NULL,
    TurkishDescription       nvarchar(400)     NULL,
    StartDate                datetime          NULL,
    EndDate                  datetime          NULL,
    Status                   nvarchar(7)       NULL,
    CONSTRAINT PK_DimProduct_ProductKey PRIMARY KEY NONCLUSTERED (ProductKey)
)
go



IF OBJECT_ID('DimProduct') IS NOT NULL
    PRINT '<<< CREATED TABLE DimProduct >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimProduct >>>'
go

/* 
 * TABLE: DimProductCategory 
 */

CREATE TABLE DimProductCategory(
    ProductCategoryKey             int             IDENTITY(1,1),
    ProductCategoryAlternateKey    int             NULL,
    EnglishProductCategoryName     nvarchar(50)    NOT NULL,
    SpanishProductCategoryName     nvarchar(50)    NOT NULL,
    FrenchProductCategoryName      nvarchar(50)    NOT NULL,
    CONSTRAINT PK_DimProductCategory_ProductCategoryKey PRIMARY KEY NONCLUSTERED (ProductCategoryKey)
)
go



IF OBJECT_ID('DimProductCategory') IS NOT NULL
    PRINT '<<< CREATED TABLE DimProductCategory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimProductCategory >>>'
go

/* 
 * TABLE: DimProductSubcategory 
 */

CREATE TABLE DimProductSubcategory(
    ProductSubcategoryKey             int             IDENTITY(1,1),
    ProductSubcategoryAlternateKey    int             NULL,
    EnglishProductSubcategoryName     nvarchar(50)    NOT NULL,
    SpanishProductSubcategoryName     nvarchar(50)    NOT NULL,
    FrenchProductSubcategoryName      nvarchar(50)    NOT NULL,
    ProductCategoryKey                int             NULL,
    CONSTRAINT PK_DimProductSubcategory_ProductSubcategoryKey PRIMARY KEY NONCLUSTERED (ProductSubcategoryKey)
)
go



IF OBJECT_ID('DimProductSubcategory') IS NOT NULL
    PRINT '<<< CREATED TABLE DimProductSubcategory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimProductSubcategory >>>'
go

/* 
 * TABLE: FactProductInventory 
 */

CREATE TABLE FactProductInventory(
    ProductKey      int      NOT NULL,
    DateKey         int      NOT NULL,
    MovementDate    date     NOT NULL,
    UnitCost        money    NOT NULL,
    UnitsIn         int      NOT NULL,
    UnitsOut        int      NOT NULL,
    UnitsBalance    int      NOT NULL,
    CONSTRAINT PK_FactProductInventory PRIMARY KEY NONCLUSTERED (ProductKey, DateKey)
)
go



IF OBJECT_ID('FactProductInventory') IS NOT NULL
    PRINT '<<< CREATED TABLE FactProductInventory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactProductInventory >>>'
go

/* 
 * TABLE: DimProduct 
 */

ALTER TABLE DimProduct ADD CONSTRAINT FK_DimProduct_DimProductSubcategory 
    FOREIGN KEY (ProductSubcategoryKey)
    REFERENCES DimProductSubcategory(ProductSubcategoryKey)
go


/* 
 * TABLE: DimProductSubcategory 
 */

ALTER TABLE DimProductSubcategory ADD CONSTRAINT FK_DimProductSubcategory_DimProductCategory 
    FOREIGN KEY (ProductCategoryKey)
    REFERENCES DimProductCategory(ProductCategoryKey)
go


/* 
 * TABLE: FactProductInventory 
 */

ALTER TABLE FactProductInventory ADD CONSTRAINT FK_FactProductInventory_DimDate 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE FactProductInventory ADD CONSTRAINT FK_FactProductInventory_DimProduct 
    FOREIGN KEY (ProductKey)
    REFERENCES DimProduct(ProductKey)
go


