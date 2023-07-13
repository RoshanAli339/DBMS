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

SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT D.DNAME, D.LOC, MAX(E.SALARY) FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
GROUP BY E.DEPTNO, D.DEPTNO HAVING E.DEPTNO=D.DEPTNO;