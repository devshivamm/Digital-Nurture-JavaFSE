CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT
ON Transactions 
FOR EACH ROW
DECLARE 
    v_balance NUMBER;
BEGIN

    --Rule 1: Deposit amount must be positive 
  IF :NEW.TransactionType = 'Deposit' THEN
  
   IF :NEW.Amount <= 0 THEN
   RAISE_APPLICATION_ERROR(
      -20010,
      'Deposit amount must be greater than zero.'
   );
   END IF;

END IF;

END;
/

/*
Trigger CHECKTRANSACTIONRULES compiled

Elapsed: 00:00:00.171
*/

INSERT INTO Transactions
VALUES
(
    5,
    1,
    SYSDATE,
    -100,
    'Deposit'
);

/* Output
ORA-20010: Deposit amount must be positive.
*/

-- Test 3: Invalid Withdrawal
INSERT INTO Transactions
VALUES
(
    6,
    1,
    SYSDATE,
    100000,
    'Withdrawal'
);

/* Output
ORA-20011: Withdrawal exceeds available balance.
*/