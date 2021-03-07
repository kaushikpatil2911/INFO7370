/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Adv work pur model.DM1
 *
 * Date Created : Thursday, October 08, 2020 13:35:53
 * Target DBMS : Microsoft SQL Server 2017
 */

/* 
 * TABLE: DimDate 
 */

CREATE TABLE DimDate(
    DateKey_SK           datetime        NOT NULL,
    DateKey              int             NOT NULL,
    DayNumberOfWeek      tinyint         NOT NULL,
    DayNumberOfMonth     tinyint         NOT NULL,
    DayNumberOfYear      smallint        NOT NULL,
    WeekNumberOfYear     tinyint         NOT NULL,
    MonthName            nvarchar(10)    NOT NULL,
    MonthNumberOfYear    tinyint         NOT NULL,
    CalenderYear         tinyint         NOT NULL,
    CalenderQuarter      tinyint         NOT NULL,
    CalenderSemester     tinyint         NOT NULL,
    FiscalQuarter        tinyint         NOT NULL,
    FiscalYear           tinyint         NOT NULL,
    FiscalSemester       tinyint         NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (DateKey_SK)
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
    Employee_SK          int                 IDENTITY(1,1),
    EmployeeID           int                 NOT NULL,
    CurrentFlag          binary(1)           NOT NULL,
    NationalIDNumber     nvarchar(15)        NOT NULL,
    LoginID              nvarchar(25)        NOT NULL,
    OrganizationNode     hierarchyid         NOT NULL,
    OrganizationLevel    nvarchar(10)        NOT NULL,
    JobTitle             nvarchar(50)        NOT NULL,
    MaritalStatus        binary(1)           NOT NULL,
    Gender               nchar(1)            NOT NULL,
    SalariedFlag         binary(1)           NOT NULL,
    VacationHours        smallint            NOT NULL,
    SickLevelHours       smallint            NOT NULL,
    rowguid              uniqueidentifier    NOT NULL,
    Geography_SK         int                 NULL,
    BirthDate            datetime            NULL,
    DateKey_SK           datetime            NOT NULL,
    CONSTRAINT PK1_2 PRIMARY KEY NONCLUSTERED (Employee_SK)
)
go



IF OBJECT_ID('DimEmployee') IS NOT NULL
    PRINT '<<< CREATED TABLE DimEmployee >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimEmployee >>>'
go

/* 
 * TABLE: DimEmployeePay 
 */

CREATE TABLE DimEmployeePay(
    EmployeePay_SK             datetime     NOT NULL,
    EmployeePayId              datetime     NULL,
    RateChngeDateDurable_NK    datetime     NOT NULL,
    [Current Indicator]        binary(1)    NOT NULL,
    RateChangeDate             datetime     NOT NULL,
    Rate                       money        NOT NULL,
    PayFrequency               tinyint      NOT NULL,
    Employee_SK                int          NULL,
    EffectiveDate              datetime     NULL,
    IneffectiveDate            datetime     NULL,
    ModifiedDate               datetime     NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (EmployeePay_SK)
)
go



IF OBJECT_ID('DimEmployeePay') IS NOT NULL
    PRINT '<<< CREATED TABLE DimEmployeePay >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimEmployeePay >>>'
go

/* 
 * TABLE: DimGeography 
 */

CREATE TABLE DimGeography(
    Geography_SK    int             IDENTITY(1,1),
    GeographyID     int             NOT NULL,
    Country         nvarchar(20)    NOT NULL,
    State           nvarchar(30)    NOT NULL,
    City            nvarchar(30)    NOT NULL,
    ZipCode         nvarchar(30)    NOT NULL,
    Address         nvarchar(30)    NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (Geography_SK)
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
    Product_SK                     int                 IDENTITY(1,1),
    ProductID                      int                 NOT NULL,
    Weight                         decimal(8, 2)       NOT NULL,
    Size                           nvarchar(5)         NOT NULL,
    ProductNumber                  nvarchar(25)        NOT NULL,
    Name                           nvarchar(50)        NOT NULL,
    ShipMethod_SK                  int                 NULL,
    ProductModel_SK                int                 NULL,
    ProductStandardCost_SK         datetime            NULL,
    ProductCategory_SK             int                 NULL,
    ProductSubCategory_SK          int                 NULL,
    ProdCostHistStrDateTable_SK    datetime            NULL,
    ModifiedDate                   datetime            NULL,
    rowguid                        uniqueidentifier    NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (Product_SK)
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
    ProductCategory_SK    int                 IDENTITY(1,1),
    ProductCategoryID     int                 NOT NULL,
    rowguid               uniqueidentifier    NOT NULL,
    Name                  nvarchar(50)        NOT NULL,
    CONSTRAINT PK1_1_2 PRIMARY KEY NONCLUSTERED (ProductCategory_SK)
)
go



IF OBJECT_ID('DimProductCategory') IS NOT NULL
    PRINT '<<< CREATED TABLE DimProductCategory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimProductCategory >>>'
go

/* 
 * TABLE: DimProductInventory 
 */

CREATE TABLE DimProductInventory(
    LocationID      int                 NOT NULL,
    Product_SK      int                 NOT NULL,
    Quantity        smallint            NOT NULL,
    Shelf           nvarchar(10)        NOT NULL,
    rowguid         uniqueidentifier    NOT NULL,
    Bin             tinyint             NOT NULL,
    ModifiedDate    datetime            NOT NULL,
    CONSTRAINT PK1_1_2_1 PRIMARY KEY NONCLUSTERED (LocationID, Product_SK)
)
go



IF OBJECT_ID('DimProductInventory') IS NOT NULL
    PRINT '<<< CREATED TABLE DimProductInventory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimProductInventory >>>'
go

/* 
 * TABLE: DimProductListPrice 
 */

CREATE TABLE DimProductListPrice(
    ProductListPrice_SK         datetime     NOT NULL,
    ProdLisStrDateDurable_SK    datetime     NOT NULL,
    ProductListPriceID_SK       datetime     NOT NULL,
    StartDate_NK                datetime     NOT NULL,
    CurrentIndicator            binary(1)    NOT NULL,
    ListPrice                   money        NOT NULL,
    IneffectiveDate             datetime     NULL,
    EffectiveDate               datetime     NULL,
    ModifiedDate                datetime     NULL,
    EndDate                     datetime     NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (ProductListPrice_SK, ProdLisStrDateDurable_SK)
)
go



IF OBJECT_ID('DimProductListPrice') IS NOT NULL
    PRINT '<<< CREATED TABLE DimProductListPrice >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimProductListPrice >>>'
go

/* 
 * TABLE: DimProductModel 
 */

CREATE TABLE DimProductModel(
    ProductModel_SK       int                 IDENTITY(1,1),
    ProductModelId        int                 NOT NULL,
    rowguid               uniqueidentifier    NOT NULL,
    Instructions          xml                 NOT NULL,
    CatalogDescription    xml                 NOT NULL,
    Name                  nvarchar(50)        NULL,
    CONSTRAINT PK1_1_1 PRIMARY KEY NONCLUSTERED (ProductModel_SK)
)
go



IF OBJECT_ID('DimProductModel') IS NOT NULL
    PRINT '<<< CREATED TABLE DimProductModel >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimProductModel >>>'
go

/* 
 * TABLE: DimProductStandardCost 
 */

CREATE TABLE DimProductStandardCost(
    ProductStandardCost_SK       datetime     NOT NULL,
    ProdCosHisStrDateTable_SK    datetime     NOT NULL,
    CurrentIndicator             binary(1)    NOT NULL,
    CostPrice                    money        NOT NULL,
    StartDate_NK                 datetime     NOT NULL,
    IneffectiveDate              datetime     NULL,
    EffectiveDate                datetime     NULL,
    ModifiedDate                 datetime     NULL,
    EndDate                      datetime     NULL,
    CONSTRAINT PK13 PRIMARY KEY NONCLUSTERED (ProductStandardCost_SK, ProdCosHisStrDateTable_SK)
)
go



IF OBJECT_ID('DimProductStandardCost') IS NOT NULL
    PRINT '<<< CREATED TABLE DimProductStandardCost >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimProductStandardCost >>>'
go

/* 
 * TABLE: DimProductSubCategory 
 */

CREATE TABLE DimProductSubCategory(
    ProductSubCategory_SK    int                 IDENTITY(1,1),
    ProductSubCategoryID     char(10)            NOT NULL,
    rowguid                  uniqueidentifier    NOT NULL,
    Name                     nvarchar(50)        NOT NULL,
    ModifiedDate             datetime            NULL,
    CONSTRAINT PK1_1 PRIMARY KEY NONCLUSTERED (ProductSubCategory_SK)
)
go



IF OBJECT_ID('DimProductSubCategory') IS NOT NULL
    PRINT '<<< CREATED TABLE DimProductSubCategory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimProductSubCategory >>>'
go

/* 
 * TABLE: DimProductVendor 
 */

CREATE TABLE DimProductVendor(
    ProductVendor_SK        int         IDENTITY(1,1),
    ProductVendorID         int         NOT NULL,
    AverageLoadTime         int         NOT NULL,
    StandardPrice           money       NOT NULL,
    MinOrderqty             int         NOT NULL,
    MaxOrderQty             int         NOT NULL,
    OnOrderQty              int         NOT NULL,
    ProductOrderDetailID    int         NULL,
    LastReceiptDate         datetime    NULL,
    DateKey_SK              datetime    NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (ProductVendor_SK)
)
go



IF OBJECT_ID('DimProductVendor') IS NOT NULL
    PRINT '<<< CREATED TABLE DimProductVendor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimProductVendor >>>'
go

/* 
 * TABLE: DimSalesTerritory 
 */

CREATE TABLE DimSalesTerritory(
    SalesTerritory_SK    int                 NOT NULL,
    SalesTerritoryID     int                 NOT NULL,
    rowguid              uniqueidentifier    NOT NULL,
    CostLastYear         money               NOT NULL,
    CostYTD              money               NOT NULL,
    SalesLastYear        money               NOT NULL,
    SalesYTD             money               NOT NULL,
    Group                nvarchar(50)        NOT NULL,
    Name                 nvarchar(50)        NOT NULL,
    CONSTRAINT PK1_1_3 PRIMARY KEY NONCLUSTERED (SalesTerritory_SK)
)
go



IF OBJECT_ID('DimSalesTerritory') IS NOT NULL
    PRINT '<<< CREATED TABLE DimSalesTerritory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimSalesTerritory >>>'
go

/* 
 * TABLE: DimShipMethod 
 */

CREATE TABLE DimShipMethod(
    ShipMethod_SK    int             IDENTITY(1,1),
    ShipMethodID     int             NOT NULL,
    ShipRate         money           NOT NULL,
    ShipBase         money           NOT NULL,
    Name             nvarchar(50)    NOT NULL,
    CONSTRAINT PK1_1_1_1 PRIMARY KEY NONCLUSTERED (ShipMethod_SK)
)
go



IF OBJECT_ID('DimShipMethod') IS NOT NULL
    PRINT '<<< CREATED TABLE DimShipMethod >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimShipMethod >>>'
go

/* 
 * TABLE: DimVendor 
 */

CREATE TABLE DimVendor(
    Vendor_SK                  int               IDENTITY(1,1),
    VendorID                   int               NOT NULL,
    PrefferedVendorStatus      binary(1)         NOT NULL,
    ActiveFlag                 binary(1)         NOT NULL,
    PurchasingWebServiceURL    nvarchar(1024)    NOT NULL,
    AccountNumber              nvarchar(15)      NOT NULL,
    Name                       nvarchar(50)      NOT NULL,
    CreditRating               tinyint           NOT NULL,
    Geography_SK               int               NULL,
    DateKey_SK                 datetime          NOT NULL,
    VendorContact_SK           int               NULL,
    CONSTRAINT PK1_3 PRIMARY KEY NONCLUSTERED (Vendor_SK)
)
go



IF OBJECT_ID('DimVendor') IS NOT NULL
    PRINT '<<< CREATED TABLE DimVendor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimVendor >>>'
go

/* 
 * TABLE: DimVendorContacts 
 */

CREATE TABLE DimVendorContacts(
    VendorContact_SK        int             NOT NULL,
    Title                   nvarchar(30)    NULL,
    FirstName               nvarchar(50)    NULL,
    MiddleName              nvarchar(50)    NULL,
    LastName                nvarchar(50)    NULL,
    BusinessEntittyID_NK    int             NOT NULL,
    ContactType             nvarchar(50)    NOT NULL,
    PhoneNumber             nvarchar(25)    NULL,
    PhoneNumberType         nvarchar(50)    NULL,
    EmailAddress            nvarchar(50)    NULL,
    EmailPromotion          int             NOT NULL,
    VendorID_SK             int             NULL,
    SOR_ID                  int             NULL,
    ETLLoadID               int             NULL,
    ETLLoadDate             datetime        NOT NULL,
    DI_Job_ID               int             NOT NULL,
    DI_Create_Date          date            NOT NULL,
    DI_Modified_Date        date            NOT NULL,
    CONSTRAINT PK17 PRIMARY KEY NONCLUSTERED (VendorContact_SK)
)
go



IF OBJECT_ID('DimVendorContacts') IS NOT NULL
    PRINT '<<< CREATED TABLE DimVendorContacts >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimVendorContacts >>>'
go

/* 
 * TABLE: FactOrderDetail 
 */

CREATE TABLE FactOrderDetail(
    ProductOrderDetailID    int              IDENTITY(1,1),
    StockedQty              decimal(8, 2)    NOT NULL,
    OrderQty                smallint         NOT NULL,
    UnitPrice               money            NOT NULL,
    LineTotal               money            NOT NULL,
    RejectedQty             decimal(8, 2)    NOT NULL,
    RecievedQty             decimal(8, 2)    NOT NULL,
    PurchaseOrderID         int              NULL,
    ModifiedDate            datetime         NULL,
    DueDate                 datetime         NULL,
    Product_SK              int              NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (ProductOrderDetailID)
)
go



IF OBJECT_ID('FactOrderDetail') IS NOT NULL
    PRINT '<<< CREATED TABLE FactOrderDetail >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactOrderDetail >>>'
go

/* 
 * TABLE: FactPurchaseOrderHeader 
 */

CREATE TABLE FactPurchaseOrderHeader(
    PurchaseOrderID     int         IDENTITY(1,1),
    RevisionNumber      tinyint     NOT NULL,
    Status              tinyint     NOT NULL,
    TaxAmt              money       NOT NULL,
    SubTotal            money       NOT NULL,
    TotalDue            money       NOT NULL,
    Freight             money       NOT NULL,
    Employee_SK         int         NULL,
    Vendor_SK           int         NULL,
    ProductVendor_SK    int         NULL,
    ShipMethod_SK       int         NULL,
    Geography_SK        int         NULL,
    ModifiedDate        datetime    NULL,
    ShipDate            datetime    NULL,
    OrderDate           datetime    NULL,
    CONSTRAINT PK2_1 PRIMARY KEY NONCLUSTERED (PurchaseOrderID)
)
go



IF OBJECT_ID('FactPurchaseOrderHeader') IS NOT NULL
    PRINT '<<< CREATED TABLE FactPurchaseOrderHeader >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactPurchaseOrderHeader >>>'
go

/* 
 * TABLE: DimEmployee 
 */

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimGeography234 
    FOREIGN KEY (Geography_SK)
    REFERENCES DimGeography(Geography_SK)
go

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimDate246 
    FOREIGN KEY (BirthDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimDate272 
    FOREIGN KEY (DateKey_SK)
    REFERENCES DimDate(DateKey_SK)
go


/* 
 * TABLE: DimEmployeePay 
 */

ALTER TABLE DimEmployeePay ADD CONSTRAINT RefDimDate254 
    FOREIGN KEY (EffectiveDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimEmployeePay ADD CONSTRAINT RefDimDate255 
    FOREIGN KEY (EffectiveDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimEmployeePay ADD CONSTRAINT RefDimDate256 
    FOREIGN KEY (IneffectiveDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimEmployeePay ADD CONSTRAINT RefDimDate261 
    FOREIGN KEY (EmployeePayId)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimEmployeePay ADD CONSTRAINT RefDimEmployee262 
    FOREIGN KEY (Employee_SK)
    REFERENCES DimEmployee(Employee_SK)
go

ALTER TABLE DimEmployeePay ADD CONSTRAINT RefDimDate270 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
go


/* 
 * TABLE: DimProduct 
 */

ALTER TABLE DimProduct ADD CONSTRAINT RefDimShipMethod229 
    FOREIGN KEY (ShipMethod_SK)
    REFERENCES DimShipMethod(ShipMethod_SK)
go

ALTER TABLE DimProduct ADD CONSTRAINT RefDimProductSubCategory239 
    FOREIGN KEY (ProductSubCategory_SK)
    REFERENCES DimProductSubCategory(ProductSubCategory_SK)
go

ALTER TABLE DimProduct ADD CONSTRAINT RefDimProductModel240 
    FOREIGN KEY (ProductModel_SK)
    REFERENCES DimProductModel(ProductModel_SK)
go

ALTER TABLE DimProduct ADD CONSTRAINT RefDimDate241 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimProduct ADD CONSTRAINT RefDimProductStandardCost242 
    FOREIGN KEY (ProductStandardCost_SK, ProdCostHistStrDateTable_SK)
    REFERENCES DimProductStandardCost(ProductStandardCost_SK, ProdCosHisStrDateTable_SK)
go

ALTER TABLE DimProduct ADD CONSTRAINT RefDimProductCategory243 
    FOREIGN KEY (ProductCategory_SK)
    REFERENCES DimProductCategory(ProductCategory_SK)
go


/* 
 * TABLE: DimProductInventory 
 */

ALTER TABLE DimProductInventory ADD CONSTRAINT RefDimDate231 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimProductInventory ADD CONSTRAINT RefDimProduct264 
    FOREIGN KEY (Product_SK)
    REFERENCES DimProduct(Product_SK)
go

ALTER TABLE DimProductInventory ADD CONSTRAINT RefDimGeography266 
    FOREIGN KEY (LocationID)
    REFERENCES DimGeography(Geography_SK)
go


/* 
 * TABLE: DimProductListPrice 
 */

ALTER TABLE DimProductListPrice ADD CONSTRAINT RefDimDate228 
    FOREIGN KEY (EndDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimProductListPrice ADD CONSTRAINT RefDimDate248 
    FOREIGN KEY (ProdLisStrDateDurable_SK)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimProductListPrice ADD CONSTRAINT RefDimDate257 
    FOREIGN KEY (IneffectiveDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimProductListPrice ADD CONSTRAINT RefDimDate259 
    FOREIGN KEY (EffectiveDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimProductListPrice ADD CONSTRAINT RefDimDate268 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
go


/* 
 * TABLE: DimProductStandardCost 
 */

ALTER TABLE DimProductStandardCost ADD CONSTRAINT RefDimDate227 
    FOREIGN KEY (EndDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimProductStandardCost ADD CONSTRAINT RefDimDate249 
    FOREIGN KEY (ProdCosHisStrDateTable_SK)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimProductStandardCost ADD CONSTRAINT RefDimDate258 
    FOREIGN KEY (IneffectiveDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimProductStandardCost ADD CONSTRAINT RefDimDate260 
    FOREIGN KEY (EffectiveDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimProductStandardCost ADD CONSTRAINT RefDimDate274 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
go


/* 
 * TABLE: DimProductSubCategory 
 */

ALTER TABLE DimProductSubCategory ADD CONSTRAINT RefDimDate245 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
go


/* 
 * TABLE: DimProductVendor 
 */

ALTER TABLE DimProductVendor ADD CONSTRAINT RefDimDate247 
    FOREIGN KEY (LastReceiptDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimProductVendor ADD CONSTRAINT RefFactOrderDetail263 
    FOREIGN KEY (ProductOrderDetailID)
    REFERENCES FactOrderDetail(ProductOrderDetailID)
go

ALTER TABLE DimProductVendor ADD CONSTRAINT RefDimDate267 
    FOREIGN KEY (DateKey_SK)
    REFERENCES DimDate(DateKey_SK)
go


/* 
 * TABLE: DimSalesTerritory 
 */

ALTER TABLE DimSalesTerritory ADD CONSTRAINT RefDimGeography271 
    FOREIGN KEY (SalesTerritory_SK)
    REFERENCES DimGeography(Geography_SK)
go


/* 
 * TABLE: DimVendor 
 */

ALTER TABLE DimVendor ADD CONSTRAINT RefDimGeography235 
    FOREIGN KEY (Geography_SK)
    REFERENCES DimGeography(Geography_SK)
go

ALTER TABLE DimVendor ADD CONSTRAINT RefDimDate273 
    FOREIGN KEY (DateKey_SK)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE DimVendor ADD CONSTRAINT RefDimVendorContacts275 
    FOREIGN KEY (VendorContact_SK)
    REFERENCES DimVendorContacts(VendorContact_SK)
go


/* 
 * TABLE: FactOrderDetail 
 */

ALTER TABLE FactOrderDetail ADD CONSTRAINT RefDimDate233 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE FactOrderDetail ADD CONSTRAINT RefDimProduct238 
    FOREIGN KEY (Product_SK)
    REFERENCES DimProduct(Product_SK)
go

ALTER TABLE FactOrderDetail ADD CONSTRAINT RefDimDate253 
    FOREIGN KEY (DueDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE FactOrderDetail ADD CONSTRAINT RefFactPurchaseOrderHeader265 
    FOREIGN KEY (PurchaseOrderID)
    REFERENCES FactPurchaseOrderHeader(PurchaseOrderID)
go


/* 
 * TABLE: FactPurchaseOrderHeader 
 */

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimVendor230 
    FOREIGN KEY (Vendor_SK)
    REFERENCES DimVendor(Vendor_SK)
go

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimProductVendor232 
    FOREIGN KEY (ProductVendor_SK)
    REFERENCES DimProductVendor(ProductVendor_SK)
go

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimShipMethod236 
    FOREIGN KEY (ShipMethod_SK)
    REFERENCES DimShipMethod(ShipMethod_SK)
go

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimGeography237 
    FOREIGN KEY (Geography_SK)
    REFERENCES DimGeography(Geography_SK)
go

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimDate244 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimDate250 
    FOREIGN KEY (ShipDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimDate251 
    FOREIGN KEY (ShipDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimDate252 
    FOREIGN KEY (OrderDate)
    REFERENCES DimDate(DateKey_SK)
go

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimEmployee269 
    FOREIGN KEY (Employee_SK)
    REFERENCES DimEmployee(Employee_SK)
go


