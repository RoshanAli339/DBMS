declare
	v_prodName Inventory.Product_name%TYPE;
	v_inventoryRow	Inventory%ROWTYPE;
	v_status	VARCHAR(20);
begin
    v_prodName := '&product_name';

    SELECT * INTO v_inventoryRow FROM Inventory WHERE Product_name = v_prodName;
    IF v_inventoryRow.Product_ID IS NOT NULL THEN
        IF v_inventoryRow.Quantity > 0 THEN
            UPDATE Inventory SET Quantity = Quantity - 1 
            WHERE Product_ID = v_inventoryRow.Product_ID;
            v_status := 'PURCHASED';
        ELSE
            v_status := 'OUT OF STOCK';
        END IF;

        INSERT INTO Purchase_Record VALUES(v_inventoryRow.Product_ID, v_status, SYSDATE);
        COMMIT;

         
        dbms_output.put_line('Purchase recorded successfully');
    ELSE
        dbms_output.put_line('Product '||v_prodName||' not found!');
    END IF;

end;