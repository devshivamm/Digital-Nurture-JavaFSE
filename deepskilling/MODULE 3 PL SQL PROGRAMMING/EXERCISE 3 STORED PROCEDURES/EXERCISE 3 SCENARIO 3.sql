CREATE OR REPLACE PROCEDURE TransferFunds(
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
)
IS
  v_balance NUMBER;
BEGIN
    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_from_account;

    IF v_balance < p_amount THEN
    RAISE_APPLICATION_ERROR(-20003,'Insufficient Balance');
    END IF;

    UPDATE Accounts
    SET Balance = Balance - p_amount
    WHERE AccountID = p_from_account;

    UPDATE Accounts
    SET Balance = Balance + p_amount
    WHERE AccountID = p_from_account;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('funds transferred succesfully');
EXCEPTION 
     WHEN OTHERS THEN 
     ROLLBACK;
     DBMS_OUTPUT.PUT_LINE('Error: '|| SQLERRM);
END;
/
BEGIN
    TransferFunds(2,1,1000);
END;
/
BEGIN
    TransferFunds(1,2,5000);
END;
/
/*output

Error: ORA-20003: Insufficient Balance


PL/SQL procedure successfully completed.

Elapsed: 00:00:00.005
*/