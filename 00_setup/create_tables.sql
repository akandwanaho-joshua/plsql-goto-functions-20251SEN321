-- 00_setup/create_tables.sql
SET DEFINE OFF;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE payroll CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE employees CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE departments CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE departments (
    dept_id   NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50) NOT NULL
);

CREATE TABLE employees (
    emp_id         NUMBER PRIMARY KEY,
    first_name     VARCHAR2(50),
    last_name      VARCHAR2(50),
    email          VARCHAR2(100) UNIQUE,
    hire_date      DATE,
    monthly_salary NUMBER(10,2),
    dept_id        NUMBER REFERENCES departments(dept_id)
);

CREATE TABLE payroll (
    payroll_id   NUMBER PRIMARY KEY,
    emp_id       NUMBER REFERENCES employees(emp_id),
    pay_month    VARCHAR2(7),
    basic_salary NUMBER(10,2),
    allowance    NUMBER(10,2),
    deduction    NUMBER(10,2),
    net_salary   NUMBER(10,2)
);

INSERT INTO departments VALUES (10, 'IT');
INSERT INTO departments VALUES (20, 'Finance');
INSERT INTO departments VALUES (30, 'HR');
INSERT INTO departments VALUES (40, 'Operations');

INSERT INTO employees VALUES
 (1,'Joshua','Akandwanaho','jnrjosh90@gmail.com', DATE '2019-03-15', 850000, 10);
INSERT INTO employees VALUES
 (2,'Alice','Uwase','alice@example.com',       DATE '2021-07-01', 450000, 20);
INSERT INTO employees VALUES
 (3,'Brian','Habimana','brian@example.com',    DATE '2018-01-20', 1200000, 10);
INSERT INTO employees VALUES
 (4,'Claudine','Mukamana','claudine@example.com', DATE '2023-09-05', 300000, 30);
INSERT INTO employees VALUES
 (5,'David','Nkurunziza','david@example.com',  DATE '2020-11-11', 600000, 40);

INSERT INTO payroll VALUES (1, 1, '2026-09', 850000, 100000, 150000, 800000);
INSERT INTO payroll VALUES (2, 2, '2026-09', 450000,  50000,  60000, 440000);
INSERT INTO payroll VALUES (3, 3, '2026-09',1200000, 200000, 300000, 999999);
INSERT INTO payroll VALUES (4, 4, '2026-09', 300000,  30000,  20000, 310000);

COMMIT;

PROMPT Schema created successfully.