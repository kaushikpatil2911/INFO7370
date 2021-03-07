--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      ChinookModel.DM1
--
-- Date Created : Wednesday, September 30, 2020 12:42:06
-- Target DBMS : PostgreSQL 10.x-12.x
--

-- 
-- TABLE: "DIm_Album" 
--

CREATE TABLE "DIm_Album"(
    "AlbumId_SK (PK)"  integer                  NOT NULL,
    "ArtistId (PK)"    integer                  NOT NULL,
    "ArtistName"       character varying(10)    NOT NULL,
    "AlbumTitle"       character varying(10)    NOT NULL,
    CONSTRAINT "PK24" PRIMARY KEY ("AlbumId_SK (PK)", "ArtistId (PK)")
)
;



-- 
-- TABLE: "Dim_Customer" 
--

CREATE TABLE "Dim_Customer"(
    "CustomerId_SK (PK)"    integer                  NOT NULL,
    "FirstName"             character varying(40)    NOT NULL,
    "LastName"              character varying(40)    NOT NULL,
    "Company"               character varying(40)    NOT NULL,
    "Phone"                 integer                  NOT NULL,
    "Email"                 integer                  NOT NULL,
    "GeographyKey_SK (PK)"  integer                  NOT NULL,
    CONSTRAINT "PK22" PRIMARY KEY ("CustomerId_SK (PK)")
)
;



-- 
-- TABLE: "Dim_Date" 
--

CREATE TABLE "Dim_Date"(
    "DateKey (PK)"  time without time zone    NOT NULL,
    "Year"          integer                   NOT NULL,
    "Quarter"       integer                   NOT NULL,
    "Month"         integer                   NOT NULL,
    "Date"          date                      NOT NULL,
    "Day"           character varying(10)     NOT NULL,
    CONSTRAINT "PK27" PRIMARY KEY ("DateKey (PK)")
)
;



-- 
-- TABLE: "Dim_Employee" 
--

CREATE TABLE "Dim_Employee"(
    "EmployeeId_SK (PK)"    integer                   NOT NULL,
    "BirthDate"             time without time zone    NOT NULL,
    "Phone"                 character varying(10)     NOT NULL,
    "Email"                 character varying(40)     NOT NULL,
    "Title"                 character varying(80)     NOT NULL,
    "Fax"                   character varying(10)     NOT NULL,
    "HireDate"              time without time zone    NOT NULL,
    "FirstName"             character varying(40)     NOT NULL,
    "Lastname"              character varying(40)     NOT NULL,
    "ReportsTo (FK)"        integer                   NOT NULL,
    "GeographyKey_SK (PK)"  integer                   NOT NULL,
    CONSTRAINT "PK26" PRIMARY KEY ("EmployeeId_SK (PK)")
)
;



-- 
-- TABLE: "Dim_Geography" 
--

CREATE TABLE "Dim_Geography"(
    "GeographyKey_SK (PK)"  integer                  NOT NULL,
    "City"                  character varying(40)    NOT NULL,
    "State"                 character varying(40)    NOT NULL,
    "Country"               character varying(40)    NOT NULL,
    "PostalCOde"            character varying(10)    NOT NULL,
    CONSTRAINT "PK23" PRIMARY KEY ("GeographyKey_SK (PK)")
)
;



-- 
-- TABLE: "Dim_Playlist" 
--

CREATE TABLE "Dim_Playlist"(
    "Playlist_SK (PK)"         integer                  NOT NULL,
    "PlaylistName"             character varying(10)    NOT NULL,
    "TarckId_SK (PK)"          integer                  NOT NULL,
    "PlaylistId_SK (PK) (FK)"  integer                  NOT NULL,
    CONSTRAINT "PK30" PRIMARY KEY ("Playlist_SK (PK)")
)
;



-- 
-- TABLE: "FactInvoice" 
--

CREATE TABLE "FactInvoice"(
    "Invoiceid_SK (PK)"        integer                   NOT NULL,
    "InvoiceLineId (PK)"       integer                   NOT NULL,
    "DateKey (PK) (FK)"        date                      NOT NULL,
    "DateKey (PK)"             time without time zone    NOT NULL,
    "BillingAddress"           character varying(60)     NOT NULL,
    "UnitPrice"                numeric(10, 2)            NOT NULL,
    "Quantity"                 integer                   NOT NULL,
    "Total"                    integer,
    "GeographyKey_SK (PK)"     integer                   NOT NULL,
    "TarckId_SK (PK)"          integer                   NOT NULL,
    "PlaylistId_SK (PK) (FK)"  integer                   NOT NULL,
    "CustomerId_SK (PK)"       integer                   NOT NULL,
    "EmployeeId_SK (PK)"       integer                   NOT NULL,
    CONSTRAINT "PK28" PRIMARY KEY ("Invoiceid_SK (PK)", "InvoiceLineId (PK)", "DateKey (PK) (FK)", "DateKey (PK)")
)
;



-- 
-- TABLE: "Track" 
--

CREATE TABLE "Track"(
    "TarckId_SK (PK)"          integer                  NOT NULL,
    "PlaylistId_SK (PK) (FK)"  integer                  NOT NULL,
    "MediaName"                character varying(80)    NOT NULL,
    "GenreName"                character varying(80)    NOT NULL,
    "MediaTypeId"              integer                  NOT NULL,
    "GenreId"                  integer                  NOT NULL,
    "Composer"                 character varying(80)    NOT NULL,
    "TrackName"                character varying(80)    NOT NULL,
    "Milliseconds"             integer                  NOT NULL,
    "Bytes"                    integer                  NOT NULL,
    "AlbumId_SK (PK)"          integer                  NOT NULL,
    "ArtistId (PK)"            integer                  NOT NULL,
    CONSTRAINT "PK25" PRIMARY KEY ("TarckId_SK (PK)", "PlaylistId_SK (PK) (FK)")
)
;



-- 
-- TABLE: "Dim_Customer" 
--

ALTER TABLE "Dim_Customer" ADD CONSTRAINT "RefDim_Geography44" 
    FOREIGN KEY ("GeographyKey_SK (PK)")
    REFERENCES "Dim_Geography"("GeographyKey_SK (PK)")
;


-- 
-- TABLE: "Dim_Employee" 
--

ALTER TABLE "Dim_Employee" ADD CONSTRAINT "RefDim_Employee45" 
    FOREIGN KEY ("EmployeeId_SK (PK)")
    REFERENCES "Dim_Employee"("EmployeeId_SK (PK)")
;

ALTER TABLE "Dim_Employee" ADD CONSTRAINT "RefDim_Geography52" 
    FOREIGN KEY ("GeographyKey_SK (PK)")
    REFERENCES "Dim_Geography"("GeographyKey_SK (PK)")
;


-- 
-- TABLE: "Dim_Playlist" 
--

ALTER TABLE "Dim_Playlist" ADD CONSTRAINT "RefTrack40" 
    FOREIGN KEY ("TarckId_SK (PK)", "PlaylistId_SK (PK) (FK)")
    REFERENCES "Track"("TarckId_SK (PK)", "PlaylistId_SK (PK) (FK)")
;


-- 
-- TABLE: "FactInvoice" 
--

ALTER TABLE "FactInvoice" ADD CONSTRAINT "RefDim_Geography35" 
    FOREIGN KEY ("GeographyKey_SK (PK)")
    REFERENCES "Dim_Geography"("GeographyKey_SK (PK)")
;

ALTER TABLE "FactInvoice" ADD CONSTRAINT "RefTrack37" 
    FOREIGN KEY ("TarckId_SK (PK)", "PlaylistId_SK (PK) (FK)")
    REFERENCES "Track"("TarckId_SK (PK)", "PlaylistId_SK (PK) (FK)")
;

ALTER TABLE "FactInvoice" ADD CONSTRAINT "RefDim_Date49" 
    FOREIGN KEY ("DateKey (PK)")
    REFERENCES "Dim_Date"("DateKey (PK)")
;

ALTER TABLE "FactInvoice" ADD CONSTRAINT "RefDim_Customer50" 
    FOREIGN KEY ("CustomerId_SK (PK)")
    REFERENCES "Dim_Customer"("CustomerId_SK (PK)")
;

ALTER TABLE "FactInvoice" ADD CONSTRAINT "RefDim_Employee51" 
    FOREIGN KEY ("EmployeeId_SK (PK)")
    REFERENCES "Dim_Employee"("EmployeeId_SK (PK)")
;


-- 
-- TABLE: "Track" 
--

ALTER TABLE "Track" ADD CONSTRAINT "RefDIm_Album41" 
    FOREIGN KEY ("AlbumId_SK (PK)", "ArtistId (PK)")
    REFERENCES "DIm_Album"("AlbumId_SK (PK)", "ArtistId (PK)")
;


