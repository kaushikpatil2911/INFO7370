-- Chinook_DW Schema
-- rick sherman
-- 2020-09-30

USE chinook_dw
GO


drop TABLE if exists Dim_Artist;

CREATE TABLE Dim_Artist
(
  ArtistSK         int IDENTITY (1, 1) NOT NULL,
  ArtistId         int  NOT NULL,  -- NK
  ArtistName       nvarchar(120) NULL,
  
  SOR_ID             int NULL,
  SOR_LoadDate       datetime NULL,
  SOR_UpdateDate     datetime NULL,
  DI_Job_ID          nvarchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT getdate(),
  DI_Modified_Date   datetime NOT NULL  DEFAULT getdate(),
PRIMARY KEY CLUSTERED (ArtistSK)
);


drop TABLE if exists Dim_Album;

CREATE TABLE Dim_Album
(
  AlbumSK         int IDENTITY (1, 1) NOT NULL,
  AlbumId             int  NOT NULL,  -- NK
  AlbumTitle       nvarchar(120) NULL,
  ArtistSK             int  NOT NULL,  -- FK
  
  SOR_ID             int NULL,
  SOR_LoadDate       datetime NULL,
  SOR_UpdateDate     datetime NULL,
  DI_Job_ID          nvarchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT getdate(),
  DI_Modified_Date   datetime NOT NULL  DEFAULT getdate(),
PRIMARY KEY CLUSTERED (AlbumSK)
);

drop TABLE if exists Dim_Composer;

CREATE TABLE Dim_Composer
(
  ComposerSK         int IDENTITY (1, 1) NOT NULL,
  ComposerName       nvarchar(220) NULL,
  
  SOR_ID             int NULL,
  SOR_LoadDate       datetime NULL,
  SOR_UpdateDate     datetime NULL,
  DI_Job_ID          nvarchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT getdate(),
  DI_Modified_Date   datetime NOT NULL  DEFAULT getdate(),
PRIMARY KEY CLUSTERED (ComposerSK)
);

drop TABLE if exists Dim_Employee;

CREATE TABLE Dim_Employee
(
    EmployeeSK         int IDENTITY (1, 1) NOT NULL,
    EmployeeId INT NOT NULL, -- NK

    LastName NVARCHAR(20) NOT NULL,
    FirstName NVARCHAR(20) NOT NULL,

    Title NVARCHAR(30),

    ReportsToSK INT, -- EmployeeSK  
   -- ReportsTo INT,

    BirthDateSK int null,
    BirthDate DATETIME,
    HireDateSK int null,
    HireDate DATETIME,

    EmployeeAddress NVARCHAR(70),
    EmployeePostalCode NVARCHAR(10),
    EmployeeGeoSK int null, 

    -- City NVARCHAR(40),
    -- State NVARCHAR(40),
    -- Country NVARCHAR(40),

    Phone NVARCHAR(24),
    Fax NVARCHAR(24),
    Email NVARCHAR(60),
  
  SOR_ID             int NULL,
  SOR_LoadDate       datetime NULL,
  SOR_UpdateDate     datetime NULL,
  DI_Job_ID          nvarchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT getdate(),
  DI_Modified_Date   datetime NOT NULL  DEFAULT getdate(),
PRIMARY KEY CLUSTERED (EmployeeSK)
);

drop TABLE if exists Dim_Customer;

CREATE TABLE Dim_Customer
(
  CustomerSK       int IDENTITY (1, 1) NOT NULL,
  CustomerId       int  NOT NULL,  --NK
  FirstName         nvarchar(40) NOT NULL,
  LastName         nvarchar(20) NOT NULL,
  Company          nvarchar(80) NULL,

   CustomerAddress nvarchar(70) NULL,  
   CustomerPostalCode nvarchar(10) NULL, 
   CustomerGeoSK            int          not null,

  Phone          nvarchar(24) NULL,
  Fax            nvarchar(24) NULL,
  Email          nvarchar(60) NOT NULL,
  EmployeeSK   int NULL,     -- SupportRepId  

  SOR_ID             int NULL,
  SOR_LoadDate       datetime NULL,
  SOR_UpdateDate     datetime NULL,
  DI_Job_ID          nvarchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT getdate(),
  DI_Modified_Date   datetime NOT NULL  DEFAULT getdate(),
PRIMARY KEY CLUSTERED (CustomerSK)
);


drop TABLE if exists Dim_Date;

CREATE TABLE Dim_Date
(
  DateSK                  int NOT NULL,
  FullDateAK             date NOT NULL,
  DayNumberOfWeek        int NOT NULL,
  DayNameOfWeek          nvarchar(10) NOT NULL,
  DayNumberOfMonth       int NOT NULL,
  DayNumberOfYear        int NOT NULL,
  WeekNumberOfYear       int NOT NULL,
  MonthName       nvarchar(10) NOT NULL,
  MonthNumberOfYear      int NOT NULL,
  CalendarQuarter        int NOT NULL,
  CalendarYear           smallint NOT NULL,
  
  SOR_ID             int NULL,
  SOR_LoadDate       datetime NULL,
  SOR_UpdateDate     datetime NULL,
  DI_Job_ID          nvarchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT getdate(),
  DI_Modified_Date   datetime NOT NULL  DEFAULT getdate(),
PRIMARY KEY CLUSTERED (DateSK)
);


drop TABLE if exists Dim_Genre;

CREATE TABLE Dim_Genre
(
    GenreSK       int IDENTITY (1, 1) NOT NULL,
    GenreId INT NOT NULL, -- NK
    GenreName NVARCHAR(120),

  SOR_ID             int NULL,
  SOR_LoadDate       datetime NULL,
  SOR_UpdateDate     datetime NULL,
  DI_Job_ID          nvarchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT getdate(),
  DI_Modified_Date   datetime NOT NULL  DEFAULT getdate(),
PRIMARY KEY CLUSTERED (GenreSK)
);


drop TABLE if exists Dim_Geography;

CREATE TABLE Dim_Geography
(
    GeoSK int IDENTITY(1,1) NOT NULL,

   --   Address nvarchar(70) NULL,  
   --  PostalCode nvarchar(10) NULL, 
        City nvarchar(40) NULL,
        State nvarchar(40) NULL,
        Country nvarchar(40) NULL,

  SOR_ID             int NULL,
  SOR_LoadDate       datetime NULL,
  SOR_UpdateDate     datetime NULL,
  DI_Job_ID          nvarchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT getdate(),
  DI_Modified_Date   datetime NOT NULL  DEFAULT getdate(),
PRIMARY KEY CLUSTERED (GeoSK)
);


drop TABLE if exists Dim_MediaType;

CREATE TABLE Dim_MediaType
(
    MediaTypeSK   int IDENTITY(1,1) NOT NULL,
    MediaTypeId INT NULL,  -- NK
    MediaTypeName NVARCHAR(120),

  SOR_ID             int NULL,
  SOR_LoadDate       datetime NULL,
  SOR_UpdateDate     datetime NULL,
  DI_Job_ID          nvarchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT getdate(),
  DI_Modified_Date   datetime NOT NULL  DEFAULT getdate(),
PRIMARY KEY CLUSTERED (MediaTypeSK)
);


drop TABLE if exists Dim_Song;

CREATE TABLE Dim_Song
(
  SongSK           int IDENTITY (1, 1) NOT NULL,
  TrackId             int  NOT NULL, -- NK
  SongName         nvarchar(200) NOT NULL,
   AlbumSK            int NULL, 
  ArtistSK         int NOT NULL, --ArtistId
  MediaTypeSK      int NOT NULL,  
  GenreSK          int NULL, 
  ComposerSK       int NULL,
  
  SongPlayTime     int NOT NULL, -- Milliseconds
  SongLength       int NULL,  -- Bytes
  UnitPrice        numeric(15, 2) NOT NULL,
  
  SOR_ID             int NULL,
  SOR_LoadDate       datetime NULL,
  SOR_UpdateDate     datetime NULL,
  DI_Job_ID          nvarchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT getdate(),
  DI_Modified_Date   datetime NOT NULL  DEFAULT getdate(),
PRIMARY KEY CLUSTERED (SongSK)
);


drop TABLE if exists Dim_Playlist;

CREATE TABLE Dim_Playlist
(
  PlaylistSK      int IDENTITY (1, 1) NOT NULL,
  PlaylistId      int  NOT NULL, -- NK
  PlaylistName    nvarchar(120) NULL,
  SongSK          int NOT NULL,
  
  SOR_ID             int NULL,
  SOR_LoadDate       datetime NULL,
  SOR_UpdateDate     datetime NULL,
  DI_Job_ID          nvarchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT getdate(),
  DI_Modified_Date   datetime NOT NULL  DEFAULT getdate(),
PRIMARY KEY CLUSTERED (PlaylistSK)
);

drop TABLE if exists Dim_PlaylistTrack;

CREATE TABLE Dim_PlaylistTrack
(
    PlaylistSK      INT NOT NULL,
    SongSK          INT NOT NULL,

  SOR_ID             int NULL,
  SOR_LoadDate       datetime NULL,
  SOR_UpdateDate     datetime NULL,
  DI_Job_ID          nvarchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT getdate(),
  DI_Modified_Date   datetime NOT NULL  DEFAULT getdate(),
PRIMARY KEY CLUSTERED (PlaylistSK, SongSK)
);


drop TABLE if exists Fact_Sales;

CREATE TABLE Fact_Sales
(   
  SalesSK                 int IDENTITY (1, 1) NOT NULL,
  CustomerSK         int NOT NULL,
  InvoiceDateSK      int NOT NULL,
  InvoiceDate           datetime NOT NULL,

   BillingAddress nvarchar(70) NULL,  
   BillingPostalCode nvarchar(10) NULL, 
   BillingGeoSK       int NOT NULL,

   SongSK                int NOT NULL,

  SalesQuantity       int NOT NULL,
  SalesAmount        numeric(15, 2) NOT NULL,

  InvoiceLineId      int NOT NULL,
  InvoiceId               int NOT NULL,

  SOR_ID             int NULL,
  SOR_LoadDate       datetime NULL,
  SOR_UpdateDate     datetime NULL,
  DI_Job_ID          nvarchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT getdate(),
  DI_Modified_Date   datetime NOT NULL  DEFAULT getdate(),
PRIMARY KEY CLUSTERED (SalesSK)
);

---------------------------------------------------------------------------------------------------------
-- Views 
---------------------------------------------------------------------------------------------------------

create view Dim_Geography_Customer
as
SELECT GeoSK as CustomerGeoSK
       GeoSK as CustomerGeoSK,
      ,City
      ,State
      ,Country
  FROM Dim_Geography
  ;

  create view Dim_Geography_Billing
as
SELECT GeoSK as BillingGeoSK
       GeoSK as BillingGeoSK,
      ,City
      ,State
      ,Country
  FROM Dim_Geography
  ;

  create view Dim_Geography_Employee
as
SELECT GeoSK as EmployeeGeoSK
       GeoSK as EmployeeGeoSK,
      ,City
      ,State
      ,Country
  FROM Dim_Geography
  ;
create view Dim_DateInvoice as
SELECT
	DateSK as InvoiceDateSK,
	FullDateAK,
	DayNumberOfWeek,
	DayNameOfWeek,
	DayNumberOfMonth,
	DayNumberOfYear,
	WeekNumberOfYear,
	MonthNameDesc as MonthName,
	MonthNumberOfYear,
	CalendarQuarter,
	CalendarYear
FROM Dim_Date
go
;

create view Dim_DateHire
as
SELECT
	DateSK as HireDateSK,
	FullDateAK,
	DayNumberOfWeek,
	DayNameOfWeek,
	DayNumberOfMonth,
	DayNumberOfYear,
	WeekNumberOfYear,
	MonthNameDesc as MonthName,
	MonthNumberOfYear,
	CalendarQuarter,
	CalendarYear
FROM Dim_Date
go;

create view Dim_DateBirth
as
SELECT
	DateSK as BirthDateSK,
	FullDateAK,
	DayNumberOfWeek,
	DayNameOfWeek,
	DayNumberOfMonth,
	DayNumberOfYear,
	WeekNumberOfYear,
	MonthNameDesc as MonthName,
	MonthNumberOfYear,
	CalendarQuarter,
	CalendarYear
FROM Dim_Date
go
;

create view Dim_EmployeeManager as
SELECT
	EmployeeSK,
	EmployeeId,
	LastName,
	FirstName,
	Title,
	ReportsToSK,
	BirthDateSK,
	BirthDate,
	HireDateSK,
	HireDate,
	EmployeeAddress,
	EmployeePostalCode,
	EmployeeGeoSK,
	Phone,
	Fax,
	Email
FROM Dim_Employee
go
;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Chinook_DW foreign keys -----------------------------------------------------------------------------------------------------------------------------------------------------
/*
ALTER TABLE Fact_Sales ADD CONSTRAINT Fact_Sales_FK_BillingGeoSK FOREIGN KEY (BillingGeoSK) REFERENCES Dim_Geography(GeoSK);
ALTER TABLE Fact_Sales ADD CONSTRAINT Fact_Sales_FK_InvoiceDateSK FOREIGN KEY (InvoiceDateSK) REFERENCES Dim_Date(DateSK);

ALTER TABLE Dim_Employee ADD CONSTRAINT Employee_FK_HireDateSK FOREIGN KEY (HireDateSK) REFERENCES Dim_Date(DateSK);
ALTER TABLE Dim_Employee ADD CONSTRAINT Employee_FK_BirthDateSK FOREIGN KEY (BirthDateSK) REFERENCES Dim_Date(DateSK);

ALTER TABLE Dim_Employee ADD CONSTRAINT Employee_FK_ReportsToSK FOREIGN KEY (ReportsToSK) REFERENCES Dim_Employee(EmployeeSK);


ALTER TABLE Dim_Employee ADD CONSTRAINT Employee_FK_EmployeeGeoSK FOREIGN KEY (EmployeeGeoSK) REFERENCES Dim_Geography(GeoSK);

ALTER TABLE Dim_Customer ADD CONSTRAINT Employee_FK_CustomerGeoSK FOREIGN KEY (CustomerGeoSK) REFERENCES Dim_Geography(GeoSK);

*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------
--- alternative design
-------------------------------------------------------------------------------------------------------------------------------------------------------------
/* this is an fyi and not used in dimensioal model workshop

CREATE TABLE Dim_Address  -- alternative design to Dim_Geography
(
       AdressSK int IDENTITY(1,1) NOT NULL,

        Address nvarchar(70) NULL,  
        PostalCode nvarchar(10) NULL, 
        City nvarchar(40) NULL,
        State nvarchar(40) NULL,
        Country nvarchar(40) NULL,

  SOR_ID             int NULL,
  SOR_LoadDate       datetime NULL,
  SOR_UpdateDate     datetime NULL,
  DI_Job_ID          nvarchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT getdate(),
  DI_Modified_Date   datetime NOT NULL  DEFAULT getdate(),
PRIMARY KEY CLUSTERED (AddressSK)
);

CREATE TABLE Dim_Customer_Alt
(
  CustomerSK       int IDENTITY (1, 1) NOT NULL,
  CustomerId       int  NOT NULL,  --NK
  FirstName         nvarchar(40) NOT NULL,
  LastName         nvarchar(20) NOT NULL,
  Company          nvarchar(80) NULL,

   CustomerAddressSK            int          not null,

  Phone          nvarchar(24) NULL,
  Fax            nvarchar(24) NULL,
  Email          nvarchar(60) NOT NULL,
  EmployeeSK   int NULL,     -- SupportRepId  

  SOR_ID             int NULL,
  SOR_LoadDate       datetime NULL,
  SOR_UpdateDate     datetime NULL,
  DI_Job_ID          nvarchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT getdate(),
  DI_Modified_Date   datetime NOT NULL  DEFAULT getdate(),
PRIMARY KEY CLUSTERED (CustomerSK)
);

*/