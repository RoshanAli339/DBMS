-- 1.	Write a PL/SQL block to do the following:
-- c.Read a number n, and print the first n Fibonacci numbers

declare
    a number := 0;
    b number := 1;
    c number;
    n number := &n;
    i number;
begin
  dbms_output.put_line('Fibonacci series: ');
  dbms_output.put_line(a);
  dbms_output.put_line(b);
  for i in 3..n loop
  c := a+b;
  dbms_output.put_line(c);
  a := b;
  b := c;
  end loop;
end;

-- Enter value for n: 5
-- old   5:     n number := &n;
-- new   5:     n number := 5;
-- Fibonacci series:
-- 0
-- 1
-- 1
-- 2
-- 3

-- PL/SQL procedure successfully completed.