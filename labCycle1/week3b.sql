/* Find the details of all students. */
SELECT * FROM STUDENT;

/* Find the department names of instructors */
SELECT name, DEPT_NAME FROM INSTRUCTOR;

/* Find the names of all the instructors from Biology department */
SELECT name FROM INSTRUCTOR WHERE DEPT_NAME LIKE 'Biology';

/* Find the names of all instructors in the Computer Science department who have salaries greater than $70,000. */
SELECT name FROM INSTRUCTOR WHERE DEPT_NAME LIKE 'Comp. Sci.' AND SALARY>70000;

/* Find the names of courses in Computer science department which have 3 credits */
SELECT title FROM COURSE WHERE DEPT_NAME LIKE 'Comp. Sci.' AND CREDITS=3;

/* Find the names of the instructors, their present salaries and the resulting salaries if they were given a 10% raise. */
SELECT name, salary, (salary * 1.1) AS "RAISED SALARY" FROM INSTRUCTOR;

/* Find the names of instructors with salary amounts between $90,000 and $100,000 */
SELECT name FROM INSTRUCTOR WHERE SALARY BETWEEN 90000 AND 100000;

/* Find all instructors whose salary is unknown */
SELECT name FROM instructor WHERE salary=NULL;

/* Find the names of all departments whose building name includes the substring ‘Watson’. */
SELECT DEPT_NAME FROM DEPARTMENT WHERE BUILDING LIKE '%Watson%';

/* Find departments whose names contain the string “sci” as a substring, regardless of the case */
SELECT dept_name FROM DEPARTMENT WHERE LOWER(DEPT_NAME) LIKE '%sci%';

/* List the names of all instructors in the Physics department in alphabetic order */
SELECT name FROM INSTRUCTOR WHERE DEPT_NAME LIKE 'Physics' ORDER BY name ASC;

/* List the entire instructor relation in descending order of salary. If several instructors have 
the same salary, order them in ascending order by name. */
SELECT * FROM INSTRUCTOR ORDER BY SALARY DESC, name ASC;