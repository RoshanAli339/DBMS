-- should create a table named DEMO_TAB before hand
declare
    n1 DEMO_TAB.Num1%type := &n1;
    n2 DEMO_TAB.Num2%type := &n2;
    ma number;
    mi number;
    gcd DEMO_TAB.HCF%type;
    lcm DEMO_TAB.LCM%type;
    i number;
    r DEMO_TAB%ROWTYPE;
begin
    if n1>n2 then
    ma := n1;
    mi := n2;
    else
    mi := n1;
    ma := n2;
    end if;
    for i in 2..mi loop
    if MOD(mi, i)=0 AND MOD(ma, i)=0 then   
    lcm := i;
    EXIT;
    end if;
    end loop;

    for i in REVERSE 1..mi loop
    if MOD(mi, i)=0 AND MOD(ma, i)=0 then
    gcd := i;
    EXIT;
    end if;
    end loop;

    INSERT INTO DEMO_TAB VALUES(n1, n2, lcm, gcd);
end;
