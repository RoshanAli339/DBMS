declare
    dnum emp1.dno%type := &dno;
    c number;
begin
    DELETE FROM emp1 WHERE dno=dnum;
    if sql%found then
        c := sql%rowcount;
        INSERT INTO del_history VALUES(dnum, c, SYSDATE);
    end if;
end;