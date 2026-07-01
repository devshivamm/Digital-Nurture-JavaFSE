CREATE OR REPLACE FUNCTION HasSufficientBalance(
    p_account_id IN NUMBER,
    p_amount IN NUMBER
)
RETURN VARCHAR2
IS   
   v_balance NUMBER;
BEGIN 
    SELECT Balance 
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_account_id;

    IF v_balance >= p_amount THEN
         RETURN 'TRUE';
    ELSE
         RETURN 'FALSE';
    END IF;

EXCEPTION
     WHEN NO_DATA_FOUND THEN
          RETURN 'ACCOUNT NOT FOUND';
END;
/

SELECT HasSufficientBalance(
    2,
    10000
) AS Result
FROM DUAL;

SELECT HasSufficientBalance(
    10,
    1000
) AS Result
FROM DUAL;
/* OUTPUT
ACCOUNT NOT FOUND 
*/