-------------------------------------------------------------------
-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------
-- 1. [Grouping by one column]: 
select * from purchases;
select state, count(purchase_id) from purchases group by state;
-- 2. [Grouping by multiple columns]: 
select state, zipcode, count(purchase_id) from purchases group by state, zipcode;
--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------
-- 1. Find the most recent purchase made within each state.
select max(created_at), state from purchases group by state order by max(created_at) desc;
-- 2. Use the purchase_items table to find the total number of each product_id sold.
select * from purchase_items;
select product_id, count(product_id) from purchase_items group by product_id order by product_id;
-- 3. Use the purchase_items table to see the total dollar amount of items in each state: Delivered, Returned, Pending
select * from purchase_items;
select sum(price * quantity), status from purchase_items group by status order by status;
-- 4. In the products table, find how many products are under each set of tags.
select * from products;
select count(title), tags from products group by tags;
-- 5. Modify the previous query to find how many products over $10 are under each set of tags.
select * from products;
select count(price), tags from products where price > 10 group by tags;
-- 6. Use the user table to find out how many purchases each user made.
select * from users;
select user_id, count(user_id) from purchases group by user_id order by user_id;
-- 7. What is the first purchase that was made in each state, in each zipcode? 
-- (No, zipcodes do not repeat between states, but write your query as though they did.)
select * from purchases;
select state, zipcode, min(created_at) from purchases group by state,zipcode order by state;
----------------------------------------
-- EXTRA CREDIT: If you finish early. --
----------------------------------------
-- 1. The DATEPART() function extracts whichever part of the
--  timestamp you want. E.g. DATEPART(year FROM '2001-02-16 20:38:40')
--  returns 2001. Use DATEPART() to extract which calendar month
--  each user was created in.
select * from users;
select user_id, DATE_PART('month', created_at) AS Month from users;

-- 2. Use DATEPART() and a group by statement to count how many
--    users were created in each calendar month.
select count(*), DATE_PART('month', created_at) from users group by DATE_PART('month', created_at);

-- 3. Use the DATEPART() function to find the number of users
--    created during each day of the week.
--    Hint: Use DAY as the first input
select date_part('dow', created_at) + 1, count(*) from users group by date_part('dow', created_at) +1 order by 2;
