CREATE OR REPLACE PROCEDURE UpdateSalary(
    p_employee_id IN NUMBER,
    p_percentage IN NUMBER
)
IS
    v_count NUMBER;
BEGIN

    --Checking whether the employee is existing or not
    SELECT COUNT(*)
    INTO v_count
    FROM EMPLOYEES
    WHERE EmployeeID = p_employee_id;

    --If employee not found
    IF v_count = 0 THEN
          RAISE_APPLICATION_ERROR(-20002,'Employee ID does not exist');
    END IF;
    --Update Salary

    UPDATE Employees 
    SET Salary = Salary + (Salary * p_percentage / 100)
    WHERE EmployeeID = p_employee_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Salary Updated Successfully');

EXCEPTION

     WHEN OTHERS THEN
         ROLLBACK;
         DBMS_OUTPUT.PUT_LINE('Error : ' || SQLERRM);
END;
/

BEGIN
    UpdateSalary(100,10);
END;
/

/*OUTPUT

Error : ORA-20002: Employee ID does not exist


PL/SQL procedure successfully completed.

Elapsed: 00:00:00.008
*/