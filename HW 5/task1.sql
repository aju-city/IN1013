-- 1
SELECT * FROM restBill WHERE cust_name = 'Bob Crow';

SELECT DISTINCT * FROM restBill WHERE cust_name LIKE "%smith" ORDER BY cust_name DESC;

SELECT DISTINCT cust_name FROM restBill WHERE cust_name LIKE "% C%";

SELECT * FROM restStaff WHERE headwaiter IS NOT NULL;

SELECT * FROM restBill WHERE bill_date LIKE '1602%';

SELECT DISTINCT * FROM restBill WHERE bill_date LIKE '15%' ORDER BY bill_date ASC;