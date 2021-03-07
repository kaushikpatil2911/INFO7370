--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Adventure Work DW DM1.DM1
--
-- Date Created : Wednesday, September 30, 2020 16:18:23
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: DimAccount 
--

CREATE TABLE DimAccount(
    AccountKey                       INT                      AUTO_INCREMENT,
    ParentAccountKey                 INT,
    AccountCodeAlternateKey          INT,
    ParentAccountCodeAlternateKey    INT,
    AccountDescription               NATIONAL VARCHAR(50),
    AccountType                      NATIONAL VARCHAR(50),
    Operator                         NATIONAL VARCHAR(50),
    CustomMembers                    NATIONAL VARCHAR(300),
    ValueType                        NATIONAL VARCHAR(50),
    CustomMemberOptions              NATIONAL VARCHAR(200),
    PRIMARY KEY (AccountKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimCurrency 
--

CREATE TABLE DimCurrency(
    CurrencyKey             INT                     AUTO_INCREMENT,
    CurrencyAlternateKey    NATIONAL CHAR(3)        NOT NULL,
    CurrencyName            NATIONAL VARCHAR(50)    NOT NULL,
    PRIMARY KEY (CurrencyKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimCustomer 
--

CREATE TABLE DimCustomer(
    CustomerKey             INT                      AUTO_INCREMENT,
    GeographyKey            INT,
    CustomerAlternateKey    NATIONAL VARCHAR(15)     NOT NULL,
    Title                   NATIONAL VARCHAR(8),
    FirstName               NATIONAL VARCHAR(50),
    MiddleName              NATIONAL VARCHAR(50),
    LastName                NATIONAL VARCHAR(50),
    NameStyle               BIT(1),
    BirthDate               DATE,
    MaritalStatus           NATIONAL CHAR(1),
    Suffix                  NATIONAL VARCHAR(10),
    Gender                  NATIONAL VARCHAR(1),
    EmailAddress            NATIONAL VARCHAR(50),
    YearlyIncome            DECIMAL(19, 4),
    TotalChildren           TINYINT,
    NumberChildrenAtHome    TINYINT,
    EnglishEducation        NATIONAL VARCHAR(40),
    SpanishEducation        NATIONAL VARCHAR(40),
    FrenchEducation         NATIONAL VARCHAR(40),
    EnglishOccupation       NATIONAL VARCHAR(100),
    SpanishOccupation       NATIONAL VARCHAR(100),
    FrenchOccupation        NATIONAL VARCHAR(100),
    HouseOwnerFlag          NATIONAL CHAR(1),
    NumberCarsOwned         TINYINT,
    AddressLine1            NATIONAL VARCHAR(120),
    AddressLine2            NATIONAL VARCHAR(120),
    Phone                   NATIONAL VARCHAR(20),
    DateFirstPurchase       DATE,
    CommuteDistance         NATIONAL VARCHAR(15),
    PRIMARY KEY (CustomerKey)
)ENGINE=MYISAM
;



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
-- TABLE: DimDepartmentGroup 
--

CREATE TABLE DimDepartmentGroup(
    DepartmentGroupKey          INT                     AUTO_INCREMENT,
    ParentDepartmentGroupKey    INT,
    DepartmentGroupName         NATIONAL VARCHAR(50),
    PRIMARY KEY (DepartmentGroupKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimEmployee 
--

CREATE TABLE DimEmployee(
    EmployeeKey                             INT                      AUTO_INCREMENT,
    ParentEmployeeKey                       INT,
    EmployeeNationalIDAlternateKey          NATIONAL VARCHAR(15),
    ParentEmployeeNationalIDAlternateKey    NATIONAL VARCHAR(15),
    SalesTerritoryKey                       INT,
    FirstName                               NATIONAL VARCHAR(50)     NOT NULL,
    LastName                                NATIONAL VARCHAR(50)     NOT NULL,
    MiddleName                              NATIONAL VARCHAR(50),
    NameStyle                               BIT(1)                   NOT NULL,
    Title                                   NATIONAL VARCHAR(50),
    HireDate                                DATE,
    BirthDate                               DATE,
    LoginID                                 NATIONAL VARCHAR(256),
    EmailAddress                            NATIONAL VARCHAR(50),
    Phone                                   NATIONAL VARCHAR(25),
    MaritalStatus                           NATIONAL CHAR(1),
    EmergencyContactName                    NATIONAL VARCHAR(50),
    EmergencyContactPhone                   NATIONAL VARCHAR(25),
    SalariedFlag                            BIT(1),
    Gender                                  NATIONAL CHAR(1),
    PayFrequency                            TINYINT,
    BaseRate                                DECIMAL(19, 4),
    VacationHours                           SMALLINT,
    SickLeaveHours                          SMALLINT,
    CurrentFlag                             BIT(1)                   NOT NULL,
    SalesPersonFlag                         BIT(1)                   NOT NULL,
    DepartmentName                          NATIONAL VARCHAR(50),
    StartDate                               DATE,
    EndDate                                 DATE,
    Status                                  NATIONAL VARCHAR(50),
    EmployeePhoto                           VARBINARY(4000),
    PRIMARY KEY (EmployeeKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimGeography 
--

CREATE TABLE DimGeography(
    GeographyKey                INT                     AUTO_INCREMENT,
    City                        NATIONAL VARCHAR(30),
    StateProvinceCode           NATIONAL VARCHAR(3),
    StateProvinceName           NATIONAL VARCHAR(50),
    CountryRegionCode           NATIONAL VARCHAR(3),
    EnglishCountryRegionName    NATIONAL VARCHAR(50),
    SpanishCountryRegionName    NATIONAL VARCHAR(50),
    FrenchCountryRegionName     NATIONAL VARCHAR(50),
    PostalCode                  NATIONAL VARCHAR(15),
    SalesTerritoryKey           INT,
    IpAddressLocator            NATIONAL VARCHAR(15),
    PRIMARY KEY (GeographyKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimOrganization 
--

CREATE TABLE DimOrganization(
    OrganizationKey          INT                     AUTO_INCREMENT,
    ParentOrganizationKey    INT,
    PercentageOfOwnership    NATIONAL VARCHAR(16),
    OrganizationName         NATIONAL VARCHAR(50),
    CurrencyKey              INT,
    PRIMARY KEY (OrganizationKey)
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
-- TABLE: DimPromotion 
--

CREATE TABLE DimPromotion(
    PromotionKey                INT                      AUTO_INCREMENT,
    PromotionAlternateKey       INT,
    EnglishPromotionName        NATIONAL VARCHAR(255),
    SpanishPromotionName        NATIONAL VARCHAR(255),
    FrenchPromotionName         NATIONAL VARCHAR(255),
    DiscountPct                 FLOAT(8, 0),
    EnglishPromotionType        NATIONAL VARCHAR(50),
    SpanishPromotionType        NATIONAL VARCHAR(50),
    FrenchPromotionType         NATIONAL VARCHAR(50),
    EnglishPromotionCategory    NATIONAL VARCHAR(50),
    SpanishPromotionCategory    NATIONAL VARCHAR(50),
    FrenchPromotionCategory     NATIONAL VARCHAR(50),
    StartDate                   DATETIME                 NOT NULL,
    EndDate                     DATETIME,
    MinQty                      INT,
    MaxQty                      INT,
    PRIMARY KEY (PromotionKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimReseller 
--

CREATE TABLE DimReseller(
    ResellerKey             INT                     AUTO_INCREMENT,
    GeographyKey            INT,
    ResellerAlternateKey    NATIONAL VARCHAR(15),
    Phone                   NATIONAL VARCHAR(25),
    BusinessType            VARCHAR(20)             NOT NULL,
    ResellerName            NATIONAL VARCHAR(50)    NOT NULL,
    NumberEmployees         INT,
    OrderFrequency          CHAR(1),
    OrderMonth              TINYINT,
    FirstOrderYear          INT,
    LastOrderYear           INT,
    ProductLine             NATIONAL VARCHAR(50),
    AddressLine1            NATIONAL VARCHAR(60),
    AddressLine2            NATIONAL VARCHAR(60),
    AnnualSales             DECIMAL(19, 4),
    BankName                NATIONAL VARCHAR(50),
    MinPaymentType          TINYINT,
    MinPaymentAmount        DECIMAL(19, 4),
    AnnualRevenue           DECIMAL(19, 4),
    YearOpened              INT,
    PRIMARY KEY (ResellerKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimSalesReason 
--

CREATE TABLE DimSalesReason(
    SalesReasonKey             INT                     AUTO_INCREMENT,
    SalesReasonAlternateKey    INT                     NOT NULL,
    SalesReasonName            NATIONAL VARCHAR(50)    NOT NULL,
    SalesReasonReasonType      NATIONAL VARCHAR(50)    NOT NULL,
    PRIMARY KEY (SalesReasonKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimSalesTerritory 
--

CREATE TABLE DimSalesTerritory(
    SalesTerritoryKey             INT                     AUTO_INCREMENT,
    SalesTerritoryAlternateKey    INT,
    SalesTerritoryRegion          NATIONAL VARCHAR(50)    NOT NULL,
    SalesTerritoryCountry         NATIONAL VARCHAR(50)    NOT NULL,
    SalesTerritoryGroup           NATIONAL VARCHAR(50),
    SalesTerritoryImage           VARBINARY(4000),
    PRIMARY KEY (SalesTerritoryKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimScenario 
--

CREATE TABLE DimScenario(
    ScenarioKey     INT                     AUTO_INCREMENT,
    ScenarioName    NATIONAL VARCHAR(50),
    PRIMARY KEY (ScenarioKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactAdditionalInternationalProductDescription 
--

CREATE TABLE FactAdditionalInternationalProductDescription(
    ProductKey            INT                     NOT NULL,
    CultureName           NATIONAL VARCHAR(50)    NOT NULL,
    ProductDescription    NATIONAL VARCHAR(18)    NOT NULL,
    PRIMARY KEY (ProductKey, CultureName)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactCallCenter 
--

CREATE TABLE FactCallCenter(
    FactCallCenterID       INT                     AUTO_INCREMENT,
    DateKey                INT                     NOT NULL,
    WageType               NATIONAL VARCHAR(15)    NOT NULL,
    Shift                  NATIONAL VARCHAR(20)    NOT NULL,
    LevelOneOperators      SMALLINT                NOT NULL,
    LevelTwoOperators      SMALLINT                NOT NULL,
    TotalOperators         SMALLINT                NOT NULL,
    Calls                  INT                     NOT NULL,
    AutomaticResponses     INT                     NOT NULL,
    Orders                 INT                     NOT NULL,
    IssuesRaised           SMALLINT                NOT NULL,
    AverageTimePerIssue    SMALLINT                NOT NULL,
    ServiceGrade           FLOAT(8, 0)             NOT NULL,
    Date                   DATETIME,
    PRIMARY KEY (FactCallCenterID)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactCurrencyRate 
--

CREATE TABLE FactCurrencyRate(
    CurrencyKey     INT            NOT NULL,
    DateKey         INT            NOT NULL,
    AverageRate     FLOAT(8, 0)    NOT NULL,
    EndOfDayRate    FLOAT(8, 0)    NOT NULL,
    Date            DATETIME,
    PRIMARY KEY (CurrencyKey, DateKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactFinance 
--

CREATE TABLE FactFinance(
    FinanceKey            INT            AUTO_INCREMENT,
    DateKey               INT            NOT NULL,
    OrganizationKey       INT            NOT NULL,
    DepartmentGroupKey    INT            NOT NULL,
    ScenarioKey           INT            NOT NULL,
    AccountKey            INT            NOT NULL,
    Amount                FLOAT(8, 0)    NOT NULL,
    Date                  DATETIME
)ENGINE=MYISAM
;



-- 
-- TABLE: FactInternetSales 
--

CREATE TABLE FactInternetSales(
    ProductKey               INT                     NOT NULL,
    OrderDateKey             INT                     NOT NULL,
    DueDateKey               INT                     NOT NULL,
    ShipDateKey              INT                     NOT NULL,
    CustomerKey              INT                     NOT NULL,
    PromotionKey             INT                     NOT NULL,
    CurrencyKey              INT                     NOT NULL,
    SalesTerritoryKey        INT                     NOT NULL,
    SalesOrderNumber         NATIONAL VARCHAR(20)    NOT NULL,
    SalesOrderLineNumber     TINYINT                 NOT NULL,
    RevisionNumber           TINYINT                 NOT NULL,
    OrderQuantity            SMALLINT                NOT NULL,
    UnitPrice                DECIMAL(19, 4)          NOT NULL,
    ExtendedAmount           DECIMAL(19, 4)          NOT NULL,
    UnitPriceDiscountPct     FLOAT(8, 0)             NOT NULL,
    DiscountAmount           FLOAT(8, 0)             NOT NULL,
    ProductStandardCost      DECIMAL(19, 4)          NOT NULL,
    TotalProductCost         DECIMAL(19, 4)          NOT NULL,
    SalesAmount              DECIMAL(19, 4)          NOT NULL,
    TaxAmt                   DECIMAL(19, 4)          NOT NULL,
    Freight                  DECIMAL(19, 4)          NOT NULL,
    CarrierTrackingNumber    NATIONAL VARCHAR(25),
    CustomerPONumber         NATIONAL VARCHAR(25),
    OrderDate                DATETIME,
    DueDate                  DATETIME,
    ShipDate                 DATETIME,
    PRIMARY KEY (SalesOrderNumber, SalesOrderLineNumber)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactInternetSalesReason 
--

CREATE TABLE FactInternetSalesReason(
    SalesOrderNumber        NATIONAL VARCHAR(20)    NOT NULL,
    SalesOrderLineNumber    TINYINT                 NOT NULL,
    SalesReasonKey          INT                     NOT NULL,
    PRIMARY KEY (SalesOrderNumber, SalesOrderLineNumber, SalesReasonKey)
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
-- TABLE: FactResellerSales 
--

CREATE TABLE FactResellerSales(
    ProductKey               INT                     NOT NULL,
    OrderDateKey             INT                     NOT NULL,
    DueDateKey               INT                     NOT NULL,
    ShipDateKey              INT                     NOT NULL,
    ResellerKey              INT                     NOT NULL,
    EmployeeKey              INT                     NOT NULL,
    PromotionKey             INT                     NOT NULL,
    CurrencyKey              INT                     NOT NULL,
    SalesTerritoryKey        INT                     NOT NULL,
    SalesOrderNumber         NATIONAL VARCHAR(20)    NOT NULL,
    SalesOrderLineNumber     TINYINT                 NOT NULL,
    RevisionNumber           TINYINT,
    OrderQuantity            SMALLINT,
    UnitPrice                DECIMAL(19, 4),
    ExtendedAmount           DECIMAL(19, 4),
    UnitPriceDiscountPct     FLOAT(8, 0),
    DiscountAmount           FLOAT(8, 0),
    ProductStandardCost      DECIMAL(19, 4),
    TotalProductCost         DECIMAL(19, 4),
    SalesAmount              DECIMAL(19, 4),
    TaxAmt                   DECIMAL(19, 4),
    Freight                  DECIMAL(19, 4),
    CarrierTrackingNumber    NATIONAL VARCHAR(25),
    CustomerPONumber         NATIONAL VARCHAR(25),
    OrderDate                DATETIME,
    DueDate                  DATETIME,
    ShipDate                 DATETIME,
    PRIMARY KEY (SalesOrderNumber, SalesOrderLineNumber)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactSalesQuota 
--

CREATE TABLE FactSalesQuota(
    SalesQuotaKey       INT               AUTO_INCREMENT,
    EmployeeKey         INT               NOT NULL,
    DateKey             INT               NOT NULL,
    CalendarYear        SMALLINT          NOT NULL,
    CalendarQuarter     TINYINT           NOT NULL,
    SalesAmountQuota    DECIMAL(19, 4)    NOT NULL,
    Date                DATETIME,
    PRIMARY KEY (SalesQuotaKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactSurveyResponse 
--

CREATE TABLE FactSurveyResponse(
    SurveyResponseKey                INT                     AUTO_INCREMENT,
    DateKey                          INT                     NOT NULL,
    CustomerKey                      INT                     NOT NULL,
    ProductCategoryKey               INT                     NOT NULL,
    EnglishProductCategoryName       NATIONAL VARCHAR(50)    NOT NULL,
    ProductSubcategoryKey            INT                     NOT NULL,
    EnglishProductSubcategoryName    NATIONAL VARCHAR(50)    NOT NULL,
    Date                             DATETIME,
    PRIMARY KEY (SurveyResponseKey)
)ENGINE=MYISAM
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


