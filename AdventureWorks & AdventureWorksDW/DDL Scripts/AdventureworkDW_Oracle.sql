--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Adventure Work DW DM1.DM1
--
-- Date Created : Wednesday, September 30, 2020 16:19:03
-- Target DBMS : Oracle 12c
--

-- 
-- TABLE: DimAccount 
--

CREATE TABLE DimAccount(
    AccountKey                       NUMBER(38, 0)     NOT NULL,
    ParentAccountKey                 NUMBER(38, 0),
    AccountCodeAlternateKey          NUMBER(38, 0),
    ParentAccountCodeAlternateKey    NUMBER(38, 0),
    AccountDescription               NVARCHAR2(50),
    AccountType                      NVARCHAR2(50),
    Operator                         NVARCHAR2(50),
    CustomMembers                    NVARCHAR2(300),
    ValueType                        NVARCHAR2(50),
    CustomMemberOptions              NVARCHAR2(200),
    CONSTRAINT PK_DimAccount PRIMARY KEY (AccountKey)
)
;



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
-- TABLE: DimDepartmentGroup 
--

CREATE TABLE DimDepartmentGroup(
    DepartmentGroupKey          NUMBER(38, 0)    NOT NULL,
    ParentDepartmentGroupKey    NUMBER(38, 0),
    DepartmentGroupName         NVARCHAR2(50),
    CONSTRAINT PK_DimDepartmentGroup PRIMARY KEY (DepartmentGroupKey)
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
-- TABLE: DimOrganization 
--

CREATE TABLE DimOrganization(
    OrganizationKey          NUMBER(38, 0)    NOT NULL,
    ParentOrganizationKey    NUMBER(38, 0),
    PercentageOfOwnership    NVARCHAR2(16),
    OrganizationName         NVARCHAR2(50),
    CurrencyKey              NUMBER(38, 0),
    CONSTRAINT PK_DimOrganization PRIMARY KEY (OrganizationKey)
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
-- TABLE: DimSalesReason 
--

CREATE TABLE DimSalesReason(
    SalesReasonKey             NUMBER(38, 0)    NOT NULL,
    SalesReasonAlternateKey    NUMBER(38, 0)    NOT NULL,
    SalesReasonName            NVARCHAR2(50)    NOT NULL,
    SalesReasonReasonType      NVARCHAR2(50)    NOT NULL,
    CONSTRAINT PK_DimSalesReason_SalesReasonKey PRIMARY KEY (SalesReasonKey)
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
-- TABLE: DimScenario 
--

CREATE TABLE DimScenario(
    ScenarioKey     NUMBER(38, 0)    NOT NULL,
    ScenarioName    NVARCHAR2(50),
    CONSTRAINT PK_DimScenario PRIMARY KEY (ScenarioKey)
)
;



-- 
-- TABLE: FactAdditionalInternationalProductDescription 
--

CREATE TABLE FactAdditionalInternationalProductDescription(
    ProductKey            NUMBER(38, 0)    NOT NULL,
    CultureName           NVARCHAR2(50)    NOT NULL,
    ProductDescription    NVARCHAR2(18)    NOT NULL,
    CONSTRAINT PK_FactAdditionalInternationalProductDescription_ProductKey_CultureName PRIMARY KEY (ProductKey, CultureName)
)
;



-- 
-- TABLE: FactCallCenter 
--

CREATE TABLE FactCallCenter(
    FactCallCenterID       NUMBER(38, 0)    NOT NULL,
    DateKey                NUMBER(38, 0)    NOT NULL,
    WageType               NVARCHAR2(15)    NOT NULL,
    Shift                  NVARCHAR2(20)    NOT NULL,
    LevelOneOperators      SMALLINT         NOT NULL,
    LevelTwoOperators      SMALLINT         NOT NULL,
    TotalOperators         SMALLINT         NOT NULL,
    Calls                  NUMBER(38, 0)    NOT NULL,
    AutomaticResponses     NUMBER(38, 0)    NOT NULL,
    Orders                 NUMBER(38, 0)    NOT NULL,
    IssuesRaised           SMALLINT         NOT NULL,
    AverageTimePerIssue    SMALLINT         NOT NULL,
    ServiceGrade           BINARY_FLOAT     NOT NULL,
    Date                   TIMESTAMP(6),
    CONSTRAINT PK_FactCallCenter_FactCallCenterID PRIMARY KEY (FactCallCenterID)
)
;



-- 
-- TABLE: FactCurrencyRate 
--

CREATE TABLE FactCurrencyRate(
    CurrencyKey     NUMBER(38, 0)    NOT NULL,
    DateKey         NUMBER(38, 0)    NOT NULL,
    AverageRate     BINARY_FLOAT     NOT NULL,
    EndOfDayRate    BINARY_FLOAT     NOT NULL,
    Date            TIMESTAMP(6),
    CONSTRAINT PK_FactCurrencyRate_CurrencyKey_DateKey PRIMARY KEY (CurrencyKey, DateKey)
)
;



-- 
-- TABLE: FactFinance 
--

CREATE TABLE FactFinance(
    FinanceKey            NUMBER(38, 0)    NOT NULL,
    DateKey               NUMBER(38, 0)    NOT NULL,
    OrganizationKey       NUMBER(38, 0)    NOT NULL,
    DepartmentGroupKey    NUMBER(38, 0)    NOT NULL,
    ScenarioKey           NUMBER(38, 0)    NOT NULL,
    AccountKey            NUMBER(38, 0)    NOT NULL,
    Amount                BINARY_FLOAT     NOT NULL,
    Date                  TIMESTAMP(6)
)
;



-- 
-- TABLE: FactInternetSales 
--

CREATE TABLE FactInternetSales(
    ProductKey               NUMBER(38, 0)    NOT NULL,
    OrderDateKey             NUMBER(38, 0)    NOT NULL,
    DueDateKey               NUMBER(38, 0)    NOT NULL,
    ShipDateKey              NUMBER(38, 0)    NOT NULL,
    CustomerKey              NUMBER(38, 0)    NOT NULL,
    PromotionKey             NUMBER(38, 0)    NOT NULL,
    CurrencyKey              NUMBER(38, 0)    NOT NULL,
    SalesTerritoryKey        NUMBER(38, 0)    NOT NULL,
    SalesOrderNumber         NVARCHAR2(20)    NOT NULL,
    SalesOrderLineNumber     NUMBER(3, 0)     NOT NULL,
    RevisionNumber           NUMBER(3, 0)     NOT NULL,
    OrderQuantity            SMALLINT         NOT NULL,
    UnitPrice                NUMBER(19, 4)    NOT NULL,
    ExtendedAmount           NUMBER(19, 4)    NOT NULL,
    UnitPriceDiscountPct     BINARY_FLOAT     NOT NULL,
    DiscountAmount           BINARY_FLOAT     NOT NULL,
    ProductStandardCost      NUMBER(19, 4)    NOT NULL,
    TotalProductCost         NUMBER(19, 4)    NOT NULL,
    SalesAmount              NUMBER(19, 4)    NOT NULL,
    TaxAmt                   NUMBER(19, 4)    NOT NULL,
    Freight                  NUMBER(19, 4)    NOT NULL,
    CarrierTrackingNumber    NVARCHAR2(25),
    CustomerPONumber         NVARCHAR2(25),
    OrderDate                TIMESTAMP(6),
    DueDate                  TIMESTAMP(6),
    ShipDate                 TIMESTAMP(6),
    CONSTRAINT PK_FactInternetSales_SalesOrderNumber_SalesOrderLineNumber PRIMARY KEY (SalesOrderNumber, SalesOrderLineNumber)
)
;



-- 
-- TABLE: FactInternetSalesReason 
--

CREATE TABLE FactInternetSalesReason(
    SalesOrderNumber        NVARCHAR2(20)    NOT NULL,
    SalesOrderLineNumber    NUMBER(3, 0)     NOT NULL,
    SalesReasonKey          NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK_FactInternetSalesReason_SalesOrderNumber_SalesOrderLineNumber_SalesReasonKey PRIMARY KEY (SalesOrderNumber, SalesOrderLineNumber, SalesReasonKey)
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
-- TABLE: FactResellerSales 
--

CREATE TABLE FactResellerSales(
    ProductKey               NUMBER(38, 0)    NOT NULL,
    OrderDateKey             NUMBER(38, 0)    NOT NULL,
    DueDateKey               NUMBER(38, 0)    NOT NULL,
    ShipDateKey              NUMBER(38, 0)    NOT NULL,
    ResellerKey              NUMBER(38, 0)    NOT NULL,
    EmployeeKey              NUMBER(38, 0)    NOT NULL,
    PromotionKey             NUMBER(38, 0)    NOT NULL,
    CurrencyKey              NUMBER(38, 0)    NOT NULL,
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
-- TABLE: FactSalesQuota 
--

CREATE TABLE FactSalesQuota(
    SalesQuotaKey       NUMBER(38, 0)    NOT NULL,
    EmployeeKey         NUMBER(38, 0)    NOT NULL,
    DateKey             NUMBER(38, 0)    NOT NULL,
    CalendarYear        SMALLINT         NOT NULL,
    CalendarQuarter     NUMBER(3, 0)     NOT NULL,
    SalesAmountQuota    NUMBER(19, 4)    NOT NULL,
    Date                TIMESTAMP(6),
    CONSTRAINT PK_FactSalesQuota_SalesQuotaKey PRIMARY KEY (SalesQuotaKey)
)
;



-- 
-- TABLE: FactSurveyResponse 
--

CREATE TABLE FactSurveyResponse(
    SurveyResponseKey                NUMBER(38, 0)    NOT NULL,
    DateKey                          NUMBER(38, 0)    NOT NULL,
    CustomerKey                      NUMBER(38, 0)    NOT NULL,
    ProductCategoryKey               NUMBER(38, 0)    NOT NULL,
    EnglishProductCategoryName       NVARCHAR2(50)    NOT NULL,
    ProductSubcategoryKey            NUMBER(38, 0)    NOT NULL,
    EnglishProductSubcategoryName    NVARCHAR2(50)    NOT NULL,
    Date                             TIMESTAMP(6),
    CONSTRAINT PK_FactSurveyResponse_SurveyResponseKey PRIMARY KEY (SurveyResponseKey)
)
;



-- 
-- TABLE: DimAccount 
--

ALTER TABLE DimAccount ADD CONSTRAINT FK_DimAccount_DimAccount 
    FOREIGN KEY (ParentAccountKey)
    REFERENCES DimAccount(AccountKey)
;


-- 
-- TABLE: DimCustomer 
--

ALTER TABLE DimCustomer ADD CONSTRAINT FK_DimCustomer_DimGeography 
    FOREIGN KEY (GeographyKey)
    REFERENCES DimGeography(GeographyKey)
;


-- 
-- TABLE: DimDepartmentGroup 
--

ALTER TABLE DimDepartmentGroup ADD CONSTRAINT FK_DimDepartmentGroup_DimDepartmentGroup 
    FOREIGN KEY (ParentDepartmentGroupKey)
    REFERENCES DimDepartmentGroup(DepartmentGroupKey)
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
-- TABLE: DimOrganization 
--

ALTER TABLE DimOrganization ADD CONSTRAINT FK_DimOrganization_DimCurrency 
    FOREIGN KEY (CurrencyKey)
    REFERENCES DimCurrency(CurrencyKey)
;

ALTER TABLE DimOrganization ADD CONSTRAINT FK_DimOrganization_DimOrganization 
    FOREIGN KEY (ParentOrganizationKey)
    REFERENCES DimOrganization(OrganizationKey)
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
-- TABLE: FactAdditionalInternationalProductDescription 
--

ALTER TABLE FactAdditionalInternationalProductDescription ADD CONSTRAINT RefDimProduct45 
    FOREIGN KEY (ProductKey)
    REFERENCES DimProduct(ProductKey)
;


-- 
-- TABLE: FactCallCenter 
--

ALTER TABLE FactCallCenter ADD CONSTRAINT FK_FactCallCenter_DimDate 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
;


-- 
-- TABLE: FactCurrencyRate 
--

ALTER TABLE FactCurrencyRate ADD CONSTRAINT FK_FactCurrencyRate_DimCurrency 
    FOREIGN KEY (CurrencyKey)
    REFERENCES DimCurrency(CurrencyKey)
;

ALTER TABLE FactCurrencyRate ADD CONSTRAINT FK_FactCurrencyRate_DimDate 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
;


-- 
-- TABLE: FactFinance 
--

ALTER TABLE FactFinance ADD CONSTRAINT FK_FactFinance_DimAccount 
    FOREIGN KEY (AccountKey)
    REFERENCES DimAccount(AccountKey)
;

ALTER TABLE FactFinance ADD CONSTRAINT FK_FactFinance_DimDate 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
;

ALTER TABLE FactFinance ADD CONSTRAINT FK_FactFinance_DimDepartmentGroup 
    FOREIGN KEY (DepartmentGroupKey)
    REFERENCES DimDepartmentGroup(DepartmentGroupKey)
;

ALTER TABLE FactFinance ADD CONSTRAINT FK_FactFinance_DimOrganization 
    FOREIGN KEY (OrganizationKey)
    REFERENCES DimOrganization(OrganizationKey)
;

ALTER TABLE FactFinance ADD CONSTRAINT FK_FactFinance_DimScenario 
    FOREIGN KEY (ScenarioKey)
    REFERENCES DimScenario(ScenarioKey)
;


-- 
-- TABLE: FactInternetSales 
--

ALTER TABLE FactInternetSales ADD CONSTRAINT RefFactProductInventory48 
    FOREIGN KEY (ProductKey, OrderDateKey)
    REFERENCES FactProductInventory(ProductKey, DateKey)
;

ALTER TABLE FactInternetSales ADD CONSTRAINT RefFactCurrencyRate54 
    FOREIGN KEY (CurrencyKey, OrderDateKey)
    REFERENCES FactCurrencyRate(CurrencyKey, DateKey)
;

ALTER TABLE FactInternetSales ADD CONSTRAINT RefFactCurrencyRate55 
    FOREIGN KEY (CurrencyKey, OrderDateKey)
    REFERENCES FactCurrencyRate(CurrencyKey, DateKey)
;

ALTER TABLE FactInternetSales ADD CONSTRAINT RefFactCurrencyRate56 
    FOREIGN KEY (CurrencyKey, OrderDateKey)
    REFERENCES FactCurrencyRate(CurrencyKey, DateKey)
;

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimCurrency 
    FOREIGN KEY (CurrencyKey)
    REFERENCES DimCurrency(CurrencyKey)
;

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimCustomer 
    FOREIGN KEY (CustomerKey)
    REFERENCES DimCustomer(CustomerKey)
;

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimDate 
    FOREIGN KEY (OrderDateKey)
    REFERENCES DimDate(DateKey)
;

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimDate1 
    FOREIGN KEY (DueDateKey)
    REFERENCES DimDate(DateKey)
;

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimDate2 
    FOREIGN KEY (ShipDateKey)
    REFERENCES DimDate(DateKey)
;

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimProduct 
    FOREIGN KEY (ProductKey)
    REFERENCES DimProduct(ProductKey)
;

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimPromotion 
    FOREIGN KEY (PromotionKey)
    REFERENCES DimPromotion(PromotionKey)
;

ALTER TABLE FactInternetSales ADD CONSTRAINT FK_FactInternetSales_DimSalesTerritory 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
;


-- 
-- TABLE: FactInternetSalesReason 
--

ALTER TABLE FactInternetSalesReason ADD CONSTRAINT RefFactResellerSales46 
    FOREIGN KEY (SalesOrderNumber, SalesOrderLineNumber)
    REFERENCES FactResellerSales(SalesOrderNumber, SalesOrderLineNumber)
;

ALTER TABLE FactInternetSalesReason ADD CONSTRAINT FK_FactInternetSalesReason_DimSalesReason 
    FOREIGN KEY (SalesReasonKey)
    REFERENCES DimSalesReason(SalesReasonKey)
;

ALTER TABLE FactInternetSalesReason ADD CONSTRAINT FK_FactInternetSalesReason_FactInternetSales 
    FOREIGN KEY (SalesOrderNumber, SalesOrderLineNumber)
    REFERENCES FactInternetSales(SalesOrderNumber, SalesOrderLineNumber)
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


-- 
-- TABLE: FactResellerSales 
--

ALTER TABLE FactResellerSales ADD CONSTRAINT RefFactProductInventory47 
    FOREIGN KEY (ProductKey, OrderDateKey)
    REFERENCES FactProductInventory(ProductKey, DateKey)
;

ALTER TABLE FactResellerSales ADD CONSTRAINT RefFactCurrencyRate51 
    FOREIGN KEY (CurrencyKey, OrderDateKey)
    REFERENCES FactCurrencyRate(CurrencyKey, DateKey)
;

ALTER TABLE FactResellerSales ADD CONSTRAINT RefFactCurrencyRate52 
    FOREIGN KEY (CurrencyKey, OrderDateKey)
    REFERENCES FactCurrencyRate(CurrencyKey, DateKey)
;

ALTER TABLE FactResellerSales ADD CONSTRAINT RefFactCurrencyRate53 
    FOREIGN KEY (CurrencyKey, OrderDateKey)
    REFERENCES FactCurrencyRate(CurrencyKey, DateKey)
;

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimCurrency 
    FOREIGN KEY (CurrencyKey)
    REFERENCES DimCurrency(CurrencyKey)
;

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimDate 
    FOREIGN KEY (OrderDateKey)
    REFERENCES DimDate(DateKey)
;

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

ALTER TABLE FactResellerSales ADD CONSTRAINT FK_FactResellerSales_DimProduct 
    FOREIGN KEY (ProductKey)
    REFERENCES DimProduct(ProductKey)
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


-- 
-- TABLE: FactSalesQuota 
--

ALTER TABLE FactSalesQuota ADD CONSTRAINT FK_FactSalesQuota_DimDate 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
;

ALTER TABLE FactSalesQuota ADD CONSTRAINT FK_FactSalesQuota_DimEmployee 
    FOREIGN KEY (EmployeeKey)
    REFERENCES DimEmployee(EmployeeKey)
;


-- 
-- TABLE: FactSurveyResponse 
--

ALTER TABLE FactSurveyResponse ADD CONSTRAINT RefDimProductCategory49 
    FOREIGN KEY (ProductCategoryKey)
    REFERENCES DimProductCategory(ProductCategoryKey)
;

ALTER TABLE FactSurveyResponse ADD CONSTRAINT RefDimProductSubcategory50 
    FOREIGN KEY (ProductSubcategoryKey)
    REFERENCES DimProductSubcategory(ProductSubcategoryKey)
;

ALTER TABLE FactSurveyResponse ADD CONSTRAINT FK_FactSurveyResponse_CustomerKey 
    FOREIGN KEY (CustomerKey)
    REFERENCES DimCustomer(CustomerKey)
;

ALTER TABLE FactSurveyResponse ADD CONSTRAINT FK_FactSurveyResponse_DateKey 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
;


