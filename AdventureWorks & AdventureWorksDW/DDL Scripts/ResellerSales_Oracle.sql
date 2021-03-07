--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Adventure Work DW DM1.DM1
--
-- Date Created : Wednesday, September 30, 2020 16:12:38
-- Target DBMS : Oracle 12c
--

-- 
-- TABLE: DimCurrency 
--

CREATE TABLE DimCurrency(
    CurrencyKey             NUMBER(38, 0)    NOT NULL,
    CurrencyAlternateKey    NCHAR(3)         NOT NULL,
    CurrencyName            NVARCHAR2(50)    NOT NULL,
    CONSTRAINT PK_DimCurrency_CurrencyKey PRIMARY KEY (CurrencyKey)
)
;



-- 
-- TABLE: DimCustomer 
--

CREATE TABLE DimCustomer(
    CustomerKey             NUMBER(38, 0)     NOT NULL,
    GeographyKey            NUMBER(38, 0),
    CustomerAlternateKey    NVARCHAR2(15)     NOT NULL,
    Title                   NVARCHAR2(8),
    FirstName               NVARCHAR2(50),
    MiddleName              NVARCHAR2(50),
    LastName                NVARCHAR2(50),
    NameStyle               NUMBER(1, 0),
    BirthDate               DATE,
    MaritalStatus           NCHAR(1),
    Suffix                  NVARCHAR2(10),
    Gender                  NVARCHAR2(1),
    EmailAddress            NVARCHAR2(50),
    YearlyIncome            NUMBER(19, 4),
    TotalChildren           NUMBER(3, 0),
    NumberChildrenAtHome    NUMBER(3, 0),
    EnglishEducation        NVARCHAR2(40),
    SpanishEducation        NVARCHAR2(40),
    FrenchEducation         NVARCHAR2(40),
    EnglishOccupation       NVARCHAR2(100),
    SpanishOccupation       NVARCHAR2(100),
    FrenchOccupation        NVARCHAR2(100),
    HouseOwnerFlag          NCHAR(1),
    NumberCarsOwned         NUMBER(3, 0),
    AddressLine1            NVARCHAR2(120),
    AddressLine2            NVARCHAR2(120),
    Phone                   NVARCHAR2(20),
    DateFirstPurchase       DATE,
    CommuteDistance         NVARCHAR2(15),
    CONSTRAINT PK_DimCustomer_CustomerKey PRIMARY KEY (CustomerKey)
)
;



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
-- TABLE: DimEmployee 
--

CREATE TABLE DimEmployee(
    EmployeeKey                             NUMBER(38, 0)     NOT NULL,
    ParentEmployeeKey                       NUMBER(38, 0),
    EmployeeNationalIDAlternateKey          NVARCHAR2(15),
    ParentEmployeeNationalIDAlternateKey    NVARCHAR2(15),
    SalesTerritoryKey                       NUMBER(38, 0),
    FirstName                               NVARCHAR2(50)     NOT NULL,
    LastName                                NVARCHAR2(50)     NOT NULL,
    MiddleName                              NVARCHAR2(50),
    NameStyle                               NUMBER(1, 0)      NOT NULL,
    Title                                   NVARCHAR2(50),
    HireDate                                DATE,
    BirthDate                               DATE,
    LoginID                                 NVARCHAR2(256),
    EmailAddress                            NVARCHAR2(50),
    Phone                                   NVARCHAR2(25),
    MaritalStatus                           NCHAR(1),
    EmergencyContactName                    NVARCHAR2(50),
    EmergencyContactPhone                   NVARCHAR2(25),
    SalariedFlag                            NUMBER(1, 0),
    Gender                                  NCHAR(1),
    PayFrequency                            NUMBER(3, 0),
    BaseRate                                NUMBER(19, 4),
    VacationHours                           SMALLINT,
    SickLeaveHours                          SMALLINT,
    CurrentFlag                             NUMBER(1, 0)      NOT NULL,
    SalesPersonFlag                         NUMBER(1, 0)      NOT NULL,
    DepartmentName                          NVARCHAR2(50),
    StartDate                               DATE,
    EndDate                                 DATE,
    Status                                  NVARCHAR2(50),
    EmployeePhoto                           BLOB,
    CONSTRAINT PK_DimEmployee_EmployeeKey PRIMARY KEY (EmployeeKey)
)
;



-- 
-- TABLE: DimGeography 
--

CREATE TABLE DimGeography(
    GeographyKey                NUMBER(38, 0)    NOT NULL,
    City                        NVARCHAR2(30),
    StateProvinceCode           NVARCHAR2(3),
    StateProvinceName           NVARCHAR2(50),
    CountryRegionCode           NVARCHAR2(3),
    EnglishCountryRegionName    NVARCHAR2(50),
    SpanishCountryRegionName    NVARCHAR2(50),
    FrenchCountryRegionName     NVARCHAR2(50),
    PostalCode                  NVARCHAR2(15),
    SalesTerritoryKey           NUMBER(38, 0),
    IpAddressLocator            NVARCHAR2(15),
    CONSTRAINT PK_DimGeography_GeographyKey PRIMARY KEY (GeographyKey)
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
-- TABLE: DimPromotion 
--

CREATE TABLE DimPromotion(
    PromotionKey                NUMBER(38, 0)     NOT NULL,
    PromotionAlternateKey       NUMBER(38, 0),
    EnglishPromotionName        NVARCHAR2(255),
    SpanishPromotionName        NVARCHAR2(255),
    FrenchPromotionName         NVARCHAR2(255),
    DiscountPct                 BINARY_FLOAT,
    EnglishPromotionType        NVARCHAR2(50),
    SpanishPromotionType        NVARCHAR2(50),
    FrenchPromotionType         NVARCHAR2(50),
    EnglishPromotionCategory    NVARCHAR2(50),
    SpanishPromotionCategory    NVARCHAR2(50),
    FrenchPromotionCategory     NVARCHAR2(50),
    StartDate                   TIMESTAMP(6)      NOT NULL,
    EndDate                     TIMESTAMP(6),
    MinQty                      NUMBER(38, 0),
    MaxQty                      NUMBER(38, 0),
    CONSTRAINT PK_DimPromotion_PromotionKey PRIMARY KEY (PromotionKey)
)
;



-- 
-- TABLE: DimReseller 
--

CREATE TABLE DimReseller(
    ResellerKey             NUMBER(38, 0)    NOT NULL,
    GeographyKey            NUMBER(38, 0),
    ResellerAlternateKey    NVARCHAR2(15),
    Phone                   NVARCHAR2(25),
    BusinessType            VARCHAR2(20)     NOT NULL,
    ResellerName            NVARCHAR2(50)    NOT NULL,
    NumberEmployees         NUMBER(38, 0),
    OrderFrequency          CHAR(1),
    OrderMonth              NUMBER(3, 0),
    FirstOrderYear          NUMBER(38, 0),
    LastOrderYear           NUMBER(38, 0),
    ProductLine             NVARCHAR2(50),
    AddressLine1            NVARCHAR2(60),
    AddressLine2            NVARCHAR2(60),
    AnnualSales             NUMBER(19, 4),
    BankName                NVARCHAR2(50),
    MinPaymentType          NUMBER(3, 0),
    MinPaymentAmount        NUMBER(19, 4),
    AnnualRevenue           NUMBER(19, 4),
    YearOpened              NUMBER(38, 0),
    CONSTRAINT PK_DimReseller_ResellerKey PRIMARY KEY (ResellerKey)
)
;



-- 
-- TABLE: DimSalesTerritory 
--

CREATE TABLE DimSalesTerritory(
    SalesTerritoryKey             NUMBER(38, 0)    NOT NULL,
    SalesTerritoryAlternateKey    NUMBER(38, 0),
    SalesTerritoryRegion          NVARCHAR2(50)    NOT NULL,
    SalesTerritoryCountry         NVARCHAR2(50)    NOT NULL,
    SalesTerritoryGroup           NVARCHAR2(50),
    SalesTerritoryImage           BLOB,
    CONSTRAINT PK_DimSalesTerritory_SalesTerritoryKey PRIMARY KEY (SalesTerritoryKey)
)
;



-- 
-- TABLE: FactResellerSales 
--

CREATE TABLE FactResellerSales(
    DueDateKey               NUMBER(38, 0)    NOT NULL,
    ShipDateKey              NUMBER(38, 0)    NOT NULL,
    ResellerKey              NUMBER(38, 0)    NOT NULL,
    EmployeeKey              NUMBER(38, 0)    NOT NULL,
    PromotionKey             NUMBER(38, 0)    NOT NULL,
    SalesTerritoryKey        NUMBER(38, 0)    NOT NULL,
    SalesOrderNumber         NVARCHAR2(20)    NOT NULL,
    SalesOrderLineNumber     NUMBER(3, 0)     NOT NULL,
    RevisionNumber           NUMBER(3, 0),
    OrderQuantity            SMALLINT,
    UnitPrice                NUMBER(19, 4),
    ExtendedAmount           NUMBER(19, 4),
    UnitPriceDiscountPct     BINARY_FLOAT,
    DiscountAmount           BINARY_FLOAT,
    ProductStandardCost      NUMBER(19, 4),
    TotalProductCost         NUMBER(19, 4),
    SalesAmount              NUMBER(19, 4),
    TaxAmt                   NUMBER(19, 4),
    Freight                  NUMBER(19, 4),
    CarrierTrackingNumber    NVARCHAR2(25),
    CustomerPONumber         NVARCHAR2(25),
    OrderDate                TIMESTAMP(6),
    DueDate                  TIMESTAMP(6),
    ShipDate                 TIMESTAMP(6),
    CONSTRAINT PK_FactResellerSales_SalesOrderNumber_SalesOrderLineNumber PRIMARY KEY (SalesOrderNumber, SalesOrderLineNumber)
)
;



-- 
-- TABLE: DimCustomer 
--

ALTER TABLE DimCustomer ADD CONSTRAINT FK_DimCustomer_DimGeography 
    FOREIGN KEY (GeographyKey)
    REFERENCES DimGeography(GeographyKey)
;


-- 
-- TABLE: DimEmployee 
--

ALTER TABLE DimEmployee ADD CONSTRAINT FK_DimEmployee_DimEmployee 
    FOREIGN KEY (ParentEmployeeKey)
    REFERENCES DimEmployee(EmployeeKey)
;

ALTER TABLE DimEmployee ADD CONSTRAINT FK_DimEmployee_DimSalesTerritory 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
;


-- 
-- TABLE: DimGeography 
--

ALTER TABLE DimGeography ADD CONSTRAINT FK_DimGeography_DimSalesTerritory 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
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
-- TABLE: DimReseller 
--

ALTER TABLE DimReseller ADD CONSTRAINT FK_DimReseller_DimGeography 
    FOREIGN KEY (GeographyKey)
    REFERENCES DimGeography(GeographyKey)
;


-- 
-- TABLE: FactResellerSales 
--

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimDate1 
    FOREIGN KEY (DueDateKey)
    REFERENCES DimDate(DateKey)
;

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimDate2 
    FOREIGN KEY (ShipDateKey)
    REFERENCES DimDate(DateKey)
;

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimEmployee 
    FOREIGN KEY (EmployeeKey)
    REFERENCES DimEmployee(EmployeeKey)
;

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimPromotion 
    FOREIGN KEY (PromotionKey)
    REFERENCES DimPromotion(PromotionKey)
;

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimReseller 
    FOREIGN KEY (ResellerKey)
    REFERENCES DimReseller(ResellerKey)
;

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimSalesTerritory 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
;


