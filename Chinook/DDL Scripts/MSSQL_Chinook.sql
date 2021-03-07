/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      ChinookModel.DM1
 *
 * Date Created : Wednesday, September 30, 2020 12:40:48
 * Target DBMS : Microsoft SQL Server 2017
 */

/* 
 * TABLE: DIm_Album 
 */

CREATE TABLE DIm_Album(
    [AlbumId_SK (PK)]  int             NOT NULL,
    [ArtistId (PK)]    int             NOT NULL,
    ArtistName         nvarchar(10)    NOT NULL,
    AlbumTitle         nvarchar(10)    NOT NULL,
    CONSTRAINT PK24 PRIMARY KEY NONCLUSTERED ([AlbumId_SK (PK)], [ArtistId (PK)])
)
go



IF OBJECT_ID('DIm_Album') IS NOT NULL
    PRINT '<<< CREATED TABLE DIm_Album >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIm_Album >>>'
go

/* 
 * TABLE: Dim_Customer 
 */

CREATE TABLE Dim_Customer(
    [CustomerId_SK (PK)]    int             NOT NULL,
    FirstName               nvarchar(40)    NOT NULL,
    LastName                nvarchar(40)    NOT NULL,
    Company                 nvarchar(40)    NOT NULL,
    Phone                   int             NOT NULL,
    Email                   int             NOT NULL,
    [GeographyKey_SK (PK)]  int             NOT NULL,
    CONSTRAINT PK22 PRIMARY KEY NONCLUSTERED ([CustomerId_SK (PK)])
)
go



IF OBJECT_ID('Dim_Customer') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Customer >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Customer >>>'
go

/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    [DateKey (PK)]  datetime        NOT NULL,
    Year            int             NOT NULL,
    Quarter         int             NOT NULL,
    Month           int             NOT NULL,
    Date            date            NOT NULL,
    Day             nvarchar(10)    NOT NULL,
    CONSTRAINT PK27 PRIMARY KEY NONCLUSTERED ([DateKey (PK)])
)
go



IF OBJECT_ID('Dim_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'
go

/* 
 * TABLE: Dim_Employee 
 */

CREATE TABLE Dim_Employee(
    [EmployeeId_SK (PK)]    int             NOT NULL,
    BirthDate               datetime        NOT NULL,
    Phone                   nvarchar(10)    NOT NULL,
    Email                   nvarchar(40)    NOT NULL,
    Title                   nvarchar(80)    NOT NULL,
    Fax                     nvarchar(10)    NOT NULL,
    HireDate                datetime        NOT NULL,
    FirstName               nvarchar(40)    NOT NULL,
    Lastname                nvarchar(40)    NOT NULL,
    [ReportsTo (FK)]        int             NOT NULL,
    [GeographyKey_SK (PK)]  int             NOT NULL,
    CONSTRAINT PK26 PRIMARY KEY NONCLUSTERED ([EmployeeId_SK (PK)])
)
go



IF OBJECT_ID('Dim_Employee') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Employee >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Employee >>>'
go

/* 
 * TABLE: Dim_Geography 
 */

CREATE TABLE Dim_Geography(
    [GeographyKey_SK (PK)]  int             NOT NULL,
    City                    nvarchar(40)    NOT NULL,
    State                   nvarchar(40)    NOT NULL,
    Country                 nvarchar(40)    NOT NULL,
    PostalCOde              nvarchar(10)    NOT NULL,
    CONSTRAINT PK23 PRIMARY KEY NONCLUSTERED ([GeographyKey_SK (PK)])
)
go



IF OBJECT_ID('Dim_Geography') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Geography >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Geography >>>'
go

/* 
 * TABLE: Dim_Playlist 
 */

CREATE TABLE Dim_Playlist(
    [Playlist_SK (PK)]         int             NOT NULL,
    PlaylistName               nvarchar(10)    NOT NULL,
    [TarckId_SK (PK)]          int             NOT NULL,
    [PlaylistId_SK (PK) (FK)]  int             NOT NULL,
    CONSTRAINT PK30 PRIMARY KEY NONCLUSTERED ([Playlist_SK (PK)])
)
go



IF OBJECT_ID('Dim_Playlist') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Playlist >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Playlist >>>'
go

/* 
 * TABLE: FactInvoice 
 */

CREATE TABLE FactInvoice(
    [Invoiceid_SK (PK)]        int               NOT NULL,
    [InvoiceLineId (PK)]       int               NOT NULL,
    [DateKey (PK) (FK)]        date              NOT NULL,
    [DateKey (PK)]             datetime          NOT NULL,
    BillingAddress             nvarchar(60)      NOT NULL,
    UnitPrice                  numeric(10, 2)    NOT NULL,
    Quantity                   int               NOT NULL,
    Total                      int               NULL,
    [GeographyKey_SK (PK)]     int               NOT NULL,
    [TarckId_SK (PK)]          int               NOT NULL,
    [PlaylistId_SK (PK) (FK)]  int               NOT NULL,
    [CustomerId_SK (PK)]       int               NOT NULL,
    [EmployeeId_SK (PK)]       int               NOT NULL,
    CONSTRAINT PK28 PRIMARY KEY NONCLUSTERED ([Invoiceid_SK (PK)], [InvoiceLineId (PK)], [DateKey (PK) (FK)], [DateKey (PK)])
)
go



IF OBJECT_ID('FactInvoice') IS NOT NULL
    PRINT '<<< CREATED TABLE FactInvoice >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactInvoice >>>'
go

/* 
 * TABLE: Track 
 */

CREATE TABLE Track(
    [TarckId_SK (PK)]          int             NOT NULL,
    [PlaylistId_SK (PK) (FK)]  int             NOT NULL,
    MediaName                  nvarchar(80)    NOT NULL,
    GenreName                  nvarchar(80)    NOT NULL,
    MediaTypeId                int             NOT NULL,
    GenreId                    int             NOT NULL,
    Composer                   nvarchar(80)    NOT NULL,
    TrackName                  nvarchar(80)    NOT NULL,
    Milliseconds               int             NOT NULL,
    Bytes                      int             NOT NULL,
    [AlbumId_SK (PK)]          int             NOT NULL,
    [ArtistId (PK)]            int             NOT NULL,
    CONSTRAINT PK25 PRIMARY KEY NONCLUSTERED ([TarckId_SK (PK)], [PlaylistId_SK (PK) (FK)])
)
go



IF OBJECT_ID('Track') IS NOT NULL
    PRINT '<<< CREATED TABLE Track >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Track >>>'
go

/* 
 * TABLE: Dim_Customer 
 */

ALTER TABLE Dim_Customer ADD CONSTRAINT RefDim_Geography44 
    FOREIGN KEY ([GeographyKey_SK (PK)])
    REFERENCES Dim_Geography([GeographyKey_SK (PK)])
go


/* 
 * TABLE: Dim_Employee 
 */

ALTER TABLE Dim_Employee ADD CONSTRAINT RefDim_Employee45 
    FOREIGN KEY ([EmployeeId_SK (PK)])
    REFERENCES Dim_Employee([EmployeeId_SK (PK)])
go

ALTER TABLE Dim_Employee ADD CONSTRAINT RefDim_Geography52 
    FOREIGN KEY ([GeographyKey_SK (PK)])
    REFERENCES Dim_Geography([GeographyKey_SK (PK)])
go


/* 
 * TABLE: Dim_Playlist 
 */

ALTER TABLE Dim_Playlist ADD CONSTRAINT RefTrack40 
    FOREIGN KEY ([TarckId_SK (PK)], [PlaylistId_SK (PK) (FK)])
    REFERENCES Track([TarckId_SK (PK)], [PlaylistId_SK (PK) (FK)])
go


/* 
 * TABLE: FactInvoice 
 */

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Geography35 
    FOREIGN KEY ([GeographyKey_SK (PK)])
    REFERENCES Dim_Geography([GeographyKey_SK (PK)])
go

ALTER TABLE FactInvoice ADD CONSTRAINT RefTrack37 
    FOREIGN KEY ([TarckId_SK (PK)], [PlaylistId_SK (PK) (FK)])
    REFERENCES Track([TarckId_SK (PK)], [PlaylistId_SK (PK) (FK)])
go

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Date49 
    FOREIGN KEY ([DateKey (PK)])
    REFERENCES Dim_Date([DateKey (PK)])
go

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Customer50 
    FOREIGN KEY ([CustomerId_SK (PK)])
    REFERENCES Dim_Customer([CustomerId_SK (PK)])
go

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Employee51 
    FOREIGN KEY ([EmployeeId_SK (PK)])
    REFERENCES Dim_Employee([EmployeeId_SK (PK)])
go


/* 
 * TABLE: Track 
 */

ALTER TABLE Track ADD CONSTRAINT RefDIm_Album41 
    FOREIGN KEY ([AlbumId_SK (PK)], [ArtistId (PK)])
    REFERENCES DIm_Album([AlbumId_SK (PK)], [ArtistId (PK)])
go


