--Creation of table Customers:

CREATE TABLE Customers (
Customer_id INT PRIMARY KEY,
Date_of_Birth DATE,
C_name VARCHAR(255),
Age INT CHECK (Age >= 0), -- Age cannot be negative
Phone_num VARCHAR(20),
C_Email VARCHAR(100) UNIQUE);

--2. Creation of table Cars:
CREATE TABLE Car (
Car_id INT PRIMARY KEY,
Brand VARCHAR(50),
Model VARCHAR(100),
Year INT CHECK (Year > 1885), -- Cars were invented after 1885
Colour VARCHAR(20),
Price DECIMAL(10, 2) CHECK (Price >= 0) -- Price cannot be negative);

--3. Creation of table Inventory:
CREATE TABLE Inventory (
Inventory_id INT PRIMARY KEY,
Car_id INT,
Quantity INT CHECK (Quantity >= 0), -- Quantity cannot be negative
FOREIGN KEY (Car_id) REFERENCES Car(Car_id) ON DELETE CASCADE);

--4. Creation of table Orders:
CREATE TABLE Orders (
Order_id INT PRIMARY KEY,
Order_date DATE,
Customer_id INT,
Total_amount DECIMAL(10, 2) CHECK (Total_amount >= 0), -- Total amount cannot
be negative
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id) ON DELETE
CASCADE);

--5. Creation of table Transactions:
CREATE TABLE Transactions (
Transaction_id INT PRIMARY KEY,
Car_id INT,
Commission DECIMAL(10, 2) CHECK (Commission >= 0), -- Commission cannot be
negative
Order_id INT,
FOREIGN KEY (Car_id) REFERENCES Car(Car_id) ON DELETE CASCADE,
FOREIGN KEY (Order_id) REFERENCES Orders(Order_id) ON DELETE
CASCADE);

--6. Creation of table Manager:
CREATE TABLE Manager (
Employee_id INT PRIMARY KEY,
Works_Present CHAR(1) CHECK (Works_Present IN ('Y', 'N'))
-- Using 'Y' for TRUE and 'N' for FALSE);

--7. Insertion of records into Customers:
INSERT INTO Customers VALUES (1, TO_DATE('1990-01-01', 'YYYY-MM-DD'),
'Alice Smith', 34, '123-456-7890', 'alice@example.com');
INSERT INTO Customers VALUES (2, TO_DATE('1985-02-15', 'YYYY-MM-DD'), 'Bob
Johnson', 39, '234-567-8901', 'bob@example.com');
INSERT INTO Customers VALUES (3, TO_DATE('1992-03-20', 'YYYY-MM-DD'),
'Charlie Brown', 32, '345-678-9012', 'charlie@example.com');
INSERT INTO Customers VALUES (4, TO_DATE('1988-04-10', 'YYYY-MM-DD'),
'Diana Prince', 36, '456-789-0123', 'diana@example.com');
INSERT INTO Customers VALUES (5, TO_DATE('1975-05-25', 'YYYY-MM-DD'),
'Edward Elric', 49, '567-890-1234', 'edward@example.com');
INSERT INTO Customers VALUES (6, TO_DATE('1995-06-30', 'YYYY-MM-DD'),
'Fiona Gallagher', 29, '678-901-2345', 'fiona@example.com');
INSERT INTO Customers VALUES (7, TO_DATE('2000-07-15', 'YYYY-MM-DD'),
'George Michael', 24, '789-012-3456', 'george@example.com');
INSERT INTO Customers VALUES (8, TO_DATE('1991-08-01', 'YYYY-MM-DD'),
'Hannah Arendt', 33, '890-123-4567', 'hannah@example.com');
INSERT INTO Customers VALUES (9, TO_DATE('1983-09-05', 'YYYY-MM-DD'), 'Ian
Malcolm', 41, '901-234-5678', 'ian@example.com');
INSERT INTO Customers VALUES (10, TO_DATE('1978-10-20', 'YYYY-MM-DD'),
'Julia Child', 46, '012-345-6789', 'julia@example.com');
INSERT INTO Customers VALUES (11, TO_DATE('1993-11-30', 'YYYY-MM-DD'),
'Kurt Vonnegut', 30, '123-456-7891', 'kurt@example.com');
INSERT INTO Customers VALUES (12, TO_DATE('1998-12-31', 'YYYY-MM-DD'),
'Luna Lovegood', 25, '234-567-8902', 'luna@example.com');
INSERT INTO Customers VALUES (13, TO_DATE('1980-01-01', 'YYYY-MM-DD'),
'Max Mustermann', 44, '345-678-9013', 'max@example.com');
INSERT INTO Customers VALUES (14, TO_DATE('1972-02-14', 'YYYY-MM-DD'),
'Nina Simone', 52, '456-789-0124', 'nina@example.com');
INSERT INTO Customers VALUES (15, TO_DATE('1987-03-28', 'YYYY-MM-DD'),
'Oliver Twist', 37, '567-890-1235', 'oliver@example.com');
INSERT INTO Customers VALUES (16, TO_DATE('1996-04-22', 'YYYY-MM-DD'),
'Penny Lane', 28, '678-901-2346', 'penny@example.com');
INSERT INTO Customers VALUES (17, TO_DATE('1979-05-10', 'YYYY-MM-DD'),
'Quinn Fabray', 45, '789-012-3457', 'quinn@example.com');
INSERT INTO Customers VALUES (18, TO_DATE('1994-06-25', 'YYYY-MM-DD'),
'Ralph Waldo', 30, '890-123-4568', 'ralph@example.com');
INSERT INTO Customers VALUES (19, TO_DATE('1981-07-04', 'YYYY-MM-DD'),
'Sophie Turner', 43, '901-234-5679', 'sophie@example.com');
INSERT INTO Customers VALUES (20, TO_DATE('1999-08-17', 'YYYY-MM-DD'),
'Timmy Turner', 25, '012-345-6780', 'timmy@example.com');

--8. Insertion of records into Cars:
INSERT INTO Car VALUES (1, 'Toyota', 'Camry', 2020, 'White', 24000.00);
INSERT INTO Car VALUES (2, 'Honda', 'Accord', 2019, 'Black', 22000.00);
INSERT INTO Car VALUES (3, 'Ford', 'Mustang', 2021, 'Red', 35000.00);
INSERT INTO Car VALUES (4, 'Tesla', 'Model 3', 2022, 'Blue', 45000.00);
INSERT INTO Car VALUES (5, 'BMW', 'X5', 2020, 'Gray', 55000.00);
INSERT INTO Car VALUES (6, 'Audi', 'A6', 2019, 'Black', 40000.00);
INSERT INTO Car VALUES (7, 'Mercedes', 'C-Class', 2021, 'Silver', 48000.00);
INSERT INTO Car VALUES (8, 'Chevrolet', 'Malibu', 2018, 'White', 20000.00);
INSERT INTO Car VALUES (9, 'Hyundai', 'Elantra', 2020, 'Gray', 19000.00);
INSERT INTO Car VALUES (10, 'Nissan', 'Altima', 2019, 'Blue', 21000.00);
INSERT INTO Car VALUES (11, 'Volkswagen', 'Passat', 2019, 'Black', 27000.00);
INSERT INTO Car VALUES (12, 'Lexus', 'RX 350', 2021, 'White', 52000.00);
INSERT INTO Car VALUES (13, 'Jeep', 'Wrangler', 2020, 'Green', 38000.00);
INSERT INTO Car VALUES (14, 'Kia', 'Sorento', 2021, 'Red', 33000.00);
INSERT INTO Car VALUES (15, 'Mazda', 'CX-5', 2020, 'Blue', 29000.00);
INSERT INTO Car VALUES (16, 'Dodge', 'Charger', 2021, 'Black', 37000.00);
INSERT INTO Car VALUES (17, 'Subaru', 'Outback', 2022, 'Gray', 32000.00);
INSERT INTO Car VALUES (18, 'Porsche', 'Cayenne', 2020, 'White', 85000.00);
INSERT INTO Car VALUES (19, 'Jaguar', 'XF', 2019, 'Black', 60000.00);
INSERT INTO Car VALUES (20, 'Volvo', 'XC90', 2021, 'Silver', 67000.00);

--9. Insertion of records into Inventory:
INSERT INTO Inventory VALUES (1, 1, 10);
INSERT INTO Inventory VALUES (2, 2, 15);
INSERT INTO Inventory VALUES (3, 3, 5);
INSERT INTO Inventory VALUES (4, 4, 8);
INSERT INTO Inventory VALUES (5, 5, 12);
INSERT INTO Inventory VALUES (6, 6, 6);
INSERT INTO Inventory VALUES (7, 7, 3);
INSERT INTO Inventory VALUES (8, 8, 10);
INSERT INTO Inventory VALUES (9, 9, 9);
INSERT INTO Inventory VALUES (10, 10, 7);
INSERT INTO Inventory VALUES (11, 11, 8);
INSERT INTO Inventory VALUES (12, 12, 10);
INSERT INTO Inventory VALUES (13, 13, 5);
INSERT INTO Inventory VALUES (14, 14, 4);
INSERT INTO Inventory VALUES (15, 15, 11);
INSERT INTO Inventory VALUES (16, 16, 10);
INSERT INTO Inventory VALUES (17, 17, 8);
INSERT INTO Inventory VALUES (18, 18, 3);
INSERT INTO Inventory VALUES (19, 19, 2);
INSERT INTO Inventory VALUES (20, 20, 1);

--10. Insertion of records into Orders:
INSERT INTO Orders VALUES (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 1,
24000.00);
INSERT INTO Orders VALUES (2, TO_DATE('2023-01-02', 'YYYY-MM-DD'), 2,
22000.00);
INSERT INTO Orders VALUES (3, TO_DATE('2023-01-03', 'YYYY-MM-DD'), 3,
35000.00);
INSERT INTO Orders VALUES (4, TO_DATE('2023-01-04', 'YYYY-MM-DD'), 4,
45000.00);
INSERT INTO Orders VALUES (5, TO_DATE('2023-01-05', 'YYYY-MM-DD'), 5,
55000.00);
INSERT INTO Orders VALUES (6, TO_DATE('2023-01-06', 'YYYY-MM-DD'), 6,
40000.00);
INSERT INTO Orders VALUES (7, TO_DATE('2023-01-07', 'YYYY-MM-DD'), 7,
48000.00);
INSERT INTO Orders VALUES (8, TO_DATE('2023-01-08', 'YYYY-MM-DD'), 8,
20000.00);
INSERT INTO Orders VALUES (9, TO_DATE('2023-01-09', 'YYYY-MM-DD'), 9,
19000.00);
INSERT INTO Orders VALUES (10, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 10,
21000.00);
INSERT INTO Orders VALUES (11, TO_DATE('2023-01-11', 'YYYY-MM-DD'), 11,
27000.00);
INSERT INTO Orders VALUES (12, TO_DATE('2023-01-12', 'YYYY-MM-DD'), 12,
52000.00);
INSERT INTO Orders VALUES (13, TO_DATE('2023-01-13', 'YYYY-MM-DD'), 13,
38000.00);
INSERT INTO Orders VALUES (14, TO_DATE('2023-01-14', 'YYYY-MM-DD'), 14,
33000.00);
INSERT INTO Orders VALUES (15, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 15,
29000.00);
INSERT INTO Orders VALUES (16, TO_DATE('2023-01-16', 'YYYY-MM-DD'), 16,
37000.00);
INSERT INTO Orders VALUES (17, TO_DATE('2023-01-17', 'YYYY-MM-DD'), 17,
32000.00);
INSERT INTO Orders VALUES (18, TO_DATE('2023-01-18', 'YYYY-MM-DD'), 18,
85000.00);
INSERT INTO Orders VALUES (19, TO_DATE('2023-01-19', 'YYYY-MM-DD'), 19,
60000.00);
INSERT INTO Orders VALUES (20, TO_DATE('2023-01-20', 'YYYY-MM-DD'), 20,
67000.00);

--11.Insertion of records into Transactions:
INSERT INTO Transactions VALUES (1, 1, 2000.00, 1);
INSERT INTO Transactions VALUES (2, 2, 1800.00, 2);
INSERT INTO Transactions VALUES (3, 3, 3000.00, 3);
INSERT INTO Transactions VALUES (4, 4, 4000.00, 4);
INSERT INTO Transactions VALUES (5, 5, 5000.00, 5);
INSERT INTO Transactions VALUES (6, 6, 3200.00, 6);
INSERT INTO Transactions VALUES (7, 7, 3800.00, 7);
INSERT INTO Transactions VALUES (8, 8, 1700.00, 8);
INSERT INTO Transactions VALUES (9, 9, 1600.00, 9);
INSERT INTO Transactions VALUES (10, 10, 1800.00, 10);
INSERT INTO Transactions VALUES (11, 11, 2300.00, 11);
INSERT INTO Transactions VALUES (12, 12, 4200.00, 12);
INSERT INTO Transactions VALUES (13, 13, 3000.00, 13);
INSERT INTO Transactions VALUES (14, 14, 2600.00, 14);
INSERT INTO Transactions VALUES (15, 15, 2900.00, 15);
INSERT INTO Transactions VALUES (16, 16, 3700.00, 16);
INSERT INTO Transactions VALUES (17, 17, 3100.00, 17);
INSERT INTO Transactions VALUES (18, 18, 7500.00, 18);
INSERT INTO Transactions VALUES (19, 19, 5000.00, 19);
INSERT INTO Transactions VALUES (20, 20, 6200.00, 20);

--12. Insertion of records into Manager:
INSERT INTO Manager VALUES (1, 'Y');
INSERT INTO Manager VALUES (2, 'N');
INSERT INTO Manager VALUES (3, 'Y');
INSERT INTO Manager VALUES (4, 'Y');
INSERT INTO Manager VALUES (5, 'N');
INSERT INTO Manager VALUES (6, 'Y');
INSERT INTO Manager VALUES (7, 'N');
INSERT INTO Manager VALUES (8, 'Y');
INSERT INTO Manager VALUES (9, 'N');
INSERT INTO Manager VALUES (10, 'Y');
INSERT INTO Manager VALUES (11, 'Y');
INSERT INTO Manager VALUES (12, 'N');
INSERT INTO Manager VALUES (13, 'Y');
INSERT INTO Manager VALUES (14, 'N');
INSERT INTO Manager VALUES (15, 'Y');
INSERT INTO Manager VALUES (16, 'N');
INSERT INTO Manager VALUES (17, 'Y');
INSERT INTO Manager VALUES (18, 'N');
INSERT INTO Manager VALUES (19, 'Y');
INSERT INTO Manager VALUES (20, 'N');

--Queries
--Query1-Find the total revenue generated from each car model sold, including the total commission.
--SQL Commands:
SELECT c.Model, SUM(o.Total_amount) AS Total_Revenue, SUM(t.Commission) AS
Total_Commission FROM Car c JOIN Transactions t ON c.Car_id = t.Car_id JOIN Orders o ON
t.Order_id = o.Order_id
GROUP BY c.Model
ORDER BY Total_Revenue DESC;

--Query2-List the customers who purchased cars worth more than a specified amount, along with their details.
SQL Commands:
SELECT DISTINCT cu.Customer_id,
cu.C_name,
cu.Phone_num,
cu.C_Email,
o.Total_amount
FROM Customers cu
JOIN Orders o ON cu.Customer_id = o.Customer_id
WHERE o.Total_amount > 30000
ORDER BY o.Total_amount DESC;

--Query3-Calculate the age of customers and categorise them into groups (e.g., '18-25', '26-35', etc.).
SQL Commands:
SELECT CASE
WHEN Age BETWEEN 18 AND 25 THEN '18-25'
WHEN Age BETWEEN 26 AND 35 THEN '26-35'
WHEN Age BETWEEN 36 AND 45 THEN '36-45'
WHEN Age BETWEEN 46 AND 55 THEN '46-55'
ELSE '56+'
END AS Age_Group,
COUNT(Customer_id) AS Number_of_Customers
FROM Customers
GROUP BY CASE
WHEN Age BETWEEN 18 AND 25 THEN '18-25'
WHEN Age BETWEEN 26 AND 35 THEN '26-35'
WHEN Age BETWEEN 36 AND 45 THEN '36-45'
WHEN Age BETWEEN 46 AND 55 THEN '46-55'
ELSE '56+'
END
ORDER BY Age_Group;

--Query4-Get the top 3 customers based on the total amount spent on car purchases.
--SQL Commands:
SELECT cu.Customer_id,
cu.C_name,
SUM(o.Total_amount) AS Total_Spent
FROM Customers cu
JOIN Orders o ON cu.Customer_id = o.Customer_id
GROUP BY cu.Customer_id, cu.C_name
ORDER BY Total_Spent DESC
FETCH FIRST 3 ROWS ONLY;

--Query5-Find the least expensive car available in the inventory.
SQL Commands:
SELECT c.Brand,
c.Model,
MIN(c.Price) AS Least_Expensive
FROM Car c
JOIN Inventory i ON c.Car_id = i.Car_id
WHERE i.Quantity > 0
GROUP BY c.Brand, c.Model
ORDER BY Least_Expensive
FETCH FIRST 1 ROWS ONLY;

--Query6- List all transactions along with customer names and car models.
SQL Commands:
SELECT t.Transaction_id,
c.C_name,
car.Model,
t.Commission,
o.Order_date
FROM Transactions t
JOIN Orders o ON t.Order_id = o.Order_id
JOIN Customers c ON o.Customer_id = c.Customer_id
JOIN Car car ON t.Car_id = car.Car_id
ORDER BY t.Transaction_id;

--Query7- Generate a report of cars sold per year, including the total number of cars sold and the total revenue generated.
--SQL Commands:
SELECT EXTRACT(YEAR FROM o.Order_date) AS Sale_Year,
COUNT(o.Order_id) AS Total_Cars_Sold,
SUM(o.Total_amount) AS Total_Revenue
FROM Orders o
GROUP BY EXTRACT(YEAR FROM o.Order_date)
ORDER BY Sale_Year DESC;

--Query8- Get a summary of sales for each month, showing the total sales and the number of transactions for each month.
SQL Commands:
SELECT TO_CHAR(o.Order_date, 'YYYY-MM') AS Sale_Month,
COUNT(o.Order_id) AS Number_of_Transactions,
SUM(o.Total_amount) AS Total_Sales
FROM Orders o
GROUP BY TO_CHAR(o.Order_date, 'YYYY-MM')
ORDER BY Sale_Month;

--Query9- Analyze customer spending patterns, including total spent, average spent per transaction, and rank customers based on their spending.
--Customer Spending Patterns Query:
--● This query calculates the total amount spent by each customer, the average spent per transaction, and assigns a rank based on total spending using window functions.
--● It uses CTEs to break down the process into manageable parts, making it easier to read and maintain.
--SQL Commands:
WITH Customer_Spending AS (
SELECT cu.Customer_id,
cu.C_name,
SUM(o.Total_amount) AS Total_Spent,
COUNT(o.Order_id) AS Total_Orders,
AVG(o.Total_amount) AS Average_Spent
FROM Customers cu
JOIN Orders o ON cu.Customer_id = o.Customer_id
GROUP BY cu.Customer_id, cu.C_name
),
Ranked_Customers AS (
SELECT Customer_id,
C_name,
Total_Spent,
Average_Spent,
RANK() OVER (ORDER BY Total_Spent DESC) AS Spending_Rank
FROM Customer_Spending
)
SELECT Customer_id,
C_name,
Total_Spent,
Average_Spent,
Spending_Rank
FROM Ranked_Customers
ORDER BY Spending_Rank;

/*Query10-Brand Performance Analysis:Analyze the sales performance of different car brands,
including total sales and average price, and identifies the best-selling brand.
Brand Sales CTE: This CTE aggregates sales data for each car brand, calculating the total
number of sales, total amount earned, and the average price of cars sold.
Final SELECT Statement: Retrieves brand performance metrics and assigns a sales rank based
on total sales amount, ordering the results by sales rank.

SQL Commands:*/
WITH Brand_Sales AS (
SELECT c.Brand,
COUNT(o.Order_id) AS Total_Sales,
SUM(o.Total_amount) AS Total_Amount,
AVG(car.Price) AS Average_Price
FROM Car car
JOIN Orders o ON car.Car_id = o.Order_id
JOIN Inventory inv ON car.Car_id = inv.Car_id
JOIN Transactions t ON o.Order_id = t.Order_id
JOIN Customers cu ON o.Customer_id = cu.Customer_id
JOIN Car c ON car.Car_id = t.Car_id
GROUP BY c.Brand
)
SELECT Brand,
Total_Sales,
Total_Amount,
Average_Price,
RANK() OVER (ORDER BY Total_Amount DESC) AS Sales_Rank
FROM Brand_Sales
ORDER BY Sales_Rank;
