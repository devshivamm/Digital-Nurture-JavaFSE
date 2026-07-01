SET SERVEROUTPUT ON;
DECLARE 
       CURSOR customer_cursor IS
           SELECT CustomerID,
                  Name,
                  Balance
            FROM Customers;

BEGIN 
    FOR customer_record IN customer_cursor LOOP

    IF customer_record.Balance > 10000  THEN
            UPDATE Customers
            SET IsVIP = 'Y'
            WHERE CustomerID = customer_record.CustomerID;
            DBMS_OUTPUT.PUT_LINE(
                customer_record.Name
                || 'promoted to VIP.'
            );
        END IF;
    END LOOP;

    COMMIT;

END;
/* OUTPUT

Jane Smithpromoted to VIP.
Robert Williamspromoted to VIP.


PL/SQL procedure successfully completed.

Elapsed: 00:00:00.012
*/