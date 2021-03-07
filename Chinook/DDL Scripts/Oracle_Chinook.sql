--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      ChinookModel.DM1
--
-- Date Created : Wednesday, September 30, 2020 12:13:29
-- Target DBMS : Oracle 12c
--

-- 
-- TABLE: DIm_Album 
--

CREATE TABLE DIm_Album(
    "AlbumId_SK (PK)"  NUMBER(38, 0)    NOT NULL,
    "ArtistId (PK)"    NUMBER(38, 0)    NOT NULL,
    ArtistName         NVARCHAR2(10)    NOT NULL,
    AlbumTitle         NVARCHAR2(10)    NOT NULL,
    CONSTRAINT PK24 PRIMARY KEY ("AlbumId_SK (PK)", "ArtistId (PK)")
)
;



-- 
-- TABLE: Dim_Customer 
--

CREATE TABLE Dim_Customer(
    "CustomerId_SK (PK)"    NUMBER(38, 0)    NOT NULL,
    FirstName               NVARCHAR2(40)    NOT NULL,
    LastName                NVARCHAR2(40)    NOT NULL,
    Company                 NVARCHAR2(40)    NOT NULL,
    Phone                   NUMBER(38, 0)    NOT NULL,
    Email                   NUMBER(38, 0)    NOT NULL,
    "GeographyKey_SK (PK)"  NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK22 PRIMARY KEY ("CustomerId_SK (PK)")
)
;



-- 
-- TABLE: Dim_Date 
--

CREATE TABLE Dim_Date(
    "DateKey (PK)"  TIMESTAMP(6)     NOT NULL,
    Year            NUMBER(38, 0)    NOT NULL,
    Quarter         NUMBER(38, 0)    NOT NULL,
    Month           NUMBER(38, 0)    NOT NULL,
    Date            DATE             NOT NULL,
    Day             NVARCHAR2(10)    NOT NULL,
    CONSTRAINT PK27 PRIMARY KEY ("DateKey (PK)")
)
;



-- 
-- TABLE: Dim_Employee 
--

CREATE TABLE Dim_Employee(
    "EmployeeId_SK (PK)"    NUMBER(38, 0)    NOT NULL,
    BirthDate               TIMESTAMP(6)     NOT NULL,
    Phone                   NVARCHAR2(10)    NOT NULL,
    Email                   NVARCHAR2(40)    NOT NULL,
    Title                   NVARCHAR2(80)    NOT NULL,
    Fax                     NVARCHAR2(10)    NOT NULL,
    HireDate                TIMESTAMP(6)     NOT NULL,
    FirstName               NVARCHAR2(40)    NOT NULL,
    Lastname                NVARCHAR2(40)    NOT NULL,
    "ReportsTo (FK)"        NUMBER(38, 0)    NOT NULL,
    "GeographyKey_SK (PK)"  NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK26 PRIMARY KEY ("EmployeeId_SK (PK)")
)
;



-- 
-- TABLE: Dim_Geography 
--

CREATE TABLE Dim_Geography(
    "GeographyKey_SK (PK)"  NUMBER(38, 0)    NOT NULL,
    City                    NVARCHAR2(40)    NOT NULL,
    State                   NVARCHAR2(40)    NOT NULL,
    Country                 NVARCHAR2(40)    NOT NULL,
    PostalCOde              NVARCHAR2(10)    NOT NULL,
    CONSTRAINT PK23 PRIMARY KEY ("GeographyKey_SK (PK)")
)
;



-- 
-- TABLE: Dim_Playlist 
--

CREATE TABLE Dim_Playlist(
    "Playlist_SK (PK)"         NUMBER(38, 0)    NOT NULL,
    PlaylistName               NVARCHAR2(10)    NOT NULL,
    "TarckId_SK (PK)"          NUMBER(38, 0)    NOT NULL,
    "PlaylistId_SK (PK) (FK)"  NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK30 PRIMARY KEY ("Playlist_SK (PK)")
)
;



-- 
-- TABLE: FactInvoice 
--

CREATE TABLE FactInvoice(
    "Invoiceid_SK (PK)"        NUMBER(38, 0)    NOT NULL,
    "InvoiceLineId (PK)"       NUMBER(38, 0)    NOT NULL,
    "DateKey (PK) (FK)"        DATE             NOT NULL,
    "DateKey (PK)"             TIMESTAMP(6)     NOT NULL,
    BillingAddress             NVARCHAR2(60)    NOT NULL,
    UnitPrice                  NUMBER(10, 2)    NOT NULL,
    Quantity                   NUMBER(38, 0)    NOT NULL,
    Total                      NUMBER(38, 0),
    "GeographyKey_SK (PK)"     NUMBER(38, 0)    NOT NULL,
    "TarckId_SK (PK)"          NUMBER(38, 0)    NOT NULL,
    "PlaylistId_SK (PK) (FK)"  NUMBER(38, 0)    NOT NULL,
    "CustomerId_SK (PK)"       NUMBER(38, 0)    NOT NULL,
    "EmployeeId_SK (PK)"       NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK28 PRIMARY KEY ("Invoiceid_SK (PK)", "InvoiceLineId (PK)", "DateKey (PK) (FK)", "DateKey (PK)")
)
;



-- 
-- TABLE: Track 
--

CREATE TABLE Track(
    "TarckId_SK (PK)"          NUMBER(38, 0)    NOT NULL,
    "PlaylistId_SK (PK) (FK)"  NUMBER(38, 0)    NOT NULL,
    MediaName                  NVARCHAR2(80)    NOT NULL,
    GenreName                  NVARCHAR2(80)    NOT NULL,
    MediaTypeId                NUMBER(38, 0)    NOT NULL,
    GenreId                    NUMBER(38, 0)    NOT NULL,
    Composer                   NVARCHAR2(80)    NOT NULL,
    TrackName                  NVARCHAR2(80)    NOT NULL,
    Milliseconds               NUMBER(38, 0)    NOT NULL,
    Bytes                      NUMBER(38, 0)    NOT NULL,
    "AlbumId_SK (PK)"          NUMBER(38, 0)    NOT NULL,
    "ArtistId (PK)"            NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK25 PRIMARY KEY ("TarckId_SK (PK)", "PlaylistId_SK (PK) (FK)")
)
;



-- 
-- TABLE: Dim_Customer 
--

ALTER TABLE Dim_Customer ADD CONSTRAINT RefDim_Geography44 
    FOREIGN KEY ("GeographyKey_SK (PK)")
    REFERENCES Dim_Geography("GeographyKey_SK (PK)")
;


-- 
-- TABLE: Dim_Employee 
--

ALTER TABLE Dim_Employee ADD CONSTRAINT RefDim_Employee45 
    FOREIGN KEY ("EmployeeId_SK (PK)")
    REFERENCES Dim_Employee("EmployeeId_SK (PK)")
;

ALTER TABLE Dim_Employee ADD CONSTRAINT RefDim_Geography52 
    FOREIGN KEY ("GeographyKey_SK (PK)")
    REFERENCES Dim_Geography("GeographyKey_SK (PK)")
;


-- 
-- TABLE: Dim_Playlist 
--

ALTER TABLE Dim_Playlist ADD CONSTRAINT RefTrack40 
    FOREIGN KEY ("TarckId_SK (PK)", "PlaylistId_SK (PK) (FK)")
    REFERENCES Track("TarckId_SK (PK)", "PlaylistId_SK (PK) (FK)")
;


-- 
-- TABLE: FactInvoice 
--

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Geography35 
    FOREIGN KEY ("GeographyKey_SK (PK)")
    REFERENCES Dim_Geography("GeographyKey_SK (PK)")
;

ALTER TABLE FactInvoice ADD CONSTRAINT RefTrack37 
    FOREIGN KEY ("TarckId_SK (PK)", "PlaylistId_SK (PK) (FK)")
    REFERENCES Track("TarckId_SK (PK)", "PlaylistId_SK (PK) (FK)")
;

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Date49 
    FOREIGN KEY ("DateKey (PK)")
    REFERENCES Dim_Date("DateKey (PK)")
;

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Customer50 
    FOREIGN KEY ("CustomerId_SK (PK)")
    REFERENCES Dim_Customer("CustomerId_SK (PK)")
;

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Employee51 
    FOREIGN KEY ("EmployeeId_SK (PK)")
    REFERENCES Dim_Employee("EmployeeId_SK (PK)")
;


-- 
-- TABLE: Track 
--

ALTER TABLE Track ADD CONSTRAINT RefDIm_Album41 
    FOREIGN KEY ("AlbumId_SK (PK)", "ArtistId (PK)")
    REFERENCES DIm_Album("AlbumId_SK (PK)", "ArtistId (PK)")
;


