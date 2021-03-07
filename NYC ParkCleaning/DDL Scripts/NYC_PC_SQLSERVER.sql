/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      NYC_PARK_CLEANING_DM.DM1
 *
 * Date Created : Thursday, October 01, 2020 14:19:48
 * Target DBMS : Microsoft SQL Server 2017
 */

USE NYC_PC
go
/* 
 * TABLE: DIm_Acitivity_Deatils 
 */

CREATE TABLE DIm_Acitivity_Deatils(
    Acitivity_ID_SK         int            NOT NULL,
    DailyAcitivity_ID_NK    char(10)       NULL,
    Vehicle_number          varchar(10)    NULL,
    Start_time              datetime       NOT NULL,
    End_time                datetime       NOT NULL,
    Activity                varchar(10)    NULL,
    Animal_waste            char(10)       NULL,
    Broken_glass            char(10)       NULL,
    Dumping                 char(10)       NULL,
    Graffiti                char(10)       NULL,
    Medical_waste           char(10)       NULL,
    FIxedPost               char(10)       NULL,
    Overlap_flag            char(10)       NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (Acitivity_ID_SK)
)
go



IF OBJECT_ID('DIm_Acitivity_Deatils') IS NOT NULL
    PRINT '<<< CREATED TABLE DIm_Acitivity_Deatils >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIm_Acitivity_Deatils >>>'
go

/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    DATE_KEY_SK        int        NOT NULL,
    FULL_DATE_AK       date       NOT NULL,
    FISCAL_DAY         tinyint    NULL,
    FISCAL_WEEK        tinyint    NULL,
    FISCAL_QUATER      int        NULL,
    FISCAL_YEAR        int        NULL,
    CALENDAR_QUATER    int        NULL,
    CALENDAR_YEAR      int        NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (DATE_KEY_SK)
)
go



IF OBJECT_ID('Dim_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'
go

/* 
 * TABLE: Dim_Geography 
 */

CREATE TABLE Dim_Geography(
    GEOGRAPHY_KEY_SK    int            NOT NULL,
    POSTAL_CODE_AK      int            NOT NULL,
    DISTRICT            nchar(50)      NULL,
    SECTOR_CODE         nchar(10)      NULL,
    SECTOR_NAME         nchar(50)      NULL,
    SEC_DESC            varchar(50)    NULL,
    CONSTRAINT PK2_1 PRIMARY KEY NONCLUSTERED (GEOGRAPHY_KEY_SK)
)
go



IF OBJECT_ID('Dim_Geography') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Geography >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Geography >>>'
go

/* 
 * TABLE: Dim_Park_Details 
 */

CREATE TABLE Dim_Park_Details(
    Park_ID_SK     char(10)        NOT NULL,
    Gispropnum     varchar(18)     NOT NULL,
    Omppropid      varchar(10)     NULL,
    Gisobjid       char(10)        NULL,
    Description    varchar(100)    NULL,
    Route_id       int             NULL,
    Off_route      varchar(10)     NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (Park_ID_SK)
)
go



IF OBJECT_ID('Dim_Park_Details') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Park_Details >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Park_Details >>>'
go

/* 
 * TABLE: FACT_DAILY_ACTIVITY_NYC 
 */

CREATE TABLE FACT_DAILY_ACTIVITY_NYC(
    ACTIVITY_ID_SK      char(10)    NOT NULL,
    Acitivity_ID_SK     int         NOT NULL,
    GEOGRAPHY_KEY_SK    int         NOT NULL,
    DATE_WORKED         int         NOT NULL,
    Park_ID_SK          char(10)    NOT NULL,
    NAPSW               int         NULL,
    NCPW                int         NULL,
    NCSA                char(10)    NULL,
    NPOP                int         NULL,
    NNPW                int         NULL,
    NCREW               char(10)    NULL,
    NHOURS              char(10)    NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (ACTIVITY_ID_SK)
)
go



IF OBJECT_ID('FACT_DAILY_ACTIVITY_NYC') IS NOT NULL
    PRINT '<<< CREATED TABLE FACT_DAILY_ACTIVITY_NYC >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FACT_DAILY_ACTIVITY_NYC >>>'
go

/* 
 * TABLE: FACT_DAILY_ACTIVITY_NYC 
 */

ALTER TABLE FACT_DAILY_ACTIVITY_NYC ADD CONSTRAINT RefDim_Geography1 
    FOREIGN KEY (GEOGRAPHY_KEY_SK)
    REFERENCES Dim_Geography(GEOGRAPHY_KEY_SK)
go

ALTER TABLE FACT_DAILY_ACTIVITY_NYC ADD CONSTRAINT RefDim_Park_Details2 
    FOREIGN KEY (Park_ID_SK)
    REFERENCES Dim_Park_Details(Park_ID_SK)
go

ALTER TABLE FACT_DAILY_ACTIVITY_NYC ADD CONSTRAINT RefDIm_Acitivity_Deatils3 
    FOREIGN KEY (Acitivity_ID_SK)
    REFERENCES DIm_Acitivity_Deatils(Acitivity_ID_SK)
go

ALTER TABLE FACT_DAILY_ACTIVITY_NYC ADD CONSTRAINT RefDim_Date4 
    FOREIGN KEY (DATE_WORKED)
    REFERENCES Dim_Date(DATE_KEY_SK)
go


