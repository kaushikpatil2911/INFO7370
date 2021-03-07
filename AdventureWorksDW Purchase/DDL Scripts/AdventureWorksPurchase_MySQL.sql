--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Adv work pur model.DM1
--
-- Date Created : Thursday, October 08, 2020 13:36:25
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: DimDate 
--

CREATE TABLE DimDate(
    DateKey_SK           DATETIME                NOT NULL,
    DateKey              INT                     NOT NULL,
    DayNumberOfWeek      TINYINT                 NOT NULL,
    DayNumberOfMonth     TINYINT                 NOT NULL,
    DayNumberOfYear      SMALLINT                NOT NULL,
    WeekNumberOfYear     TINYINT                 NOT NULL,
    MonthName            NATIONAL VARCHAR(10)    NOT NULL,
    MonthNumberOfYear    TINYINT                 NOT NULL,
    CalenderYear         TINYINT                 NOT NULL,
    CalenderQuarter      TINYINT                 NOT NULL,
    CalenderSemester     TINYINT                 NOT NULL,
    FiscalQuarter        TINYINT                 NOT NULL,
    FiscalYear           TINYINT                 NOT NULL,
    FiscalSemester       TINYINT                 NOT NULL,
    PRIMARY KEY (DateKey_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimEmployee 
--

CREATE TABLE DimEmployee(
    Employee_SK          INT                     AUTO_INCREMENT,
    EmployeeID           INT                     NOT NULL,
    CurrentFlag          BINARY(1)               NOT NULL,
    NationalIDNumber     NATIONAL VARCHAR(15)    NOT NULL,
    LoginID              NATIONAL VARCHAR(25)    NOT NULL,
    OrganizationNode     CHAR(10)                NOT NULL,
    OrganizationLevel    NATIONAL VARCHAR(10)    NOT NULL,
    JobTitle             NATIONAL VARCHAR(50)    NOT NULL,
    MaritalStatus        BINARY(1)               NOT NULL,
    Gender               NATIONAL CHAR(1)        NOT NULL,
    SalariedFlag         BINARY(1)               NOT NULL,
    VacationHours        SMALLINT                NOT NULL,
    SickLevelHours       SMALLINT                NOT NULL,
    rowguid              BINARY(16)              NOT NULL,
    Geography_SK         INT,
    BirthDate            DATETIME,
    DateKey_SK           DATETIME                NOT NULL,
    PRIMARY KEY (Employee_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimEmployeePay 
--

CREATE TABLE DimEmployeePay(
    EmployeePay_SK             DATETIME          NOT NULL,
    EmployeePayId              DATETIME,
    RateChngeDateDurable_NK    DATETIME          NOT NULL,
    `Current Indicator`        BINARY(1)         NOT NULL,
    RateChangeDate             DATETIME          NOT NULL,
    Rate                       DECIMAL(10, 0)    NOT NULL,
    PayFrequency               TINYINT           NOT NULL,
    Employee_SK                INT,
    EffectiveDate              DATETIME,
    IneffectiveDate            DATETIME,
    ModifiedDate               DATETIME,
    PRIMARY KEY (EmployeePay_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimGeography 
--

CREATE TABLE DimGeography(
    Geography_SK    INT                     AUTO_INCREMENT,
    GeographyID     INT                     NOT NULL,
    Country         NATIONAL VARCHAR(20)    NOT NULL,
    State           NATIONAL VARCHAR(30)    NOT NULL,
    City            NATIONAL VARCHAR(30)    NOT NULL,
    ZipCode         NATIONAL VARCHAR(30)    NOT NULL,
    Address         NATIONAL VARCHAR(30)    NOT NULL,
    PRIMARY KEY (Geography_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProduct 
--

CREATE TABLE DimProduct(
    Product_SK                     INT                     AUTO_INCREMENT,
    ProductID                      INT                     NOT NULL,
    Weight                         DECIMAL(8, 2)           NOT NULL,
    Size                           NATIONAL VARCHAR(5)     NOT NULL,
    ProductNumber                  NATIONAL VARCHAR(25)    NOT NULL,
    Name                           NATIONAL VARCHAR(50)    NOT NULL,
    ShipMethod_SK                  INT,
    ProductModel_SK                INT,
    ProductStandardCost_SK         DATETIME,
    ProductCategory_SK             INT,
    ProductSubCategory_SK          INT,
    ProdCostHistStrDateTable_SK    DATETIME,
    ModifiedDate                   DATETIME,
    rowguid                        BINARY(16)              NOT NULL,
    PRIMARY KEY (Product_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductCategory 
--

CREATE TABLE DimProductCategory(
    ProductCategory_SK    INT                     AUTO_INCREMENT,
    ProductCategoryID     INT                     NOT NULL,
    rowguid               BINARY(16)              NOT NULL,
    Name                  NATIONAL VARCHAR(50)    NOT NULL,
    PRIMARY KEY (ProductCategory_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductInventory 
--

CREATE TABLE DimProductInventory(
    LocationID      INT                     NOT NULL,
    Product_SK      INT                     NOT NULL,
    Quantity        SMALLINT                NOT NULL,
    Shelf           NATIONAL VARCHAR(10)    NOT NULL,
    rowguid         BINARY(16)              NOT NULL,
    Bin             TINYINT                 NOT NULL,
    ModifiedDate    DATETIME                NOT NULL,
    PRIMARY KEY (LocationID, Product_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductListPrice 
--

CREATE TABLE DimProductListPrice(
    ProductListPrice_SK         DATETIME          NOT NULL,
    ProdLisStrDateDurable_SK    DATETIME          NOT NULL,
    ProductListPriceID_SK       DATETIME          NOT NULL,
    StartDate_NK                DATETIME          NOT NULL,
    CurrentIndicator            BINARY(1)         NOT NULL,
    ListPrice                   DECIMAL(10, 0)    NOT NULL,
    IneffectiveDate             DATETIME,
    EffectiveDate               DATETIME,
    ModifiedDate                DATETIME,
    EndDate                     DATETIME          NOT NULL,
    PRIMARY KEY (ProductListPrice_SK, ProdLisStrDateDurable_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductModel 
--

CREATE TABLE DimProductModel(
    ProductModel_SK       INT                     AUTO_INCREMENT,
    ProductModelId        INT                     NOT NULL,
    rowguid               BINARY(16)              NOT NULL,
    Instructions          LONGBLOB                NOT NULL,
    CatalogDescription    LONGBLOB                NOT NULL,
    Name                  NATIONAL VARCHAR(50),
    PRIMARY KEY (ProductModel_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductStandardCost 
--

CREATE TABLE DimProductStandardCost(
    ProductStandardCost_SK       DATETIME          NOT NULL,
    ProdCosHisStrDateTable_SK    DATETIME          NOT NULL,
    CurrentIndicator             BINARY(1)         NOT NULL,
    CostPrice                    DECIMAL(10, 0)    NOT NULL,
    StartDate_NK                 DATETIME          NOT NULL,
    IneffectiveDate              DATETIME,
    EffectiveDate                DATETIME,
    ModifiedDate                 DATETIME,
    EndDate                      DATETIME,
    PRIMARY KEY (ProductStandardCost_SK, ProdCosHisStrDateTable_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductSubCategory 
--

CREATE TABLE DimProductSubCategory(
    ProductSubCategory_SK    INT                     AUTO_INCREMENT,
    ProductSubCategoryID     CHAR(10)                NOT NULL,
    rowguid                  BINARY(16)              NOT NULL,
    Name                     NATIONAL VARCHAR(50)    NOT NULL,
    ModifiedDate             DATETIME,
    PRIMARY KEY (ProductSubCategory_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductVendor 
--

CREATE TABLE DimProductVendor(
    ProductVendor_SK        INT               AUTO_INCREMENT,
    ProductVendorID         INT               NOT NULL,
    AverageLoadTime         INT               NOT NULL,
    StandardPrice           DECIMAL(10, 0)    NOT NULL,
    MinOrderqty             INT               NOT NULL,
    MaxOrderQty             INT               NOT NULL,
    OnOrderQty              INT               NOT NULL,
    ProductOrderDetailID    INT,
    LastReceiptDate         DATETIME,
    DateKey_SK              DATETIME          NOT NULL,
    PRIMARY KEY (ProductVendor_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimSalesTerritory 
--

CREATE TABLE DimSalesTerritory(
    SalesTerritory_SK    INT                     NOT NULL,
    SalesTerritoryID     INT                     NOT NULL,
    rowguid              BINARY(16)              NOT NULL,
    CostLastYear         DECIMAL(10, 2)          NOT NULL,
    CostYTD              DECIMAL(10, 2)          NOT NULL,
    SalesLastYear        DECIMAL(10, 2)          NOT NULL,
    SalesYTD             DECIMAL(10, 2)          NOT NULL,
    Group                NATIONAL VARCHAR(50)    NOT NULL,
    Name                 NATIONAL VARCHAR(50)    NOT NULL,
    PRIMARY KEY (SalesTerritory_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimShipMethod 
--

CREATE TABLE DimShipMethod(
    ShipMethod_SK    INT                     AUTO_INCREMENT,
    ShipMethodID     INT                     NOT NULL,
    ShipRate         DECIMAL(10, 2)          NOT NULL,
    ShipBase         DECIMAL(10, 2)          NOT NULL,
    Name             NATIONAL VARCHAR(50)    NOT NULL,
    PRIMARY KEY (ShipMethod_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimVendor 
--

CREATE TABLE DimVendor(
    Vendor_SK                  INT                       AUTO_INCREMENT,
    VendorID                   INT                       NOT NULL,
    PrefferedVendorStatus      BINARY(1)                 NOT NULL,
    ActiveFlag                 BINARY(1)                 NOT NULL,
    PurchasingWebServiceURL    NATIONAL VARCHAR(1024)    NOT NULL,
    AccountNumber              NATIONAL VARCHAR(15)      NOT NULL,
    Name                       NATIONAL VARCHAR(50)      NOT NULL,
    CreditRating               TINYINT                   NOT NULL,
    Geography_SK               INT,
    DateKey_SK                 DATETIME                  NOT NULL,
    VendorContact_SK           INT,
    PRIMARY KEY (Vendor_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimVendorContacts 
--

CREATE TABLE DimVendorContacts(
    VendorContact_SK        INT                     NOT NULL,
    Title                   NATIONAL VARCHAR(30),
    FirstName               NATIONAL VARCHAR(50),
    MiddleName              NATIONAL VARCHAR(50),
    LastName                NATIONAL VARCHAR(50),
    BusinessEntittyID_NK    INT                     NOT NULL,
    ContactType             NATIONAL VARCHAR(50)    NOT NULL,
    PhoneNumber             NATIONAL VARCHAR(25),
    PhoneNumberType         NATIONAL VARCHAR(50),
    EmailAddress            NATIONAL VARCHAR(50),
    EmailPromotion          INT                     NOT NULL,
    VendorID_SK             INT,
    SOR_ID                  INT,
    ETLLoadID               INT,
    ETLLoadDate             DATETIME                NOT NULL,
    DI_Job_ID               INT                     NOT NULL,
    DI_Create_Date          DATE                    NOT NULL,
    DI_Modified_Date        DATE                    NOT NULL,
    PRIMARY KEY (VendorContact_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactOrderDetail 
--

CREATE TABLE FactOrderDetail(
    ProductOrderDetailID    INT               AUTO_INCREMENT,
    StockedQty              DECIMAL(8, 2)     NOT NULL,
    OrderQty                SMALLINT          NOT NULL,
    UnitPrice               DECIMAL(10, 0)    NOT NULL,
    LineTotal               DECIMAL(10, 0)    NOT NULL,
    RejectedQty             DECIMAL(8, 2)     NOT NULL,
    RecievedQty             DECIMAL(8, 2)     NOT NULL,
    PurchaseOrderID         INT,
    ModifiedDate            DATETIME,
    DueDate                 DATETIME,
    Product_SK              INT,
    PRIMARY KEY (ProductOrderDetailID)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactPurchaseOrderHeader 
--

CREATE TABLE FactPurchaseOrderHeader(
    PurchaseOrderID     INT               AUTO_INCREMENT,
    RevisionNumber      TINYINT           NOT NULL,
    Status              TINYINT           NOT NULL,
    TaxAmt              DECIMAL(10, 2)    NOT NULL,
    SubTotal            DECIMAL(10, 2)    NOT NULL,
    TotalDue            DECIMAL(10, 2)    NOT NULL,
    Freight             DECIMAL(10, 2)    NOT NULL,
    Employee_SK         INT,
    Vendor_SK           INT,
    ProductVendor_SK    INT,
    ShipMethod_SK       INT,
    Geography_SK        INT,
    ModifiedDate        DATETIME,
    ShipDate            DATETIME,
    OrderDate           DATETIME,
    PRIMARY KEY (PurchaseOrderID)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimEmployee 
--

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimGeography234 
    FOREIGN KEY (Geography_SK)
    REFERENCES DimGeography(Geography_SK)
;

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimDate246 
    FOREIGN KEY (BirthDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimDate272 
    FOREIGN KEY (DateKey_SK)
    REFERENCES DimDate(DateKey_SK)
;


-- 
-- TABLE: DimEmployeePay 
--

ALTER TABLE DimEmployeePay ADD CONSTRAINT RefDimDate254 
    FOREIGN KEY (EffectiveDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimEmployeePay ADD CONSTRAINT RefDimDate255 
    FOREIGN KEY (EffectiveDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimEmployeePay ADD CONSTRAINT RefDimDate256 
    FOREIGN KEY (IneffectiveDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimEmployeePay ADD CONSTRAINT RefDimDate261 
    FOREIGN KEY (EmployeePayId)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimEmployeePay ADD CONSTRAINT RefDimEmployee262 
    FOREIGN KEY (Employee_SK)
    REFERENCES DimEmployee(Employee_SK)
;

ALTER TABLE DimEmployeePay ADD CONSTRAINT RefDimDate270 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
;


-- 
-- TABLE: DimProduct 
--

ALTER TABLE DimProduct ADD CONSTRAINT RefDimShipMethod229 
    FOREIGN KEY (ShipMethod_SK)
    REFERENCES DimShipMethod(ShipMethod_SK)
;

ALTER TABLE DimProduct ADD CONSTRAINT RefDimProductSubCategory239 
    FOREIGN KEY (ProductSubCategory_SK)
    REFERENCES DimProductSubCategory(ProductSubCategory_SK)
;

ALTER TABLE DimProduct ADD CONSTRAINT RefDimProductModel240 
    FOREIGN KEY (ProductModel_SK)
    REFERENCES DimProductModel(ProductModel_SK)
;

ALTER TABLE DimProduct ADD CONSTRAINT RefDimDate241 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimProduct ADD CONSTRAINT RefDimProductStandardCost242 
    FOREIGN KEY (ProductStandardCost_SK, ProdCostHistStrDateTable_SK)
    REFERENCES DimProductStandardCost(ProductStandardCost_SK, ProdCosHisStrDateTable_SK)
;

ALTER TABLE DimProduct ADD CONSTRAINT RefDimProductCategory243 
    FOREIGN KEY (ProductCategory_SK)
    REFERENCES DimProductCategory(ProductCategory_SK)
;


-- 
-- TABLE: DimProductInventory 
--

ALTER TABLE DimProductInventory ADD CONSTRAINT RefDimDate231 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimProductInventory ADD CONSTRAINT RefDimProduct264 
    FOREIGN KEY (Product_SK)
    REFERENCES DimProduct(Product_SK)
;

ALTER TABLE DimProductInventory ADD CONSTRAINT RefDimGeography266 
    FOREIGN KEY (LocationID)
    REFERENCES DimGeography(Geography_SK)
;


-- 
-- TABLE: DimProductListPrice 
--

ALTER TABLE DimProductListPrice ADD CONSTRAINT RefDimDate228 
    FOREIGN KEY (EndDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimProductListPrice ADD CONSTRAINT RefDimDate248 
    FOREIGN KEY (ProdLisStrDateDurable_SK)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimProductListPrice ADD CONSTRAINT RefDimDate257 
    FOREIGN KEY (IneffectiveDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimProductListPrice ADD CONSTRAINT RefDimDate259 
    FOREIGN KEY (EffectiveDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimProductListPrice ADD CONSTRAINT RefDimDate268 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
;


-- 
-- TABLE: DimProductStandardCost 
--

ALTER TABLE DimProductStandardCost ADD CONSTRAINT RefDimDate227 
    FOREIGN KEY (EndDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimProductStandardCost ADD CONSTRAINT RefDimDate249 
    FOREIGN KEY (ProdCosHisStrDateTable_SK)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimProductStandardCost ADD CONSTRAINT RefDimDate258 
    FOREIGN KEY (IneffectiveDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimProductStandardCost ADD CONSTRAINT RefDimDate260 
    FOREIGN KEY (EffectiveDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimProductStandardCost ADD CONSTRAINT RefDimDate274 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
;


-- 
-- TABLE: DimProductSubCategory 
--

ALTER TABLE DimProductSubCategory ADD CONSTRAINT RefDimDate245 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
;


-- 
-- TABLE: DimProductVendor 
--

ALTER TABLE DimProductVendor ADD CONSTRAINT RefDimDate247 
    FOREIGN KEY (LastReceiptDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimProductVendor ADD CONSTRAINT RefFactOrderDetail263 
    FOREIGN KEY (ProductOrderDetailID)
    REFERENCES FactOrderDetail(ProductOrderDetailID)
;

ALTER TABLE DimProductVendor ADD CONSTRAINT RefDimDate267 
    FOREIGN KEY (DateKey_SK)
    REFERENCES DimDate(DateKey_SK)
;


-- 
-- TABLE: DimSalesTerritory 
--

ALTER TABLE DimSalesTerritory ADD CONSTRAINT RefDimGeography271 
    FOREIGN KEY (SalesTerritory_SK)
    REFERENCES DimGeography(Geography_SK)
;


-- 
-- TABLE: DimVendor 
--

ALTER TABLE DimVendor ADD CONSTRAINT RefDimGeography235 
    FOREIGN KEY (Geography_SK)
    REFERENCES DimGeography(Geography_SK)
;

ALTER TABLE DimVendor ADD CONSTRAINT RefDimDate273 
    FOREIGN KEY (DateKey_SK)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE DimVendor ADD CONSTRAINT RefDimVendorContacts275 
    FOREIGN KEY (VendorContact_SK)
    REFERENCES DimVendorContacts(VendorContact_SK)
;


-- 
-- TABLE: FactOrderDetail 
--

ALTER TABLE FactOrderDetail ADD CONSTRAINT RefDimDate233 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE FactOrderDetail ADD CONSTRAINT RefDimProduct238 
    FOREIGN KEY (Product_SK)
    REFERENCES DimProduct(Product_SK)
;

ALTER TABLE FactOrderDetail ADD CONSTRAINT RefDimDate253 
    FOREIGN KEY (DueDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE FactOrderDetail ADD CONSTRAINT RefFactPurchaseOrderHeader265 
    FOREIGN KEY (PurchaseOrderID)
    REFERENCES FactPurchaseOrderHeader(PurchaseOrderID)
;


-- 
-- TABLE: FactPurchaseOrderHeader 
--

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimVendor230 
    FOREIGN KEY (Vendor_SK)
    REFERENCES DimVendor(Vendor_SK)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimProductVendor232 
    FOREIGN KEY (ProductVendor_SK)
    REFERENCES DimProductVendor(ProductVendor_SK)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimShipMethod236 
    FOREIGN KEY (ShipMethod_SK)
    REFERENCES DimShipMethod(ShipMethod_SK)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimGeography237 
    FOREIGN KEY (Geography_SK)
    REFERENCES DimGeography(Geography_SK)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimDate244 
    FOREIGN KEY (ModifiedDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimDate250 
    FOREIGN KEY (ShipDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimDate251 
    FOREIGN KEY (ShipDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimDate252 
    FOREIGN KEY (OrderDate)
    REFERENCES DimDate(DateKey_SK)
;

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimEmployee269 
    FOREIGN KEY (Employee_SK)
    REFERENCES DimEmployee(Employee_SK)
;


