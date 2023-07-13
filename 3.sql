-- 1.
CREATE TABLE Part(
    part_no     number,
    part_name   varchar(20),
    color       varchar(20),
    PRIMARY KEY(part_no)
);

CREATE TABLE Project(
    proj_no     number,
    name        varchar(20),
    location    varchar(20),
    budget      number NOT NULL,
    PRIMARY KEY (proj_no)
);

CREATE TABLE Supplies(
    proj_no     number,
    part_no     number,
    qty         number,
    FOREIGN KEY (proj_no) REFERENCES Project,
    FOREIGN KEY (part_no) REFERENCES Part
);

-- 2.
INSERT INTO Part VALUES (1, 'Clamp', 'Silver');
INSERT INTO Part VALUES (2, 'Screws', 'Black');

INSERT INTO Project VALUES(1, 'Robotics', 'Hyderabad', 50000);
INSERT INTO Project VALUES(2, 'Hydro Power', 'Vizag', 25000);

INSERT INTO Supplies VALUES(1, 1, 50);
INSERT INTO Supplies VALUES(2, 1, 20);

DELETE Supplies WHERE qty=20;
DELETE Project WHERE proj_no=2;

-- 3.
ALTER TABLE Supplies ADD CONSTRAINT PQty CHECK (qty > 0);

-- 4.
SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE FROM USER_CONSTRAINTS;

-- TABLE_NAME                     CONSTRAINT_NAME                C
-- ------------------------------ ------------------------------ -
-- EMP                            SYS_C007095                    P
-- PART                           SYS_C007096                    P
-- PROJECT                        SYS_C007097                    C
-- PROJECT                        SYS_C007098                    P
-- SUPPLIES                       SYS_C007099                    R
-- SUPPLIES                       SYS_C007100                    R  --> Note this name
-- SUPPLIES                       PQTY                           C

ALTER TABLE Supplies DROP CONSTRAINT SYS_C007100;

-- 5.
(SELECT ENAME FROM EMP)
MINUS
(SELECT ENAME FROM EMP WHERE MGR IN (SELECT EMPNO FROM EMP));

-- 6.
SELECT E.ENAME, D.DNAME FROM EMP E, DEPT D WHERE EMPNO IN (SELECT MGR FROM EMP) AND E.DEPTNO=D.DEPTNO;

-- 7.
SELECT distinct D.DNAME, D.LOC, E.SALARY FROM DEPT D, EMP E WHERE E.SALARY IN (
    SELECT MAX(M.SALARY) FROM EMP M WHERE D.DEPTNO=M.DEPTNO GROUP BY M.DEPTNO HAVING COUNT(M.DEPTNO)>=5
);

-- 8.
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'DAY')='MONDAY' AND 
(TO_CHAR(NEXT_DAY(HIREDATE, 'MONDAY'), 'MM') - TO_CHAR(HIREDATE, 'MM')) =1;

-- 9.
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HRIE_YEAR, COUNT(empno) AS NO_OF_EMP
FROM emp GROUP BY TO_CHAR(HIREDATE,  'YYYY') HAVING COUNT(empno) IN(
SELECT MAX(COUNT(empno)) FROM emp GROUP BY TO_CHAR(HIREDATE, 'YYYY'));

-- 10.
SELECT TO_CHAR(TO_DATE('&dt', 'DD-MM-YYYY'), 'MONTH') AS MONTH FROM DUAL;

SELECT d.dname, e.empno from emp e, dept d where e.deptno=d.deptno;

SELECT d.DNAME AS DepartmentName,
       (SELECT COUNT(*) FROM emp WHERE DEPTNO = d.DEPTNO) AS NumEmployees
FROM dept d;

CREATE TABLE MOVIE (id number,title varchar(50), year_of_release number, status varchar(20), censored varchar(2));
CREATE TABLE PEOPLE (id number, movie_id number, movie_role varchar(20), DOB date, gender varchar(2));

CREATE VIEW movies_with_same_titles AS
SELECT m1.id AS movie1_id, m1.title AS movie1_title, m1.year_of_release AS movie1_year,
       m2.id AS movie2_id, m2.title AS movie2_title, m2.year_of_release AS movie2_year
FROM MOVIE m1, MOVIE m2
WHERE m1.title = m2.title AND m1.id <> m2.id;

ALTER TABLE MOVIE ADD CONSTRAINT UniqId PRIMARY KEY (id);

ALTER TABLE MOVIE ADD CONSTRAINT statusChk CHECK(status IN ('hit', 'average', 'flop'));

CREATE VIEW male_players_in_delhi_events AS
SELECT p.playerid, p.name AS player_name, p.gender, p.year AS birth_year,
       e.eventid, e.name AS event_name, e.description, e.city
FROM Participant p, Event e
WHERE p.eventid = e.eventid AND p.gender = 'Male' AND e.city = 'Delhi';


SELECT E.ENAME AS EMP_NAME, M.ENAME AS MGR_NAME FROM EMP E, EMP M WHERE E.MGR=M.EMPNO;

SELECT ENAME , (SALARY+NVL(COMM,0)) AS TOT_SAL FROM EMP;