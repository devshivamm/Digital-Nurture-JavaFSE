CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment(
    p_loan_amount IN NUMBER,
    p_interest_rate IN NUMBER,
    p_years IN NUMBER
)
RETURN NUMBER
IS
   v_installment NUMBER;
BEGIN
    v_installment :=
    (p_loan_amount + 
    (p_loan_amount * p_interest_rate/100 * p_years))/(p_years*12);
    RETURN ROUND(v_installment,2);
END;
/
SELECT CalculateMonthlyInstallment(
    100000,
    5,
    5
) AS Monthly_Installment
/* OUTPUT 


Function CALCULATEMONTHLYINSTALLMENT compiled

Elapsed: 00:00:00.140
*/