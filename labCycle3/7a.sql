declare
    anum bank_trans.acc_no%type;
    tt bank_trans.tr_type%type;
    amt bank_trans.tr_amt%type;
    cursor bank_cursor is SELECT acc_no, tr_type, tr_amt FROM bank_trans WHERE upd_flag='N';
begin
    open bank_cursor;
    loop
        fetch bank_cursor into anum, tt, amt;
        exit when bank_cursor%notfound;
        if tt='D' then
            UPDATE BANK_MAIN SET Curr_balance=Curr_balance+amt WHERE acc_no=anum;
        elsif tt='W' then
            UPDATE BANK_MAIN SET Curr_balance=Curr_balance-amt WHERE acc_no=anum;
        end if;
        UPDATE BANK_TRANS SET UPD_FLAG='Y' WHERE acc_no=anum AND tr_type=tt;
    end loop;
end;