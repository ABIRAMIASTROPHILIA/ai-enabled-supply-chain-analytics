CREATE database supply_chain_project;
USE supply_chain_project;
SELECT * FROM orders_data
limit 10;
DESCRIBE orders_data;
SELECT COUNT(*)
FROM orders_data;
CREATE TABLE customer AS
SELECT DISTINCT
    `Customer Id`,
    CONCAT(`Customer Fname`, ' ', `Customer Lname`) AS customer_name,
    `Customer City`,
    `Customer State`,
    `Customer Country`,
    `Customer Segment`
FROM orders_data;
CREATE TABLE product AS
SELECT DISTINCT
    `Product Card Id`,
    `Category Name`,
    `Department Name`,
    `Product Price`
FROM orders_data;

CREATE TABLE sales AS
SELECT DISTINCT
    `Order Id`,
    `Sales`,
    `Order Item Quantity`,
    `Order Profit Per Order`,
    `Benefit per order`
FROM orders_data;

CREATE TABLE shipping AS
SELECT DISTINCT
    `Order Id`,
    `Shipping Mode`,
    `Delivery Status`,
    `Late_delivery_risk`,
    `Days for shipping (real)`,
    `Days for shipment (scheduled)`
FROM orders_data;

CREATE TABLE orders AS
SELECT DISTINCT
    `Order Id`,
    `Order Date (DateOrders)`,
    `Order Status`,
    `Customer Id`,
    `Product Card Id`,
    `Order Region`,
    `Market`
FROM orders_data;
SELECT * from customer limit 15;
SELECT * from orders limit 5;
SELECT * from product limit 5;
SELECT * from sales LIMIT 5;
SELECT * from shipping limit 5;
SELECT 
    `Shipping Mode`,
    COUNT(`Late_delivery_risk`) as total_delays
FROM shipping
GROUP BY `Shipping Mode`
ORDER BY `total_delays` DESC
LIMIT 1;
SELECT  
    `Order Id`,
    `Shipping Mode`,
    CASE  
        WHEN `Days for shipping (real)` > `Days for shipment (scheduled)` 
        THEN 'Risk' 
        ELSE 'Safe' 
    END AS Shipping_situation
FROM shipping;
SELECT  `Shipping Mode`,
		SUM(
		case  When `Days for shipping (real)`  > `Days for shipment (scheduled)`then 1 else 0 end
        ) as `Risk_Shipment_count`
FROM shipping 
GROUP BY `Shipping Mode`;
SELECT p.`Category Name` category,sum(s.`Sales`) no_of_sales
FROM product p
join orders o
on p.`Product Card Id`= o.`Product Card Id`
join sales s
on s.`Order Id` = o.`Order Id`
group by category
order by no_of_sales desc 
limit 1;
SELECT 
    sales_category,
    profit_category,
    
    CASE 
        WHEN sales_category = profit_category 
        THEN 'Yes'
        ELSE 'No'
    END AS profitable_product

FROM (

    SELECT 
        (
            SELECT p.`Category Name`
            FROM product p
            JOIN orders o
            ON p.`Product Card Id` = o.`Product Card Id`
            JOIN sales s
            ON s.`Order Id` = o.`Order Id`
            GROUP BY p.`Category Name`
            ORDER BY SUM(s.`Sales`) DESC
            LIMIT 1
        ) AS sales_category,

        (
            SELECT p.`Category Name`
            FROM product p
            JOIN orders o
            ON p.`Product Card Id` = o.`Product Card Id`
            JOIN sales s
            ON s.`Order Id` = o.`Order Id`
            GROUP BY p.`Category Name`
            ORDER BY SUM(s.`Order Profit Per Order`) DESC
            LIMIT 1
        ) AS profit_category

) sub;
SELECT o.`Order Region` region,
	sum(s.`sales`) no_of_sales
from orders o
join sales s
on s.`Order Id`=o.`Order Id`
group by region
order by no_of_sales desc
limit 1;
SELECT o.`Order Region` region,
	SUM(
		case  When `Days for shipping (real)`  > `Days for shipment (scheduled)`then 1 else 0 end
        ) as `Risk_Shipment_count`
from orders o
join shipping s
on s.`Order Id`=o.`Order Id`
group by region
order by  `Risk_Shipment_count` desc
limit 1;
SELECT MONTH(
STR_TO_DATE(`Order Date (DateOrders)`, '%m/%d/%Y %H:%i')
) orders_per_month,
		sum(s.`sales`) no_of_sales
from orders o
join sales s
on s.`Order Id`=o.`Order Id`
group by orders_per_month
order by no_of_sales desc
limit 1;
SELECT monthname(
STR_TO_DATE(`Order Date (DateOrders)`, '%m/%d/%Y %H:%i')
) month_name,
SUM(
		case  When `Days for shipping (real)`  > `Days for shipment (scheduled)`then 1 else 0 end
        ) as `Risk_Shipment_count`		
from orders o
join shipping s
on s.`Order Id`=o.`Order Id`
group by month_name
order by Risk_Shipment_count desc
limit 1;

SELECT 
    c.`Customer Segment`,
    SUM(s.`Order Profit Per Order`) AS total_profit

FROM customer c

JOIN orders o
ON c.`Customer Id` = o.`Customer Id`

JOIN sales s
ON s.`Order Id` = o.`Order Id`

GROUP BY c.`Customer Segment`

ORDER BY total_profit DESC

LIMIT 1;
SELECT 
    p.`Category Name` AS category,

    SUM(s.`Sales`) AS total_sales,

    SUM(s.`Order Profit Per Order`) AS total_profit

FROM product p

JOIN orders o
ON p.`Product Card Id` = o.`Product Card Id`

JOIN sales s
ON s.`Order Id` = o.`Order Id`

GROUP BY category

HAVING total_sales > (
    SELECT AVG(total_sales)
    FROM (
        SELECT 
            SUM(`Sales`) AS total_sales
        FROM sales
        GROUP BY `Order Id`
    ) sub1
)

AND total_profit < (
    SELECT AVG(total_profit)
    FROM (
        SELECT 
            SUM(`Order Profit Per Order`) AS total_profit
        FROM sales
        GROUP BY `Order Id`
    ) sub2
)

ORDER BY total_sales DESC;
SELECT s.`Shipping Mode`,
SUM(
		case  When `Days for shipping (real)`  > `Days for shipment (scheduled)`then 1 else 0 end
        ) as `Risk_Shipment_count`		
from orders o
join shipping s
on s.`Order Id`=o.`Order Id`
group by s.`Shipping Mode`
order by Risk_Shipment_count desc
limit 1;

