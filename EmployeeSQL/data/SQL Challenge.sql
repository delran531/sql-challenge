

CREATE TABLE Employees (
    EmpNo INT   NOT NULL,
    BirthDate DATE   NOT NULL,
    FirstName VARCHAR   NOT NULL,
    LastName VARCHAR   NOT NULL,
    Gender VARCHAR   NOT NULL,
    HireDate DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        EmpNo
     )
);

CREATE TABLE Salaries (
    EmpNo int   NOT NULL,
    Salary INT   NOT NULL,
    FromDate DATE   NOT NULL,
    ToDate DATE   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        EmpNo
     )
);


CREATE TABLE Titles (
    EmpNo INT   NOT NULL,
    Title VARCHAR   NOT NULL,
    FromDate DATE   NOT NULL,
    ToDate DATE   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        EmpNo,FromDate
     )
);

CREATE TABLE DeptMgr (
    DeptNo VARCHAR  NOT NULL,
    EmpNo int   NOT NULL,
    FromDate DATE   NOT NULL,
    ToDate DATE   NOT NULL,
    CONSTRAINT pk_DeptMgr PRIMARY KEY (
        DeptNo,EmpNo
     )
);

CREATE TABLE DeptEmp (
    EmpNo int   NOT NULL,
    DeptNo VARCHAR   NOT NULL,
    FromDate DATE   NOT NULL,
    ToDate DATE   NOT NULL,
    CONSTRAINT pk_DeptEmp PRIMARY KEY (
        EmpNo,DeptNo
     )
);


CREATE TABLE Depts (
    DeptNo VARCHAR   NOT NULL,
    DeptName VARCHAR   NOT NULL,
    CONSTRAINT pk_Depts PRIMARY KEY (
        DeptNo
     )
);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_EmpNo FOREIGN KEY(EmpNo)
REFERENCES Employees (EmpNo);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_EmpNo FOREIGN KEY(EmpNo)
REFERENCES Employees (EmpNo);

ALTER TABLE DeptMgr ADD CONSTRAINT fk_DeptMgr_DeptNo FOREIGN KEY(DeptNo)
REFERENCES Depts (DeptNo);

ALTER TABLE DeptMgr ADD CONSTRAINT fk_DeptMgr_EmpNo FOREIGN KEY(EmpNo)
REFERENCES Employees (EmpNo);

ALTER TABLE DeptEmp ADD CONSTRAINT fk_DeptEmp_EmpNo FOREIGN KEY(EmpNo)
REFERENCES Employees (EmpNo);

ALTER TABLE DeptEmp ADD CONSTRAINT fk_DeptEmp_DeptNo FOREIGN KEY(DeptNo)
REFERENCES Depts (DeptNo);

