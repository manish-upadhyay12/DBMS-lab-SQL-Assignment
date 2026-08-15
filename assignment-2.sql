-------------------------Assignment-2 --------------------------------

 CREATE TABLE college(
	 cName VARCHAR(10),
	 state 	VARCHAR(10),
	 enrollment INT
 );

CREATE TABLE student(
	 sID INT,
	 sName VARCHAR(10),
	 GPA numeric(2,1),
	 sizeHS INT
);

CREATE TABLE apply (
	 sID INT,
	 cName VARCHAR(10),
	 major 	VARCHAR(20)
);

--1. Add cName as Primary key in College. 

ALTER TABLE college
ADD CONSTRAINT coName PRIMARY KEY(cName);

--2  Add sID as Primary key in Student. 

ALTER TABLE student
ADD CONSTRAINT constraints PRIMARY KEY(sID);

--3. Add sID, cName, major as Primarykey in Apply. 

ALTER TABLE apply
ADD CONSTRAINT app_pri PRIMARY KEY(sID,cName,major);

--4. Make sID in Applyforeignkey referring table student and cName referring table college. 

ALTER TABLE apply

ADD CONSTRAINT for_key1
FOREIGN KEY (sID)
REFERENCES student(sID);

ALTER TABLE apply
ADD CONSTRAINT for_key2
FOREIGN KEY(cName)
REFERENCES college(cName);

-- 5. Increase data type size of major from 20 to 25. 

ALTER TABLE  apply
ALTER COLUMN major TYPE VARCHAR(25);

--6 Add a new column decision in the Apply table keeping a constraint of not null for this column with data type varchar2(3).

ALTER TABLE apply
ADD COLUMN decision VARCHAR(3) NOT NULL;

--7. Change data type of decision in Apply to char(1). 

ALTER TABLE apply
ALTER COLUMN decision TYPE char(1);

--8. Drop foreign key on column name cName from Apply table. 

ALTER TABLE apply
DROP CONSTRAINT for_key2;


--9.  Remove column sizeHS from Student table

ALTER TABLE Student 
DROP COLUMN sizeHs;

--10 Drop primary key from College 

ALTER TABLE college 
DROP CONSTRAINT  coName;  -- coName is the constraint name of primary key

-- 11. Make cName, major unique pairwise such as Stanford CS, Stanford EE. 

ALTER TABLE apply
ADD CONSTRAINT uni_con UNIQUE(cName,major);

--12. Add cName as Foreign Key in Apply table referring table College usingon delete cascade.

ALTER TABLE apply
ADD CONSTRAINT for_key 
FOREIGN KEY(cName)
REFERENCES college(cName);

--13. Modify foreign key on sID in Apply table to foreign key on delete set null. 

ALTER TABLE Apply
DROP CONSTRAINT for_key1;

ALTER TABLE Apply
ADD CONSTRAINT for_key1
FOREIGN KEY (sID)
REFERENCES Student(sID)
ON DELETE SET NULL;

--14. Rename column enrollment to enroll in College Table. 

ALTER TABLE college 
RENAME COLUMN enrollment  to enroll  ;

