-- Chinook_DW Schema
-- MySQL
-- rick sherman
-- 2020-10-04

-- USE chinook_dw
-- GO


drop TABLE if exists Dim_Artist;

CREATE TABLE Dim_Artist
(
  ArtistSK         int AUTO_INCREMENT  NOT NULL,
  ArtistId         int  NOT NULL,  -- NK
  ArtistName       VARCHAR(120) NULL,
  
  SOR_ID             int NULL,
  --  SOR_LoadDate       datetime(3) NULL,
  --  SOR_UpdateDate    datetime(3) NULL,
  DI_Job_ID          varchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT current_timestamp,
  DI_Modified_Date   datetime NOT NULL  DEFAULT current_timestamp,
PRIMARY KEY (ArtistSK)
);


drop TABLE if exists Dim_Album;

CREATE TABLE Dim_Album
(
  AlbumSK         int AUTO_INCREMENT  NOT NULL,
  AlbumId             int  NOT NULL,  -- NK
  AlbumTitle       VARCHAR(120) NULL,
  ArtistSK             int  NOT NULL,  -- FK
  
  SOR_ID             int NULL,
  --  SOR_LoadDate       datetime(3) NULL,
  --  SOR_UpdateDate    datetime(3) NULL,
  DI_Job_ID          varchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT current_timestamp,
  DI_Modified_Date   datetime NOT NULL  DEFAULT current_timestamp,
PRIMARY KEY (AlbumSK)
);

drop TABLE if exists Dim_Composer;

CREATE TABLE Dim_Composer
(
  ComposerSK         int AUTO_INCREMENT  NOT NULL,
  ComposerName       VARCHAR(220) NULL,
  
  SOR_ID             int NULL,
  --  SOR_LoadDate       datetime(3) NULL,
  --  SOR_UpdateDate    datetime(3) NULL,
  DI_Job_ID          varchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT current_timestamp,
  DI_Modified_Date   datetime NOT NULL  DEFAULT current_timestamp,
PRIMARY KEY (ComposerSK)
);

drop TABLE if exists Dim_Employee;

CREATE TABLE Dim_Employee
(
    EmployeeSK         int AUTO_INCREMENT  NOT NULL,
    EmployeeId INT NOT NULL, -- NK

    LastName varchar(20) NOT NULL,
    FirstName varchar(20) NOT NULL,

    Title VARCHAR(30),

    ReportsToSK INT, -- EmployeeSK  
   -- ReportsTo INT,

    BirthDateSK int null,
    BirthDate DATETIME(3),
    HireDateSK int null,
    HireDate DATETIME(3),

    EmployeeAddress VARCHAR(70),
    EmployeePostalCode VARCHAR(10),
    EmployeeGeoSK int null, 

    -- City VARCHAR(40),
    -- State VARCHAR(40),
    -- Country VARCHAR(40),

    Phone VARCHAR(24),
    Fax VARCHAR(24),
    Email VARCHAR(60),
  
  SOR_ID             int NULL,
  --  SOR_LoadDate       datetime(3) NULL,
  --  SOR_UpdateDate    datetime(3) NULL,
  DI_Job_ID          varchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT current_timestamp,
  DI_Modified_Date   datetime NOT NULL  DEFAULT current_timestamp,
PRIMARY KEY (EmployeeSK)
);

drop TABLE if exists Dim_Customer;

CREATE TABLE Dim_Customer
(
  CustomerSK       int AUTO_INCREMENT  NOT NULL,
  CustomerId       int  NOT NULL,  -- NK
  FirstName         VARCHAR(40) NOT NULL,
  LastName         varchar(20) NOT NULL,
  Company          VARCHAR(80) NULL,

   CustomerAddress VARCHAR(70) NULL,  
   CustomerPostalCode VARCHAR(10) NULL, 
   CustomerGeoSK            int          not null,

  Phone          VARCHAR(24) NULL,
  Fax            VARCHAR(24) NULL,
  Email          VARCHAR(60) NOT NULL,
  EmployeeSK   int NULL,     -- SupportRepId  

  SOR_ID             int NULL,
  --  SOR_LoadDate       datetime(3) NULL,
  --  SOR_UpdateDate    datetime(3) NULL,
  DI_Job_ID          varchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT current_timestamp,
  DI_Modified_Date   datetime NOT NULL  DEFAULT current_timestamp,
PRIMARY KEY (CustomerSK)
);


drop TABLE if exists Dim_Date;

CREATE TABLE Dim_Date
(
  DateSK                  int NOT NULL,
  FullDateAK             date NOT NULL,
  DayNumberOfWeek        int NOT NULL,
  DayNameOfWeek          VARCHAR(10) NOT NULL,
  DayNumberOfMonth       int NOT NULL,
  DayNumberOfYear        int NOT NULL,
  WeekNumberOfYear       int NOT NULL,
  MonthName       VARCHAR(10) NOT NULL,
  MonthNumberOfYear      int NOT NULL,
  CalendarQuarter        int NOT NULL,
  CalendarYear           smallint NOT NULL,
  
  SOR_ID             int NULL,
  --  SOR_LoadDate       datetime(3) NULL,
  --  SOR_UpdateDate    datetime(3) NULL,
  DI_Job_ID          varchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT current_timestamp,
  DI_Modified_Date   datetime NOT NULL  DEFAULT current_timestamp,
PRIMARY KEY (DateSK)
);


drop TABLE if exists Dim_Genre;

CREATE TABLE Dim_Genre
(
    GenreSK       int AUTO_INCREMENT  NOT NULL,
    GenreId INT NOT NULL, -- NK
    GenreName VARCHAR(120),

  SOR_ID             int NULL,
  --  SOR_LoadDate       datetime(3) NULL,
  --  SOR_UpdateDate    datetime(3) NULL,
  DI_Job_ID          varchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT current_timestamp,
  DI_Modified_Date   datetime NOT NULL  DEFAULT current_timestamp,
PRIMARY KEY (GenreSK)
);


drop TABLE if exists Dim_Geography;

CREATE TABLE Dim_Geography
(
    GeoSK int AUTO_INCREMENT NOT NULL,

   --   Address VARCHAR(70) NULL,  
   --  PostalCode VARCHAR(10) NULL, 
        City VARCHAR(40) NULL,
        State VARCHAR(40) NULL,
        Country VARCHAR(40) NULL,

  SOR_ID             int NULL,
  --  SOR_LoadDate       datetime(3) NULL,
  --  SOR_UpdateDate    datetime(3) NULL,
  DI_Job_ID          varchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT current_timestamp,
  DI_Modified_Date   datetime NOT NULL  DEFAULT current_timestamp,
PRIMARY KEY (GeoSK)
);


drop TABLE if exists Dim_MediaType;

CREATE TABLE Dim_MediaType
(
    MediaTypeSK   int AUTO_INCREMENT NOT NULL,
    MediaTypeId INT NULL,  -- NK
    MediaTypeName VARCHAR(120),

  SOR_ID             int NULL,
  --  SOR_LoadDate       datetime(3) NULL,
  --  SOR_UpdateDate    datetime(3) NULL,
  DI_Job_ID          varchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT current_timestamp,
  DI_Modified_Date   datetime NOT NULL  DEFAULT current_timestamp,
PRIMARY KEY (MediaTypeSK)
);


drop TABLE if exists Dim_Song;

CREATE TABLE Dim_Song
(
  SongSK           int AUTO_INCREMENT  NOT NULL,
  TrackId             int  NOT NULL, -- NK
  SongName         VARCHAR(200) NOT NULL,
   AlbumSK            int NULL, 
  ArtistSK         int NOT NULL, -- ArtistId
  MediaTypeSK      int NOT NULL,  
  GenreSK          int NULL, 
  ComposerSK       int NULL,
  
  SongPlayTime     int NOT NULL, -- Milliseconds
  SongLength       int NULL,  -- Bytes
  UnitPrice        numeric(15, 2) NOT NULL,
  
  SOR_ID             int NULL,
  --  SOR_LoadDate       datetime(3) NULL,
  --  SOR_UpdateDate    datetime(3) NULL,
  DI_Job_ID          varchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT current_timestamp,
  DI_Modified_Date   datetime NOT NULL  DEFAULT current_timestamp,
PRIMARY KEY (SongSK)
);


drop TABLE if exists Dim_Playlist;

CREATE TABLE Dim_Playlist
(
  PlaylistSK      int AUTO_INCREMENT  NOT NULL,
  PlaylistId      int  NOT NULL, -- NK
  PlaylistName    VARCHAR(120) NULL,
  SongSK          int NOT NULL,
  
  SOR_ID             int NULL,
  --  SOR_LoadDate       datetime(3) NULL,
  --  SOR_UpdateDate    datetime(3) NULL,
  DI_Job_ID          varchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT current_timestamp,
  DI_Modified_Date   datetime NOT NULL  DEFAULT current_timestamp,
PRIMARY KEY (PlaylistSK)
);

drop TABLE if exists Dim_PlaylistTrack;

CREATE TABLE Dim_PlaylistTrack
(
    PlaylistSK      INT NOT NULL,
    SongSK          INT NOT NULL,

  SOR_ID             int NULL,
  --  SOR_LoadDate       datetime(3) NULL,
  --  SOR_UpdateDate    datetime(3) NULL,
  DI_Job_ID          varchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT current_timestamp,
  DI_Modified_Date   datetime NOT NULL  DEFAULT current_timestamp,
PRIMARY KEY (PlaylistSK, SongSK)
);


drop TABLE if exists Fact_Sales;

CREATE TABLE Fact_Sales
(   
  SalesSK                 int AUTO_INCREMENT  NOT NULL,
  CustomerSK         int NOT NULL,
  InvoiceDateSK      int NOT NULL,
  InvoiceDate           datetime(3) NOT NULL,

   BillingAddress VARCHAR(70) NULL,  
   BillingPostalCode VARCHAR(10) NULL, 
   BillingGeoSK       int NOT NULL,

   SongSK                int NOT NULL,

  SalesQuantity       int NOT NULL,
  SalesAmount        numeric(15, 2) NOT NULL,

  InvoiceLineId      int NOT NULL,
  InvoiceId               int NOT NULL,

  SOR_ID             int NULL,
  --  SOR_LoadDate       datetime(3) NULL,
  --  SOR_UpdateDate    datetime(3) NULL,
  DI_Job_ID          varchar(20) NULL,
  DI_Create_Date     datetime NOT NULL  DEFAULT current_timestamp,
  DI_Modified_Date   datetime NOT NULL  DEFAULT current_timestamp,
PRIMARY KEY (SalesSK)
);
