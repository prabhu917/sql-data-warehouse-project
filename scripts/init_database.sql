/*
=======================================================================
Create Database and Schemas
=======================================================================

Script Purpose:
This script creates a new database named 'DataWarehouse' after checking 
if it already exists. If the database exists, it is dropped and recreated. 
Additionally, the script sets up three schemas within the database: 
'bronze', 'silver', and 'gold'. These schemas correspond to different 
layers of data processing in a lakehouse architecture:
  - bronze: raw ingestion layer
  - silver: cleaned and transformed layer
  - gold: curated and business-ready layer

WARNING:
Running this script will drop the entire 'DataWarehouse' database if it exists.
All data in the database will be permanently deleted.
Proceed with caution and ensure you have proper backups 
before running this script in any production or shared environment.
*/


--Using 'master' as the Database
USE master;
GO

--Drop the Database if it Exists
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
	BEGIN 
		ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE DataWarehouse;
	END;
GO

--creating the 'DataWarehouse' Database
CREATE DATABASE DataWarehouse;
GO

--Switching to 'Datawarehouse' as the Database
USE DataWarehouse;
GO 

-- Creating Schemas for the layers Bronze, Silver, Gold
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
