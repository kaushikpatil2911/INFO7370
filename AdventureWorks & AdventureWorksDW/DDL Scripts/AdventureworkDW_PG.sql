--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Adventure Work DW DM1.DM1
--
-- Date Created : Wednesday, September 30, 2020 16:19:50
-- Target DBMS : PostgreSQL 10.x-12.x
--

-- 
-- TABLE: "DimAccount" 
--

CREATE TABLE "DimAccount"(
    "AccountKey"                     integer                   GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "ParentAccountKey"               integer,
    "AccountCodeAlternateKey"        integer,
    "ParentAccountCodeAlternateKey"  integer,
    "AccountDescription"             character varying(50),
    "AccountType"                    character varying(50),
    "Operator"                       character varying(50),
    "CustomMembers"                  character varying(300),
    "ValueType"                      character varying(50),
    "CustomMemberOptions"            character varying(200),
    CONSTRAINT "PK_DimAccount" PRIMARY KEY ("AccountKey")
)
;



-- 
-- TABLE: "DimCurrency" 
--

CREATE TABLE "DimCurrency"(
    "CurrencyKey"           integer                  GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "CurrencyAlternateKey"  char(3)                  NOT NULL,
    "CurrencyName"          character varying(50)    NOT NULL,
    CONSTRAINT "PK_DimCurrency_CurrencyKey" PRIMARY KEY ("CurrencyKey")
)
;



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
-- TABLE: "DimDepartmentGroup" 
--

CREATE TABLE "DimDepartmentGroup"(
    "DepartmentGroupKey"        integer                  GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "ParentDepartmentGroupKey"  integer,
    "DepartmentGroupName"       character varying(50),
    CONSTRAINT "PK_DimDepartmentGroup" PRIMARY KEY ("DepartmentGroupKey")
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
-- TABLE: "DimOrganization" 
--

CREATE TABLE "DimOrganization"(
    "OrganizationKey"        integer                  GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "ParentOrganizationKey"  integer,
    "PercentageOfOwnership"  character varying(16),
    "OrganizationName"       character varying(50),
    "CurrencyKey"            integer,
    CONSTRAINT "PK_DimOrganization" PRIMARY KEY ("OrganizationKey")
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
-- TABLE: "DimReseller" 
--

CREATE TABLE "DimReseller"(
    "ResellerKey"           integer                  GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "GeographyKey"          integer,
    "ResellerAlternateKey"  character varying(15),
    "Phone"                 character varying(25),
    "BusinessType"          varchar(20)              NOT NULL,
    "ResellerName"          character varying(50)    NOT NULL,
    "NumberEmployees"       integer,
    "OrderFrequency"        character(1),
    "OrderMonth"            int2,
    "FirstOrderYear"        integer,
    "LastOrderYear"         integer,
    "ProductLine"           character varying(50),
    "AddressLine1"          character varying(60),
    "AddressLine2"          character varying(60),
    "AnnualSales"           money,
    "BankName"              character varying(50),
    "MinPaymentType"        int2,
    "MinPaymentAmount"      money,
    "AnnualRevenue"         money,
    "YearOpened"            integer,
    CONSTRAINT "PK_DimReseller_ResellerKey" PRIMARY KEY ("ResellerKey")
)
;



-- 
-- TABLE: "DimSalesReason" 
--

CREATE TABLE "DimSalesReason"(
    "SalesReasonKey"           integer                  GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "SalesReasonAlternateKey"  integer                  NOT NULL,
    "SalesReasonName"          character varying(50)    NOT NULL,
    "SalesReasonReasonType"    character varying(50)    NOT NULL,
    CONSTRAINT "PK_DimSalesReason_SalesReasonKey" PRIMARY KEY ("SalesReasonKey")
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
-- TABLE: "DimScenario" 
--

CREATE TABLE "DimScenario"(
    "ScenarioKey"   integer                  GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "ScenarioName"  character varying(50),
    CONSTRAINT "PK_DimScenario" PRIMARY KEY ("ScenarioKey")
)
;



-- 
-- TABLE: "FactAdditionalInternationalProductDescription" 
--

CREATE TABLE "FactAdditionalInternationalProductDescription"(
    "ProductKey"          integer                  NOT NULL,
    "CultureName"         character varying(50)    NOT NULL,
    "ProductDescription"  character varying(18)    NOT NULL,
    CONSTRAINT "PK_FactAdditionalInternationalProductDescription_ProductKey_CultureName" PRIMARY KEY ("ProductKey", "CultureName")
)
;



-- 
-- TABLE: "FactCallCenter" 
--

CREATE TABLE "FactCallCenter"(
    "FactCallCenterID"     integer                   GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "DateKey"              integer                   NOT NULL,
    "WageType"             character varying(15)     NOT NULL,
    "Shift"                character varying(20)     NOT NULL,
    "LevelOneOperators"    smallint                  NOT NULL,
    "LevelTwoOperators"    smallint                  NOT NULL,
    "TotalOperators"       smallint                  NOT NULL,
    "Calls"                integer                   NOT NULL,
    "AutomaticResponses"   integer                   NOT NULL,
    "Orders"               integer                   NOT NULL,
    "IssuesRaised"         smallint                  NOT NULL,
    "AverageTimePerIssue"  smallint                  NOT NULL,
    "ServiceGrade"         float4                    NOT NULL,
    "Date"                 time without time zone,
    CONSTRAINT "PK_FactCallCenter_FactCallCenterID" PRIMARY KEY ("FactCallCenterID")
)
;



-- 
-- TABLE: "FactCurrencyRate" 
--

CREATE TABLE "FactCurrencyRate"(
    "CurrencyKey"   integer                   NOT NULL,
    "DateKey"       integer                   NOT NULL,
    "AverageRate"   float4                    NOT NULL,
    "EndOfDayRate"  float4                    NOT NULL,
    "Date"          time without time zone,
    CONSTRAINT "PK_FactCurrencyRate_CurrencyKey_DateKey" PRIMARY KEY ("CurrencyKey", "DateKey")
)
;



-- 
-- TABLE: "FactFinance" 
--

CREATE TABLE "FactFinance"(
    "FinanceKey"          integer                   GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "DateKey"             integer                   NOT NULL,
    "OrganizationKey"     integer                   NOT NULL,
    "DepartmentGroupKey"  integer                   NOT NULL,
    "ScenarioKey"         integer                   NOT NULL,
    "AccountKey"          integer                   NOT NULL,
    "Amount"              float4                    NOT NULL,
    "Date"                time without time zone
)
;



-- 
-- TABLE: "FactInternetSales" 
--

CREATE TABLE "FactInternetSales"(
    "ProductKey"             integer                   NOT NULL,
    "OrderDateKey"           integer                   NOT NULL,
    "DueDateKey"             integer                   NOT NULL,
    "ShipDateKey"            integer                   NOT NULL,
    "CustomerKey"            integer                   NOT NULL,
    "PromotionKey"           integer                   NOT NULL,
    "CurrencyKey"            integer                   NOT NULL,
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
-- TABLE: "FactInternetSalesReason" 
--

CREATE TABLE "FactInternetSalesReason"(
    "SalesOrderNumber"      character varying(20)    NOT NULL,
    "SalesOrderLineNumber"  int2                     NOT NULL,
    "SalesReasonKey"        integer                  NOT NULL,
    CONSTRAINT "PK_FactInternetSalesReason_SalesOrderNumber_SalesOrderLineNumber_SalesReasonKey" PRIMARY KEY ("SalesOrderNumber", "SalesOrderLineNumber", "SalesReasonKey")
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
-- TABLE: "FactResellerSales" 
--

CREATE TABLE "FactResellerSales"(
    "ProductKey"             integer                   NOT NULL,
    "OrderDateKey"           integer                   NOT NULL,
    "DueDateKey"             integer                   NOT NULL,
    "ShipDateKey"            integer                   NOT NULL,
    "ResellerKey"            integer                   NOT NULL,
    "EmployeeKey"            integer                   NOT NULL,
    "PromotionKey"           integer                   NOT NULL,
    "CurrencyKey"            integer                   NOT NULL,
    "SalesTerritoryKey"      integer                   NOT NULL,
    "SalesOrderNumber"       character varying(20)     NOT NULL,
    "SalesOrderLineNumber"   int2                      NOT NULL,
    "RevisionNumber"         int2,
    "OrderQuantity"          smallint,
    "UnitPrice"              money,
    "ExtendedAmount"         money,
    "UnitPriceDiscountPct"   float4,
    "DiscountAmount"         float4,
    "ProductStandardCost"    money,
    "TotalProductCost"       money,
    "SalesAmount"            money,
    "TaxAmt"                 money,
    "Freight"                money,
    "CarrierTrackingNumber"  character varying(25),
    "CustomerPONumber"       character varying(25),
    "OrderDate"              time without time zone,
    "DueDate"                time without time zone,
    "ShipDate"               time without time zone,
    CONSTRAINT "PK_FactResellerSales_SalesOrderNumber_SalesOrderLineNumber" PRIMARY KEY ("SalesOrderNumber", "SalesOrderLineNumber")
)
;



-- 
-- TABLE: "FactSalesQuota" 
--

CREATE TABLE "FactSalesQuota"(
    "SalesQuotaKey"     integer                   GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "EmployeeKey"       integer                   NOT NULL,
    "DateKey"           integer                   NOT NULL,
    "CalendarYear"      smallint                  NOT NULL,
    "CalendarQuarter"   int2                      NOT NULL,
    "SalesAmountQuota"  money                     NOT NULL,
    "Date"              time without time zone,
    CONSTRAINT "PK_FactSalesQuota_SalesQuotaKey" PRIMARY KEY ("SalesQuotaKey")
)
;



-- 
-- TABLE: "FactSurveyResponse" 
--

CREATE TABLE "FactSurveyResponse"(
    "SurveyResponseKey"              integer                   GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "DateKey"                        integer                   NOT NULL,
    "CustomerKey"                    integer                   NOT NULL,
    "ProductCategoryKey"             integer                   NOT NULL,
    "EnglishProductCategoryName"     character varying(50)     NOT NULL,
    "ProductSubcategoryKey"          integer                   NOT NULL,
    "EnglishProductSubcategoryName"  character varying(50)     NOT NULL,
    "Date"                           time without time zone,
    CONSTRAINT "PK_FactSurveyResponse_SurveyResponseKey" PRIMARY KEY ("SurveyResponseKey")
)
;



-- 
-- TABLE: "DimAccount" 
--

ALTER TABLE "DimAccount" ADD CONSTRAINT "FK_DimAccount_DimAccount" 
    FOREIGN KEY ("ParentAccountKey")
    REFERENCES "DimAccount"("AccountKey")
;


-- 
-- TABLE: "DimCustomer" 
--

ALTER TABLE "DimCustomer" ADD CONSTRAINT "FK_DimCustomer_DimGeography" 
    FOREIGN KEY ("GeographyKey")
    REFERENCES "DimGeography"("GeographyKey")
;


-- 
-- TABLE: "DimDepartmentGroup" 
--

ALTER TABLE "DimDepartmentGroup" ADD CONSTRAINT "FK_DimDepartmentGroup_DimDepartmentGroup" 
    FOREIGN KEY ("ParentDepartmentGroupKey")
    REFERENCES "DimDepartmentGroup"("DepartmentGroupKey")
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
-- TABLE: "DimOrganization" 
--

ALTER TABLE "DimOrganization" ADD CONSTRAINT "FK_DimOrganization_DimCurrency" 
    FOREIGN KEY ("CurrencyKey")
    REFERENCES "DimCurrency"("CurrencyKey")
;

ALTER TABLE "DimOrganization" ADD CONSTRAINT "FK_DimOrganization_DimOrganization" 
    FOREIGN KEY ("ParentOrganizationKey")
    REFERENCES "DimOrganization"("OrganizationKey")
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
-- TABLE: "DimReseller" 
--

ALTER TABLE "DimReseller" ADD CONSTRAINT "FK_DimReseller_DimGeography" 
    FOREIGN KEY ("GeographyKey")
    REFERENCES "DimGeography"("GeographyKey")
;


-- 
-- TABLE: "FactAdditionalInternationalProductDescription" 
--

ALTER TABLE "FactAdditionalInternationalProductDescription" ADD CONSTRAINT "RefDimProduct45" 
    FOREIGN KEY ("ProductKey")
    REFERENCES "DimProduct"("ProductKey")
;


-- 
-- TABLE: "FactCallCenter" 
--

ALTER TABLE "FactCallCenter" ADD CONSTRAINT "FK_FactCallCenter_DimDate" 
    FOREIGN KEY ("DateKey")
    REFERENCES "DimDate"("DateKey")
;


-- 
-- TABLE: "FactCurrencyRate" 
--

ALTER TABLE "FactCurrencyRate" ADD CONSTRAINT "FK_FactCurrencyRate_DimCurrency" 
    FOREIGN KEY ("CurrencyKey")
    REFERENCES "DimCurrency"("CurrencyKey")
;

ALTER TABLE "FactCurrencyRate" ADD CONSTRAINT "FK_FactCurrencyRate_DimDate" 
    FOREIGN KEY ("DateKey")
    REFERENCES "DimDate"("DateKey")
;


-- 
-- TABLE: "FactFinance" 
--

ALTER TABLE "FactFinance" ADD CONSTRAINT "FK_FactFinance_DimAccount" 
    FOREIGN KEY ("AccountKey")
    REFERENCES "DimAccount"("AccountKey")
;

ALTER TABLE "FactFinance" ADD CONSTRAINT "FK_FactFinance_DimDate" 
    FOREIGN KEY ("DateKey")
    REFERENCES "DimDate"("DateKey")
;

ALTER TABLE "FactFinance" ADD CONSTRAINT "FK_FactFinance_DimDepartmentGroup" 
    FOREIGN KEY ("DepartmentGroupKey")
    REFERENCES "DimDepartmentGroup"("DepartmentGroupKey")
;

ALTER TABLE "FactFinance" ADD CONSTRAINT "FK_FactFinance_DimOrganization" 
    FOREIGN KEY ("OrganizationKey")
    REFERENCES "DimOrganization"("OrganizationKey")
;

ALTER TABLE "FactFinance" ADD CONSTRAINT "FK_FactFinance_DimScenario" 
    FOREIGN KEY ("ScenarioKey")
    REFERENCES "DimScenario"("ScenarioKey")
;


-- 
-- TABLE: "FactInternetSales" 
--

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "RefFactProductInventory48" 
    FOREIGN KEY ("ProductKey", "OrderDateKey")
    REFERENCES "FactProductInventory"("ProductKey", "DateKey")
;

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "RefFactCurrencyRate54" 
    FOREIGN KEY ("CurrencyKey", "OrderDateKey")
    REFERENCES "FactCurrencyRate"("CurrencyKey", "DateKey")
;

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "RefFactCurrencyRate55" 
    FOREIGN KEY ("CurrencyKey", "OrderDateKey")
    REFERENCES "FactCurrencyRate"("CurrencyKey", "DateKey")
;

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "RefFactCurrencyRate56" 
    FOREIGN KEY ("CurrencyKey", "OrderDateKey")
    REFERENCES "FactCurrencyRate"("CurrencyKey", "DateKey")
;

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "FK_FactInternetSales_DimCurrency" 
    FOREIGN KEY ("CurrencyKey")
    REFERENCES "DimCurrency"("CurrencyKey")
;

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "FK_FactInternetSales_DimCustomer" 
    FOREIGN KEY ("CustomerKey")
    REFERENCES "DimCustomer"("CustomerKey")
;

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "FK_FactInternetSales_DimDate" 
    FOREIGN KEY ("OrderDateKey")
    REFERENCES "DimDate"("DateKey")
;

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "FK_FactInternetSales_DimDate1" 
    FOREIGN KEY ("DueDateKey")
    REFERENCES "DimDate"("DateKey")
;

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "FK_FactInternetSales_DimDate2" 
    FOREIGN KEY ("ShipDateKey")
    REFERENCES "DimDate"("DateKey")
;

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "FK_FactInternetSales_DimProduct" 
    FOREIGN KEY ("ProductKey")
    REFERENCES "DimProduct"("ProductKey")
;

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "FK_FactInternetSales_DimPromotion" 
    FOREIGN KEY ("PromotionKey")
    REFERENCES "DimPromotion"("PromotionKey")
;

ALTER TABLE "FactInternetSales" ADD CONSTRAINT "FK_FactInternetSales_DimSalesTerritory" 
    FOREIGN KEY ("SalesTerritoryKey")
    REFERENCES "DimSalesTerritory"("SalesTerritoryKey")
;


-- 
-- TABLE: "FactInternetSalesReason" 
--

ALTER TABLE "FactInternetSalesReason" ADD CONSTRAINT "RefFactResellerSales46" 
    FOREIGN KEY ("SalesOrderNumber", "SalesOrderLineNumber")
    REFERENCES "FactResellerSales"("SalesOrderNumber", "SalesOrderLineNumber")
;

ALTER TABLE "FactInternetSalesReason" ADD CONSTRAINT "FK_FactInternetSalesReason_DimSalesReason" 
    FOREIGN KEY ("SalesReasonKey")
    REFERENCES "DimSalesReason"("SalesReasonKey")
;

ALTER TABLE "FactInternetSalesReason" ADD CONSTRAINT "FK_FactInternetSalesReason_FactInternetSales" 
    FOREIGN KEY ("SalesOrderNumber", "SalesOrderLineNumber")
    REFERENCES "FactInternetSales"("SalesOrderNumber", "SalesOrderLineNumber")
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


-- 
-- TABLE: "FactResellerSales" 
--

ALTER TABLE "FactResellerSales" ADD CONSTRAINT "RefFactProductInventory47" 
    FOREIGN KEY ("ProductKey", "OrderDateKey")
    REFERENCES "FactProductInventory"("ProductKey", "DateKey")
;

ALTER TABLE "FactResellerSales" ADD CONSTRAINT "RefFactCurrencyRate51" 
    FOREIGN KEY ("CurrencyKey", "OrderDateKey")
    REFERENCES "FactCurrencyRate"("CurrencyKey", "DateKey")
;

ALTER TABLE "FactResellerSales" ADD CONSTRAINT "RefFactCurrencyRate52" 
    FOREIGN KEY ("CurrencyKey", "OrderDateKey")
    REFERENCES "FactCurrencyRate"("CurrencyKey", "DateKey")
;

ALTER TABLE "FactResellerSales" ADD CONSTRAINT "RefFactCurrencyRate53" 
    FOREIGN KEY ("CurrencyKey", "OrderDateKey")
    REFERENCES "FactCurrencyRate"("CurrencyKey", "DateKey")
;

ALTER TABLE "FactResellerSales" ADD CONSTRAINT "FK_FactResellerSales_DimCurrency" 
    FOREIGN KEY ("CurrencyKey")
    REFERENCES "DimCurrency"("CurrencyKey")
;

ALTER TABLE "FactResellerSales" ADD CONSTRAINT "FK_FactResellerSales_DimDate" 
    FOREIGN KEY ("OrderDateKey")
    REFERENCES "DimDate"("DateKey")
;

ALTER TABLE "FactResellerSales" ADD CONSTRAINT "FK_FactResellerSales_DimDate1" 
    FOREIGN KEY ("DueDateKey")
    REFERENCES "DimDate"("DateKey")
;

ALTER TABLE "FactResellerSales" ADD CONSTRAINT "FK_FactResellerSales_DimDate2" 
    FOREIGN KEY ("ShipDateKey")
    REFERENCES "DimDate"("DateKey")
;

ALTER TABLE "FactResellerSales" ADD CONSTRAINT "FK_FactResellerSales_DimEmployee" 
    FOREIGN KEY ("EmployeeKey")
    REFERENCES "DimEmployee"("EmployeeKey")
;

ALTER TABLE "FactResellerSales" ADD CONSTRAINT "FK_FactResellerSales_DimProduct" 
    FOREIGN KEY ("ProductKey")
    REFERENCES "DimProduct"("ProductKey")
;

ALTER TABLE "FactResellerSales" ADD CONSTRAINT "FK_FactResellerSales_DimPromotion" 
    FOREIGN KEY ("PromotionKey")
    REFERENCES "DimPromotion"("PromotionKey")
;

ALTER TABLE "FactResellerSales" ADD CONSTRAINT "FK_FactResellerSales_DimReseller" 
    FOREIGN KEY ("ResellerKey")
    REFERENCES "DimReseller"("ResellerKey")
;

ALTER TABLE "FactResellerSales" ADD CONSTRAINT "FK_FactResellerSales_DimSalesTerritory" 
    FOREIGN KEY ("SalesTerritoryKey")
    REFERENCES "DimSalesTerritory"("SalesTerritoryKey")
;


-- 
-- TABLE: "FactSalesQuota" 
--

ALTER TABLE "FactSalesQuota" ADD CONSTRAINT "FK_FactSalesQuota_DimDate" 
    FOREIGN KEY ("DateKey")
    REFERENCES "DimDate"("DateKey")
;

ALTER TABLE "FactSalesQuota" ADD CONSTRAINT "FK_FactSalesQuota_DimEmployee" 
    FOREIGN KEY ("EmployeeKey")
    REFERENCES "DimEmployee"("EmployeeKey")
;


-- 
-- TABLE: "FactSurveyResponse" 
--

ALTER TABLE "FactSurveyResponse" ADD CONSTRAINT "RefDimProductCategory49" 
    FOREIGN KEY ("ProductCategoryKey")
    REFERENCES "DimProductCategory"("ProductCategoryKey")
;

ALTER TABLE "FactSurveyResponse" ADD CONSTRAINT "RefDimProductSubcategory50" 
    FOREIGN KEY ("ProductSubcategoryKey")
    REFERENCES "DimProductSubcategory"("ProductSubcategoryKey")
;

ALTER TABLE "FactSurveyResponse" ADD CONSTRAINT "FK_FactSurveyResponse_CustomerKey" 
    FOREIGN KEY ("CustomerKey")
    REFERENCES "DimCustomer"("CustomerKey")
;

ALTER TABLE "FactSurveyResponse" ADD CONSTRAINT "FK_FactSurveyResponse_DateKey" 
    FOREIGN KEY ("DateKey")
    REFERENCES "DimDate"("DateKey")
;


