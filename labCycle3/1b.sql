-- 1.	Write a PL/SQL block to do the following:
-- b.Read a number and check whether it is a palindrome or not

declare
    n number := &n;
    rev number := 0;
    temp number := n;
begin
    while temp<>0 loop
    rev := (rev*10)+mod(temp,10);
    temp := trunc(temp/10);
    end loop;
    dbms_output.put_line('Reverse: '||rev);
    if rev=n then
      dbms_output.put_line(n||' is a Palindrome number');
    else
      dbms_output.put_line(n||' is not a Palindrome number');
    end if;
end;

-- Enter value for n: 45654
-- old   2:     n number := &n;
-- new   2:     n number := 45654;
-- Reverse: 45654
-- 45654 is a Palindrome number

-- PL/SQL procedure successfully completed.