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
Print'=====================================';
Print 'Utilizing the database "DataWarehouse"';
Print'=====================================';
USE master;
GO

--Drop the Database if it Exists
Print'=====================================';
Print 'Droping the database "DataWarehouse" if it alredy exists';
Print'=====================================';
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
	BEGIN 
		ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE DataWarehouse;
	END;
GO

--creating the 'DataWarehouse' Database
Print'=====================================';
Print 'Creating OR Recreating the database "DataWarehouse"';
Print'=====================================';
CREATE DATABASE DataWarehouse;
GO

--Switching to 'Datawarehouse' as the Database
Print'=====================================';
Print 'Switching to database "DataWarehouse"';
Print'=====================================';
USE DataWarehouse;
GO 

Print'=====================================';
Print 'Creating SCHEMAS';
Print'=====================================';
GO
-- Creating Schemas for the layers Bronze, Silver, Gold
CREATE SCHEMA bronze;
GO
Print'=====================================';
Print 'Created SCHEMA Bronze';
Print'=====================================';
GO 

CREATE SCHEMA silver;
GO
Print'=====================================';
Print 'Created SCHEMA silver';
Print'=====================================';
GO

CREATE SCHEMA gold;
GO
Print'=====================================';
Print 'Created SCHEMA gold';
Print'=====================================';
GO
