CREATE SCHEMA IF NOT EXISTS FelineCompetition_db;
USE FelineCompetition_db;

CREATE TABLE Owner (
    OwnerID INT NOT NULL,
    Name VARCHAR(250) NOT NULL,
    Surname VARCHAR(250) NOT NULL,
    PRIMARY KEY (OwnerID)
);

CREATE TABLE Cat (
    CatID INT NOT NULL,
    Name VARCHAR(250) NOT NULL,
    PRIMARY KEY (CatID)
);

CREATE TABLE Breed (
    BreedID INT NOT NULL,
    Description VARCHAR(250) NOT NULL,
    PRIMARY KEY (BreedID)
);

CREATE TABLE Competition (
    CompetitionID INT NOT NULL,
    Description VARCHAR(250) NOT NULL,
    PRIMARY KEY (CompetitionID)
);

CREATE TABLE Entry (
    FOREIGN KEY (CatID)
        REFERENCES Cat,
    FOREIGN KEY (CompetitionID)
        REFERENCES CompetitionID
);

INSERT Breed(BreedID, Description)
VALUES (1, "Siamese"),
       (2, "Burmese"),
       (3, "Sphynx"),
       (4, "Persian"),
       (5, "Maine Coon");
       
SELECT 
    *
FROM
    Breed;
    
INSERT Onwer (OwnerID, Name, Surname)
VALUES (1, "Thabo", "Ndlovu"),
       (2, "Clark", "Grobler"),
       (3, "Sbonelo", "Mthaba"),
       (4, "Teagan", "Boland"),
       (5, "Chester", "Phillips");
       
INSERT Pet(PetID, Name)
VALUES(1,"Kittie"),
      (2,"Evelyn"),
      (3,"Bubbles"),
      (1,"Hairry Styles");

SELECT P.Name
FROM Pet P
WHERE PetID = 1
GROUP BY P.Name asc;

SELECT B.Description, count(*) as NumberOfCats
FROM Breed B
JOIN Pet P ON P.BreedID = B.BreedID
group by B.Description;
