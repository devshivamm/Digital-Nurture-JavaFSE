SET SERVEROUTPUT ON;

DECLARE
     CURSOR customer_cursor IS
         SELECT c.CustomerID,
                c.Name,
                c.DOB,
                l.LoanID,
                l.InterestRate

        FROM Customers c
        JOIN Loans l
        ON c.CustomerID = l.CustomerID;


    age_years NUMBER;
BEGIN
    FOR customer_record IN customer_cursor LOOP
    age_years := FLOOR(MONTHS_BETWEEN(SYSDATE,customer_record.DOB)/12);

    IF age_years > 60 THEN
         UPDATE Loans
         SET InterestRate = InterestRate - 1
         WHERE LoanId = customer_record.LoanID;

         DBMS_OUTPUT.PUT_LINE(
            'Discount applied to '
            || customer_record.Name
            || '(Loan ID: '
            || customer_record.LoanID
            || ')'
         );
         END IF;

        END LOOP;
        COMMIT;
END;
/

/* OUTPUT 

Discount applied to Robert Williams(Loan ID: 2)


PL/SQL procedure successfully completed.

Elapsed: 00:00:00.022
*/