CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE
ON Customers
FOR EACH ROW
BEGIN
    :NEW.LastModified := SYSDATE;
END;
/

UPDATE Customers
SET Balance = 20000
WHERE CustomerID = 1;

COMMIT;


SELECT CustomerID,
       Name,
       Balance,
       LastModified
FROM Customers
WHERE CustomerID = 1;
/* OUTPUT
"CUSTOMERID"	"NAME"	"BALANCE"	"LASTMODIFIED"
1	"John Doe"	20000	"2026-06-27T14:21:30Z"
/*