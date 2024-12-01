-- 1.	Which waiters have taken 2 or more bills on a single date? List the waiter names and surnames, the dates and the number of bills they have taken.
SELECT rs.first_name, rs.surname, rb.bill_date, COUNT(*) AS bill_count 
FROM restBill rb 
JOIN restStaff rs ON rb.waiter_no = rs.staff_no 
GROUP BY rb.waiter_no, rb.bill_date, rs.first_name, rs.surname 
HAVING COUNT(*) >= 2;

-- 2.	List the rooms with tables that can server more than 6 people and how many of such tables they have.
SELECT rrt.room_name, COUNT(*) AS table_count FROM restRest_table rrt WHERE rrt.no_of_seats > 6 GROUP BY rrt.room_name;

-- 3.	List the names of the rooms and the total amount of bills in each room
SELECT rrt.room_name, SUM(rb.bill_total) AS total_bills FROM restRest_table rrt JOIN restBill rb ON rrt.table_no = rb.table_no GROUP BY rrt.room_name;

-- 4.	List the headwaiter’s name and surname and the total bill amount their waiters have taken. Order the list by total bill amount, largest first.
SELECT hw.first_name, hw.surname, SUM(rb.bill_total) AS total_bill_amount
FROM restStaff hs
JOIN restBill rb ON rb.waiter_no = hs.staff_no
JOIN restStaff hw ON hw.staff_no = hs.headwaiter
GROUP BY hw.staff_no
ORDER BY total_bill_amount DESC;

-- 5.	List any customers who have spent more than £400 on average.
SELECT rb.cust_name, AVG(rb.bill_total) AS average_spent
FROM restBill rb
GROUP BY rb.cust_name
HAVING AVG(rb.bill_total) > 400;

-- 6.	Which waiters have taken 3 or more bills on a single date? List the waiter names, surnames, and the number of bills they have taken.
SELECT rs.first_name, rs.surname, rb.bill_date, COUNT(*) AS number_of_bills
FROM restStaff rs
JOIN restBill rb ON rs.staff_no = rb.waiter_no
GROUP BY rb.waiter_no, rb.bill_date
HAVING COUNT(*) >= 3;
