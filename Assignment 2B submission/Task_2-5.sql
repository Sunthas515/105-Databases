-- Task 2
-- Query 1
SELECT CONCAT(firstName, " ", surname) AS 'fullName', teachingcredentials.degreecode
FROM teachingstaff INNER JOIN teachingcredentials
ON teachingcredentials.employeeNumber=teachingstaff.employeeNumber
WHERE NOT uni = 'QUT';

-- Query 2
SELECT student.studentId, CONCAT(firstName, " ", surname) AS name, gender
FROM student INNER JOIN enrolment
ON student.studentID = enrolment.studentID
WHERE enrolment.timeMode = 'PT'
ORDER BY surname ASC;

-- Query 3
SELECT teachingstaff.employeeNumber, teachingstaff.surname, COUNT(studentID) AS 'NoStudents'
FROM instructs INNER JOIN teachingstaff
ON teachingstaff.employeeNumber = instructs.employeeNumber
GROUP BY employeeNumber;

-- Query 4
SELECT DISTINCT firstName, degreeCode
FROM teachingstaff AS staff JOIN teachingcredentials AS credentials
	ON staff.employeeNumber = credentials.employeeNumber
JOIN instructs AS teaching 
	ON staff.employeeNumber = teaching.employeeNumber
WHERE NOT EXISTS
   (SELECT 1 FROM instructs AS teaching_dup
   WHERE teaching.employeeNumber = teaching_dup.employeeNumber AND subjectcode LIKE '%19%')
GROUP BY staff.employeeNumber

-- Query 5
SELECT student.studentID, surname, ROUND(SUM(grade*12)/(COUNT(subjectCode)*12), 2) as GPA, timeMode, placeMode
FROM student INNER JOIN grades
    ON student.studentID = grades.studentID
INNER JOIN enrolment
    ON grades.studentID = enrolment.studentID
GROUP BY student.studentID;

-- Query 6
SELECT instructs.subjectcode, teachingstaff.surname, COUNT(DISTINCT instructs.studentID) AS Student_Count, 
MIN(grade), MAX(grade), AVG(grade)
FROM grades INNER JOIN instructs
	ON grades.subjectcode = instructs.subjectcode
INNER JOIN teachingstaff
	ON instructs.employeeNumber = teachingstaff.EmployeeNumber
GROUP BY instructs.subjectcode

--Task 3
-- INSERT
INSERT INTO teachingstaff (employeeNumber, firstName, surname, departmentName)
VALUES ('9962040', 'Srikanth', 'Nair', 'SEF');

-- DELETE
DELETE FROM grades WHERE subjectCode LIKE 'BSB111%';

-- UPDATE
UPDATE instructs 
SET position = 'LECTURER' 
WHERE subjectcode LIKE '%IFB%' AND position = 'TUTOR';

--Task 4
-- CREATE INDEX
CREATE UNIQUE INDEX Student_Index
ON student (studentID);

-- CREATE VIEW
CREATE VIEW Perfectionists AS
SELECT DISTINCT surname, firstName, subjectcode
FROM student
LEFT JOIN grades
ON student.studentID = grades.studentID
WHERE grade = '7';


-- Task 5
-- A
GRANT UPDATE ON subject
TO chan@localhost;

-- B
GRANT DELETE ON subject
TO chan@localhost;

-- C
REVOKE UPDATE ON enrolment
FROM jake@localhost;

-- D
REVOKE DELETE ON enrolment
FROM jake@localhost