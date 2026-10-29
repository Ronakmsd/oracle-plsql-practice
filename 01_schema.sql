-- employees demo schema for PL/SQL practice
CREATE TABLE employees (
    emp_id     NUMBER PRIMARY KEY,
    emp_name   VARCHAR2(50) NOT NULL,
    dept       VARCHAR2(30),
    salary     NUMBER(10,2),
    hire_date  DATE
);

INSERT INTO employees VALUES (1, 'Asha',  'Engineering', 55000, DATE '2024-01-15');
INSERT INTO employees VALUES (2, 'Rohan', 'Finance',     48000, DATE '2023-06-01');
INSERT INTO employees VALUES (3, 'Neha',  'Engineering', 62000, DATE '2022-11-20');
INSERT INTO employees VALUES (4, 'Vikram','HR',          45000, DATE '2025-03-10');
INSERT INTO employees VALUES (5, 'Priya', 'Engineering', 58000, DATE '2024-08-05');
COMMIT;
