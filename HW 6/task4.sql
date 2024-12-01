-- 1.	List the names of customers who spent more than 450.00 on a single bill on occasions when ‘Charles’ was their Headwaiter.
SELECT DISTINCT rb.cust_name FROM restBill rb JOIN restRest_table rrt ON rb.table_no = rrt.table_no JOIN restRoom_management rrm ON rrt.room_name = rrm.room_name AND rb.bill_date = rrm.room_date WHERE rrm.headwaiter = 010 AND rb.bill_total > 450.00;

-- 2.	A customer called Nerida has complained that a waiter was rude to her when she dined at the restaurant on the 11th January 2016. What is the name and surname of the Headwaiter who will have to deal with the matter?
SELECT rs.first_name, rs.surname FROM restBill rb JOIN restRest_table rrt ON rb.table_no = rrt.table_no JOIN restRoom_management rrm ON rrt.room_name = rrm.room_name AND rb.bill_date = rrm.room_date JOIN restStaff rs ON rrm.headwaiter = rs.staff_no WHERE rb.cust_name = 'Nerida Smith' AND rb.bill_date = 160111;

-- 3.	What are the names of customers with the smallest bill?
SELECT cust_name FROM restBill WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

-- 4.	List the names of any waiters who have not taken any bills.
SELECT first_name, surname FROM restStaff WHERE staff_no NOT IN (SELECT DISTINCT waiter_no FROM restBill);

-- 5.	Which customers had the largest single bill? List the customer name, the name and surname of headwaiters, and the room name where they were served on that occasion.
SELECT rb.cust_name, rs.first_name AS headwaiter_first_name, rs.surname AS headwaiter_surname, rrm.room_name 
FROM restBill rb 
JOIN restRest_table rrt ON rb.table_no = rrt.table_no 
JOIN restRoom_management rrm ON rrt.room_name = rrm.room_name AND rb.bill_date = rrm.room_date 
JOIN restStaff rs ON rrm.headwaiter = rs.staff_no 
WHERE rb.bill_total = (SELECT MAX(bill_total) FROM restBill);
