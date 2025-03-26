-- This is helpful for review the dataset.
SELECT * FROM dummy.dummy_data;

-- updating the NULL values from decision_factor 
UPDATE dummy_data
SET Decision_Factor = 'Discounted Price'
WHERE Decision_Factor = '';

-- updating the NULL values from recommend_promotion
UPDATE dummy_data
SET Recommend_Promotion = 'Definitely'
WHERE Recommend_Promotion = '';

-- updating the NULL values from product_familiarity
UPDATE dummy_data
SET Product_Familiarity = 'Use it Daily'
WHERE Product_Familiarity = '';


-- In Timestamp column, this way you can able to show the data, but can't run it.
SELECT 
  SUBSTRING_INDEX(Timestamp, ' ', 1) AS time_part,
  SUBSTRING_INDEX(SUBSTRING_INDEX(Timestamp, ' ', 3), ' ', -1) AS timezone_part
FROM dummy_data;

-- Solution for Timestamp
ALTER TABLE dummy_data
  ADD COLUMN time_part VARCHAR(20),
  ADD COLUMN timezone_part VARCHAR(20);
  
UPDATE dummy_data
SET 
  time_part = SUBSTRING_INDEX(Timestamp, ' ', 1),
  timezone_part = SUBSTRING_INDEX(SUBSTRING_INDEX(Timestamp, ' ', 3), ' ', -1);

ALTER TABLE dummy_data 
DROP COLUMN timestamp;

select * from dummy_data;

-- Rename How old are you?
ALTER TABLE dummy_data
RENAME COLUMN `How old are you?` TO Age_groups;

select * from dummy_data;

-- Drop similar column
ALTER TABLE dummy_data 
DROP COLUMN Product_Familiarity2;

-- In Ad_Motivation_Rating, convert into Low, Medium, High

update dummy_data
set Ad_Motivation_Rating = 'Low'
where Ad_Motivation_Rating in ('1 Star', '2 Star', '3 Star');

Select * from dummy_data;

update dummy_data
set Ad_Motivation_Rating = 'Medium'
where Ad_Motivation_Rating in ('4 Star');

Select * from dummy_data;

update dummy_data
set Ad_Motivation_Rating = 'High'
where Ad_Motivation_Rating in ('5 Star');

Select * from dummy_data;









