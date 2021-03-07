--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Adventure Work DW DM1.DM1
--
-- Date Created : Wednesday, September 30, 2020 16:03:17
-- Target DBMS : Oracle 12c
--

-- 
-- TABLE: DimDate 
--

CREATE TABLE DimDate(
    DateKey                 NUMBER(38, 0)    NOT NULL,
    FullDateAlternateKey    DATE             NOT NULL,
    DayNumberOfWeek         NUMBER(3, 0)     NOT NULL,
    EnglishDayNameOfWeek    NVARCHAR2(10)    NOT NULL,
    SpanishDayNameOfWeek    NVARCHAR2(10)    NOT NULL,
    FrenchDayNameOfWeek     NVARCHAR2(10)    NOT NULL,
    DayNumberOfMonth        NUMBER(3, 0)     NOT NULL,
    DayNumberOfYear         SMALLINT         NOT NULL,
    WeekNumberOfYear        NUMBER(3, 0)     NOT NULL,
    EnglishMonthName        NVARCHAR2(10)    NOT NULL,
    SpanishMonthName        NVARCHAR2(10)    NOT NULL,
    FrenchMonthName         NVARCHAR2(10)    NOT NULL,
    MonthNumberOfYear       NUMBER(3, 0)     NOT NULL,
    CalendarQuarter         NUMBER(3, 0)     NOT NULL,
    CalendarYear            SMALLINT         NOT NULL,
    CalendarSemester        NUMBER(3, 0)     NOT NULL,
    FiscalQuarter           NUMBER(3, 0)     NOT NULL,
    FiscalYear              SMALLINT         NOT NULL,
    FiscalSemester          NUMBER(3, 0)     NOT NULL,
    CONSTRAINT PK_DimDate_DateKey PRIMARY KEY (DateKey)
)
;



-- 
-- TABLE: DimProduct 
--

CREATE TABLE DimProduct(
    ProductKey               NUMBER(38, 0)     NOT NULL,
    ProductAlternateKey      NVARCHAR2(25),
    ProductSubcategoryKey    NUMBER(38, 0),
    WeightUnitMeasureCode    NCHAR(3),
    SizeUnitMeasureCode      NCHAR(3),
    EnglishProductName       NVARCHAR2(50)     NOT NULL,
    SpanishProductName       NVARCHAR2(50)     NOT NULL,
    FrenchProductName        NVARCHAR2(50)     NOT NULL,
    StandardCost             NUMBER(19, 4),
    FinishedGoodsFlag        NUMBER(1, 0)      NOT NULL,
    Color                    NVARCHAR2(15)     NOT NULL,
    SafetyStockLevel         SMALLINT,
    ReorderPoint             SMALLINT,
    ListPrice                NUMBER(19, 4),
    Size                     NVARCHAR2(50),
    SizeRange                NVARCHAR2(50),
    Weight                   BINARY_FLOAT,
    DaysToManufacture        NUMBER(38, 0),
    ProductLine              NCHAR(2),
    DealerPrice              NUMBER(19, 4),
    Class                    NCHAR(2),
    Style                    NCHAR(2),
    ModelName                NVARCHAR2(50),
    LargePhoto               BLOB,
    EnglishDescription       NVARCHAR2(400),
    FrenchDescription        NVARCHAR2(400),
    ChineseDescription       NVARCHAR2(400),
    ArabicDescription        NVARCHAR2(400),
    HebrewDescription        NVARCHAR2(400),
    ThaiDescription          NVARCHAR2(400),
    GermanDescription        NVARCHAR2(400),
    JapaneseDescription      NVARCHAR2(400),
    TurkishDescription       NVARCHAR2(400),
    StartDate                TIMESTAMP(6),
    EndDate                  TIMESTAMP(6),
    Status                   NVARCHAR2(7),
    CONSTRAINT PK_DimProduct_ProductKey PRIMARY KEY (ProductKey)
)
;



-- 
-- TABLE: DimProductCategory 
--

CREATE TABLE DimProductCategory(
    ProductCategoryKey             NUMBER(38, 0)    NOT NULL,
    ProductCategoryAlternateKey    NUMBER(38, 0),
    EnglishProductCategoryName     NVARCHAR2(50)    NOT NULL,
    SpanishProductCategoryName     NVARCHAR2(50)    NOT NULL,
    FrenchProductCategoryName      NVARCHAR2(50)    NOT NULL,
    CONSTRAINT PK_DimProductCategory_ProductCategoryKey PRIMARY KEY (ProductCategoryKey)
)
;



-- 
-- TABLE: DimProductSubcategory 
--

CREATE TABLE DimProductSubcategory(
    ProductSubcategoryKey             NUMBER(38, 0)    NOT NULL,
    ProductSubcategoryAlternateKey    NUMBER(38, 0),
    EnglishProductSubcategoryName     NVARCHAR2(50)    NOT NULL,
    SpanishProductSubcategoryName     NVARCHAR2(50)    NOT NULL,
    FrenchProductSubcategoryName      NVARCHAR2(50)    NOT NULL,
    ProductCategoryKey                NUMBER(38, 0),
    CONSTRAINT PK_DimProductSubcategory_ProductSubcategoryKey PRIMARY KEY (ProductSubcategoryKey)
)
;



-- 
-- TABLE: FactProductInventory 
--

CREATE TABLE FactProductInventory(
    ProductKey      NUMBER(38, 0)    NOT NULL,
    DateKey         NUMBER(38, 0)    NOT NULL,
    MovementDate    DATE             NOT NULL,
    UnitCost        NUMBER(19, 4)    NOT NULL,
    UnitsIn         NUMBER(38, 0)    NOT NULL,
    UnitsOut        NUMBER(38, 0)    NOT NULL,
    UnitsBalance    NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK_FactProductInventory PRIMARY KEY (ProductKey, DateKey)
)
;



-- 
-- TABLE: DimProduct 
--

ALTER TABLE DimProduct ADD CONSTRAINT FK_DimProduct_DimProductSubcategory 
    FOREIGN KEY (ProductSubcategoryKey)
    REFERENCES DimProductSubcategory(ProductSubcategoryKey)
;


-- 
-- TABLE: DimProductSubcategory 
--

ALTER TABLE DimProductSubcategory ADD CONSTRAINT FK_DimProductSubcategory_DimProductCategory 
    FOREIGN KEY (ProductCategoryKey)
    REFERENCES DimProductCategory(ProductCategoryKey)
;


-- 
-- TABLE: FactProductInventory 
--

ALTER TABLE FactProductInventory ADD CONSTRAINT FK_FactProductInventory_DimDate 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
;

ALTER TABLE FactProductInventory ADD CONSTRAINT FK_FactProductInventory_DimProduct 
    FOREIGN KEY (ProductKey)
    REFERENCES DimProduct(ProductKey)
;


