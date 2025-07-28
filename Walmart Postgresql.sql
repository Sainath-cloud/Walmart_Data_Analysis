select * from walmart

select count(*)from walmart

select payment_method 
from walmart
Group by payment_method
where payment_method = 'Credit card'
select count(distinct city) from walmart
-- Group by city
select count(distinct branch) from walmart

select max(quantity) from walmart
select min(quantity) from walmart

------------------------------------------------------------

-- Testing the table with different scenarios
-- 1) Find the different payment method, number of transactions, and number of quantity sold
select payment_method, count(payment_method) No_of_invoices, sum(quantity) No_of_products from walmart
Group by payment_method

--2) Identify the highest rated category in each branch, displaying the branch, category and average rating
select distinct category, max(rating) from walmart 
Group by category

--SubQueries
select * from(
select branch, category, AVG(rating) as avg_rating,
--window functions 
Rank() over(partition by branch order by AVG(rating) desc) 
from walmart
Group by branch, category) where rank =1
--order by 1, 3 desc
--3) Identify the busiet day for each branch based on the number of transactions

select branch, TO_DATE(date, 'DD/MM/YY') as formatted_date from walmart

-- used functions TO_DATE AND TO_CHAR as date column is in text type so used TO_DATE function
-- to change it as date and also TO_CHAR for days based on dates
select branch, TO_CHAR(TO_DATE(date, 'DD/MM/YY'), 'Day')as Day_name, 
count(*) as no_of_transactions
from walmart
Group by branch, Day_name
order by branch, no_of_transactions DESC


select * from (
select branch, TO_CHAR(TO_DATE(date, 'DD/MM/YY'), 'Day')as Day_name, 
count(*) as no_of_transactions,
Rank() Over(Partition by branch order by count(*) desc) as rank
from walmart
Group by branch, Day_name
) where rank=1
order by branch, no_of_transactions DESC



--4) Total quantity of items sold per payment method. list payment_method and total_quantity

select payment_method,  sum(quantity) as no_qty_sold
from walmart Group by payment_method

--5)

-- Determine the avg, minimum, and maximum rating of products for each city
-- List the city, average_rating, min_rating, and max_rating

select Category, city, min(rating) as min_rating, max(rating) as max_rating, avg(rating) as avg_rating
from walmart
group by 1,2

6) 
--calculate the total profit for each category by considering total_profit as
--(unit_price * quantity * profit_margin). List category and total_profit, ordered from highest to lowest profit



select category, sum(total * profit_margin) as total_profit, sum (total) as total_revenue from walmart
group by 1
order by 1, 2 desc

7) 
--determine the most common payment method for each branch
-- display branch and the preferred_payment_method

select * from (select branch, payment_method, count(*) as payment_method_used,
rank() over(partition by branch order by count(*) desc)
from walmart
group by 1,2) where rank =1
order by 3 desc

with temp_table as(
select branch, payment_method, count(*) as payment_method_used,
rank() over(partition by branch order by count(*) desc)
from walmart
group by 1,2 )
select * from temp_table where rank=1

8) 
-- Categorize sales into 3 group morning, afternoon, evening
-- find out which of the shift and number of invoices

--used time function to change the time cloumn from text to time format
select *,
time::time
from walmart

select branch,
case
-- extract(hour from(time::time)) will return the hour
when extract(hour from(time::time)) < 12 then 'Morning'
when extract(hour from (time::time)) between 12 and 17 then 'Afternoon'
else 'Evening'
end day_time, count(*)
from walmart
group by 1, 2
order by 1, 3 desc

9) 
-- identify 5 branch with highest decrease ratio in revenue compare to last year

-- revenue decrease ratio = last_rev_ratio - Cr_rev_ratio/last_yr*100

select *, Extract(Year from TO_DATE(date,'DD/MM/YY')) as typechnged_date 
from walmart

select * from walmart

--2022 Sales
With revenue_2022 as
(
select branch, sum(total) as revenue from walmart
where Extract(Year from TO_DATE(date,'DD/MM/YY')) = 2022
--where year(TO_DATE(date,'DD/MM/YY')) = 2022 mysql version 
group by branch 
), 

revenue_2023 as 
(
select branch, sum(total) as revenue from walmart
where Extract(Year from TO_DATE(date,'DD/MM/YY')) = 2023
group by branch 
)

select sale22.branch,
sale22.revenue as lastyear_revenue, sale23.revenue as currentyear_revenue,
round ((sale22.revenue - sale23.revenue)::numeric/(sale22.revenue)::numeric *100, 2) as rev_decrease_ratio
from revenue_2022 as sale22 
join 
revenue_2023 as sale23
on sale22.branch = sale23.branch
where sale23.revenue < sale22.revenue 
order by rev_decrease_ratio Desc
limit 5


