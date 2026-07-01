CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department IN VARCHAR2,
    p_bonus IN NUMBER
)
IS
BEGIN
        UPDATE Employees
        SET Salary = Salary + (Salary * p_bonus/100)
        WHERE Department = p_department;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Employee bonus updated successfully');
EXCEPTION
   WHEN OTHERS THEN
       ROLLBACK;
       DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

BEGIN
    UpdateEmployeeBonus('IT',10);
END;
/

/* OUTPUT

Employee bonus updated successfully


PL/SQL procedure successfully completed.

Elapsed: 00:00:00.012
*/