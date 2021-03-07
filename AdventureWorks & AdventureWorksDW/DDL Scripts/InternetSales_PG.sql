--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Adventure Work DW DM1.DM1
--
-- Date Created : Wednesday, September 30, 2020 16:00:49
-- Target DBMS : PostgreSQL 10.x-12.x
--

-- 
-- TABLE: "DimCustomer" 
--

CREATE TABLE "DimCustomer"(
    "CustomerKey"           integer                   GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "GeographyKey"          integer,
    "CustomerAlternateKey"  character varying(15)     NOT NULL,
    "Title"                 character varying(8),
    "FirstName"             character varying(50),
    "MiddleName"            character varying(50),
    "LastName"              character varying(50),
    "NameStyle"             boolean,
    "BirthDate"             date,
    "MaritalStatus"         char(1),
    "Suffix"                character varying(10),
    "Gender"                character varying(1),
    "EmailAddress"          character varying(50),
    "YearlyIncome"          money,
    "TotalChildren"         int2,
    "NumberChildrenAtHome"  int2,
    "EnglishEducation"      character varying(40),
    "SpanishEducation"      character varying(40),
    "FrenchEducation"       character varying(40),
    "EnglishOccupation"     character varying(100),
    "SpanishOccupation"     character varying(100),
    "FrenchOccupation"      character varying(100),
    "HouseOwnerFlag"        char(1),
    "NumberCarsOwned"       int2,
    "AddressLine1"          character varying(120),
    "AddressLine2"          character varying(120),
    "Phone"                 character varying(20),
    "DateFirstPurchase"     date,
    "CommuteDistance"       character varying(15),
    CONSTRAINT "PK_DimCustomer_CustomerKey" PRIMARY KEY ("CustomerKey")
)
;



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
-- TABLE: "DimEmployee" 
--

CREATE TABLE "DimEmployee"(
    "EmployeeKey"                           integer                   GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "ParentEmployeeKey"                     integer,
    "EmployeeNationalIDAlternateKey"        character varying(15),
    "ParentEmployeeNationalIDAlternateKey"  character varying(15),
    "SalesTerritoryKey"                     integer,
    "FirstName"                             character varying(50)     NOT NULL,
    "LastName"                              character varying(50)     NOT NULL,
    "MiddleName"                            character varying(50),
    "NameStyle"                             boolean                   NOT NULL,
    "Title"                                 character varying(50),
    "HireDate"                              date,
    "BirthDate"                             date,
    "LoginID"                               character varying(256),
    "EmailAddress"                          character varying(50),
    "Phone"                                 character varying(25),
    "MaritalStatus"                         char(1),
    "EmergencyContactName"                  character varying(50),
    "EmergencyContactPhone"                 character varying(25),
    "SalariedFlag"                          boolean,
    "Gender"                                char(1),
    "PayFrequency"                          int2,
    "BaseRate"                              money,
    "VacationHours"                         smallint,
    "SickLeaveHours"                        smallint,
    "CurrentFlag"                           boolean                   NOT NULL,
    "SalesPersonFlag"                       boolean                   NOT NULL,
    "DepartmentName"                        character varying(50),
    "StartDate"                             date,
    "EndDate"                               date,
    "Status"                                character varying(50),
    "EmployeePhoto"                         bit varying,
    CONSTRAINT "PK_DimEmployee_EmployeeKey" PRIMARY KEY ("EmployeeKey")
)
;



-- 
-- TABLE: "DimGeography" 
--

CREATE TABLE "DimGeography"(
    "GeographyKey"              integer                  GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "City"                      character varying(30),
    "StateProvinceCode"         character varying(3),
    "StateProvinceName"         character varying(50),
    "CountryRegionCode"         character varying(3),
    "EnglishCountryRegionName"  character varying(50),
    "SpanishCountryRegionName"  character varying(50),
    "FrenchCountryRegionName"   character varying(50),
    "PostalCode"                character varying(15),
    "SalesTerritoryKey"         integer,
    "IpAddressLocator"          character varying(15),
    CONSTRAINT "PK_DimGeography_GeographyKey" PRIMARY KEY ("GeographyKey")
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
-- TABLE: "DimPromotion" 
--

CREATE TABLE "DimPromotion"(
    "PromotionKey"              integer                   GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "PromotionAlternateKey"     integer,
    "EnglishPromotionName"      character varying(255),
    "SpanishPromotionName"      character varying(255),
    "FrenchPromotionName"       character varying(255),
    "DiscountPct"               float4,
    "EnglishPromotionType"      character varying(50),
    "SpanishPromotionType"      character varying(50),
    "FrenchPromotionType"       character varying(50),
    "EnglishPromotionCategory"  character varying(50),
    "SpanishPromotionCategory"  character varying(50),
    "FrenchPromotionCategory"   character varying(50),
    "StartDate"                 time without time zone    NOT NULL,
    "EndDate"                   time without time zone,
    "MinQty"                    integer,
    "MaxQty"                    integer,
    CONSTRAINT "PK_DimPromotion_PromotionKey" PRIMARY KEY ("PromotionKey")
)
;



-- 
-- TABLE: "DimSalesTerritory" 
--

CREATE TABLE "DimSalesTerritory"(
    "SalesTerritoryKey"           integer                  GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "SalesTerritoryAlternateKey"  integer,
    "SalesTerritoryRegion"        character varying(50)    NOT NULL,
    "SalesTerritoryCountry"       character varying(50)    NOT NULL,
    "SalesTerritoryGroup"         character varying(50),
    "SalesTerritoryImage"         bit varying,
    CONSTRAINT "PK_DimSalesTerritory_SalesTerritoryKey" PRIMARY KEY ("SalesTerritoryKey")
)
;



-- 
-- TABLE: "FactInternetSales" 
--

CREATE TABLE "FactInternetSales"(
    "DueDateKey"             integer                   NOT NULL,
    "ShipDateKey"            integer                   NOT NULL,
    "CustomerKey"            integer                   NOT NULL,
    "PromotionKey"           integer                   NOT NULL,
    "SalesTerritoryKey"      integer                   NOT NULL,
    "SalesOrderNumber"       character varying(20)     NOT NULL,
    "SalesOrderLineNumber"   int2                      NOT NULL,
    "RevisionNumber"         int2                      NOT NULL,
    "OrderQuantity"          smallint                  NOT NULL,
    "UnitPrice"              money                     NOT NULL,
    "ExtendedAmount"         money                     NOT NULL,
    "UnitPriceDiscountPct"   float4                    NOT NULL,
    "DiscountAmount"         float4                    NOT NULL,
    "ProductStandardCost"    money                     NOT NULL,
    "TotalProductCost"       money                     NOT NULL,
    "SalesAmount"            money                     NOT NULL,
    "TaxAmt"                 money                     NOT NULL,
    "Freight"                money                     NOT NULL,
    "CarrierTrackingNumber"  character varying(25),
    "CustomerPONumber"       character varying(25),
    "OrderDate"              time without time zone,
    "DueDate"                time without time zone,
    "ShipDate"               time without time zone,
    CONSTRAINT "PK_FactInternetSales_SalesOrderNumber_SalesOrderLineNumber" PRIMARY KEY ("SalesOrderNumber", "SalesOrderLineNumber")
)
;



-- 
-- TABLE: "DimCustomer" 
--

ALTER TABLE "DimCustomer" ADD CONSTRAINT "FK_DimCustomer_DimGeography" 
    FOREIGN KEY ("GeographyKey")
    REFERENCES "DimGeography"("GeographyKey")
;


-- 
-- TABLE: "DimEmployee" 
--

ALTER TABLE "DimEmployee" ADD CONSTRAINT "FK_DimEmployee_DimEmployee" 
    FOREIGN KEY ("ParentEmployeeKey")
    REFERENCES "DimEmployee"("EmployeeKey")
;

ALTER TABLE "DimEmployee" ADD CONSTRAINT "FK_DimEmployee_DimSalesTerritory" 
    FOREIGN KEY ("SalesTerritoryKey")
    REFERENCES "DimSalesTerritory"("SalesTerritoryKey")
;


-- 
-- TABLE: "DimGeography" 
--

ALTER TABLE "DimGeography" ADD CONSTRAINT "FK_DimGeography_DimSalesTerritory" 
    FOREIGN KEY ("SalesTerritoryKey")
    REFERENCES "DimSalesTerritory"("SalesTerritoryKey")
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
-- TABLE: "FactInternetSales" 
--

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "FK_FactInternetSales_DimCustomer" 
    FOREIGN KEY ("CustomerKey")
    REFERENCES "DimCustomer"("CustomerKey")
;

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "FK_FactInternetSales_DimDate1" 
    FOREIGN KEY ("DueDateKey")
    REFERENCES "DimDate"("DateKey")
;

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "FK_FactInternetSales_DimDate2" 
    FOREIGN KEY ("ShipDateKey")
    REFERENCES "DimDate"("DateKey")
;

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "FK_FactInternetSales_DimPromotion" 
    FOREIGN KEY ("PromotionKey")
    REFERENCES "DimPromotion"("PromotionKey")
;

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "FK_FactInternetSales_DimSalesTerritory" 
    FOREIGN KEY ("SalesTerritoryKey")
    REFERENCES "DimSalesTerritory"("SalesTerritoryKey")
;


