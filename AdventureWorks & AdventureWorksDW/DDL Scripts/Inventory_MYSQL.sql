--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Adventure Work DW DM1.DM1
--
-- Date Created : Wednesday, September 30, 2020 16:02:46
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: DimDate 
--

CREATE TABLE DimDate(
    DateKey                 INT                     NOT NULL,
    FullDateAlternateKey    DATE                    NOT NULL,
    DayNumberOfWeek         TINYINT                 NOT NULL,
    EnglishDayNameOfWeek    NATIONAL VARCHAR(10)    NOT NULL,
    SpanishDayNameOfWeek    NATIONAL VARCHAR(10)    NOT NULL,
    FrenchDayNameOfWeek     NATIONAL VARCHAR(10)    NOT NULL,
    DayNumberOfMonth        TINYINT                 NOT NULL,
    DayNumberOfYear         SMALLINT                NOT NULL,
    WeekNumberOfYear        TINYINT                 NOT NULL,
    EnglishMonthName        NATIONAL VARCHAR(10)    NOT NULL,
    SpanishMonthName        NATIONAL VARCHAR(10)    NOT NULL,
    FrenchMonthName         NATIONAL VARCHAR(10)    NOT NULL,
    MonthNumberOfYear       TINYINT                 NOT NULL,
    CalendarQuarter         TINYINT                 NOT NULL,
    CalendarYear            SMALLINT                NOT NULL,
    CalendarSemester        TINYINT                 NOT NULL,
    FiscalQuarter           TINYINT                 NOT NULL,
    FiscalYear              SMALLINT                NOT NULL,
    FiscalSemester          TINYINT                 NOT NULL,
    PRIMARY KEY (DateKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProduct 
--

CREATE TABLE DimProduct(
    ProductKey               INT                      AUTO_INCREMENT,
    ProductAlternateKey      NATIONAL VARCHAR(25),
    ProductSubcategoryKey    INT,
    WeightUnitMeasureCode    NATIONAL CHAR(3),
    SizeUnitMeasureCode      NATIONAL CHAR(3),
    EnglishProductName       NATIONAL VARCHAR(50)     NOT NULL,
    SpanishProductName       NATIONAL VARCHAR(50)     NOT NULL,
    FrenchProductName        NATIONAL VARCHAR(50)     NOT NULL,
    StandardCost             DECIMAL(19, 4),
    FinishedGoodsFlag        BIT(1)                   NOT NULL,
    Color                    NATIONAL VARCHAR(15)     NOT NULL,
    SafetyStockLevel         SMALLINT,
    ReorderPoint             SMALLINT,
    ListPrice                DECIMAL(19, 4),
    Size                     NATIONAL VARCHAR(50),
    SizeRange                NATIONAL VARCHAR(50),
    Weight                   FLOAT(8, 0),
    DaysToManufacture        INT,
    ProductLine              NATIONAL CHAR(2),
    DealerPrice              DECIMAL(19, 4),
    Class                    NATIONAL CHAR(2),
    Style                    NATIONAL CHAR(2),
    ModelName                NATIONAL VARCHAR(50),
    LargePhoto               VARBINARY(4000),
    EnglishDescription       NATIONAL VARCHAR(400),
    FrenchDescription        NATIONAL VARCHAR(400),
    ChineseDescription       NATIONAL VARCHAR(400),
    ArabicDescription        NATIONAL VARCHAR(400),
    HebrewDescription        NATIONAL VARCHAR(400),
    ThaiDescription          NATIONAL VARCHAR(400),
    GermanDescription        NATIONAL VARCHAR(400),
    JapaneseDescription      NATIONAL VARCHAR(400),
    TurkishDescription       NATIONAL VARCHAR(400),
    StartDate                DATETIME,
    EndDate                  DATETIME,
    Status                   NATIONAL VARCHAR(7),
    PRIMARY KEY (ProductKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductCategory 
--

CREATE TABLE DimProductCategory(
    ProductCategoryKey             INT                     AUTO_INCREMENT,
    ProductCategoryAlternateKey    INT,
    EnglishProductCategoryName     NATIONAL VARCHAR(50)    NOT NULL,
    SpanishProductCategoryName     NATIONAL VARCHAR(50)    NOT NULL,
    FrenchProductCategoryName      NATIONAL VARCHAR(50)    NOT NULL,
    PRIMARY KEY (ProductCategoryKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductSubcategory 
--

CREATE TABLE DimProductSubcategory(
    ProductSubcategoryKey             INT                     AUTO_INCREMENT,
    ProductSubcategoryAlternateKey    INT,
    EnglishProductSubcategoryName     NATIONAL VARCHAR(50)    NOT NULL,
    SpanishProductSubcategoryName     NATIONAL VARCHAR(50)    NOT NULL,
    FrenchProductSubcategoryName      NATIONAL VARCHAR(50)    NOT NULL,
    ProductCategoryKey                INT,
    PRIMARY KEY (ProductSubcategoryKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactProductInventory 
--

CREATE TABLE FactProductInventory(
    ProductKey      INT               NOT NULL,
    DateKey         INT               NOT NULL,
    MovementDate    DATE              NOT NULL,
    UnitCost        DECIMAL(19, 4)    NOT NULL,
    UnitsIn         INT               NOT NULL,
    UnitsOut        INT               NOT NULL,
    UnitsBalance    INT               NOT NULL,
    PRIMARY KEY (ProductKey, DateKey)
)ENGINE=MYISAM
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


