declare
    empno emp.empno%type;
    empD emp%ROWTYPE;
    n number := 10;
    a number;
begin
    SELECT empno INTO empno FROM emp WHERE deptno=5560;
    SELECT * INTO empD FROM emp;
    a := n / 0;
    exception
        when no_data_found then
            dbms_output.put_line('No data foud with given constraints');
        when too_many_rows then
            dbms_output.put_line('Too many rows selected, specify a constraint');
        when zero_divide then
            dbms_output.put_line('Division by zero not possible');
end;