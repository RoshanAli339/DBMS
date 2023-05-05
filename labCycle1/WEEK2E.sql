/* Drop the constraints specified in problem 1 using alter table statements. */

/* course table, unique constraint */
ALTER TABLE course DROP CONSTRAINT SYS_C008264;
/* TABLE altered. */

/* student table, foreign ket constraint, we remove this first because it refers to the course_id primary key */
ALTER TABLE student DROP CONSTRAINT SYS_C008267;
/* TABLE altered. */

/* course table, primary key constraint */
ALTER TABLE course DROP CONSTRAINT SYS_C008263;
/* TABLE altered. */

/* student table, NOT NULL constraint */
ALTER TABLE student MODIFY name NULL;
/* TABLE altered. */

/* student table, PRIMARY KEY constraint */
ALTER TABLE student DROP CONSTRAINT SYS_C008266;
/* TABLE altered. */

/* grade table, CHECK constraint */
ALTER TABLE grade DROP constraint SYS_C008268;
/* TABLE altered. */
