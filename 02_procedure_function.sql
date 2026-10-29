-- Procedure: give percentage raise
CREATE OR REPLACE PROCEDURE give_raise (
    p_emp_id   IN NUMBER,
    p_percent  IN NUMBER
) AS
BEGIN
    UPDATE employees
    SET salary = salary * (1 + p_percent / 100)
    WHERE emp_id = p_emp_id;
    COMMIT;
END;
/

-- Function: average salary by department
CREATE OR REPLACE FUNCTION get_dept_avg_salary (
    p_dept IN VARCHAR2
) RETURN NUMBER AS
    v_avg NUMBER;
BEGIN
    SELECT AVG(salary) INTO v_avg FROM employees WHERE dept = p_dept;
    RETURN ROUND(v_avg, 2);
EXCEPTION
    WHEN NO_DATA_FOUND THEN RETURN NULL;
END;
/
