/* ========================================
   LOGISTICS DATA ANALYSIS QUERIES
   ======================================== */

/* 1. Total Shipments per Branch */
SELECT b.name AS branch_name,
       COUNT(s.shipment_id) AS total_shipments
FROM shipment s
JOIN delivery_segment ds ON s.shipment_id = ds.shipment_id
JOIN warehouse w ON ds.warehouse_id = w.warehouse_id
JOIN branch b ON w.branch_id = b.branch_id
GROUP BY b.name;


/* 2. Total Revenue Generated */
SELECT SUM(total_amount) AS total_revenue
FROM invoice;


/* 3. Unpaid Invoices */
SELECT invoice_id,
       total_amount,
       invoice_status
FROM invoice
WHERE invoice_status = 'Unpaid';


/* 4. Top 5 Customers by Revenue */
SELECT c.Names AS customer_name,
       SUM(i.total_amount) AS total_spent
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN invoice i ON o.order_id = i.order_id
GROUP BY c.Names
ORDER BY total_spent DESC
LIMIT 5;
