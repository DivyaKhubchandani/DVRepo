create database MockTest;
use Mocktest;
#1)	Details of customers whose name starts with 'A' and have gmail id.
select * from customers;
select name,email from customers where name like 'A%' 
and email like '%gmail.com';

#2)	Details of customers containing 3 times 5 in password.
select * from customers c where password like '%5%5%5%';

#3)	Name & address of North Indian restaurant which is situated in 456 Elm St.
select * from cuisine;
select r_name, address  from cuisine c where cuisine = 'North Indian' 
and address  = '456 Elm St';

#4)	Names of restaurant which is either Italian or situated in '433 Oak St'.
select r_name, address  from cuisine c where cuisine = 'Italian' 
or address  = '433 Oak St';

#5)	How many orders were palced with amount 650 or more.
select * from orders;
select count(order_ID) from orders o where amount >= 650;

#6)	Find details of those customers who have never ordered.
select c.*, o.order_id  from customers c left join orders o 
on c.user_id = o.user_id 
where o.order_id is null;

#7)	Find out details of restaurants having sales greater than x (1000 or any amount).
select c.r_name , sum(o.amount) from cuisine c join orders o 
on c.r_id = o.r_id 
group by r_name having sum(o.amount) >1000;

#8)	Show all order details for a particular customer ('Vartika').
select c.name,o.* from customers c join orders o 
on c.user_ID = o.user_id 
where c.name='Vartika';

#9)	What is the average Price per dish.
select d.f_name ,round(avg(c.price)) as Dish_Avg_Price from dish d join card c 
on d.f_id = c.f_id 
group by d.f_name
order by Dish_Avg_Price desc;

#10)Find out number of times each customer ordered food from each restaurants. 
select c2.name , c.r_name , count(o.order_id) total_order 
from orders o join cuisine c
on o.r_id = c.r_id 
join customers c2 on
o.user_id = c2.user_id 
group by 1,2;

#11)Find the top restaurant in terms of the number of orders for a given month      
select c.r_name,monthname(o.`date`), count(o.order_id) Total_order  
from cuisine c join orders o 
on c.r_id = o.r_id 
group by 1,2
order by 3 desc;

#12)Who is most loyal customer of dominos?
select c.name,c2.r_name, count(o.order_id) from customers c join orders o 
on c.user_id = o.user_id 
join cuisine c2 on o.r_id = c2.r_id 
group by 1,2 having r_name='dominos'
order by 3 desc limit 1;