DROP TABLE if EXISTS sales;
DROP TABLE if EXISTS employee;

CREATE TABLE employee (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE sales (
  id INT PRIMARY KEY,
  employee_id INT REFERENCES employee(id),
  price INT
);

INSERT INTO employee (id, name) VALUES
(1, 'Ann'),
(2, 'Boris'),
(3, 'Viktor'),
(4, 'Ivan'),
(5, 'Eugene');

INSERT INTO sales (id, employee_id, price) VALUES
(1, 1, 1000),
(2, 2, 1500),
(3, 3, 2000),
(4, 4, 2500),
(5, 5, 3000),
(6, 1, 1200),
(7, 2, 1800),
(8, 3, 2400),
(9, 4, 3000),
(10, 5, 3600),
(11, 1, 1200),
(12, 1, 1800),
(13, 3, 2400),
(14, 3, 3000),
(15, 4, 3600);

SELECT e.id,
       e.name,
       COUNT(s.id) AS sales_c,
       RANK() OVER (ORDER BY COUNT(s.id) DESC) AS sales_rank_c,
       SUM(s.price) AS sales_s,
       RANK() OVER (ORDER BY SUM(s.price) DESC) AS sales_rank_s
FROM employee e
JOIN sales s ON e.id = s.employee_id
GROUP BY e.id,
         e.name;


DROP TABLE if EXISTS sales;
DROP TABLE if EXISTS employee;