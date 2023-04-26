/* Write SQL Select Statements using Aggregate Functions, Group By and Having clauses for the following queries that retrieve data from university database */

/* 1.	Find the maximum and average capacity of buildings in the university. */
SELECT MAX(capacity) AS Maximum, AVG(capacity) AS AVERAGE FROM clasroom;

/* 2.	Display the least budget of the departments. */
SELECT MIN(budget) AS "Least Budget" FROM department;

/* 3.	 Find the total number of courses and credits offered by Biology department */
SELECT COUNT(course_id) AS "Total Courses", SUM(credits) AS "Total Credits"
FROM course WHERE dept_name='Biology';

/* 4.	Find the average salary of instructors in the Computer Science department */
SELECT AVG(salary) FROM instructor WHERE dept_name='Comp. Sci.';

/* 5.	Find the total number of instructors who teach a course in the Spring 2010 semester */
SELECT COUNT(DISTINCT id) FROM teaches WHERE semester='Spring' AND year=2010;

/* 6.	Find the average salary in each department. */
SELECT dept_name, AVG(salary) FROM instructor GROUP BY dept_name;

/* 7.	Find the number of instructors in each department who teach a course in the Spring 2010 semester. */
SELECT COUNT(DISTINCT i.id) AS "No.of instructors", i.dept_name 
FROM instructor i, teaches t
WHERE i.id=t.id AND t.semester='Spring' AND t.year=2010
GROUP BY dept_name;

/* 8.	Find the department name and average salary of the department for only those departments where the average salary of the instructors is more than $42,000 */
SELECT dept_name, AVG(salary) FROM instructor 
GROUP BY dept_name
HAVING AVG(salary)>42000;

/* 9.	For each course section offered in 2009, find the average total credits (tot_cred) of all students enrolled in the section, if the section had at least 2 students*/

/* 10.	For each department, find the maximum salary of instructors in that department. You may assume that every department has at least one instructor */
SELECT dept_name, MAX(salary) AS MAX_SALARY
FROM instructor
GROUP BY dept_name;

/* 11.	For the student with ID 12345 (or any other value), show the total number of credits scored for all courses (taken by that student). 
Don't display the tot_creds value from the student table, you should use SQL aggregation on courses taken by the student*/
SELECT t.id, SUM(c.credits) AS TOT_CRED 
FROM takes t, course c
WHERE t.course_id=c.course_id
GROUP BY t.id HAVING t.id='12345';

/* 12.	Display the total credits for each of the students, along with the ID of the student; don't bother about the name of the student. 
   (Don't display the tot_creds value from the student table, you should use SQL aggregation on courses taken by the student.) */
SELECT t.id, SUM(c.credits) AS TOT_CRED
FROM takes t, course c
WHERE t.course_id=c.course_id
GROUP BY t.id;
