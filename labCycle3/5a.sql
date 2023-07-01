declare
    pid inventory.product_id%type;
    invalid_qty exception;
begin
    SELECT product_id INTO pid FROM inventory WHERE Quantity<0;
    if sql%found then
        raise invalid_qty;
    end if;
    exception
        when  no_data_found then
            dbms_output.put_line('No data found with given constraint');
        when too_many_rows then
            dbms_output.put_line('Too many rows select');
        when invalid_qty then
            dbms_output.put_line('INVALID QUANTITY');
            UPDATE inventory SET Quantity=0 WHERE product_id=pid;
end;