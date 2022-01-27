-------------------------------------------------------------------
-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------
-- 1. [Inner Join]: 
SELECT *
FROM users AS u
JOIN purchases AS p
ON p.user_id=u.user_id;

-- 2. [Left Join]: 
SELECT *
FROM users AS u
LEFT JOIN purchases AS p
ON p.user_id=u.user_id;

-- 3. [Finding NULLS]: 
SELECT *
FROM users AS u
WHERE deleted_at IS NULL;

--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------
-- 1. First, join the products table to the purchase_items
--    table. Choose a join that will KEEP products even
--    if they don't have any associated purchase_items.
select *
from products as p
join purchase_items as pi 
on p.product_id = pi.product_id;

-- 2. Were there any products with no purchase?
--    Query the joined table for rows with NULL quantity.
select distinct title
from products as p
join purchase_items as pi
on p.product_id = pi.product_id;

-- 3. Now add a groupby to find the average quantity that
--    each product was purchased in.
select product_id, avg(quantity)
from purchase_items
group by product_id;

-- 4. Let's find the total number of items associated with each
--    user.
select p.user_id, count(pi.quantity) as count
from purchases as p
left join purchase_items as pi
on p.purchase_id = pi.purchase_id
group by p.user_id
order by count;

-- a. First, join the purchases and purchase_items table,
--    so we have both user_id and quantity.
--    Which kind of join is appropriate here?
select p.user_id, count(pi.quantity) as count
from purchases as p
left join purchase_items as pi
on p.purchase_id = pi.purchase_id
group by p.user_id
order by count;

-- b. Now use a group by to find the total quantity for each
--    user_id.