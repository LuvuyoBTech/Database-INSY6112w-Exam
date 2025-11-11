CREATE SCHEMA IF NOT EXISTS school_db;
USE school_db;
-- Q.5.1
CREATE TABLE Student (
    StudentNumber VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    First_Name VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    Last_Name VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    Phy_Address VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    City VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    Age INT NOT NULL,
    Email_Address VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL
   );

CREATE TABLE Subject (
    Subject VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    Subject_Cost INT NOT NULL
   
);

CREATE TABLE Results (
    StudentNumber VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    Subject VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    Grade_Status VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL
    
);



INSERT INTO Student(StudentNumber, First_Name, Last_Name, Phy_Address, City, Age, Email_Address)
VALUES("200126511","Mary","Grimes","10 Charles St","PTA","21","200126511@rosebank.co.za"),
      ("213011223","Linda","Hlagala","12 Flower St","PTA","22","213011223@rosebank.co.za"),
      ("202126511","Linda","McCain","22 Madiba Ave","JHB","19","202126511@varsitycollege.co.za"),
      ("201011223","Tshepo","Ross","343 Lilian Ngoyi St","JHB","18","201011223@varsitycollege.co.za");

INSERT INTO Results(StudentNumber, Subject, Grade_Status)
VALUES("200126511","English","Pass"),
      ("213011223","Maths","Distinction"),
      ("202126511","Accounting","Pass"),
      ("201011223","Accounting","Fail"),
      ("213011223","Science","Pass");
      
INSERT INTO Subject(Subject, Subject_Cost)
VALUES("English","2100"),
      ("Maths","2300"),
      ("Accounting","1980"),
      ("Science","2150");
  
-- Q.5.2
SELECT 
    *
FROM
    Results
ORDER BY StudentNumber;

-- Q.5.3
SELECT 
*
FROM 
Subject 
WHERE Subject_Cost BETWEEN 2300 AND 2500;

-- IN Operator allows you to compare the value of a specific attribute to a set of values;
-- Alternatively you can the between query is Select * From table_Name WHERE value BETWEEN "" AND "";

-- Q.5.4
ALTER TABLE Student
ADD COLUMN Address VARCHAR(50) CHARACTER SET utf8mb4 NOT NULL;

-- Q.5.5
SELECT Count(*) as NumberOfSubjects
FROM
Subject;

-- Q.5.6
SELECT StudentNumber, First_Name, Last_Name, Age, Email_Address
FROM
Student
WHERE Email_Address LIKE "%@rosebank.co.za";

-- Q.5.7
INSERT INTO Results(StudentNumber, Subject, Grade_Status)
VALUES ("201011224","Accounting","Pass");

-- Q.5.8
SELECT StudentNumber, First_Name, Last_Name, Age
FROM 
Student
WHERE Age <= 18;

-- Q.5.9
SELECT Subject, avg()
FROM
Subject;