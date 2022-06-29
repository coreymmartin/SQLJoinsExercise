/*
 -- inner join
SELECT p.Name, s.Date AS "Sale Date" 
FROM products AS p 
INNER JOIN sales as s 
ON p.ProductID = s.ProductID;
*/

/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT P.Name AS Product, C.Name AS Category FROM bestbuy.products AS P
INNER JOIN bestbuy.categories AS C ON C.CategoryID = P.CategoryID
WHERE C.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

SELECT p.Name AS 'Product Name', p.Price As 'Cost', r.Rating As 'Rating'
FROM bestbuy.products AS p
INNER JOIN bestbuy.reviews AS r on r.ProductID = p.ProductID
WHERE r.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, SUM(s.quantity) AS Total 
FROM sales AS s
INNER JOIN bestbuy.employees AS e 
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Totally DESC
LIMIT 3
;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS 'Department Name', c.Name AS 'Category Name'
FROM bestbuy.departments AS d
INNER JOIN bestbuy.categories AS c 
ON d.DepartmentID = c.DepartmentID
where c.Name = 'Appliances' OR c.Name = 'Games';



/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT 
p.Name AS 'Product Name', 
Sum(s.Quantity) AS 'Total Number Sold', 
Sum(s.Quantity) * s.PricePerUnit AS 'Total Price Sold'
FROM bestbuy.products as p
INNER JOIN bestbuy.sales as s
ON p.ProductID = s.ProductID
WHERE p.Name LIKE "%Eagles%California%";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT
p.Name AS 'Product Name',
r.Reviewer AS 'Reviewer Name',
r.Rating AS 'Rating',
r.Comment AS 'Comment'
FROM bestbuy.products AS p
INNER JOIN bestbuy.reviews as r
ON p.ProductID = r.ProductID
WHERE p.Name LIKE '%Visio%'
ORDER BY r.Rating ASC
LIMIT 1
;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID AS 'ID', 
e.FirstName AS 'First', 
e.LastName AS 'Last', 
p.Name AS 'Product Name', 
Sum(s.Quantity) AS 'Qty Sold'
FROM bestbuy.employees as e
INNER JOIN bestbuy.sales as s
ON e.EmployeeID = s.EmployeeID
INNER JOIN bestbuy.products as p
ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID
;