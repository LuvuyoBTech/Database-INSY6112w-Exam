CREATE SCHEMA IF NOT EXISTS presidentialdb;
USE presidentialdb;

CREATE TABLE Country (
    CountryID INT AUTO_INCREMENT NOT NULL,
    Name VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    Abbreviation VARCHAR(20)CHARACTER SET UTF8MB4 NOT NULL,
    CallingCode VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    PRIMARY KEY (CountryID)
);

INSERT INTO Country (Name, Abbreviation, CallingCode)
VALUES ("South Africa", "ZA", "27"),
	   ("Lesotho","LS","266"),
	   ("Namibia","NA","264"),
       ("Egypt","EG","20");

-- Q.6.1.1
CREATE TABLE President (
    PresidentID INT AUTO_INCREMENT NOT NULL,
    CountryID INT NOT NULL,
    Name VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    Surname VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    Year YEAR NOT NULL,
    PRIMARY KEY (PresidentID),
    FOREIGN KEY (CountryID)
        REFERENCES Country (CountryID)
);

INSERT INTO President(CountryID, Name, Surname, Year)
VALUES (1, "Cyril","Ramaphosa", 2018),
       (1, "Jacob","Zuma", 2009),
       (3, "Hage","Geingob", 2015),
       (3, "Hifikepunye","Pohamba", 2005);

-- Q.6.1.2
Select Count(*) as numberOfPresidents
From President
WHERE Year > 2009;

-- Q.6.1.3
INSERT INTO Country(Name, Abbreviation, CallingCode)
VALUES ("Botswana","BW", "267");

-- Q.6.1.4
SELECT 
    *
FROM
    Country
ORDER BY Name;
 
 -- Q 6.1.5
SELECT 
    *
FROM
    President
WHERE
    Surname LIKE 'R%';
    
-- Q.6.1.6
SELECT 
S.Name, S.Surname, C.Name
FROM President S
JOIN  Country C ON S.CountryID = C.CountryID;