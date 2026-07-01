CREATE OR REPLACE PROCEDURE AddNewCustomer(
    p_customer_id IN NUMBER,
    p_name IN VARCHAR2,
    p_dob IN DATE,
    p_balance IN NUMBER
)
IS
BEGIN
    INSERT INTO Customers
    (
        CustomerID,
        Name,
        DOB,
        Balance,
        LastModified,
        IsVIP
    )
    VALUES
    (
        p_customer_id,
        p_name,
        p_dob,
        p_balance,
        SYSDATE,
        'N'
    );

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Customer Added Successfully');

EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
          ROLLBACK;
          DBMS_OUTPUT.PUT_LINE('Error:Customer ID already exists');
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('error: '|| SQLERRM);
END;
/
BEGIN
    AddNewCustomer(
        4,
        'Rahul Sharma',
        TO_DATE('2002-10-15','YYYY-MM-DD'),
        12000
    );
END;
/
BEGIN
    AddNewCustomer(
        1,
        'Rahul Sharma',
        TO_DATE('2002-10-15','YYYY-MM-DD'),
        12000
    );
END;
/
/* OUTPUT 

Error:Customer ID already exists


PL/SQL procedure successfully completed.

Elapsed: 00:00:00.008
*/