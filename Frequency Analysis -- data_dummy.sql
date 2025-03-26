SELECT * FROM data_dummy.categorical_dummy_data_;

-- Count of Rows
SELECT Count(*) FROM categorical_dummy_data_;

-- Count of Columns'
SELECT COUNT(*) 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = DATABASE() 
AND TABLE_NAME = 'categorical_dummy_data_';

-- This is helpful for review the dataset.
SELECT * FROM dummy.dummy_data;		

-- Frequency analysis for Sales_Promotions
select 
Sales_Promotions, 
COUNT(*) as Promotion_count,
ROUND((Count(*) / (select COUNT(*) from categorical_dummy_data_))*100, 2) as frequency_percentage
from categorical_dummy_data_
GROUP BY Sales_Promotions
ORDER BY frequency_percentage desc;

-- Frequency analysis for Promotions_Product_Type
select 
Promotions_Product_Type, 
COUNT(*) as Promotion_count,
ROUND((Count(*) / (select COUNT(*) from categorical_dummy_data_))*100, 2) as frequency_percentage
from categorical_dummy_data_
GROUP BY Promotions_Product_Type
ORDER BY frequency_percentage desc;

-- Frequency analysis for Preferred_Promotions_Method
select 
Preferred_Promotions_Method, 
COUNT(*) as Promotion_count,
ROUND((Count(*) / (select COUNT(*) from categorical_dummy_data_))*100, 2) as frequency_percentage
from categorical_dummy_data_
GROUP BY Preferred_Promotions_Method
ORDER BY frequency_percentage desc;

-- Frequency analysis for Advertising_Metric
select 
Advertising_Metric, 
COUNT(*) as Promotion_count,
ROUND((Count(*) / (select COUNT(*) from categorical_dummy_data_))*100, 2) as frequency_percentage
from categorical_dummy_data_
GROUP BY Advertising_Metric
ORDER BY frequency_percentage desc;

















