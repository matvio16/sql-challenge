CREATE TABLE Titles (
    title_id varchar(5)  PRIMARY KEY NOT NULL,
    title varchar(20)  NOT NULL
);

CREATE TABLE Departments (
    dept_no varchar(4) PRIMARY KEY  NOT NULL,
    dept_name varchar(20)  NOT NULL
);

CREATE TABLE Employees (
    emp_no INTEGER PRIMARY KEY  NOT NULL,
    emp_title_id varchar(5)   NOT NULL,
    birth_date varchar(10)   NOT NULL,
    first_name varchar(50)   NOT NULL,
    last_name varchar(50)   NOT NULL,
    sex varchar(1)  NOT NULL,
    hire_date varchar(10)   NOT NULL,
    CONSTRAINT fk_Employees_emp_title_id
        FOREIGN KEY (emp_title_id)
        REFERENCES Titles (title_id)
);

CREATE TABLE Salaries (
    id SERIAL PRIMARY KEY,
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
    CONSTRAINT fk_Salaries_emp_no
        FOREIGN KEY (emp_no)
        REFERENCES Employees (emp_no)
);

CREATE TABLE Dept_Emp (
    id SERIAL PRIMARY KEY,
    emp_no INTEGER   NOT NULL,
    dept_no varchar(4)   NOT NULL,
    CONSTRAINT fk_Dept_Emp_emp_no
        FOREIGN KEY (emp_no)
        REFERENCES Employees (emp_no),
    CONSTRAINT fk_Dept_Emp_dept_no
        FOREIGN KEY (dept_no)
        REFERENCES Departments (dept_no)
);

CREATE TABLE Dept_Manager (
    id SERIAL PRIMARY KEY,
    dept_no varchar(4)   NOT NULL,
    emp_no INTEGER   NOT NULL,
    CONSTRAINT fk_Dept_Manager_dept_no
        FOREIGN KEY (dept_no)
        REFERENCES Departments (dept_no),
    CONSTRAINT fk_Dept_Manager_emp_no
        FOREIGN KEY (emp_no)
        REFERENCES Employees (emp_no)
);