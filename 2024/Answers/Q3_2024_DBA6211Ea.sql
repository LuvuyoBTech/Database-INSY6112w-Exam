CREATE SCHEMA IF NOT EXISTS Hospital_db;
USE Hospital_db;

-- Q.3.1
CREATE TABLE IF NOT EXISTS Patient(
    PaitentID INT AUTO_INCREMENT NOT NULL,
    PaitentName VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    PaitentSurname VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    PaitentDOB DATE NOT NULL,
    PRIMARY KEY (PaitentID)
);

-- Q.3.2
CREATE TABLE IF NOT EXISTS Doctor(
    DoctorID INT AUTO_INCREMENT NOT NULL,
    DoctorName VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    DoctorSurname VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    PRIMARY KEY (DoctorID)
);

-- Q.3.3
CREATE TABLE IF NOT EXISTS Appointments(
    AppointmentID INT AUTO_INCREMENT NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    AppointmentDuration VARCHAR(250)CHARACTER SET UTF8MB4 NOT NULL,
    PRIMARY KEY (AppointmentID),
    FOREIGN KEY (PaitentID)
        REFERENCES Paitent (PaitientID),
    FOREIGN KEY (DoctorID)
        REFERENCES Doctor (DoctorID)
);

-- Q.3.4
INSERT INTO Paitent(PaitentName, PaitentSurname, PaitentDOB)
VALUES("Debbie", "Theart", "1980-03-17"),
	 ("Thomas", "Duncan", "1976-08-12");
     
INSERT INTO Doctor(DoctorName, DoctorSurname)
VALUES("Zintle", "Nukani"),
	  ("Ravi", "Maharaj");
      
INSERT INTO Appointments(AppointmentDate, AppointmentTime, AppointmentDuration, PatientID, DoctorID)
VALUES("2024-01-15", "9:00", "15", "2", "1"),
      ("2024-01-18", "15:00", "30", "2", "2"),
      ("2024-01-20", "10:00", "15", "1", "1"),
      ("2024-01-21", "11:00", "15", "2", "1");
     
-- Q.3.5 
SELECT *
FROM Appointments
WHERE "2024-01-16" <= AppointmentDate AND
AppointmentDate >= "2024-01-20";

-- Q.3.6
SELECT P.PaitentName, P.PaitentSurname, COUNT(*) AS number_of_Appointments
FROM Paitent P
JOIN Appointments A ON P.PaitentID = A.PaitentID
GROUP BY P.PaitentSurname
ORDER BY number_of_Appointments;


-- Q.3.7
SELECT A.AppointmentDate, A.AppointmentTime, D.*, P.PaitentName, P.PaitentSurname
FROM Appointments A
JOIN Doctor D ON A.PaitentID = D.DoctorID
JOIN Paitent P ON A.PaitentID = P.PaitientID
ORDER BY A.AppointmentDate;

-- Q.3.8
CREATE OR REPLACE VIEW Paitents_with_Appointments_with_DoctorID2 AS
SELECT P.PaitentName, P.PaitentSurname, A.DoctorID
FROM Paitent P
JOIN Appointments A ON AppointmentID = PaitentID
WHERE A.DoctorID = 2
ORDER BY P.PaitentSurname asc;

-- Q.3.9 
DELIMITER  // 

CREATE procedure get_Appointment
(IN AppointmentDate DATE)
BEGIN
-- Declare a loca; variable to store the appointment Date
DECLARE AppointmentDate_to_Insert DATE;

SELECT A.AppointmentDate
INTO AppointmentDate_to_Insert
FROM Appointments A
WHERE AppointmentDate = AppointmentDate_to_Insert;

SELECT A.AppointmentDate, A.AppointmentTime, A.AppointmentDuration, D.DoctorName, D.DoctorSurname, P.PatientName, P.PaitentSurname
FROM Appointment A
JOIN Doctor D ON D.DoctorID = A.DoctorID
JOIN Paitent P ON P.PaitientID = A.PaitientID
ORDER BY A.AppointmentTime asc;

END //
DELIMITER ;