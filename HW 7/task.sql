-- 1 
CREATE VIEW samsBills AS
SELECT 
    rs.first_name,
    rs.surname,
    rb.bill_date,
    rb.cust_name,
    rb.bill_total
FROM 
    restStaff rs
JOIN 
    restBill rb 
ON 
    rs.staff_no = rb.waiter_no
WHERE 
    rs.first_name = 'Sam' AND rs.surname = 'Pitt';

-- 2
SELECT * FROM samsBills WHERE bill_total > 400;

--3
CREATE VIEW roomTotals AS
SELECT 
    rt.room_name,
    SUM(rb.bill_total) AS total_sum
FROM 
    restRest_table rt
JOIN 
    restBill rb 
ON 
    rt.table_no = rb.table_no
GROUP BY 
    rt.room_name;

-- 4
CREATE VIEW teamTotals AS
SELECT 
    CONCAT(hw.first_name, ' ', hw.surname) AS headwaiter_name,
    SUM(rb.bill_total) AS total_sum
FROM 
    restStaff w
JOIN 
    restBill rb 
ON 
    w.staff_no = rb.waiter_no
JOIN 
    restStaff hw 
ON 
    w.headwaiter = hw.staff_no
GROUP BY 
    hw.staff_no;
