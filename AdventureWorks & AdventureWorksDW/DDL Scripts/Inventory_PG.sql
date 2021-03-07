--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Adventure Work DW DM1.DM1
--
-- Date Created : Wednesday, September 30, 2020 16:03:57
-- Target DBMS : PostgreSQL 10.x-12.x
--

-- 
-- TABLE: "DimDate" 
--

CREATE TABLE "DimDate"(
    "DateKey"               integer                  NOT NULL,
    "FullDateAlternateKey"  date                     NOT NULL,
    "DayNumberOfWeek"       int2                     NOT NULL,
    "EnglishDayNameOfWeek"  character varying(10)    NOT NULL,
    "SpanishDayNameOfWeek"  character varying(10)    NOT NULL,
    "FrenchDayNameOfWeek"   character varying(10)    NOT NULL,
    "DayNumberOfMonth"      int2                     NOT NULL,
    "DayNumberOfYear"       smallint                 NOT NULL,
    "WeekNumberOfYear"      int2                     NOT NULL,
    "EnglishMonthName"      character varying(10)    NOT NULL,
    "SpanishMonthName"      character varying(10)    NOT NULL,
    "FrenchMonthName"       character varying(10)    NOT NULL,
    "MonthNumberOfYear"     int2                     NOT NULL,
    "CalendarQuarter"       int2                     NOT NULL,
    "CalendarYear"          smallint                 NOT NULL,
    "CalendarSemester"      int2                     NOT NULL,
    "FiscalQuarter"         int2                     NOT NULL,
    "FiscalYear"            smallint                 NOT NULL,
    "FiscalSemester"        int2                     NOT NULL,
    CONSTRAINT "PK_DimDate_DateKey" PRIMARY KEY ("DateKey")
)
;



-- 
-- TABLE: "DimProduct" 
--

CREATE TABLE "DimProduct"(
    "ProductKey"             integer                   GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "ProductAlternateKey"    character varying(25),
    "ProductSubcategoryKey"  integer,
    "WeightUnitMeasureCode"  char(3),
    "SizeUnitMeasureCode"    char(3),
    "EnglishProductName"     character varying(50)     NOT NULL,
    "SpanishProductName"     character varying(50)     NOT NULL,
    "FrenchProductName"      character varying(50)     NOT NULL,
    "StandardCost"           money,
    "FinishedGoodsFlag"      boolean                   NOT NULL,
    "Color"                  character varying(15)     NOT NULL,
    "SafetyStockLevel"       smallint,
    "ReorderPoint"           smallint,
    "ListPrice"              money,
    "Size"                   character varying(50),
    "SizeRange"              character varying(50),
    "Weight"                 float4,
    "DaysToManufacture"      integer,
    "ProductLine"            char(2),
    "DealerPrice"            money,
    "Class"                  char(2),
    "Style"                  char(2),
    "ModelName"              character varying(50),
    "LargePhoto"             bit varying,
    "EnglishDescription"     character varying(400),
    "FrenchDescription"      character varying(400),
    "ChineseDescription"     character varying(400),
    "ArabicDescription"      character varying(400),
    "HebrewDescription"      character varying(400),
    "ThaiDescription"        character varying(400),
    "GermanDescription"      character varying(400),
    "JapaneseDescription"    character varying(400),
    "TurkishDescription"     character varying(400),
    "StartDate"              time without time zone,
    "EndDate"                time without time zone,
    "Status"                 character varying(7),
    CONSTRAINT "PK_DimProduct_ProductKey" PRIMARY KEY ("ProductKey")
)
;



-- 
-- TABLE: "DimProductCategory" 
--

CREATE TABLE "DimProductCategory"(
    "ProductCategoryKey"           integer                  GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "ProductCategoryAlternateKey"  integer,
    "EnglishProductCategoryName"   character varying(50)    NOT NULL,
    "SpanishProductCategoryName"   character varying(50)    NOT NULL,
    "FrenchProductCategoryName"    character varying(50)    NOT NULL,
    CONSTRAINT "PK_DimProductCategory_ProductCategoryKey" PRIMARY KEY ("ProductCategoryKey")
)
;



-- 
-- TABLE: "DimProductSubcategory" 
--

CREATE TABLE "DimProductSubcategory"(
    "ProductSubcategoryKey"           integer                  GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "ProductSubcategoryAlternateKey"  integer,
    "EnglishProductSubcategoryName"   character varying(50)    NOT NULL,
    "SpanishProductSubcategoryName"   character varying(50)    NOT NULL,
    "FrenchProductSubcategoryName"    character varying(50)    NOT NULL,
    "ProductCategoryKey"              integer,
    CONSTRAINT "PK_DimProductSubcategory_ProductSubcategoryKey" PRIMARY KEY ("ProductSubcategoryKey")
)
;



-- 
-- TABLE: "FactProductInventory" 
--

CREATE TABLE "FactProductInventory"(
    "ProductKey"    integer    NOT NULL,
    "DateKey"       integer    NOT NULL,
    "MovementDate"  date       NOT NULL,
    "UnitCost"      money      NOT NULL,
    "UnitsIn"       integer    NOT NULL,
    "UnitsOut"      integer    NOT NULL,
    "UnitsBalance"  integer    NOT NULL,
    CONSTRAINT "PK_FactProductInventory" PRIMARY KEY ("ProductKey", "DateKey")
)
;



-- 
-- TABLE: "DimProduct" 
--

ALTER TABLE "DimProduct" ADD CONSTRAINT "FK_DimProduct_DimProductSubcategory" 
    FOREIGN KEY ("ProductSubcategoryKey")
    REFERENCES "DimProductSubcategory"("ProductSubcategoryKey")
;


-- 
-- TABLE: "DimProductSubcategory" 
--

ALTER TABLE "DimProductSubcategory" ADD CONSTRAINT "FK_DimProductSubcategory_DimProductCategory" 
    FOREIGN KEY ("ProductCategoryKey")
    REFERENCES "DimProductCategory"("ProductCategoryKey")
;


-- 
-- TABLE: "FactProductInventory" 
--

ALTER TABLE "FactProductInventory" ADD CONSTRAINT "FK_FactProductInventory_DimDate" 
    FOREIGN KEY ("DateKey")
    REFERENCES "DimDate"("DateKey")
;

ALTER TABLE "FactProductInventory" ADD CONSTRAINT "FK_FactProductInventory_DimProduct" 
    FOREIGN KEY ("ProductKey")
    REFERENCES "DimProduct"("ProductKey")
;


