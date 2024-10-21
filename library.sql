CREATE DATABASE wrkrdtls;

USE wrkrdtls;


DELIMITER //

CREATE PROCEDURE AddWorker (
    IN p_WorkerId INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES CALL 
(1, "Alice", "Smith", 60000, "2023-01-15 08:30:00", "HR"),
(2, "Bob", "Johnson", 75000, "2023-02-20 09:00:00", "Finance"),
(3, "Charlie", "Williams", 55000, "2023-03-10 09:30:00", "Engineering"),
(4, "Diana", "Brown", 72000, "2023-04-05 10:00:00", "Marketing"),
(5, "Ethan", "Jones", 48000, "2023-05-12 08:15:00", "Sales"),
(6, "Ali", "Sha", 65000, "2023-10-15 08:40:00", "HP"),
(7, "Baby", "son", 75000, "2024-02-20 09:30:00", "Finance"),
(8, "Charles", "iams", 55050, "2023-03-10 10:30:00", "Engineering"),
(9, "Dilna", "own", 78000, "2022-04-05 10:00:00", "Marketing"),
(5, "alan", "Js", 48000, "2023-06-12 08:15:00", "Sales"),
END //

DELIMITER ;

-- Procedure Call
CALL AddWorker(1, "Alice", "Smith", 60000, "2023-01-15 08:30:00", "HR");

DELIMITER //

CREATE PROCEDURE GetSalaryById (
    IN p_WorkerId INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary FROM Worker WHERE Worker_Id = p_WorkerId;
END //

DELIMITER ;

-- Procedure Call
SET @worker_salary = 0;
CALL GetSalaryById(1, @worker_salary);
SELECT @worker_salary AS Salary;

DELIMITER //

CREATE PROCEDURE UpdateWorkerDepartment (
    IN p_WorkerId INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_WorkerId;
END //

DELIMITER ;

-- Procedure Call
CALL UpdateWorkerDepartment(1, 'Marketing');

DELIMITER //

CREATE PROCEDURE CountWorkersInDepartment (
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount FROM Worker WHERE Department = p_Department;
END //

DELIMITER ;

-- Procedure Call
SET @worker_count = 0;
CALL CountWorkersInDepartment('Engineering', @worker_count);
SELECT @worker_count AS WorkerCount;

DELIMITER //

CREATE PROCEDURE AvgSalaryInDepartment (
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(15, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary FROM Worker WHERE Department = p_Department;
END //

DELIMITER ;

-- Procedure Call
SET @avg_salary = 0;
CALL AvgSalaryInDepartment('Engineering', @avg_salary);
SELECT @avg_salary AS AverageSalary;


