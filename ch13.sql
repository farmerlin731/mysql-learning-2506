use demo_ch13_0722;

-- stupid merge
select * from orders where customer_id=(select id from customers where email = "roj@gmail.com");

-- use foreign key
