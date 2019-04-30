-- Create and use Happiness_Indicators_2016 database
CREATE DATABASE Happiness_Indicators_2016;
USE Happiness_Indicators_2016;

-- Creating  intellectual_property_transformed table
CREATE TABLE intellectual_property_transformed (
  Country_Code varchar(10) PRIMARY KEY,
  Country_Name varchar(100),
  Intellectual_Property_Charges float
);

-- creating arable_land table
create table arable_land(
Country_Name varchar(150) PRIMARY KEY,
Country_Code varchar(150),
Arable_Land double
);

-- creating military_expenses table
CREATE TABLE military_expenses (
  Country_Name VARCHAR(100) PRIMARY KEY,
  Country_Code VARCHAR(50),
  military_expenses float
);

-- creating World_Happiness_Report table
CREATE TABLE World_Happiness_Report (
Country_Name VARCHAR(100) PRIMARY KEY,
Happiness_Rank INT,
Happiness_Score INT,
Economy_GDP_Per_Capita INT,
Health_Life_Expectancy INT,
Trust_Government_Corruption INT
)
;

-- joining the 4 tables
SELECT whb.Country_Name, ipt.Country_Code, Happiness_Rank, Happiness_Score, Economy_GDP_Per_Capita, Trust_Government_Corruption, 
Intellectual_Property_Charges, al.Arable_Land
FROM World_Happiness_Report AS whb
JOIN intellectual_property_transformed AS ipt
ON whb.Country_Name = ipt.Country_Name
JOIN arable_land AS al
ON ipt.Country_Code = al.Country_Code
JOIN military_expenses AS me
ON me.Country_Code = al.Country_Code
ORDER BY whb.Country_Name;


