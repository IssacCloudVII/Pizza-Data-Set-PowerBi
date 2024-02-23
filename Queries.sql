--Total Revenue
select sum(total_price) Total_Revenue from pizza_sales

--Average Order Value
select sum(total_price) / count(distinct order_id) Avg_Order_Value from pizza_sales

--Total Pizzas Sold
select sum(quantity) Total_Quantity from pizza_sales

--Total Orders 
select count(distinct order_id) Total_Orders from pizza_sales

--Average Pizzas per Order
select cast(sum(quantity) as decimal) / count(distinct order_id) Avg_Pizzas_Order from pizza_sales

--Orders per Weekday
select 
	DATENAME(Weekday, order_date) as WeekDay, 
	count(distinct order_id) as SalesWeekday
from pizza_sales
group by DATENAME(Weekday, order_date) 

--Orders per Month
select 
	DATENAME(month, order_date) as Month,
	count(distinct order_id) as SalesMonth
from pizza_sales
group by DATENAME(month, order_date)

--Percentage of Revenue by Pizza Category
select 
	pizza_category, 
	cast(sum(total_price) * 100 / (select SUM(total_price) from pizza_sales) as decimal(10,2)) pizza_percentage
from pizza_sales
group by pizza_category

--Percentage of Revenue by Pizza Size
select 
	pizza_size, 
	cast(sum(total_price) * 100 / (select SUM(total_price) from pizza_sales) as decimal(10,2)) pizza_percentage
from pizza_sales
group by pizza_size

--Top 5 pizzas
select top 5 
	pizza_name,
	sum(total_price) total_revenue, 
	sum(quantity) quantity, 
	count(distinct order_id) order_count from pizza_sales 
group by pizza_name order by sum(total_price) desc 

--Bottom 5 pizzas
select top 5 
	pizza_name,
	sum(total_price) total_revenue, 
	sum(quantity) quantity, 
	count(distinct order_id) order_count from pizza_sales 
group by pizza_name order by sum(total_price) asc 
