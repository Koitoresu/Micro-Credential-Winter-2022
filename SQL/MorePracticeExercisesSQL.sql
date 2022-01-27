-------------------------------------------------------------------
-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------
-- 1. [Grouping by multiple columns]: 
SELECT state, zipcode, COUNT(purchase_id) FROM purchases GROUP BY state, zipcode;
-- 2. [Group by using a HAVING filter]:
SELECT state, COUNT(purchase_id) FROM purchases GROUP BY state HAVING COUNT(purchase_id) > 100;
-- 3. [Multiple-value subquery]: 
SELECT * FROM purchases WHERE user_id IN (SELECT user_id FROM users WHERE email LIKE '%@gmail.com');
-- 4. [Using alias in filter]: 
select * from users;
SELECT name, email FROM users AS u JOIN purchases AS p ON p.user_id=u.user_id WHERE u.email LIKE '%@gmail.com';
--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------
-- 1. Find the most recent purchase made by each user.
select * from purchases;
select name, min(created_at) from purchases group by name;
-- 2. Find the oldest purchase made by a user with a yahoo email
--    address.
-- select * from users where email ilike '%@yahoo.com';
select email, min(created_at) from users where email ilike '%@yahoo.com' group by email;
select email, min(created_at) from users where email ilike '%@verizon.com' group by email;
-- 3. Find all the users' emails who made at least one purchase from the
--    state of NY.
select * from users;
select * from purchases where state = 'NY';
SELECT email FROM users AS u JOIN purchases AS p ON u.user_id=p.user_id WHERE state = 'NY' group by email;

----------------------------------------
-- EXTRA CREDIT: If you finish early. --
----------------------------------------
-- 1. Use the DATEPART() function to find the number of users created
--    during each day of the week.
--    Hint: Use DW as the first input
select date_part('dow', created_at) as DOW, count(*) from users group by date_part('dow', created_at);
-- 2. How about each day of the month?
select date_part('day', created_at) as MONTH, count(*) 
from users 
group by date_part('day', created_at) 
order by date_part('day', created_at);