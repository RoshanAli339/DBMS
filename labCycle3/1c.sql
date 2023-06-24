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
