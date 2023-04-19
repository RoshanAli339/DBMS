/* Find all possible combinations of instructors and the courses they teach. */
SELECT i.id, i.name, c.course_id, c.title FROM instructor i, course c, teaches t WHERE i.id=t.id AND t.course_id=c.course_id;

/* Retrieve the names of all instructors, along with their department names and department building name. */
SELECT i.name, i.dept_name, d.building FROM instructor i, department d WHERE i.dept_name=d.dept_name;

/* Find the names of instructors who have taught at least one course */
SELECT DISTINCT i.name FROM instructor i, teaches t WHERE i.id=t.id;

/* For the student with ID 12345 (or any other value), show all course_id and title of all courses registered for by the student */
SELECT s.id, c.course_id, c.title FROM student s, course c, takes t WHERE s.id='12345' AND s.id=t.id AND t.course_id=c.course_id;

/* Find instructor names and course identifiers for instructors in the Computer Science department. */
SELECT DISTINCT i.name, t.course_id
FROM instructor i, teaches t 
WHERE i.dept_name LIKE 'Comp. Sci.' AND i.id=t.id;

/* For all instructors in the university who have taught some course, find their names and the course ID of all courses they taught. */
SELECT DISTINCT i.name, t.course_id FROM instructor i, teaches t WHERE i.id=t.id;

/* Find the names of all instructors whose salary is greater than at least one instructor in the Biology department. 
Or Find the names of all instructors who earn more than the lowest paid instructor in the Biology department. */
SELECT name FROM instructor WHERE salary>(SELECT MIN(salary) FROM instructor WHERE dept_name LIKE 'Biology');

/* Find full details of instructors who teach at least one course. */
SELECT DISTINCT i.* FROM instructor i, teaches t WHERE i.id=t.id;

/* Find the instructor names and the courses they taught for all instructors in the Biology department who have taught some course. */
SELECT DISTINCT i.name FROM instructor i, teaches t WHERE i.dept_name LIKE 'Biology' AND i.id=t.id;

/* . Find the set of all courses taught either in Fall 2009 or in Spring 2010, or both. */
SELECT course_id FROM teaches 
WHERE (semester LIKE 'Fall' AND year=2009) OR (semester LIKE 'Spring' AND year=2010);

/* Find all courses taught in the Fall 2009 semester but not in the Spring 2010 semester. */
SELECT course_id FROM teaches WHERE (semester LIKE 'Fall' AND year=2009) AND NOT(semester LIKE 'Spring' AND year=2010);

/* Find the names of all students who have taken any Comp. Sci. course ever. (there should be no duplicate names) */
SELECT DISTINCT s.name FROM student s, takes t, course c 
WHERE s.id=t.id AND t.course_id=c.course_id AND c.dept_name LIKE 'Comp. Sci.';

/* . Display the IDs of all instructors who have never taught a course. (Don’t write nested query) */
