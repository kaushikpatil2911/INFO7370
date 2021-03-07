--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      ChinookModel.DM1
--
-- Date Created : Wednesday, September 30, 2020 12:38:39
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: DIm_Album 
--

CREATE TABLE DIm_Album(
    `AlbumId_SK (PK)`  INT                     NOT NULL,
    `ArtistId (PK)`    INT                     NOT NULL,
    ArtistName         NATIONAL VARCHAR(10)    NOT NULL,
    AlbumTitle         NATIONAL VARCHAR(10)    NOT NULL,
    PRIMARY KEY (`AlbumId_SK (PK)`, `ArtistId (PK)`)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Customer 
--

CREATE TABLE Dim_Customer(
    `CustomerId_SK (PK)`    INT                     NOT NULL,
    FirstName               NATIONAL VARCHAR(40)    NOT NULL,
    LastName                NATIONAL VARCHAR(40)    NOT NULL,
    Company                 NATIONAL VARCHAR(40)    NOT NULL,
    Phone                   INT                     NOT NULL,
    Email                   INT                     NOT NULL,
    `GeographyKey_SK (PK)`  INT                     NOT NULL,
    PRIMARY KEY (`CustomerId_SK (PK)`)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Date 
--

CREATE TABLE Dim_Date(
    `DateKey (PK)`  DATETIME                NOT NULL,
    Year            INT                     NOT NULL,
    Quarter         INT                     NOT NULL,
    Month           INT                     NOT NULL,
    Date            DATE                    NOT NULL,
    Day             NATIONAL VARCHAR(10)    NOT NULL,
    PRIMARY KEY (`DateKey (PK)`)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Employee 
--

CREATE TABLE Dim_Employee(
    `EmployeeId_SK (PK)`    INT                     NOT NULL,
    BirthDate               DATETIME                NOT NULL,
    Phone                   NATIONAL VARCHAR(10)    NOT NULL,
    Email                   NATIONAL VARCHAR(40)    NOT NULL,
    Title                   NATIONAL VARCHAR(80)    NOT NULL,
    Fax                     NATIONAL VARCHAR(10)    NOT NULL,
    HireDate                DATETIME                NOT NULL,
    FirstName               NATIONAL VARCHAR(40)    NOT NULL,
    Lastname                NATIONAL VARCHAR(40)    NOT NULL,
    `ReportsTo (FK)`        INT                     NOT NULL,
    `GeographyKey_SK (PK)`  INT                     NOT NULL,
    PRIMARY KEY (`EmployeeId_SK (PK)`)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Geography 
--

CREATE TABLE Dim_Geography(
    `GeographyKey_SK (PK)`  INT                     NOT NULL,
    City                    NATIONAL VARCHAR(40)    NOT NULL,
    State                   NATIONAL VARCHAR(40)    NOT NULL,
    Country                 NATIONAL VARCHAR(40)    NOT NULL,
    PostalCOde              NATIONAL VARCHAR(10)    NOT NULL,
    PRIMARY KEY (`GeographyKey_SK (PK)`)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Playlist 
--

CREATE TABLE Dim_Playlist(
    `Playlist_SK (PK)`         INT                     NOT NULL,
    PlaylistName               NATIONAL VARCHAR(10)    NOT NULL,
    `TarckId_SK (PK)`          INT                     NOT NULL,
    `PlaylistId_SK (PK) (FK)`  INT                     NOT NULL,
    PRIMARY KEY (`Playlist_SK (PK)`)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactInvoice 
--

CREATE TABLE FactInvoice(
    `Invoiceid_SK (PK)`        INT                     NOT NULL,
    `InvoiceLineId (PK)`       INT                     NOT NULL,
    `DateKey (PK) (FK)`        DATE                    NOT NULL,
    `DateKey (PK)`             DATETIME                NOT NULL,
    BillingAddress             NATIONAL VARCHAR(60)    NOT NULL,
    UnitPrice                  DECIMAL(10, 2)          NOT NULL,
    Quantity                   INT                     NOT NULL,
    Total                      INT,
    `GeographyKey_SK (PK)`     INT                     NOT NULL,
    `TarckId_SK (PK)`          INT                     NOT NULL,
    `PlaylistId_SK (PK) (FK)`  INT                     NOT NULL,
    `CustomerId_SK (PK)`       INT                     NOT NULL,
    `EmployeeId_SK (PK)`       INT                     NOT NULL,
    PRIMARY KEY (`Invoiceid_SK (PK)`, `InvoiceLineId (PK)`, `DateKey (PK) (FK)`, `DateKey (PK)`)
)ENGINE=MYISAM
;



-- 
-- TABLE: Track 
--

CREATE TABLE Track(
    `TarckId_SK (PK)`          INT                     NOT NULL,
    `PlaylistId_SK (PK) (FK)`  INT                     NOT NULL,
    MediaName                  NATIONAL VARCHAR(80)    NOT NULL,
    GenreName                  NATIONAL VARCHAR(80)    NOT NULL,
    MediaTypeId                INT                     NOT NULL,
    GenreId                    INT                     NOT NULL,
    Composer                   NATIONAL VARCHAR(80)    NOT NULL,
    TrackName                  NATIONAL VARCHAR(80)    NOT NULL,
    Milliseconds               INT                     NOT NULL,
    Bytes                      INT                     NOT NULL,
    `AlbumId_SK (PK)`          INT                     NOT NULL,
    `ArtistId (PK)`            INT                     NOT NULL,
    PRIMARY KEY (`TarckId_SK (PK)`, `PlaylistId_SK (PK) (FK)`)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Customer 
--

ALTER TABLE Dim_Customer ADD CONSTRAINT RefDim_Geography44 
    FOREIGN KEY (`GeographyKey_SK (PK)`)
    REFERENCES Dim_Geography(`GeographyKey_SK (PK)`)
;


-- 
-- TABLE: Dim_Employee 
--

ALTER TABLE Dim_Employee ADD CONSTRAINT RefDim_Employee45 
    FOREIGN KEY (`EmployeeId_SK (PK)`)
    REFERENCES Dim_Employee(`EmployeeId_SK (PK)`)
;

ALTER TABLE Dim_Employee ADD CONSTRAINT RefDim_Geography52 
    FOREIGN KEY (`GeographyKey_SK (PK)`)
    REFERENCES Dim_Geography(`GeographyKey_SK (PK)`)
;


-- 
-- TABLE: Dim_Playlist 
--

ALTER TABLE Dim_Playlist ADD CONSTRAINT RefTrack40 
    FOREIGN KEY (`TarckId_SK (PK)`, `PlaylistId_SK (PK) (FK)`)
    REFERENCES Track(`TarckId_SK (PK)`, `PlaylistId_SK (PK) (FK)`)
;


-- 
-- TABLE: FactInvoice 
--

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Geography35 
    FOREIGN KEY (`GeographyKey_SK (PK)`)
    REFERENCES Dim_Geography(`GeographyKey_SK (PK)`)
;

ALTER TABLE FactInvoice ADD CONSTRAINT RefTrack37 
    FOREIGN KEY (`TarckId_SK (PK)`, `PlaylistId_SK (PK) (FK)`)
    REFERENCES Track(`TarckId_SK (PK)`, `PlaylistId_SK (PK) (FK)`)
;

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Date49 
    FOREIGN KEY (`DateKey (PK)`)
    REFERENCES Dim_Date(`DateKey (PK)`)
;

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Customer50 
    FOREIGN KEY (`CustomerId_SK (PK)`)
    REFERENCES Dim_Customer(`CustomerId_SK (PK)`)
;

ALTER TABLE FactInvoice ADD CONSTRAINT RefDim_Employee51 
    FOREIGN KEY (`EmployeeId_SK (PK)`)
    REFERENCES Dim_Employee(`EmployeeId_SK (PK)`)
;


-- 
-- TABLE: Track 
--

ALTER TABLE Track ADD CONSTRAINT RefDIm_Album41 
    FOREIGN KEY (`AlbumId_SK (PK)`, `ArtistId (PK)`)
    REFERENCES DIm_Album(`AlbumId_SK (PK)`, `ArtistId (PK)`)
;


