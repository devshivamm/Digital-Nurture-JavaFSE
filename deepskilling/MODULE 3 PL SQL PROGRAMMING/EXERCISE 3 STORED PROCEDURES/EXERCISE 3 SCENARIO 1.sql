CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Monthly intrest applied sucessfully.');

EXCEPTION
      WHEN OTHERS THEN 
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
BEGIN
    ProcessMonthlyInterest;
END;
/

SELECT AccountID,
       AccountType,
       Balance
FROM Accounts;
/* output

Monthly intrest applied sucessfully.


PL/SQL procedure successfully completed.

Elapsed: 00:00:00.017
*/