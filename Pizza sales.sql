use divya;
select * from pizza_sales ps ;
#Total revenue
select sum(total_price) from pizza_sales ps ;

#Avearge order value
select (sum(total_price)/ count(distinct(order_id))) from pizza_sales;

#Total Pizza Sold
select sum(quantity) from pizza_sales ps ;

#Total orders
select count(distinct(order_id)) from pizza_sales ps ;

#Average Pizza per order
select sum(quantity)/ count(distinct(order_id)) from pizza_sales ps ;

#Daily Trend for Total Orders
select dayname(order_date), count(distinct(order_id))from pizza_sales ps 
group by dayname(order_date)
order by count(distinct(order_id)) desc;

#Monthly Trend for Orders
select monthname(order_date), count(distinct(order_id)) from pizza_sales ps 
group by monthname(order_date)
order by count(distinct(order_id)) desc;

#% of Sales by Pizza Category
select pizza_category,sum(total_price)*100/(select sum(total_price) from pizza_sales ps2) from pizza_sales ps 
group by pizza_category;

#% of Sales by Pizza Size
select pizza_size,sum(total_price)*100/(select sum(total_price) from pizza_sales ps2) from pizza_sales ps 
group by pizza_size;

#Total Pizzas Sold by Pizza Category
select sum(quantity), pizza_category  from pizza_sales ps 
group by pizza_category ;

#Top 5 Pizzas by Revenue
select sum(total_price), pizza_name from pizza_sales ps 
group by pizza_name
order by sum(total_price) desc limit 5;

#Bottom 5 Pizzas by Revenue
select sum(total_price), pizza_name from pizza_sales ps 
group by pizza_name
order by sum(total_price) asc limit 5;

#Top 5 Pizzas by Quantity
select sum(quantity), pizza_name from pizza_sales ps 
group by pizza_name
order by sum(quantity) desc limit 5;

#Bottom 5 Pizzas by Quantity
select sum(quantity), pizza_name from pizza_sales ps 
group by pizza_name
order by sum(quantity) asc limit 5;

#Top 5 Pizzas by Total Orders
select count(distinct (order_id)), pizza_name from pizza_sales ps 
group by pizza_name
order by count(distinct (order_id)) desc limit 5;

#Borrom 5 Pizzas by Total Orders
select count(distinct (order_id)), pizza_name from pizza_sales ps 
group by pizza_name
order by count(distinct (order_id)) asc limit 5;










