/* Write update statements that violate the constraints specified in problem 1. */

/* deleting a row from course table whose course_id attribute is referenced by course attribute in student table */

DELETE FROM course WHERE course_id='CS125';

/*
DELETE FROM course WHERE course_id='CS125'
*
ERROR at line 5:
ORA-02292: integrity constraint (ROSHAN.SYS_C008267) violated - child record
found
*/
