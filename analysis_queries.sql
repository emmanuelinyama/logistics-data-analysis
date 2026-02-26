-- Total shipments per branch
SELECT b.name AS branch_name, COUNT(s.shipment_id) AS total_shipments
FROM shipment s
JOIN delivery_segment ds ON s.shipment_id = ds.shipment_id
JOIN warehouse w ON ds.warehouse_id = w.warehouse_id
JOIN branch b ON w.branch_id = b.branch_id
GROUP BY b.name;

-- Total revenue generated
SELECT SUM(total_amount) AS total_revenue
FROM invoice;

-- Unpaid invoices
SELECT invoice_id, total_amount
FROM invoice
WHERE invoice_status = 'Unpaid';
