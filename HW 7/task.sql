-- 1:
CREATE VIEW samsBills AS
SELECT first_name, surname, bill_date, cust_name, bill_total
FROM bills
WHERE first_name = 'Sam' AND surname = 'Pitt';

--  2:
SELECT first_name, surname, bill_date, cust_name, bill_total
FROM samsBills
WHERE bill_total > 400;

-- 3:
CREATE VIEW roomTotals AS
SELECT room_name, SUM(bill_total) AS total_sum
FROM bills
GROUP BY room_name;

-- 4:
CREATE VIEW teamTotals AS
SELECT CONCAT(waiters.first_name, ' ', waiters.surname) AS headwaiter_name, 
       SUM(bills.bill_total) AS total_sum
FROM waiters
JOIN bills ON waiters.waiter_id = bills.waiter_id
GROUP BY waiters.waiter_id;
