select *
from sales_data;

-- Which product type has the highest number of sales?
select product_type,round(sum(sales),2) as total_sales
from sales_data
group by product_type
order by total_sales desc
limit 10;

-- Which product type has the lowest number of sales?
select product_type,round(sum(sales),2) as total_sales
from sales_data
group by product_type
order by total_sales asc
limit 10;

-- Which store type has the highest number of sales?
select store_type,round(sum(sales),2) as total_sales
from sales_data
group by store_type
order by total_sales desc;

-- Which store size has the highest number of sales?
select store_size,round(sum(sales),2) as total_sales
from sales_data
group by store_size
order by total_sales desc;

-- Which store tier has the highest number of sales?
select Store_Location_Type,round(sum(sales),2) as total_sales
from sales_data
group by Store_Location_Type
order by total_sales desc;

-- Is there a correlation between product weight and sales
SELECT
    (
        (COUNT(*) * SUM(Product_MRP * Sales)) - (SUM(Product_MRP) * SUM(Sales))
    ) / (
        SQRT((COUNT(*) * SUM(Product_MRP * Product_MRP)) - (SUM(Product_MRP) * SUM(Product_MRP))) *
        SQRT((COUNT(*) * SUM(Sales * Sales)) - (SUM(Sales) * SUM(Sales)))
    ) AS correlation
FROM sales_data;

-- Sales by product fat content
SELECT
    SUM(Sales) AS total_sales,
    CASE 
        WHEN Product_Fat_Content = 'LF' THEN 'Low Fat' 
        WHEN Product_Fat_Content = 'reg' THEN 'Regular' 
        ELSE 'Other' 
    END AS Product_Fat_Content
FROM
    sales_data
GROUP BY
    CASE 
        WHEN Product_Fat_Content = 'LF' THEN 'Low Fat' 
        WHEN Product_Fat_Content = 'reg' THEN 'Regular' 
        ELSE 'Other' 
    END;

