/* Add the constraints specified in problem 1 using alter table statements. */

/* course table, course_name unique constraint */
ALTER TABLE course ADD CONSTRAINT cnameUniq UNIQUE(course_name);
/* Table altered. */

/* course table, course_id primary key constraint */
ALTER TABLE course ADD CONSTRAINT cidPK PRIMARY KEY(course_id);
/* Table altered. */

/* student table, name not null constraint */
ALTER TABLE student MODIFY name NOT NULL;
/* Table altered. */

/* student table, id primary key constraint */
ALTER TABLE student ADD CONSTRAINT sidPK PRIMARY KEY(id);
/* Table altered. */

/* student table, course foreign key constraint */
ALTER TABLE student ADD CONSTRAINT courseFK FOREIGN KEY(course) REFERENCES course(course_id);
/* Table altered. */

/* grade table, grade check constraint */
ALTER TABLE grade ADD CONSTRAINT gradeChck CHECK(grade >= 5 AND grade <= 10);
/* Table altered. */
