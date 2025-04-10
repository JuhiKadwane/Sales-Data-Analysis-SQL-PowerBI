use classicmodels;
-- To find out sales status--
select status from orders group by 1;

-- To analyse number of years of the collected data--
select year(paymentdate) from payments group by 1;

-- To analyse the prodct details--
select productline from products group by 1;

-- To analyse the countries where the company runs the business--
select country from customers group by 1;

-- To find out number of countries--
select count(distinct country) from customers;

-- To find out number of customers company deals with--
select count(distinct customerName) from customers;

--- To find out highest sailing product--
select productline,sum(msrp*quantityinstock) from products group by productline order by 2 desc;

-- year wise amount paid by customer for shipped orders ---
select year(paymentDate),sum(amount) from payments group by 1;

-- To analyse the less number of shipped oders in 2005----
select * from orders where year(orderDate)='2005' and status = 'shipped';

-- Month wise amount paid by customer for shipped orders ---
select month(orderdate),count(status),sum(amount) 
from orders
inner join payments on orders.customerNumber=payments.customerNumber
where status='shipped'
group by 1 order by 2 desc;

-- sales by country--
select country,sum(amount) 
from customers
inner join payments on customers.customerNumber=payments.customerNumber
group by country
order by 2 desc;

-- highest revenue from the customer--
select customername,sum(amount) 
from customers
inner join payments on customers.customerNumber=payments.customerNumber
group by customername
order by 2 desc;