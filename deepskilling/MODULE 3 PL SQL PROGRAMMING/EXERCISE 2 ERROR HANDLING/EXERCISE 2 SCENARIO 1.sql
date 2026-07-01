CREATE OR REPLACE PROCEDURE SafeTransferFunds(
    p_from_account NUMBER,
    p_to_account NUMBER,
    p_amount NUMBER
)
IS
    v_balance NUMBER;
BEGIN

    --Get the balance of the source account to check the sufficient balance
      SELECT Balance
      INTO v_balance
      FROM Accounts
      WHERE AccountID = p_from_account;

      --Check the sufficient balance
      IF v_balance<p_amount THEN
          RAISE_APPLICATION_ERROR(-20001,'Insufficient Balance');
      END IF;

      --Deduct amount from source account 
      UPDATE Accounts 
      SET Balance = Balance - p_amount
      WHERE AccountID = p_to_account;

      COMMIT;

      DBMS_OUTPUT.PUT_LINE('Fund Transfer Successful');

EXCEPTION

       WHEN OTHERS THEN
           ROLLBACK;
           DBMS_OUTPUT.PUT_LINE('Error : ' || SQLERRM);
END;
/

SELECT * FROM Accounts;
BEGIN
    SafeTransferFunds(1, 2, 5000);
END;
/ 

/*OUTPUT 

Error : ORA-20001: Insufficient Balance


PL/SQL procedure successfully completed.

Elapsed: 00:00:00.015
*/