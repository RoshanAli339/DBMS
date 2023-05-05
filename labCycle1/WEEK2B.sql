/* Errors when inserting data */

/* course table, unique constraint */
INSERT INTO course VALUES('Python programming',
                          'CS225',
                          'CSE');

/*  
INSERT INTO course VALUES('Python programming',
                           *
ERROR at line 1:
ORA-00001: unique constraint (ROSHAN.SYS_C008264) violated
*/

/* course table, primary key constraint */
INSERT INTO course VALUES   ('DBMS',
                             'CS125',
                             'CSE');

/*
INSERT INTO course VALUES   ('DBMS',
                              *
ERROR at line 14:
ORA-00001: unique constraint (ROSHAN.SYS_C008263) violated
*/

/* student table, NOT NULL constraint */
INSERT INTO student VALUES (NULL,
                            'Y21CS000',
                            'CS125',
                            'Sem4');
/*
INSERT INTO student VALUES (NULL,
                            *
ERROR at line 28:
ORA-01400: cannot insert NULL into ("ROSHAN"."STUDENT"."NAME")
*/

/* student table, PRIMARY KEY constraint */
INSERT INTO student VALUES ('Shreyas',
                            'Y21CS160',
                            'CS222',
                            'Sem4');
/*
INSERT INTO student VALUES ('Shreyas',
                             *
ERROR at line 40:
ORA-00001: unique constraint (ROSHAN.SYS_C008266) violated
*/

/* student table, foreign key constraint */
INSERT INTO student VALUES ('Shreyas',
                            'Y21CS164',
                            'CS232',
                            'Sem5');
/*
INSERT INTO student VALUES ('Shreyas',
*
ERROR at line 52:
ORA-02291: integrity constraint (ROSHAN.SYS_C008267) violated - parent key not
found
*/

/* grade table, check constraint */
INSERT INTO grade VALUES ('Y21CS164',
                          'Sem5',
                          'CS222',
                          12);
/*
INSERT INTO grade VALUES ('Y21CS164',
*
ERROR at line 65:
ORA-02290: check constraint (ROSHAN.SYS_C008268) violated
*/