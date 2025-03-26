SELECT * FROM data_dummy.categorical_dummy_data_;

-- Cross-tabulation analysis for Age_groups by Rating.
SELECT 
    Age_category,
    SUM(CASE WHEN Ad_Motivation_Rating = 'Low' THEN 1 ELSE 0 END) AS Low,
    SUM(CASE WHEN Ad_Motivation_Rating = 'Medium' THEN 1 ELSE 0 END) AS Medium,
    SUM(CASE WHEN Ad_Motivation_Rating = 'High' THEN 1 ELSE 0 END) AS High,
    COUNT(*) AS Total
FROM categorical_dummy_data_
GROUP BY Age_category;

-- Cross-tabulation analysis for Metric by Preferred_Promotions_Method

SELECT Preferred_Promotions_Method,
    SUM(CASE WHEN Advertising_Metric = 'Product Development Time' THEN 1 ELSE 0 END) as `Product Development Time`,
    SUM(CASE WHEN Advertising_Metric = 'Click-through Rate(CTR)' THEN 1 ELSE 0 END) as `Click-through Rate(CTR)`,
    SUM(CASE WHEN Advertising_Metric = 'Customer lifetime value(CLV)' THEN 1 ELSE 0 END) as `Customer lifetime value(CLV)`
FROM categorical_dummy_data_
GROUP BY Preferred_Promotions_Method;

-- Cross-tabulation analysis for Sales_Promotions_Industry && Sales_Promotions_Frequency

SELECT Sales_Promotions_Industry,
    SUM(CASE WHEN Sales_Promotions_Frequency = 'Often' THEN 1 ELSE 0 END) as Often,
    SUM(CASE WHEN Sales_Promotions_Frequency = 'Rarely' THEN 1 ELSE 0 END) as Rarely,
    SUM(CASE WHEN Sales_Promotions_Frequency = 'Sometimes' THEN 1 ELSE 0 END) as Sometimes,
    SUM(CASE WHEN Sales_Promotions_Frequency = 'Very often' THEN 1 ELSE 0 END) as `Very often`,
    COUNT(*) as Total
FROM categorical_dummy_data_
GROUP BY Sales_Promotions_Industry;


-- Cross-tabulation analysis for limited Purchase timing by Age_groups

SELECT Age_category,
    SUM(CASE WHEN Limited_Time_Purchase = 'Yes' THEN 1 ELSE 0 END) as Gold,
    SUM(CASE WHEN Limited_Time_Purchase = 'No' THEN 1 ELSE 0 END) as Silver,
    SUM(CASE WHEN Limited_Time_Purchase = 'Depends on the product' THEN 1 ELSE 0 END) as Bronze,
    COUNT(*) as Total
FROM categorical_dummy_data_
GROUP BY Age_category;




