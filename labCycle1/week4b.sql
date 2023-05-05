/* 1. Find the total number of (distinct) students who have taken course sections
 taught by the instructor with ID 10101 */
SELECT COUNT(DISTINCT t.id)
FROM takes t, teaches th 
WHERE th.id='10101' AND t.course_id=th.course_id AND t.sec_id=th.sec_id;

/* 2. Find the names of all instructors whose salary is greater than at 
least ne instructor in the Biology department*/
SELECT DISTINCT name FROM instructor WHERE salary > SOME(
    SELECT salary FROM instructor WHERE dept_name='Biology'
);

/* 3. Find the departments that have the highes average salary */
SELECT dept_name FROM instructor GROUP BY dept_name HAVING AVG(salary) >= ALL(
    SELECT AVG(salary) FROM instructor GROUP BY dept_name
);

/* 4. Find all the courses taught in both the Fall 2009 and Spring 2010 semesters*/
SELECT course_id FROM teaches WHERE semester='Fall' AND year=2009 AND course_id IN(
    SELECT course_id FROM teaches WHERE semester='Spring' AND year=2010
);

/* 5. Find all the courses taught in the Fall 2009 semester but not in the Spring 2010 semester */
SELECT course_id FROM teaches WHERE semester='Fall' AND year=2009 AND course_id NOT IN (
    SELECT course_id FROM teaches WHERE semester='Spring' AND year=2010
);

/* 6. Fina all courses taught in both the Fall 2009 semester and in the Spring 2010 semester
(Write a correlated nested query) */
SELECT t.course_id FROM teaches t WHERE semester='Fall' AND year=2009 AND EXISTS(
    SELECT * FROM teaches s WHERE s.semester='Spring' AND s.year=2010 AND t.course_id=s.course_id
);

/* 7. Find all students who have taken all courses offered in the Biology department (Write a correlate
nested query) */
SELECT DISTINCT s.id FROM student s WHERE NOT EXISTS(
    (SELECT course_id FROM course WHERE dept_name='Biology')
    MINUS
    (SELECT t.course_id FROM takes t WHERE s.id=t.id)
);

/* 8. Find all courses that were offered at most once in 2009 */
SELECT DISTINCT course_id FROM teaches WHERE year=2009 
GROUP BY course_id HAVING COUNT(course_id) <= 1;

/* 9. Find all courses that were offered at least twice in 2009 */
SELECT DISTINCT course_id FROM teaches WHERE year=2009 
GROUP BY course_id HAVING COUNT(course_id) >= 2;

/* 10. Fina the average instructors' salaries of those departments where the average salary is greater
than $42,000 */
SELECT dept_name, AVG(salary) AS AVG_SALARY FROM instructor 
GROUP BY dept_name HAVING AVG(salary)>42000;

/* 11. Find the departments with the maximum budget */
SELECT dept_name FROM department WHERE budget=(SELECT MAX(budget) FROM department);

/* 12. Find the names of instructors who have not taught any course. */
SELECT i.id FROM instructor i WHERE NOT EXISTS(
    SELECT * FROM teaches t WHERE t.id=i.id
);

/* 13. Find the IDs and Names of all students who have not taken any course offering before Spring 2009 */
(SELECT id, name FROM student)
MINUS
(SELECT s.id, s.name FROM student s, takes t
WHERE t.id=s.id AND t.year<2009);

/* 14. Find the lowest, across all departments, of the per-department maximum salary computed. */
SELECT MAX(maxsal) FROM(
    SELECT dept_name, MAX(salary) as maxsal FROM instructor
    GROUP BY dept_name
);

/* 15. Display the IDs and names of the instructors who have taught all Comp. Sci. courses */
SELECT i.id, i.name FROM instructor i
WHERE NOT EXISTS(
    (SELECT course_id FROM course WHERE dept_name='Comp. Sci.')
    MINUS
    (SELECT t.course_id FROM teaches t WHERE t.id=i.id)
);
