CREATE DATABASE library;
USE library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(20)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Oak Street, City A', '9876543210'),
(2, 102, '456 Maple Avenue, City B', '9876543211'),
(3, 103, '789 Pine Road, City C', '9876543212'),
(4, 104, '101 Elm Boulevard, City D', '9876543213'),
(5, 105, '202 Birch Lane, City E', '9876543214'),
(6, 106, '303 Cedar Drive, City F', '9876543215'),
(7, 107, '404 Spruce Street, City G', '9876543216'),
(8, 108, '505 Walnut Way, City H', '9876543217'),
(9, 109, '606 Chestnut Avenue, City I', '9876543218'),
(10, 110, '707 Ash Court, City J', '9876543219');


CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'Alice Johnson', 'Manager', 75000.00, 1),
(2, 'Bob Smith', 'Assistant Manager', 60000.00, 2),
(3, 'Carol White', 'Clerk', 35000.00, 3),
(4, 'David Brown', 'Librarian', 50000.00, 4),
(5, 'Eve Davis', 'Manager', 78000.00, 5),
(6, 'Frank Harris', 'Assistant Manager', 62000.00, 6),
(7, 'Grace Wilson', 'Clerk', 34000.00, 7),
(8, 'Henry Taylor', 'Librarian', 52000.00, 8),
(9, 'Isabel Moore', 'Clerk', 37000.00, 9),
(10, 'Jack Lee', 'Manager', 80000.00, 10);

CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(8, 2),
    Status VARCHAR(3),  
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('9781234567897', 'The Great Gatsby', 'Fiction', 15.99, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('9781234567898', 'A Brief History of Time', 'Science', 20.00, 'no', 'Stephen Hawking', 'Bantam Books'),
('9781234567899', 'The Art of War', 'Philosophy', 12.50, 'yes', 'Sun Tzu', 'Oxford University Press'),
('9781234567800', 'To Kill a Mockingbird', 'Fiction', 18.75, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('9781234567801', '1984', 'Dystopian', 17.20, 'no', 'George Orwell', 'Secker & Warburg'),
('9781234567802', 'The Catcher in the Rye', 'Fiction', 14.50, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('9781234567803', 'Sapiens: A Brief History of Humankind', 'History', 22.50, 'yes', 'Yuval Noah Harari', 'Harper'),
('9781234567804', 'The Lean Startup', 'Business', 25.00, 'yes', 'Eric Ries', 'Crown Publishing'),
('9781234567805', 'Pride and Prejudice', 'Romance', 13.95, 'no', 'Jane Austen', 'T. Egerton'),
('9781234567806', 'The Selfish Gene', 'Science', 19.99, 'yes', 'Richard Dawkins', 'Oxford University Press');

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'John Doe', '123 Elm Street, City A', '2021-05-12'),
(2, 'Jane Smith', '456 Maple Avenue, City B', '2020-11-03'),
(3, 'Michael Johnson', '789 Oak Road, City C', '2022-07-21'),
(4, 'Emily Davis', '101 Pine Boulevard, City D', '2021-03-15'),
(5, 'William Brown', '202 Birch Lane, City E', '2023-01-09'),
(6, 'Olivia Taylor', '303 Cedar Drive, City F', '2020-12-30'),
(7, 'James Wilson', '404 Spruce Street, City G', '2022-09-18'),
(8, 'Sophia Moore', '505 Walnut Way, City H', '2019-02-26'),
(9, 'Benjamin Harris', '606 Chestnut Avenue, City I', '2023-06-10'),
(10, 'Charlotte Lee', '707 Ash Court, City J', '2021-08-05');

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 1, 'The Great Gatsby', '2023-01-15', '9781234567897'),
(2, 2, 'A Brief History of Time', '2022-12-05', '9781234567898'),
(3, 3, 'The Art of War', '2023-03-10', '9781234567899'),
(4, 4, 'To Kill a Mockingbird', '2023-04-20', '9781234567800'),
(5, 5, '1984', '2022-06-25', '9781234567801'),
(6, 6, 'The Catcher in the Rye', '2023-02-12', '9781234567802'),
(7, 7, 'Sapiens: A Brief History of Humankind', '2023-05-18', '9781234567803'),
(8, 8, 'The Lean Startup', '2023-07-09', '9781234567804'),
(9, 9, 'Pride and Prejudice', '2023-08-11', '9781234567805'),
(10, 10, 'The Selfish Gene', '2023-09-22', '9781234567806');

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1, 'The Great Gatsby', '2023-02-10', '9781234567897'),
(2, 2, 'A Brief History of Time', '2023-01-15', '9781234567898'),
(3, 3, 'The Art of War', '2023-04-05', '9781234567899'),
(4, 4, 'To Kill a Mockingbird', '2023-05-25', '9781234567800'),
(5, 5, '1984', '2022-07-10', '9781234567801'),
(6, 6, 'The Catcher in the Rye', '2023-03-15', '9781234567802'),
(7, 7, 'Sapiens: A Brief History of Humankind', '2023-06-22', '9781234567803'),
(8, 8, 'The Lean Startup', '2023-08-02', '9781234567804'),
(9, 9, 'Pride and Prejudice', '2023-09-05', '9781234567805'),
(10, 10, 'The Selfish Gene', '2023-10-12', '9781234567806');

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT Books.Book_title, Customer.Customer_name
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

SELECT Category, COUNT(*) AS Book_Count
FROM Books
GROUP BY Category;

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

SELECT Customer.Customer_name
FROM Customer
LEFT JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE Reg_date < '2022-01-01'
  AND IssueStatus.Issue_Id IS NULL;

SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no;

SELECT Customer.Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

SELECT Employee.Emp_name, Branch.Branch_address
FROM Branch
JOIN Employee ON Branch.Manager_Id = Employee.Emp_Id;

SELECT Customer.Customer_name
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Books.Rental_Price > 25;






