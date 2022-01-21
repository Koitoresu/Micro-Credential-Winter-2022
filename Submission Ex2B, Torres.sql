
-------------------------------------------------------------------
-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------

-- 1. [Using max/min]: SELECT max(price) FROM products;
select max(price) from products;

-- 2. [Using count]: SELECT count(*) FROM users;
select count(*) users;

-- 3. [Using sum]: SELECT sum(price) FROM purchase_items;
select sum(price) from purchase_items;

-- 4. [Using avg]: SELECT avg(price) FROM purchase_items;
select avg(price) from purchase_items;

--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------

-- 1. Find the total number of purchases.
select count(*) from purchases;

-- 2. Find the average price of the items in the products table.
select avg(price) from products;

-- 3. Find the maximum price from the products that are NOT a
--    computer.
select * from products;
select max(price) from products where title not like '% Computer';

-- 4. Find the number of users with Gmail email addresses.
select * from users; 
select count(*) from users where email like '%@gmail.com';

-- 5. Using the purchase_items table, find the total dollar value of
--    all items with state "Returned".
select * from purchase_items;
select sum(price) from purchase_items where status = 'Returned';

-- 6. Find the average price of all products containing the word
--    "Book" in their title.
select * from products;
select avg(price) from products where Lower(title) like '%book%';
----------------------------------------
-- EXTRA CREDIT: If you finish early. --
----------------------------------------

-- 1. You use multiple aggregation functions in one SELECT. Using
--    only one query,
--    find the min(), max() and avg() of the prices in the product
--    table.
select min(price), max(price), avg(price) from products;
-- 2. In one query, find the difference between the price of the most
--    expensive and least expensive product.
select max(price) - min(price) from products;