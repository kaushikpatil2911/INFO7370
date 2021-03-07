/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Adventure Work DW DM1.DM1
 *
 * Date Created : Wednesday, September 30, 2020 16:20:58
 * Target DBMS : Microsoft SQL Server 2017
 */

USE AdventureworkDW
go
/* 
 * TABLE: DimAccount 
 */

CREATE TABLE DimAccount(
    AccountKey                       int              IDENTITY(1,1),
    ParentAccountKey                 int              NULL,
    AccountCodeAlternateKey          int              NULL,
    ParentAccountCodeAlternateKey    int              NULL,
    AccountDescription               nvarchar(50)     NULL,
    AccountType                      nvarchar(50)     NULL,
    Operator                         nvarchar(50)     NULL,
    CustomMembers                    nvarchar(300)    NULL,
    ValueType                        nvarchar(50)     NULL,
    CustomMemberOptions              nvarchar(200)    NULL,
    CONSTRAINT PK_DimAccount PRIMARY KEY NONCLUSTERED (AccountKey)
)
go



IF OBJECT_ID('DimAccount') IS NOT NULL
    PRINT '<<< CREATED TABLE DimAccount >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimAccount >>>'
go

/* 
 * TABLE: DimCurrency 
 */

CREATE TABLE DimCurrency(
    CurrencyKey             int             IDENTITY(1,1),
    CurrencyAlternateKey    nchar(3)        NOT NULL,
    CurrencyName            nvarchar(50)    NOT NULL,
    CONSTRAINT PK_DimCurrency_CurrencyKey PRIMARY KEY NONCLUSTERED (CurrencyKey)
)
go



IF OBJECT_ID('DimCurrency') IS NOT NULL
    PRINT '<<< CREATED TABLE DimCurrency >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimCurrency >>>'
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
 * TABLE: DimDepartmentGroup 
 */

CREATE TABLE DimDepartmentGroup(
    DepartmentGroupKey          int             IDENTITY(1,1),
    ParentDepartmentGroupKey    int             NULL,
    DepartmentGroupName         nvarchar(50)    NULL,
    CONSTRAINT PK_DimDepartmentGroup PRIMARY KEY NONCLUSTERED (DepartmentGroupKey)
)
go



IF OBJECT_ID('DimDepartmentGroup') IS NOT NULL
    PRINT '<<< CREATED TABLE DimDepartmentGroup >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimDepartmentGroup >>>'
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
 * TABLE: DimOrganization 
 */

CREATE TABLE DimOrganization(
    OrganizationKey          int             IDENTITY(1,1),
    ParentOrganizationKey    int             NULL,
    PercentageOfOwnership    nvarchar(16)    NULL,
    OrganizationName         nvarchar(50)    NULL,
    CurrencyKey              int             NULL,
    CONSTRAINT PK_DimOrganization PRIMARY KEY NONCLUSTERED (OrganizationKey)
)
go



IF OBJECT_ID('DimOrganization') IS NOT NULL
    PRINT '<<< CREATED TABLE DimOrganization >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimOrganization >>>'
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
 * TABLE: DimReseller 
 */

CREATE TABLE DimReseller(
    ResellerKey             int             IDENTITY(1,1),
    GeographyKey            int             NULL,
    ResellerAlternateKey    nvarchar(15)    NULL,
    Phone                   nvarchar(25)    NULL,
    BusinessType            varchar(20)     NOT NULL,
    ResellerName            nvarchar(50)    NOT NULL,
    NumberEmployees         int             NULL,
    OrderFrequency          char(1)         NULL,
    OrderMonth              tinyint         NULL,
    FirstOrderYear          int             NULL,
    LastOrderYear           int             NULL,
    ProductLine             nvarchar(50)    NULL,
    AddressLine1            nvarchar(60)    NULL,
    AddressLine2            nvarchar(60)    NULL,
    AnnualSales             money           NULL,
    BankName                nvarchar(50)    NULL,
    MinPaymentType          tinyint         NULL,
    MinPaymentAmount        money           NULL,
    AnnualRevenue           money           NULL,
    YearOpened              int             NULL,
    CONSTRAINT PK_DimReseller_ResellerKey PRIMARY KEY NONCLUSTERED (ResellerKey)
)
go



IF OBJECT_ID('DimReseller') IS NOT NULL
    PRINT '<<< CREATED TABLE DimReseller >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimReseller >>>'
go

/* 
 * TABLE: DimSalesReason 
 */

CREATE TABLE DimSalesReason(
    SalesReasonKey             int             IDENTITY(1,1),
    SalesReasonAlternateKey    int             NOT NULL,
    SalesReasonName            nvarchar(50)    NOT NULL,
    SalesReasonReasonType      nvarchar(50)    NOT NULL,
    CONSTRAINT PK_DimSalesReason_SalesReasonKey PRIMARY KEY NONCLUSTERED (SalesReasonKey)
)
go



IF OBJECT_ID('DimSalesReason') IS NOT NULL
    PRINT '<<< CREATED TABLE DimSalesReason >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimSalesReason >>>'
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
 * TABLE: DimScenario 
 */

CREATE TABLE DimScenario(
    ScenarioKey     int             IDENTITY(1,1),
    ScenarioName    nvarchar(50)    NULL,
    CONSTRAINT PK_DimScenario PRIMARY KEY NONCLUSTERED (ScenarioKey)
)
go



IF OBJECT_ID('DimScenario') IS NOT NULL
    PRINT '<<< CREATED TABLE DimScenario >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimScenario >>>'
go

/* 
 * TABLE: FactAdditionalInternationalProductDescription 
 */

CREATE TABLE FactAdditionalInternationalProductDescription(
    ProductKey            int              NOT NULL,
    CultureName           nvarchar(50)     NOT NULL,
    ProductDescription    nvarchar(max)    NOT NULL,
    CONSTRAINT PK_FactAdditionalInternationalProductDescription_ProductKey_CultureName PRIMARY KEY NONCLUSTERED (ProductKey, CultureName)
)
go



IF OBJECT_ID('FactAdditionalInternationalProductDescription') IS NOT NULL
    PRINT '<<< CREATED TABLE FactAdditionalInternationalProductDescription >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactAdditionalInternationalProductDescription >>>'
go

/* 
 * TABLE: FactCallCenter 
 */

CREATE TABLE FactCallCenter(
    FactCallCenterID       int             IDENTITY(1,1),
    DateKey                int             NOT NULL,
    WageType               nvarchar(15)    NOT NULL,
    Shift                  nvarchar(20)    NOT NULL,
    LevelOneOperators      smallint        NOT NULL,
    LevelTwoOperators      smallint        NOT NULL,
    TotalOperators         smallint        NOT NULL,
    Calls                  int             NOT NULL,
    AutomaticResponses     int             NOT NULL,
    Orders                 int             NOT NULL,
    IssuesRaised           smallint        NOT NULL,
    AverageTimePerIssue    smallint        NOT NULL,
    ServiceGrade           float           NOT NULL,
    Date                   datetime        NULL,
    CONSTRAINT PK_FactCallCenter_FactCallCenterID PRIMARY KEY NONCLUSTERED (FactCallCenterID)
)
go



IF OBJECT_ID('FactCallCenter') IS NOT NULL
    PRINT '<<< CREATED TABLE FactCallCenter >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactCallCenter >>>'
go

/* 
 * TABLE: FactCurrencyRate 
 */

CREATE TABLE FactCurrencyRate(
    CurrencyKey     int         NOT NULL,
    DateKey         int         NOT NULL,
    AverageRate     float       NOT NULL,
    EndOfDayRate    float       NOT NULL,
    Date            datetime    NULL,
    CONSTRAINT PK_FactCurrencyRate_CurrencyKey_DateKey PRIMARY KEY NONCLUSTERED (CurrencyKey, DateKey)
)
go



IF OBJECT_ID('FactCurrencyRate') IS NOT NULL
    PRINT '<<< CREATED TABLE FactCurrencyRate >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactCurrencyRate >>>'
go

/* 
 * TABLE: FactFinance 
 */

CREATE TABLE FactFinance(
    FinanceKey            int         IDENTITY(1,1),
    DateKey               int         NOT NULL,
    OrganizationKey       int         NOT NULL,
    DepartmentGroupKey    int         NOT NULL,
    ScenarioKey           int         NOT NULL,
    AccountKey            int         NOT NULL,
    Amount                float       NOT NULL,
    Date                  datetime    NULL
)
go



IF OBJECT_ID('FactFinance') IS NOT NULL
    PRINT '<<< CREATED TABLE FactFinance >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactFinance >>>'
go

/* 
 * TABLE: FactInternetSales 
 */

CREATE TABLE FactInternetSales(
    ProductKey               int             NOT NULL,
    OrderDateKey             int             NOT NULL,
    DueDateKey               int             NOT NULL,
    ShipDateKey              int             NOT NULL,
    CustomerKey              int             NOT NULL,
    PromotionKey             int             NOT NULL,
    CurrencyKey              int             NOT NULL,
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
 * TABLE: FactInternetSalesReason 
 */

CREATE TABLE FactInternetSalesReason(
    SalesOrderNumber        nvarchar(20)    NOT NULL,
    SalesOrderLineNumber    tinyint         NOT NULL,
    SalesReasonKey          int             NOT NULL,
    CONSTRAINT PK_FactInternetSalesReason_SalesOrderNumber_SalesOrderLineNumber_SalesReasonKey PRIMARY KEY NONCLUSTERED (SalesOrderNumber, SalesOrderLineNumber, SalesReasonKey)
)
go



IF OBJECT_ID('FactInternetSalesReason') IS NOT NULL
    PRINT '<<< CREATED TABLE FactInternetSalesReason >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactInternetSalesReason >>>'
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
 * TABLE: FactResellerSales 
 */

CREATE TABLE FactResellerSales(
    ProductKey               int             NOT NULL,
    OrderDateKey             int             NOT NULL,
    DueDateKey               int             NOT NULL,
    ShipDateKey              int             NOT NULL,
    ResellerKey              int             NOT NULL,
    EmployeeKey              int             NOT NULL,
    PromotionKey             int             NOT NULL,
    CurrencyKey              int             NOT NULL,
    SalesTerritoryKey        int             NOT NULL,
    SalesOrderNumber         nvarchar(20)    NOT NULL,
    SalesOrderLineNumber     tinyint         NOT NULL,
    RevisionNumber           tinyint         NULL,
    OrderQuantity            smallint        NULL,
    UnitPrice                money           NULL,
    ExtendedAmount           money           NULL,
    UnitPriceDiscountPct     float           NULL,
    DiscountAmount           float           NULL,
    ProductStandardCost      money           NULL,
    TotalProductCost         money           NULL,
    SalesAmount              money           NULL,
    TaxAmt                   money           NULL,
    Freight                  money           NULL,
    CarrierTrackingNumber    nvarchar(25)    NULL,
    CustomerPONumber         nvarchar(25)    NULL,
    OrderDate                datetime        NULL,
    DueDate                  datetime        NULL,
    ShipDate                 datetime        NULL,
    CONSTRAINT PK_FactResellerSales_SalesOrderNumber_SalesOrderLineNumber PRIMARY KEY NONCLUSTERED (SalesOrderNumber, SalesOrderLineNumber)
)
go



IF OBJECT_ID('FactResellerSales') IS NOT NULL
    PRINT '<<< CREATED TABLE FactResellerSales >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactResellerSales >>>'
go

/* 
 * TABLE: FactSalesQuota 
 */

CREATE TABLE FactSalesQuota(
    SalesQuotaKey       int         IDENTITY(1,1),
    EmployeeKey         int         NOT NULL,
    DateKey             int         NOT NULL,
    CalendarYear        smallint    NOT NULL,
    CalendarQuarter     tinyint     NOT NULL,
    SalesAmountQuota    money       NOT NULL,
    Date                datetime    NULL,
    CONSTRAINT PK_FactSalesQuota_SalesQuotaKey PRIMARY KEY NONCLUSTERED (SalesQuotaKey)
)
go



IF OBJECT_ID('FactSalesQuota') IS NOT NULL
    PRINT '<<< CREATED TABLE FactSalesQuota >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactSalesQuota >>>'
go

/* 
 * TABLE: FactSurveyResponse 
 */

CREATE TABLE FactSurveyResponse(
    SurveyResponseKey                int             IDENTITY(1,1),
    DateKey                          int             NOT NULL,
    CustomerKey                      int             NOT NULL,
    ProductCategoryKey               int             NOT NULL,
    EnglishProductCategoryName       nvarchar(50)    NOT NULL,
    ProductSubcategoryKey            int             NOT NULL,
    EnglishProductSubcategoryName    nvarchar(50)    NOT NULL,
    Date                             datetime        NULL,
    CONSTRAINT PK_FactSurveyResponse_SurveyResponseKey PRIMARY KEY NONCLUSTERED (SurveyResponseKey)
)
go



IF OBJECT_ID('FactSurveyResponse') IS NOT NULL
    PRINT '<<< CREATED TABLE FactSurveyResponse >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactSurveyResponse >>>'
go

/* 
 * TABLE: DimAccount 
 */

ALTER TABLE DimAccount ADD CONSTRAINT FK_DimAccount_DimAccount 
    FOREIGN KEY (ParentAccountKey)
    REFERENCES DimAccount(AccountKey)
go


/* 
 * TABLE: DimCustomer 
 */

ALTER TABLE DimCustomer ADD CONSTRAINT FK_DimCustomer_DimGeography 
    FOREIGN KEY (GeographyKey)
    REFERENCES DimGeography(GeographyKey)
go


/* 
 * TABLE: DimDepartmentGroup 
 */

ALTER TABLE DimDepartmentGroup ADD CONSTRAINT FK_DimDepartmentGroup_DimDepartmentGroup 
    FOREIGN KEY (ParentDepartmentGroupKey)
    REFERENCES DimDepartmentGroup(DepartmentGroupKey)
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
 * TABLE: DimOrganization 
 */

ALTER TABLE DimOrganization ADD CONSTRAINT FK_DimOrganization_DimCurrency 
    FOREIGN KEY (CurrencyKey)
    REFERENCES DimCurrency(CurrencyKey)
go

ALTER TABLE DimOrganization ADD CONSTRAINT FK_DimOrganization_DimOrganization 
    FOREIGN KEY (ParentOrganizationKey)
    REFERENCES DimOrganization(OrganizationKey)
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
 * TABLE: DimReseller 
 */

ALTER TABLE DimReseller ADD CONSTRAINT FK_DimReseller_DimGeography 
    FOREIGN KEY (GeographyKey)
    REFERENCES DimGeography(GeographyKey)
go


/* 
 * TABLE: FactAdditionalInternationalProductDescription 
 */

ALTER TABLE FactAdditionalInternationalProductDescription ADD CONSTRAINT RefDimProduct45 
    FOREIGN KEY (ProductKey)
    REFERENCES DimProduct(ProductKey)
go


/* 
 * TABLE: FactCallCenter 
 */

ALTER TABLE FactCallCenter ADD CONSTRAINT FK_FactCallCenter_DimDate 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
go


/* 
 * TABLE: FactCurrencyRate 
 */

ALTER TABLE FactCurrencyRate ADD CONSTRAINT FK_FactCurrencyRate_DimCurrency 
    FOREIGN KEY (CurrencyKey)
    REFERENCES DimCurrency(CurrencyKey)
go

ALTER TABLE FactCurrencyRate ADD CONSTRAINT FK_FactCurrencyRate_DimDate 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
go


/* 
 * TABLE: FactFinance 
 */

ALTER TABLE FactFinance ADD CONSTRAINT FK_FactFinance_DimAccount 
    FOREIGN KEY (AccountKey)
    REFERENCES DimAccount(AccountKey)
go

ALTER TABLE FactFinance ADD CONSTRAINT FK_FactFinance_DimDate 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE FactFinance ADD CONSTRAINT FK_FactFinance_DimDepartmentGroup 
    FOREIGN KEY (DepartmentGroupKey)
    REFERENCES DimDepartmentGroup(DepartmentGroupKey)
go

ALTER TABLE FactFinance ADD CONSTRAINT FK_FactFinance_DimOrganization 
    FOREIGN KEY (OrganizationKey)
    REFERENCES DimOrganization(OrganizationKey)
go

ALTER TABLE FactFinance ADD CONSTRAINT FK_FactFinance_DimScenario 
    FOREIGN KEY (ScenarioKey)
    REFERENCES DimScenario(ScenarioKey)
go


/* 
 * TABLE: FactInternetSales 
 */

ALTER TABLE FactInternetSales ADD CONSTRAINT RefFactProductInventory48 
    FOREIGN KEY (ProductKey, OrderDateKey)
    REFERENCES FactProductInventory(ProductKey, DateKey)
go

ALTER TABLE FactInternetSales ADD CONSTRAINT RefFactCurrencyRate54 
    FOREIGN KEY (CurrencyKey, OrderDateKey)
    REFERENCES FactCurrencyRate(CurrencyKey, DateKey)
go

ALTER TABLE FactInternetSales ADD CONSTRAINT RefFactCurrencyRate55 
    FOREIGN KEY (CurrencyKey, OrderDateKey)
    REFERENCES FactCurrencyRate(CurrencyKey, DateKey)
go

ALTER TABLE FactInternetSales ADD CONSTRAINT RefFactCurrencyRate56 
    FOREIGN KEY (CurrencyKey, OrderDateKey)
    REFERENCES FactCurrencyRate(CurrencyKey, DateKey)
go

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimCurrency 
    FOREIGN KEY (CurrencyKey)
    REFERENCES DimCurrency(CurrencyKey)
go

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimCustomer 
    FOREIGN KEY (CustomerKey)
    REFERENCES DimCustomer(CustomerKey)
go

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimDate 
    FOREIGN KEY (OrderDateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimDate1 
    FOREIGN KEY (DueDateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimDate2 
    FOREIGN KEY (ShipDateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimProduct 
    FOREIGN KEY (ProductKey)
    REFERENCES DimProduct(ProductKey)
go

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimPromotion 
    FOREIGN KEY (PromotionKey)
    REFERENCES DimPromotion(PromotionKey)
go

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimSalesTerritory 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
go


/* 
 * TABLE: FactInternetSalesReason 
 */

ALTER TABLE FactInternetSalesReason ADD CONSTRAINT RefFactResellerSales46 
    FOREIGN KEY (SalesOrderNumber, SalesOrderLineNumber)
    REFERENCES FactResellerSales(SalesOrderNumber, SalesOrderLineNumber)
go

ALTER TABLE FactInternetSalesReason ADD CONSTRAINT FK_FactInternetSalesReason_DimSalesReason 
    FOREIGN KEY (SalesReasonKey)
    REFERENCES DimSalesReason(SalesReasonKey)
go

ALTER TABLE FactInternetSalesReason ADD CONSTRAINT FK_FactInternetSalesReason_FactInternetSales 
    FOREIGN KEY (SalesOrderNumber, SalesOrderLineNumber)
    REFERENCES FactInternetSales(SalesOrderNumber, SalesOrderLineNumber)
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


/* 
 * TABLE: FactResellerSales 
 */

ALTER TABLE FactResellerSales ADD CONSTRAINT RefFactProductInventory47 
    FOREIGN KEY (ProductKey, OrderDateKey)
    REFERENCES FactProductInventory(ProductKey, DateKey)
go

ALTER TABLE FactResellerSales ADD CONSTRAINT RefFactCurrencyRate51 
    FOREIGN KEY (CurrencyKey, OrderDateKey)
    REFERENCES FactCurrencyRate(CurrencyKey, DateKey)
go

ALTER TABLE FactResellerSales ADD CONSTRAINT RefFactCurrencyRate52 
    FOREIGN KEY (CurrencyKey, OrderDateKey)
    REFERENCES FactCurrencyRate(CurrencyKey, DateKey)
go

ALTER TABLE FactResellerSales ADD CONSTRAINT RefFactCurrencyRate53 
    FOREIGN KEY (CurrencyKey, OrderDateKey)
    REFERENCES FactCurrencyRate(CurrencyKey, DateKey)
go

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimCurrency 
    FOREIGN KEY (CurrencyKey)
    REFERENCES DimCurrency(CurrencyKey)
go

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimDate 
    FOREIGN KEY (OrderDateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimDate1 
    FOREIGN KEY (DueDateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimDate2 
    FOREIGN KEY (ShipDateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimEmployee 
    FOREIGN KEY (EmployeeKey)
    REFERENCES DimEmployee(EmployeeKey)
go

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimProduct 
    FOREIGN KEY (ProductKey)
    REFERENCES DimProduct(ProductKey)
go

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimPromotion 
    FOREIGN KEY (PromotionKey)
    REFERENCES DimPromotion(PromotionKey)
go

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimReseller 
    FOREIGN KEY (ResellerKey)
    REFERENCES DimReseller(ResellerKey)
go

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimSalesTerritory 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
go


/* 
 * TABLE: FactSalesQuota 
 */

ALTER TABLE FactSalesQuota ADD CONSTRAINT FK_FactSalesQuota_DimDate 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE FactSalesQuota ADD CONSTRAINT FK_FactSalesQuota_DimEmployee 
    FOREIGN KEY (EmployeeKey)
    REFERENCES DimEmployee(EmployeeKey)
go


/* 
 * TABLE: FactSurveyResponse 
 */

ALTER TABLE FactSurveyResponse ADD CONSTRAINT RefDimProductCategory49 
    FOREIGN KEY (ProductCategoryKey)
    REFERENCES DimProductCategory(ProductCategoryKey)
go

ALTER TABLE FactSurveyResponse ADD CONSTRAINT RefDimProductSubcategory50 
    FOREIGN KEY (ProductSubcategoryKey)
    REFERENCES DimProductSubcategory(ProductSubcategoryKey)
go

ALTER TABLE FactSurveyResponse ADD CONSTRAINT FK_FactSurveyResponse_CustomerKey 
    FOREIGN KEY (CustomerKey)
    REFERENCES DimCustomer(CustomerKey)
go

ALTER TABLE FactSurveyResponse ADD CONSTRAINT FK_FactSurveyResponse_DateKey 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
go


