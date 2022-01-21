-------------------------------------------------------------------
-- WARM UPS & REFERENCE                                          --
-------------------------------------------------------------------
-- 1. View entire table:
   SELECT * FROM products;
-- 2. Only 10 rows from table:
--    In PostgreSQL:
   SELECT * FROM products LIMIT 10;
--    In SQL Server:
--    SELECT TOP(10) * FROM products;
-- 3. Only 2 columns from table:
   SELECT title, price FROM products;
-- 4. Order by a column:
   SELECT * FROM products ORDER BY price;
-- 5. Order by a column descending:
   SELECT * FROM products ORDER BY price DESC;
-- 6. Distinct values in column:
   SELECT DISTINCT price FROM products;
--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------
-- 1. Write a SQL query to view the entire 'users' table.
select * from users; 
-- 2. View the first 5 rows of the 'users' table. 
select * from users limit 10;
-- 3. View the 'users' table ordered by when the users was created.
select * from users order by created_at;
-- 4. Write a SQL query to view the entire 'purchases' table.
select * from purchases;
-- 5. View the name and state columns of the 'purchases' table.
select name, state from purchases;
-- 6. Use LIMIT and ORDER BY to see the 10 most recent purchases. 
select * from purchases order by created_at limit 10;
-- 7. Use a DISTINCT query to see which states people have made purchases from. 
select distinct state from purchases;
----------------------------------------
-- EXTRA CREDIT: If you finish early. --
----------------------------------------
-- 1. You can use DISTINCT on multiple columns as well.
--    Use DISTINCT on the purchases table to see which states each user has made orders from.
select * from purchases;
select distinct user_id, name, state from purchases;
-- 2. Modify the query above to ORDER BY user_id, so you can see the data user-by-user.
select distinct user_id, name, state from purchases order by user_id;