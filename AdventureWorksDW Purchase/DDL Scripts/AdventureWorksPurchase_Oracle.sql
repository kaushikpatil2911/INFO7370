--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Adv work pur model.DM1
--
-- Date Created : Thursday, October 08, 2020 13:38:20
-- Target DBMS : Oracle 12c
--

-- 
-- TABLE: DimDate 
--

CREATE TABLE DimDate(
    DateKey_SK           TIMESTAMP(6)     NOT NULL,
    DateKey              NUMBER(38, 0)    NOT NULL,
    DayNumberOfWeek      NUMBER(3, 0)     NOT NULL,
    DayNumberOfMonth     NUMBER(3, 0)     NOT NULL,
    DayNumberOfYear      SMALLINT         NOT NULL,
    WeekNumberOfYear     NUMBER(3, 0)     NOT NULL,
    MonthName            NVARCHAR2(10)    NOT NULL,
    MonthNumberOfYear    NUMBER(3, 0)     NOT NULL,
    CalenderYear         NUMBER(3, 0)     NOT NULL,
    CalenderQuarter      NUMBER(3, 0)     NOT NULL,
    CalenderSemester     NUMBER(3, 0)     NOT NULL,
    FiscalQuarter        NUMBER(3, 0)     NOT NULL,
    FiscalYear           NUMBER(3, 0)     NOT NULL,
    FiscalSemester       NUMBER(3, 0)     NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY (DateKey_SK)
)
;



-- 
-- TABLE: DimEmployee 
--

CREATE TABLE DimEmployee(
    Employee_SK          NUMBER(38, 0)    NOT NULL,
    EmployeeID           NUMBER(38, 0)    NOT NULL,
    CurrentFlag          RAW(1)           NOT NULL,
    NationalIDNumber     NVARCHAR2(15)    NOT NULL,
    LoginID              NVARCHAR2(25)    NOT NULL,
    OrganizationNode     CHAR(10)         NOT NULL,
    OrganizationLevel    NVARCHAR2(10)    NOT NULL,
    JobTitle             NVARCHAR2(50)    NOT NULL,
    MaritalStatus        RAW(1)           NOT NULL,
    Gender               NCHAR(1)         NOT NULL,
    SalariedFlag         RAW(1)           NOT NULL,
    VacationHours        SMALLINT         NOT NULL,
    SickLevelHours       SMALLINT         NOT NULL,
    rowguid              RAW(16)          NOT NULL,
    Geography_SK         NUMBER(38, 0),
    BirthDate            TIMESTAMP(6),
    DateKey_SK           TIMESTAMP(6)     NOT NULL,
    CONSTRAINT PK1_2 PRIMARY KEY (Employee_SK)
)
;



-- 
-- TABLE: DimEmployeePay 
--

CREATE TABLE DimEmployeePay(
    EmployeePay_SK             TIMESTAMP(6)     NOT NULL,
    EmployeePayId              TIMESTAMP(6),
    RateChngeDateDurable_NK    TIMESTAMP(6)     NOT NULL,
    "Current Indicator"        RAW(1)           NOT NULL,
    RateChangeDate             TIMESTAMP(6)     NOT NULL,
    Rate                       NUMBER(10, 0)    NOT NULL,
    PayFrequency               NUMBER(3, 0)     NOT NULL,
    Employee_SK                NUMBER(38, 0),
    EffectiveDate              TIMESTAMP(6),
    IneffectiveDate            TIMESTAMP(6),
    ModifiedDate               TIMESTAMP(6),
    CONSTRAINT PK2 PRIMARY KEY (EmployeePay_SK)
)
;



-- 
-- TABLE: DimGeography 
--

CREATE TABLE DimGeography(
    Geography_SK    NUMBER(38, 0)    NOT NULL,
    GeographyID     NUMBER(38, 0)    NOT NULL,
    Country         NVARCHAR2(20)    NOT NULL,
    State           NVARCHAR2(30)    NOT NULL,
    City            NVARCHAR2(30)    NOT NULL,
    ZipCode         NVARCHAR2(30)    NOT NULL,
    Address         NVARCHAR2(30)    NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY (Geography_SK)
)
;



-- 
-- TABLE: DimProduct 
--

CREATE TABLE DimProduct(
    Product_SK                     NUMBER(38, 0)    NOT NULL,
    ProductID                      NUMBER(38, 0)    NOT NULL,
    Weight                         NUMBER(8, 2)     NOT NULL,
    Size                           NVARCHAR2(5)     NOT NULL,
    ProductNumber                  NVARCHAR2(25)    NOT NULL,
    Name                           NVARCHAR2(50)    NOT NULL,
    ShipMethod_SK                  NUMBER(38, 0),
    ProductModel_SK                NUMBER(38, 0),
    ProductStandardCost_SK         TIMESTAMP(6),
    ProductCategory_SK             NUMBER(38, 0),
    ProductSubCategory_SK          NUMBER(38, 0),
    ProdCostHistStrDateTable_SK    TIMESTAMP(6),
    ModifiedDate                   TIMESTAMP(6),
    rowguid                        RAW(16)          NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (Product_SK)
)
;



-- 
-- TABLE: DimProductCategory 
--

CREATE TABLE DimProductCategory(
    ProductCategory_SK    NUMBER(38, 0)    NOT NULL,
    ProductCategoryID     NUMBER(38, 0)    NOT NULL,
    rowguid               RAW(16)          NOT NULL,
    Name                  NVARCHAR2(50)    NOT NULL,
    CONSTRAINT PK1_1_2 PRIMARY KEY (ProductCategory_SK)
)
;



-- 
-- TABLE: DimProductInventory 
--

CREATE TABLE DimProductInventory(
    LocationID      NUMBER(38, 0)    NOT NULL,
    Product_SK      NUMBER(38, 0)    NOT NULL,
    Quantity        SMALLINT         NOT NULL,
    Shelf           NVARCHAR2(10)    NOT NULL,
    rowguid         RAW(16)          NOT NULL,
    Bin             NUMBER(3, 0)     NOT NULL,
    ModifiedDate    TIMESTAMP(6)     NOT NULL,
    CONSTRAINT PK1_1_2_1 PRIMARY KEY (LocationID, Product_SK)
)
;



-- 
-- TABLE: DimProductListPrice 
--

CREATE TABLE DimProductListPrice(
    ProductListPrice_SK         TIMESTAMP(6)     NOT NULL,
    ProdLisStrDateDurable_SK    TIMESTAMP(6)     NOT NULL,
    ProductListPriceID_SK       TIMESTAMP(6)     NOT NULL,
    StartDate_NK                TIMESTAMP(6)     NOT NULL,
    CurrentIndicator            RAW(1)           NOT NULL,
    ListPrice                   NUMBER(10, 0)    NOT NULL,
    IneffectiveDate             TIMESTAMP(6),
    EffectiveDate               TIMESTAMP(6),
    ModifiedDate                TIMESTAMP(6),
    EndDate                     TIMESTAMP(6)     NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY (ProductListPrice_SK, ProdLisStrDateDurable_SK)
)
;



-- 
-- TABLE: DimProductModel 
--

CREATE TABLE DimProductModel(
    ProductModel_SK       NUMBER(38, 0)    NOT NULL,
    ProductModelId        NUMBER(38, 0)    NOT NULL,
    rowguid               RAW(16)          NOT NULL,
    Instructions          SYS.XMLType      NOT NULL,
    CatalogDescription    SYS.XMLType      NOT NULL,
    Name                  NVARCHAR2(50),
    CONSTRAINT PK1_1_1 PRIMARY KEY (ProductModel_SK)
)
;



-- 
-- TABLE: DimProductStandardCost 
--

CREATE TABLE DimProductStandardCost(
    ProductStandardCost_SK       TIMESTAMP(6)     NOT NULL,
    ProdCosHisStrDateTable_SK    TIMESTAMP(6)     NOT NULL,
    CurrentIndicator             RAW(1)           NOT NULL,
    CostPrice                    NUMBER(10, 0)    NOT NULL,
    StartDate_NK                 TIMESTAMP(6)     NOT NULL,
    IneffectiveDate              TIMESTAMP(6),
    EffectiveDate                TIMESTAMP(6),
    ModifiedDate                 TIMESTAMP(6),
    EndDate                      TIMESTAMP(6),
    CONSTRAINT PK13 PRIMARY KEY (ProductStandardCost_SK, ProdCosHisStrDateTable_SK)
)
;



-- 
-- TABLE: DimProductSubCategory 
--

CREATE TABLE DimProductSubCategory(
    ProductSubCategory_SK    NUMBER(38, 0)    NOT NULL,
    ProductSubCategoryID     CHAR(10)         NOT NULL,
    rowguid                  RAW(16)          NOT NULL,
    Name                     NVARCHAR2(50)    NOT NULL,
    ModifiedDate             TIMESTAMP(6),
    CONSTRAINT PK1_1 PRIMARY KEY (ProductSubCategory_SK)
)
;



-- 
-- TABLE: DimProductVendor 
--

CREATE TABLE DimProductVendor(
    ProductVendor_SK        NUMBER(38, 0)    NOT NULL,
    ProductVendorID         NUMBER(38, 0)    NOT NULL,
    AverageLoadTime         NUMBER(38, 0)    NOT NULL,
    StandardPrice           NUMBER(10, 0)    NOT NULL,
    MinOrderqty             NUMBER(38, 0)    NOT NULL,
    MaxOrderQty             NUMBER(38, 0)    NOT NULL,
    OnOrderQty              NUMBER(38, 0)    NOT NULL,
    ProductOrderDetailID    NUMBER(38, 0),
    LastReceiptDate         TIMESTAMP(6),
    DateKey_SK              TIMESTAMP(6)     NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY (ProductVendor_SK)
)
;



-- 
-- TABLE: DimSalesTerritory 
--

CREATE TABLE DimSalesTerritory(
    SalesTerritory_SK    NUMBER(38, 0)    NOT NULL,
    SalesTerritoryID     NUMBER(38, 0)    NOT NULL,
    rowguid              RAW(16)          NOT NULL,
    CostLastYear         NUMBER(10, 2)    NOT NULL,
    CostYTD              NUMBER(10, 2)    NOT NULL,
    SalesLastYear        NUMBER(10, 2)    NOT NULL,
    SalesYTD             NUMBER(10, 2)    NOT NULL,
    Group                NVARCHAR2(50)    NOT NULL,
    Name                 NVARCHAR2(50)    NOT NULL,
    CONSTRAINT PK1_1_3 PRIMARY KEY (SalesTerritory_SK)
)
;



-- 
-- TABLE: DimShipMethod 
--

CREATE TABLE DimShipMethod(
    ShipMethod_SK    NUMBER(38, 0)    NOT NULL,
    ShipMethodID     NUMBER(38, 0)    NOT NULL,
    ShipRate         NUMBER(10, 2)    NOT NULL,
    ShipBase         NUMBER(10, 2)    NOT NULL,
    Name             NVARCHAR2(50)    NOT NULL,
    CONSTRAINT PK1_1_1_1 PRIMARY KEY (ShipMethod_SK)
)
;



-- 
-- TABLE: DimVendor 
--

CREATE TABLE DimVendor(
    Vendor_SK                  NUMBER(38, 0)      NOT NULL,
    VendorID                   NUMBER(38, 0)      NOT NULL,
    PrefferedVendorStatus      RAW(1)             NOT NULL,
    ActiveFlag                 RAW(1)             NOT NULL,
    PurchasingWebServiceURL    NVARCHAR2(1024)    NOT NULL,
    AccountNumber              NVARCHAR2(15)      NOT NULL,
    Name                       NVARCHAR2(50)      NOT NULL,
    CreditRating               NUMBER(3, 0)       NOT NULL,
    Geography_SK               NUMBER(38, 0),
    DateKey_SK                 TIMESTAMP(6)       NOT NULL,
    VendorContact_SK           NUMBER(38, 0),
    CONSTRAINT PK1_3 PRIMARY KEY (Vendor_SK)
)
;



-- 
-- TABLE: DimVendorContacts 
--

CREATE TABLE DimVendorContacts(
    VendorContact_SK        NUMBER(38, 0)    NOT NULL,
    Title                   NVARCHAR2(30),
    FirstName               NVARCHAR2(50),
    MiddleName              NVARCHAR2(50),
    LastName                NVARCHAR2(50),
    BusinessEntittyID_NK    NUMBER(38, 0)    NOT NULL,
    ContactType             NVARCHAR2(50)    NOT NULL,
    PhoneNumber             NVARCHAR2(25),
    PhoneNumberType         NVARCHAR2(50),
    EmailAddress            NVARCHAR2(50),
    EmailPromotion          NUMBER(38, 0)    NOT NULL,
    VendorID_SK             NUMBER(38, 0),
    SOR_ID                  NUMBER(38, 0),
    ETLLoadID               NUMBER(38, 0),
    ETLLoadDate             TIMESTAMP(6)     NOT NULL,
    DI_Job_ID               NUMBER(38, 0)    NOT NULL,
    DI_Create_Date          DATE             NOT NULL,
    DI_Modified_Date        DATE             NOT NULL,
    CONSTRAINT PK17 PRIMARY KEY (VendorContact_SK)
)
;



-- 
-- TABLE: FactOrderDetail 
--

CREATE TABLE FactOrderDetail(
    ProductOrderDetailID    NUMBER(38, 0)    NOT NULL,
    StockedQty              NUMBER(8, 2)     NOT NULL,
    OrderQty                SMALLINT         NOT NULL,
    UnitPrice               NUMBER(10, 0)    NOT NULL,
    LineTotal               NUMBER(10, 0)    NOT NULL,
    RejectedQty             NUMBER(8, 2)     NOT NULL,
    RecievedQty             NUMBER(8, 2)     NOT NULL,
    PurchaseOrderID         NUMBER(38, 0),
    ModifiedDate            TIMESTAMP(6),
    DueDate                 TIMESTAMP(6),
    Product_SK              NUMBER(38, 0),
    CONSTRAINT PK3 PRIMARY KEY (ProductOrderDetailID)
)
;



-- 
-- TABLE: FactPurchaseOrderHeader 
--

CREATE TABLE FactPurchaseOrderHeader(
    PurchaseOrderID     NUMBER(38, 0)    NOT NULL,
    RevisionNumber      NUMBER(3, 0)     NOT NULL,
    Status              NUMBER(3, 0)     NOT NULL,
    TaxAmt              NUMBER(10, 2)    NOT NULL,
    SubTotal            NUMBER(10, 2)    NOT NULL,
    TotalDue            NUMBER(10, 2)    NOT NULL,
    Freight             NUMBER(10, 2)    NOT NULL,
    Employee_SK         NUMBER(38, 0),
    Vendor_SK           NUMBER(38, 0),
    ProductVendor_SK    NUMBER(38, 0),
    ShipMethod_SK       NUMBER(38, 0),
    Geography_SK        NUMBER(38, 0),
    ModifiedDate        TIMESTAMP(6),
    ShipDate            TIMESTAMP(6),
    OrderDate           TIMESTAMP(6),
    CONSTRAINT PK2_1 PRIMARY KEY (PurchaseOrderID)
)
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


