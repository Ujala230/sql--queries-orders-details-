create database sales_db;
use sales_db;
create table orders(order_id varchar(30),order_date char(50), customer_name varchar(55),state varchar(25) , city varchar(25), order_month varchar (50), profit int,payment_mode varchar(50),amount int, quantity int);
select*from orders;
select count(*) as total_orders from orders;
desc orders;
#BUSSINESS OVERVIEW QUERIES
#TOTAL SALES 
select sum(amount) as total_sales from orders;
#TOTAL PROFIT 
select sum(profit) as total_profit from orders;
#TOTAL QUANTITY SOLD 
select sum(quantity) as total_quantity from orders;
#CATEGORY/PAYMENT ANALYSIS
#SALES BY PAYMENT MODE
select payment_mode,sum(amount) as total_sales from orders group by payment_mode;
#PROFIT BY PAYMENT MODE
select payment_mode,sum(profit)as total_profit from orders group by  payment_mode;
#LOCATION ANALYSIS
#SALES BY STATES
select state,sum(amount) as total_sales from orders group by state order by total_sales DESC;
#TOP 5 CITIES BY SALES
select city, sum(amount)as total_sales from orders group by city order by total_sales DESC limit 5 ;
#TIME ANALYSIS
#MONTHLY SALES
select order_month,sum(amount) as monthly_sales from orders group by order_month order by order_month;
#MONTHLY PROFIT 
select order_month,sum(profit) as monthly_profit from orders group by order_month order by order_month;
#CUSTOMER ANALYSIS
#TOP 5 CUSTOMERS BY SALES
select customer_name,sum(amount) as total_spent from orders group by customer_name order by total_spent DESC limit 5;
#ORDER PER CUSTOMER
select customer_name,count(order_id)as total_orders from orders group by customer_name order by total_orders DESC;
#PROFITABILITY ANALYSIS 
#PROFIT MARGIN PER ORDER
select order_id, amount, profit ,(profit/amount)*100 as profit_margin from orders;
#LOSS MAKING ORDERS
select*from orders where profit <0;
#PROFIT 
#HIGHEST PROFIT MONTH
select order_month,sum(profit)as total_profit from orders group by order_month order by total_profit DESC limit 1;
#AVERAGE ORDER VALUE 
select avg(amount)as avg_order_value from orders;
#REPEAT CUSTOMERS
select customer_name,count(order_id) as orders_count from orders group by customer_name having orders_count>1;
select*from orders;