--1. Provide a SQL script that initializes the database for the Job Board scenario “CareerHub
CREATE DATABASE CareerHub;
USE CareerHub;

--2. Create tables for Companies, Jobs, Applicants and Applications. 

--COMPANIES TABLE 
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Companies')
BEGIN
CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY IDENTITY(1,1),
    CompanyName VARCHAR(30) NOT NULL,
    [Location] VARCHAR(30) NOT NULL
);
PRINT 'Table Companies created successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Table Companies already exists.';
    END

-- JOBS TABLE
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Jobs')
BEGIN
CREATE TABLE Jobs (
    JobID INT PRIMARY KEY IDENTITY(1,1),
    CompanyID INT,
    JobTitle VARCHAR(50) NOT NULL,
    JobDescription TEXT NOT NULL,
    JobLocation VARCHAR(30) NOT NULL,
    Salary DECIMAL NOT NuLL CHECK (Salary >= 0),
    JobType VARCHAR(50) CHECK (JobType IN ('Full-time', 'Part-time', 'Contract')),
    PostedDate DATETIME,
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);
PRINT 'Table Jobs created successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Table Jobs already exists.';
    END

-- APPLICANTS TABLE
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Applicants')
BEGIN
CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL CHECK (CHARINDEX('@', Email) > 0),
	City VARCHAR(30),
	[State] VARCHAR(30),
    Phone VARCHAR(12) NOT NULL,
    Resume int NOT NULL
);
PRINT 'Table Applicants created successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Table Applicants already exists.';
    END

-- APPLICATIONS TABLE
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Applicaions')
BEGIN
CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY IDENTITY(1,1),
    JobID INT,
    ApplicantID INT,
    ApplicationDate DATETIME NOT NULL,
    CoverLetter TEXT NOT NULL,
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID)
);
PRINT 'Table Applications created successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Table Applications already exists.';
    END

--3. 
/*Define appropriate primary keys, foreign keys, and constraints. */
-- Defined

--4.
/*Ensure the script handles potential errors, such as if the database or tables already exist.*/
-- Ensured at time of table Creation


-- Inserting Data Into Companies Table
INSERT INTO Companies (CompanyName, Location) VALUES ('ABC Corporation', 'Indore'),
('XYZ Inc.', 'Pune'),
('Tech Solutions Ltd.', 'Chennai'),
('Global Innovations', 'Mumbai'),
('Software Co.', 'Hyderabad'),
('TechGenius', 'Jaipur'),
('IT Experts', 'Indore'),
('Web Developers Inc.', 'Indore'),
('Future Technologies', 'Chennai'),
('Digital Solutions Ltd.', 'Pune');
select * from companies

-- INSERT INTO JOBS
select * from jobs
INSERT INTO Jobs (CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate)
VALUES (1, 'Software Engineer', 'Developing software applications', 'Indore', 80000, 'Full-time', '2024-04-11'),
(1, 'Data Analyst', 'Analyzing data for insights', 'Indore', 70000, 'Full-time', '2023-04-22'),
(2, 'Web Developer', 'Building websites and web applications', 'Pune', 75000, 'Full-time', '2022-08-13'),
(2, 'Network Engineer', 'Managing network infrastructure', 'Pune', 85000, 'Full-time', '2023-12-04'),
(3, 'Software Developer', 'Developing software solutions', 'Chennai', 90000, 'Full-time', '2023-05-05'),
(4, 'Project Manager', 'Managing projects and teams', 'Mumbai', 100000, 'Full-time', '2021-04-16'),
(5, 'UX/UI Designer', 'Designing user interfaces', 'Hyderabad', 80000, 'Full-time', '2022-06-07'),
(6, 'Database Administrator', 'Managing databases', 'Jaipur', 95000, 'Full-time', '2023-08-19'),
(7, 'Quality Assurance Analyst', 'Testing software applications', 'Indore', 85000, 'Full-time', '2024-04-09'),
(8, 'Software Tester', 'Testing software functionality', 'Indore', 70000, 'Full-time', '2024-04-10');

-- INSERT INTO Applicants Table
INSERT INTO Applicants (FirstName, LastName, Email, City, [State], Phone, [Resume])
VALUES 
    ('Aman', 'Vyas', 'aman.vyas@gmail.com','Indore','Madhya Pradesh' ,'1234567890', 3),
    ('Manas', 'Joshi', 'joshi.sm@gmail.com','Indore','Madhya Pradesh ','9876543210', 2),
    ('Michael', 'Xyz', 'michael.xyz@gmail.com','Bhopal','Madhya Pradesh', '4567890123', 1),
    ('Shriti', 'Soni', 'shruti234@gmail.com', 'Mumbai', 'Maharashtra','3216540987', 2),
    ('Somil', 'Joshi', 'joshi.Somil@gmail.com','Pune','Maharashtra', '7890123456', 4),
    ('Tanya', 'Nayak', 'Nayak.tanya@gmail.com','Pune','Maharashtra', '2109876543', 4),
    ('Shashank', 'Sharma', 'sharma123s@gmail.com','Chennai','Tamil Nadu', '5678901234', 3),
    ('Meenal', 'Pathak', 'Pathak123mee@gmail.com','Chennai','Tamil Nadu', '2345678901', 2),
    ('Lisa', 'Pqr', 'pqr_lisa@gmail.com','Chennai','Tamil Nadu', '6543210987', 0),
    ('Nyan', 'Sharma', 'sharma.nayam78@gmail.com','Kolkata','West Bengal', '7894561230', 1);

	

-- INSERT INTO Applications Table
INSERT INTO Applications (JobID, ApplicantID, ApplicationDate, CoverLetter)
VALUES 
    (1, 1, '2024-04-21 08:00:00', 'Cover letter for Software Engineer position'),
    (1, 2, '2024-04-22 09:00:00', 'Cover letter for Software Engineer position'),
    (1, 3, '2024-04-13 10:00:00', 'Cover letter for Software Engineer position'),
    (4, 4, '2024-01-04 11:00:00', 'Cover letter for Network Engineer position'),
    (5, 5, '2023-06-05 12:00:00', 'Cover letter for Software Developer position'),
    (6, 1, '2021-05-06 13:00:00', 'Cover letter for Project Manager position'),
    (7, 7, '2022-07-07 14:00:00', 'Cover letter for UX/UI Designer position'),
    (8, 2, '2023-09-08 15:00:00', 'Cover letter for Database Administrator');

--5.
/*Write an SQL query to count the number of applications received for each job listing in the 
"Jobs" table. Display the job title and the corresponding application count. Ensure that it lists all 
jobs, even if they have no applications */

SELECT J.JobTitle, COUNT(A.ApplicationID) AS ApplicationCount
FROM Jobs J
LEFT JOIN Applications A ON J.JobID = A.JobID
GROUP BY J.JobID, J.JobTitle;

--6.
/*. Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary 
range. Allow parameters for the minimum and maximum salary values. Display the job title, 
company name, location, and salary for each matching job. */

DECLARE @MinSalary DECIMAL = 60000; -- Minimum salary parameter
DECLARE @MaxSalary DECIMAL = 80000; -- Maximum salary parameter

SELECT J.JobTitle, C.CompanyName, J.JobLocation, J.Salary
FROM Jobs J
JOIN Companies C ON J.CompanyID = C.CompanyID
WHERE J.Salary BETWEEN @MinSalary AND @MaxSalary;

--7.
/*
Write an SQL query that retrieves the job application history for a specific applicant. Allow a 
parameter for the ApplicantID, and return a result set with the job titles, company names, and 
application dates for all the jobs the applicant has applied to.
*/

DECLARE @ApplicantID INT = 1; -- Displaying Appication History for Applicant with ApplicantID 1 

SELECT J.JobTitle, C.CompanyName, A.ApplicationDate
FROM Applications A
JOIN Jobs J ON A.JobID = J.JobID
JOIN Companies C ON J.CompanyID = C.CompanyID
WHERE A.ApplicantID = @ApplicantID;

--8.
/*
Create an SQL query that calculates and displays the average salary offered by all companies for 
job listings in the "Jobs" table. Ensure that the query filters out jobs with a salary of zero.
*/

SELECT AVG(Salary) AS Average_Salary
FROM Jobs
WHERE Salary > 0;

--9.
/*
Write an SQL query to identify the company that has posted the most job listings. Display the 
company name along with the count of job listings they have posted. Handle ties if multiple 
companies have the same maximum count.
*/

WITH JobCounts AS (
    SELECT
        C.CompanyName,
        COUNT(J.JobID) AS JobCount
    FROM
        Companies C
    JOIN
        Jobs J ON C.CompanyID = J.CompanyID
    GROUP BY
        C.CompanyName
)

SELECT
    CompanyName, JobCount
FROM
    JobCounts
WHERE
    JobCount = (
        SELECT MAX(JobCount)
        FROM JobCounts
    );


--10
/*
Find the applicants who have applied for positions in companies located in 'CityX' and have at 
least 3 years of experience
*/

DECLARE @TargetCity NVARCHAR(50) = 'Indore'; -- Considered CityX location as Indore
DECLARE @ExperienceYears INT = 3; -- minimum experience years

SELECT DISTINCT A.*
FROM Applicants A
JOIN Applications AP ON A.ApplicantID = AP.ApplicantID
JOIN Jobs J ON AP.JobID = J.JobID
JOIN Companies C ON J.CompanyID = C.CompanyID
WHERE C.Location = @TargetCity
AND A.Resume >= @ExperienceYears;


--11
/*
Retrieve a list of distinct job titles with salaries between $60,000 and $80,000
*/
SELECT DISTINCT JobTitle, SALARY
FROM Jobs
WHERE Salary BETWEEN 60000 AND 80000;

--12.
/*
Find the jobs that have not received any applications
*/
SELECT * FROM Jobs
WHERE JobID NOT IN (SELECT DISTINCT JobID FROM Applications);

--13.
/*
Retrieve a list of job applicants along with the companies they have applied to and the positions 
they have applied for
*/
SELECT A.ApplicantID, A.FirstName, A.LastName, C.CompanyName, J.JobTitle
FROM Applications AP
JOIN Applicants A ON AP.ApplicantID = A.ApplicantID
JOIN Jobs J ON AP.JobID = J.JobID
JOIN Companies C ON J.CompanyID = C.CompanyID
ORDER BY ApplicantID;

--14.
/* Retrieve a list of companies along with the count of jobs they have posted, even if they have not 
received any applications. */

SELECT C.CompanyID, C.CompanyName, COUNT(J.JobID) AS Count_of_Jobs_Posted
FROM Companies C
LEFT JOIN Jobs J ON C.CompanyID = J.CompanyID
GROUP BY C.CompanyName, C.CompanyID;

--15.
/*
List all applicants along with the companies and positions they have applied for, including those 
who have not applied
*/
SELECT A.FirstName, A.LastName, ISNULL(C.CompanyName, 'Not Applied') AS CompanyName, ISNULL(J.JobTitle, 'Not Applied') AS JobTitle
FROM Applicants A
LEFT JOIN Applications AP ON A.ApplicantID = AP.ApplicantID
LEFT JOIN Jobs J ON AP.JobID = J.JobID
LEFT JOIN Companies C ON J.CompanyID = C.CompanyID;

--16.
/*
Find companies that have posted jobs with a salary higher than the average salary of all job
*/
SELECT DISTINCT C.CompanyID, C.CompanyName
FROM Companies C
JOIN Jobs J ON C.CompanyID = J.CompanyID
WHERE J.Salary > (
    SELECT AVG(Salary)
    FROM Jobs
);

--17.
/*
Display a list of applicants with their names and a concatenated string of their city and state
*/

SELECT A.FirstName, A.LastName, 
CONCAT(A.City, ', ', A.[State]) AS CityState
FROM  Applicants A;


--18.
/*Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer*/

SELECT *
FROM Jobs
WHERE JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%';

--19.
/*
Retrieve a list of applicants and the jobs they have applied for, including those who have not 
applied and jobs without applicants
*/

SELECT A.FirstName, A.LastName, ISNULL(J.JobTitle, 'No Job Applied') AS JobTitle
FROM Applicants A
LEFT JOIN Applications AP ON A.ApplicantID = AP.ApplicantID
LEFT JOIN Jobs J ON AP.JobID = J.JobID;


--20.
/*
List all combinations of applicants and companies where the company is in a specific city and the 
applicant has more than 2 years of experience. For example: city=Chennai
*/


SELECT A.ApplicantID, C.CompanyID, A.FirstName, A.LastName, C.CompanyName, A.resume AS YEARS_of_Experience
FROM Applicants A
CROSS JOIN Companies C
WHERE C.Location = 'Chennai' AND Resume>2;


