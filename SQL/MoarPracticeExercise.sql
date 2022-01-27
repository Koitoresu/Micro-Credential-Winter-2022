-------------------------------------------------------------------
-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------
-- 1. [Single-value subquery]: 
select * from purchase_items where price = (select max(price) from products)
-- 2. [Multiple-value subquery]: 
select * from purchases where user_id in (select user_id from users where email like '%@verizon.com') 
or user_id in (select user_id from users where email like '%@gmail.com')
--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------
-- 1. Select the products that cost more than average.
select * from products where price > (select avg(price) from products)

-- 2. Find all the purchase_items that represent orders for the lowest-priced product.
select * from purchase_items where price in (select min(price) from purchase_items);

-- 3. Find the most recent purchase made by a user with a Gmail email address.
select * from purchases where user_id in (select user_id from users where email like '%@gmail.com') order by created_at desc limit 1;
-- select user_id, email from users where email like '%@gmail.com' and user_id (select user_id from purchases order by created_at)

-- 4. List the titles of the products that were ever returned in quantities greater than 4.
select * from products;
select * from purchase_items;
select * from products where product_id in (select product_id from purchase_items where quantity > 4 and status = 'Returned');