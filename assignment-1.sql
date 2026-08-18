
---============================ Assignment 1 ====================================
CREATE TABLE college(
	 college_name VARCHAR(10),
	 state VARCHAR(10),
	 enrollment int 
);

INSERT INTO college(college_name,state,enrollment)
	  VALUES('Stanford','CA',15000),
	  		('Berkeley','CA',36000),
			('MIT','MA',10000),
			('Cornell','NY',21000),
			('Harvard','MA',50040);

CREATE TABLE student (
	 sID  INT,
	 sName VARCHAR(10),
	 GPA NUMERIC(2,1),
	 sizeHS int,
	 DOB DATE
);
INSERT INTO Student (sID, sName, GPA, sizeHS, DoB) VALUES
				(123, 'Amy', 3.9, 1000, '1996-06-26'),
				(234, 'Bob', 3.6, 1500, '1995-04-07'),
				(345, 'Craig', 3.5, 500, '1995-02-04'),
				(456, 'Doris', 3.9, 1000, '1997-07-24'),
				(567, 'Edward', 2.9, 2000, '1996-12-21'),
				(678, 'Fay', 3.8, 200, '1996-08-27'),
				(789, 'Gary', 3.4, 800, '1996-10-08'),
				(987, 'Helen', 3.7, 800, '1997-03-27'),
				(876, 'Irene', 3.9, 400, '1996-03-07'),
				(765, 'Jay', 2.9, 1500, '1998-08-08'),
				(654, 'Amy', 3.9, 1000, '1996-05-26'),
				(543, 'Craig', 3.4, 2000, '1998-08-27');
	
CREATE TABLE apply(
	 sID INT,
	 cName VARCHAR(10),
	 major VARCHAR(20),
	 decision CHAR(1)
);
INSERT INTO Apply (sID, cName, major, decision) 
VALUES   		(123, 'Stanford', 'CS', 'Y'),
				(123, 'Stanford', 'EE', 'N'),
				(123, 'Berkeley', 'CS', 'Y'),
				(123, 'Cornell', 'EE', 'Y'),
				(234, 'Berkeley', 'biology', 'N'),
				(345, 'MIT', 'bioengineering', 'Y'),
				(345, 'Cornell', 'bioengineering', 'N'),
				(345, 'Cornell', 'CS', 'Y'),
				(345, 'Cornell', 'EE', 'N'),
				(678, 'Stanford', 'history', 'Y'),
				(987, 'Stanford', 'CS', 'Y'),
				(987, 'Berkeley', 'CS', 'Y'),
				(876, 'Stanford', 'CS', 'N'),
				(876, 'MIT', 'biology', 'Y'),
				(876, 'MIT', 'marine biology', 'N'),
				(765, 'Stanford', 'history', 'Y'),
				(765, 'Cornell', 'history', 'N'),
				(765, 'Cornell', 'psychology', 'Y'),
				(543, 'MIT', 'CS', 'N');


-- 1. List the student name, dob from student table

SELECT sName,
       DOB AS DOB
FROM student;
-- 2. List the name of student scoring more than 3.7 in GPA.

SELECT sName AS student_name
FROM student
WHERE GPA > 3.7;
-- 3. List the name of student whose High School size is at least 1000
-- and born after 1996

SELECT sName AS student_name
FROM student
WHERE
    sizeHS > 1000
    AND TO_CHAR(DOB, 'YYYY') > '1996';
-- 4. List the name of student who are scoring GPA in between 2.9 and 3.9

SELECT sName AS student_name
FROM student
WHERE
    GPA BETWEEN 2.9 AND 3.9;


--6. List the students who are scored more than 2.0 but less than 3.5.

SELECT * FROM student
WHERE GPA BETWEEN 2.0 AND 3.4;


--7. List the students who have born after 1st Jul 96 in the order of the Date of Birth.

SELECT * FROM student
WHERE DOB > '1996-07-01';


--8. List the sID, cName, decision of applications that are accepted.
SELECT sID,
	   cName,
	   decision
FROM apply
WHERE decision = 'Y';

SELECT sID,
       cName,
       decision
FROM apply
WHERE decision = 'Y';


--9. List the sID, cName of applications which are filled at Stanford.

SELECT sID,
       cName
FROM apply
WHERE cName = 'Stanford';


--10. List the colleges that that has enrollment greater than 10001.
 
SELECT college_name
FROM college
WHERE enrollment > 10001;


--11. List the colleges not in California.

SELECT * FROM college
WHERE state <> 'CA';


--12. List names of all student who came from high school having size greater than 17000
-- scored GPA less than 3.8.

SELECT sName
FROM student
WHERE sizeHS > 17000
      AND GPA < 3.8;


--13. Display the description of the Student table.

SELECT column_name,
       data_type
FROM information_schema.columns
WHERE table_name = 'student';


--14. Display the details of all students.

SELECT * FROM student;


--15. Display unique majors.

SELECT DISTINCT major
FROM apply;


--16. List the student names those are having three characters in their Names.

SELECT sName
FROM student
WHERE LENGTH(sName) = 3;


--17. List the student names those are starting with ‘H’ and with five characters.

SELECT sName
FROM student
WHERE sName LIKE 'H%'
      AND LENGTH(sName) = 5;


--18. List the student names those are having third character and fifth char. must be ‘e’.

SELECT sName
FROM student
WHERE sName LIKE '__e_e%';


--19. List the student names ending with ‘y’.

SELECT sName
FROM student
WHERE sName LIKE '%y';


--20. List the Students in the order of their GPA.

SELECT sName,
       GPA
FROM student
ORDER BY GPA DESC;


--21. List the details of the students in order of the ascending of GPA and descending of DoB.

SELECT * FROM student
ORDER BY GPA ASC, DOB DESC;


--22. List the sIDs of student who apply in either ‘Stanford’, ‘Cornell’ or ‘MIT’ college.

SELECT sID
FROM apply
WHERE cName IN ('Stanford', 'Cornell', 'MIT');


--23. Modify the GPA of all students by giving 10% raise in their GPA.

UPDATE student
SET GPA = GPA + (GPA * 0.1);


--24. Increment the GPA of the students by 1.5 whose GPA is less than 3.5 and belongs to High School
-- having size greater than 1500.

UPDATE student
SET GPA = GPA + 1.5
WHERE GPA < 3.5 AND sizeHS > 1500;


--25. Delete all applications filled at Stanford (Choose table wisely)

DELETE FROM apply
WHERE cName = 'Stanford';

SELECT * FROM apply;


--26. Delete the college Stanford from college table.

DELETE FROM college
WHERE college_name = 'Stanford';

SELECT * FROM college;


--27. Delete the students who have scored less than 3.2 GPA.

DELETE FROM student
WHERE GPA < 3.2;



--------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
---------------------------practice sheet -------------------------------

CREATE TABLE Dept(
	 deptno INT PRIMARY KEY,
	 dname VARCHAR(50),
	 Loc VARCHAR(100)
);

INSERT INTO Dept(deptno,dname,Loc)
	 VALUES(1,'Accounting','ST Louis'),
	 	   (2,'Research','New York'),
			(3,'Sales','Atlanta'),
			(4,'Operations','Seattle');


CREATE TABLE Employee(
	 empno INT PRIMARY KEY,
	 ename VARCHAR(30) NOT NULL,
	 job VARCHAR(20),
	 mgr INT,
	 hire_date DATE,
	 salary NUMERIC(10,2),
	 comm INT,
	 dept INT
);

INSERT INTO employee (empno, ename, job, mgr, hire_date, salary, comm, dept)
VALUES
(1, 'JOHNSON', 'ADMIN', 6, '1990-12-17', 18000, NULL, 4),
(2, 'HARDING', 'MANAGER', 9, '1998-02-02', 52000, 300, 3),
(3, 'TAFT', 'SALES I', 2, '1996-01-02', 25000, 500, 3),
(4, 'HOOVER', 'SALES I', 2, '1990-04-02', 27000, NULL, 3),
(5, 'LINCOLN', 'TECH', 6, '1994-06-23', 22500, 1400, 4),
(6, 'GARFIELD', 'MANAGER', 9, '1993-05-01', 54000, NULL, 4),
(7, 'POLK', 'TECH', 6, '1997-09-22', 25000, NULL, 4),
(8, 'GRANT', 'ENGINEER', 10, '1997-03-30', 32000, NULL, 2),
(9, 'JACKSON', 'CEO', NULL, '1990-01-01', 75000, NULL, 4),
(10, 'FILLMORE', 'MANAGER', 9, '1994-08-09', 56000, NULL, 2),
(11, 'ADAMS', 'ENGINEER', 10, '1996-03-15', 34000, NULL, 2),
(12, 'WASHINGTON', 'ADMIN', 6, '1998-04-16', 18000, NULL, 4),
(13, 'MONROE', 'ENGINEER', 10, '2000-12-03', 30000, NULL, 2),
(14, 'ROOSEVELT', 'CPA', 9, '1995-10-12', 35000, NULL, 1),
(15, 'HANCOCK', 'SALES I', 2, '1990-03-02', 27500, NULL, 3);


--Q1.  Employee Name and Hire Date sorted by Hire Date (Recent to Old). 

SELECT ename AS emp_name,
	   hire_date AS Hire_date
FROM Employee
ORDER BY hire_date DESC;

--Q2. Employee Name and Job sorted by Job (Alphabetically) 

SELECT  LOWER(ename) As Employee_name,
	    LOWER(job) 
FROM employee
ORDER BY Job ASC;

--Q3. Employee Name and Job for all Engineers, sorted by Employee Name Alphabetically 

SELECT ename AS emp_name,
	   job 
FROM employee
WHERE job = 'ENGINEER'
ORDER BY ename ASC;

--Q4. Job, Employee Name, Salary and Commission for employees with salary over 50000 sorted by Salary
--			(Largest to Smallest). 

SELECT ename AS employee_name,
	   job,
	   salary,
	   comm
FROM employee
WHERE salary>50000
ORDER BY salary DESC;


--Q5. Job, Employee Name, Salary and Commission for employees with a Commission sorted by Salary
--		(Largest to Smallest). 

SELECT ename AS emp_name,
	   salary,
	   comm
FROM employee
WHERE comm IS NOT NULL
ORDER BY salary DESC;

--Q6. Job, Employee Name, Salary and Commission for employees whose name starts with the letter H 

SELECT ename AS employee_name,
	   job,
	   salary,
	   comm
FROM employee
WHERE ename like 'H%';

--Q7. Job, Employee Name, Salary and Commission for employees whose name starts with the letter H and 
--		who do not get commission. 

SELECT  ename AS employee_name,
	    job,
		salary,
		comm
FROM employee
WHERE ename LIKE 'H%' 
	  AND comm IS NULL;

--Q8. Job, Employee Name for employees in Dept No. 3. 

SELECT ename AS employee_name,
	   job
FROM employee
WHERE dept = 3;

--Q9. Dept Name and Loc for employees in Dept No. 3. 

SELECT dName AS department_name,
	   loc AS location
FRom dept
WHERE deptno = 3;

--Q10. Job, Employee Name, Dept, Salary, sorted first by Dept (Smallest to Largest) and then Salary
--		(Largest to Smallest) 

SELECT ename AS employee_name,
	    job,
       dept,
	   salary
FROM employee 
ORDER BY dept ASC,
	     salary DESC;
	   
