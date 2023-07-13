-- 1.	Write a PL/SQL block to do the following:
-- a.Read a number and print its multiplication table

declare
n number := &n;
i number;
begin
  for i in 1..10 loop
  dbms_output.put_line(n||'x'||i||'='||(n*i));
  end loop;
end;

-- Enter value for n: 3
-- old   2: n number := &n;
-- new   2: n number := 3;
-- 3x1=3
-- 3x2=6
-- 3x3=9
-- 3x4=12
-- 3x5=15
-- 3x6=18
-- 3x7=21
-- 3x8=24
-- 3x9=27
-- 3x10=30

-- PL/SQL procedure successfully completed.