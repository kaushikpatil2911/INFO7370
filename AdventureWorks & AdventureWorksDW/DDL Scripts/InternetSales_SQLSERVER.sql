/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Adventure Work DW DM1.DM1
 *
 * Date Created : Wednesday, September 30, 2020 16:02:12
 * Target DBMS : Microsoft SQL Server 2017
 */

USE InternetSales
go
/* 
 * TABLE: DimCustomer 
 */

CREATE TABLE DimCustomer(
    CustomerKey             int              IDENTITY(1,1),
    GeographyKey            int              NULL,
    CustomerAlternateKey    nvarchar(15)     NOT NULL,
    Title                   nvarchar(8)      NULL,
    FirstName               nvarchar(50)     NULL,
    MiddleName              nvarchar(50)     NULL,
    LastName                nvarchar(50)     NULL,
    NameStyle               bit              NULL,
    BirthDate               date             NULL,
    MaritalStatus           nchar(1)         NULL,
    Suffix                  nvarchar(10)     NULL,
    Gender                  nvarchar(1)      NULL,
    EmailAddress            nvarchar(50)     NULL,
    YearlyIncome            money            NULL,
    TotalChildren           tinyint          NULL,
    NumberChildrenAtHome    tinyint          NULL,
    EnglishEducation        nvarchar(40)     NULL,
    SpanishEducation        nvarchar(40)     NULL,
    FrenchEducation         nvarchar(40)     NULL,
    EnglishOccupation       nvarchar(100)    NULL,
    SpanishOccupation       nvarchar(100)    NULL,
    FrenchOccupation        nvarchar(100)    NULL,
    HouseOwnerFlag          nchar(1)         NULL,
    NumberCarsOwned         tinyint          NULL,
    AddressLine1            nvarchar(120)    NULL,
    AddressLine2            nvarchar(120)    NULL,
    Phone                   nvarchar(20)     NULL,
    DateFirstPurchase       date             NULL,
    CommuteDistance         nvarchar(15)     NULL,
    CONSTRAINT PK_DimCustomer_CustomerKey PRIMARY KEY NONCLUSTERED (CustomerKey)
)
go



IF OBJECT_ID('DimCustomer') IS NOT NULL
    PRINT '<<< CREATED TABLE DimCustomer >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimCustomer >>>'
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
 * TABLE: DimEmployee 
 */

CREATE TABLE DimEmployee(
    EmployeeKey                             int               IDENTITY(1,1),
    ParentEmployeeKey                       int               NULL,
    EmployeeNationalIDAlternateKey          nvarchar(15)      NULL,
    ParentEmployeeNationalIDAlternateKey    nvarchar(15)      NULL,
    SalesTerritoryKey                       int               NULL,
    FirstName                               nvarchar(50)      NOT NULL,
    LastName                                nvarchar(50)      NOT NULL,
    MiddleName                              nvarchar(50)      NULL,
    NameStyle                               bit               NOT NULL,
    Title                                   nvarchar(50)      NULL,
    HireDate                                date              NULL,
    BirthDate                               date              NULL,
    LoginID                                 nvarchar(256)     NULL,
    EmailAddress                            nvarchar(50)      NULL,
    Phone                                   nvarchar(25)      NULL,
    MaritalStatus                           nchar(1)          NULL,
    EmergencyContactName                    nvarchar(50)      NULL,
    EmergencyContactPhone                   nvarchar(25)      NULL,
    SalariedFlag                            bit               NULL,
    Gender                                  nchar(1)          NULL,
    PayFrequency                            tinyint           NULL,
    BaseRate                                money             NULL,
    VacationHours                           smallint          NULL,
    SickLeaveHours                          smallint          NULL,
    CurrentFlag                             bit               NOT NULL,
    SalesPersonFlag                         bit               NOT NULL,
    DepartmentName                          nvarchar(50)      NULL,
    StartDate                               date              NULL,
    EndDate                                 date              NULL,
    Status                                  nvarchar(50)      NULL,
    EmployeePhoto                           varbinary(max)    NULL,
    CONSTRAINT PK_DimEmployee_EmployeeKey PRIMARY KEY NONCLUSTERED (EmployeeKey)
)
go



IF OBJECT_ID('DimEmployee') IS NOT NULL
    PRINT '<<< CREATED TABLE DimEmployee >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimEmployee >>>'
go

/* 
 * TABLE: DimGeography 
 */

CREATE TABLE DimGeography(
    GeographyKey                int             IDENTITY(1,1),
    City                        nvarchar(30)    NULL,
    StateProvinceCode           nvarchar(3)     NULL,
    StateProvinceName           nvarchar(50)    NULL,
    CountryRegionCode           nvarchar(3)     NULL,
    EnglishCountryRegionName    nvarchar(50)    NULL,
    SpanishCountryRegionName    nvarchar(50)    NULL,
    FrenchCountryRegionName     nvarchar(50)    NULL,
    PostalCode                  nvarchar(15)    NULL,
    SalesTerritoryKey           int             NULL,
    IpAddressLocator            nvarchar(15)    NULL,
    CONSTRAINT PK_DimGeography_GeographyKey PRIMARY KEY NONCLUSTERED (GeographyKey)
)
go



IF OBJECT_ID('DimGeography') IS NOT NULL
    PRINT '<<< CREATED TABLE DimGeography >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimGeography >>>'
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
 * TABLE: DimPromotion 
 */

CREATE TABLE DimPromotion(
    PromotionKey                int              IDENTITY(1,1),
    PromotionAlternateKey       int              NULL,
    EnglishPromotionName        nvarchar(255)    NULL,
    SpanishPromotionName        nvarchar(255)    NULL,
    FrenchPromotionName         nvarchar(255)    NULL,
    DiscountPct                 float            NULL,
    EnglishPromotionType        nvarchar(50)     NULL,
    SpanishPromotionType        nvarchar(50)     NULL,
    FrenchPromotionType         nvarchar(50)     NULL,
    EnglishPromotionCategory    nvarchar(50)     NULL,
    SpanishPromotionCategory    nvarchar(50)     NULL,
    FrenchPromotionCategory     nvarchar(50)     NULL,
    StartDate                   datetime         NOT NULL,
    EndDate                     datetime         NULL,
    MinQty                      int              NULL,
    MaxQty                      int              NULL,
    CONSTRAINT PK_DimPromotion_PromotionKey PRIMARY KEY NONCLUSTERED (PromotionKey)
)
go



IF OBJECT_ID('DimPromotion') IS NOT NULL
    PRINT '<<< CREATED TABLE DimPromotion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimPromotion >>>'
go

/* 
 * TABLE: DimSalesTerritory 
 */

CREATE TABLE DimSalesTerritory(
    SalesTerritoryKey             int               IDENTITY(1,1),
    SalesTerritoryAlternateKey    int               NULL,
    SalesTerritoryRegion          nvarchar(50)      NOT NULL,
    SalesTerritoryCountry         nvarchar(50)      NOT NULL,
    SalesTerritoryGroup           nvarchar(50)      NULL,
    SalesTerritoryImage           varbinary(max)    NULL,
    CONSTRAINT PK_DimSalesTerritory_SalesTerritoryKey PRIMARY KEY NONCLUSTERED (SalesTerritoryKey)
)
go



IF OBJECT_ID('DimSalesTerritory') IS NOT NULL
    PRINT '<<< CREATED TABLE DimSalesTerritory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimSalesTerritory >>>'
go

/* 
 * TABLE: FactInternetSales 
 */

CREATE TABLE FactInternetSales(
    DueDateKey               int             NOT NULL,
    ShipDateKey              int             NOT NULL,
    CustomerKey              int             NOT NULL,
    PromotionKey             int             NOT NULL,
    SalesTerritoryKey        int             NOT NULL,
    SalesOrderNumber         nvarchar(20)    NOT NULL,
    SalesOrderLineNumber     tinyint         NOT NULL,
    RevisionNumber           tinyint         NOT NULL,
    OrderQuantity            smallint        NOT NULL,
    UnitPrice                money           NOT NULL,
    ExtendedAmount           money           NOT NULL,
    UnitPriceDiscountPct     float           NOT NULL,
    DiscountAmount           float           NOT NULL,
    ProductStandardCost      money           NOT NULL,
    TotalProductCost         money           NOT NULL,
    SalesAmount              money           NOT NULL,
    TaxAmt                   money           NOT NULL,
    Freight                  money           NOT NULL,
    CarrierTrackingNumber    nvarchar(25)    NULL,
    CustomerPONumber         nvarchar(25)    NULL,
    OrderDate                datetime        NULL,
    DueDate                  datetime        NULL,
    ShipDate                 datetime        NULL,
    CONSTRAINT PK_FactInternetSales_SalesOrderNumber_SalesOrderLineNumber PRIMARY KEY NONCLUSTERED (SalesOrderNumber, SalesOrderLineNumber)
)
go



IF OBJECT_ID('FactInternetSales') IS NOT NULL
    PRINT '<<< CREATED TABLE FactInternetSales >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactInternetSales >>>'
go

/* 
 * TABLE: DimCustomer 
 */

ALTER TABLE DimCustomer ADD CONSTRAINT FK_DimCustomer_DimGeography 
    FOREIGN KEY (GeographyKey)
    REFERENCES DimGeography(GeographyKey)
go


/* 
 * TABLE: DimEmployee 
 */

ALTER TABLE DimEmployee ADD CONSTRAINT FK_DimEmployee_DimEmployee 
    FOREIGN KEY (ParentEmployeeKey)
    REFERENCES DimEmployee(EmployeeKey)
go

ALTER TABLE DimEmployee ADD CONSTRAINT FK_DimEmployee_DimSalesTerritory 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
go


/* 
 * TABLE: DimGeography 
 */

ALTER TABLE DimGeography ADD CONSTRAINT FK_DimGeography_DimSalesTerritory 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
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
 * TABLE: FactInternetSales 
 */

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimCustomer 
    FOREIGN KEY (CustomerKey)
    REFERENCES DimCustomer(CustomerKey)
go

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimDate1 
    FOREIGN KEY (DueDateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimDate2 
    FOREIGN KEY (ShipDateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimPromotion 
    FOREIGN KEY (PromotionKey)
    REFERENCES DimPromotion(PromotionKey)
go

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimSalesTerritory 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
go


