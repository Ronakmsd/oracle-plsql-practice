-- Cursor: list Engineering employees by salary
CREATE OR REPLACE PROCEDURE list_eng_employees AS
    CURSOR c_eng IS
        SELECT emp_id, emp_name, salary
        FROM employees
        WHERE dept = 'Engineering'
        ORDER BY salary DESC;
    v_id employees.emp_id%TYPE;
    v_name employees.emp_name%TYPE;
    v_sal employees.salary%TYPE;
BEGIN
    OPEN c_eng;
    LOOP
        FETCH c_eng INTO v_id, v_name, v_sal;
        EXIT WHEN c_eng%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_id || ' | ' || v_name || ' | ' || v_sal);
    END LOOP;
    CLOSE c_eng;
END;
/

-- Package wrapping raise + avg helpers
CREATE OR REPLACE PACKAGE emp_utils AS
    PROCEDURE give_raise(p_emp_id NUMBER, p_percent NUMBER);
    FUNCTION  get_dept_avg_salary(p_dept VARCHAR2) RETURN NUMBER;
END emp_utils;
/

CREATE OR REPLACE PACKAGE BODY emp_utils AS
    PROCEDURE give_raise(p_emp_id NUMBER, p_percent NUMBER) AS
    BEGIN
        UPDATE employees
        SET salary = salary * (1 + p_percent / 100)
        WHERE emp_id = p_emp_id;
        COMMIT;
    END;

    FUNCTION get_dept_avg_salary(p_dept VARCHAR2) RETURN NUMBER AS
        v_avg NUMBER;
    BEGIN
        SELECT AVG(salary) INTO v_avg FROM employees WHERE dept = p_dept;
        RETURN ROUND(v_avg, 2);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN RETURN NULL;
    END;
END emp_utils;
/
