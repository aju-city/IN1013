-- 3
SELECT DISTINCT first_name FROM restStaff INNER JOIN restBill ON restBill.waiter_no = restStaff.staff_no;

SELECT room_date FROM restRoom_management INNER JOIN restStaff ON restStaff.staff_no = restRoom_management.headwaiter;

SELECT ws.first_name, ws.surname FROM restStaff AS ws INNER JOIN restStaff AS zoe ON ws.headwaiter = zoe.headwaiter WHERE zoe.first_name = 'Zoe' AND zoe.surname = 'Ball' AND ws.staff_no != zoe.staff_no;

SELECT restBill.cust_name AS Customer, restBill.bill_total AS 'Amount Spent', restStaff.first_name AS 'Waiter First Name', restStaff.surname AS 'Waiter Surname' FROM restBill INNER JOIN restStaff ON restBill.waiter_no = restStaff.staff_no ORDER BY restBill.bill_total DESC;

SELECT DISTINCT restStaff.first_name AS Waiter_First_Name, restStaff.surname AS Waiter_Surname FROM restBill INNER JOIN restStaff ON restBill.waiter_no = restStaff.staff_no WHERE restBill.table_no IN (SELECT table_no FROM restBill WHERE bill_no IN (00014, 00017));

SELECT DISTINCT s.first_name, s.surname FROM restBill b INNER JOIN restRest_table t ON b.table_no = t.table_no INNER JOIN restRoom_management rm ON t.room_name = rm.room_name AND b.bill_date = rm.room_date INNER JOIN restStaff s ON b.waiter_no = s.staff_no OR rm.headwaiter = s.staff_no WHERE t.room_name = 'Blue' AND b.bill_date = 160312;
