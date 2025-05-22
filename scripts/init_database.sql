
/*
Database and Schema Initialization
Purpose:
This script initializes a fresh 'DataWarehouse' database by first verifying its existence.
If the database is found, it will be removed and then recreated from scratch. The script also
establishes three distinct schemas ('bronze', 'silver', and 'gold') within the new database.

IMPORTANT WARNING:
Executing this script will completely remove any existing 'DataWarehouse' database
and all its contents. This action cannot be undone. Please verify you have current
backups and confirm this is intentional before proceeding.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
