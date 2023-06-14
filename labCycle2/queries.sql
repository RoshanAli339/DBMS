/* 1. Display the department names in the lower case but the initial must be in uppercase. */
SELECT INITCAP(dname) FROM dept;

/* 2. Determine the ‘ename’, ‘job’, ‘sal’ rename the title as Job-sal the output must be Job-Sal as
SMITH [CLERK] RS.2000 */
SELECT ename || ' [' || job || ']' || ' RS.' || salary as "Job-sal" FROM emp;

/* 3. For each department, Count the number of times S occurs in department names. */
SELECT dname, length(dname)-length(replace(dname,'S',NULL)) as "Freq of S" FROM dept;

/* 4. Write a query to display the department name which does not contain any employees. */
SELECT dname FROM dept WHERE deptno NOT IN (SELECT DISTINCT deptno FROM emp);

/* 5. Write a query to display all employee details where employee was joined in year date wise
1980 and 1990 and 2nd week of every month */
SELECT * FROM emp 
WHERE TO_CHAR(hiredate, 'YYYY') BETWEEN 1980 AND 1990
AND TO_CHAR(hiredate, 'W') =02;

/* 6. Write an SQL statement to convert the current date to new date picture ex: MONDAY 10th
June 2005 10:30.00 PM */
SELECT TO_CHAR(SYSDATE, 'DAY DDth MONTH HH:MI:SS AM') AS "DATE-TIME" FROM DUAL;

/* 7. Write a query to display all employee details who joined last Wednesday of a month and
experience should be greater than 20 months. */
SELECT * FROM emp 
WHERE (TO_CHAR(HIREDATE, 'DY')='WED' AND TO_CHAR(HIREDATE, 'MM') - TO_CHAR(NEXT_DAY(HIREDATE, 'WEDNESDAY'), 'MM')=1)
AND MONTHS_BETWEEN(CURRENT_DATE, HIREDATE)>20;

/* 8. Write a query to calculate the service of employees rounded to years.*/
SELECT empno, ename, hiredate, FLOOR(MONTHS_BETWEEN(CURRENT_DATE, HIREDATE)/12) AS SERVICE_IN_YEARS FROM emp;

/* 11. Display the time of day */
SELECT TO_CHAR(CURRENT_DATE, 'HH:MI:SS AM') FROM dual;


/* 12. Find all employees who earn a salary greater than the average salary of their departments. */
SELECT e.* FROM emp e WHERE e.SALARY > (
    SELECT AVG(SALARY) FROM emp WHERE deptno=e.deptno GROUP BY deptno
);

/* 13. Write a query to find the name of the manager and number of sub-ordinates.*/
SELECT M.ename AS Mgr_name, (SELECT COUNT(*) FROM emp WHERE M.empno=mgr) AS "No.of subs" FROM emp M;

/* 14. Write a query to find out the manager having Maximum number of sub-ordinates. */

/* 15. Write a query to find out the employees who have joined before their managers. */
SELECT E.ename AS EMP_NAME FROM emp E 
WHERE EXISTS (
    SELECT * FROM emp M WHERE E.mgr=M.empno AND E.HIREDATE < M.HIREDATE 
);
