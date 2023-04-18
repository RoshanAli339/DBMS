/* Find all possible combinations of instructors and the courses they teach. */
SELECT * FROM INSTRUCTOR I JOIN TEACHES T on I.ID = T.ID JOIN COURSE C ON T.COURSE_ID = C.COURSE_ID; 