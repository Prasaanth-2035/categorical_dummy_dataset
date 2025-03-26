
-- Word Frequency Analysis

CREATE TABLE dummy_data2 
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  Promotions_Hesitations VARCHAR(255)
);

INSERT INTO dummy_data2 (Promotions_Hesitations) VALUES
('Lack of trust in promotion'),
('Limited availablity'),
('Limited availablity;Lack of trust in promotion'),
('Limited availablity;Unclear terms & conditions'),
('Limited availablity;Unclear terms & conditions;Previous bad experience with the brand'),
('Limited availablity;Unclear terms & conditions;Previous bad experience with the brand;Lack of trust in promotion;Limited product selection'),
('Limited product selection'),
('Previous bad experience with the brand'),
('Previous bad experience with the brand;Limited product selection'),
('Unclear terms & conditions');

select * from dummy_data2;

select id, Promotions_Hesitations
from dummy_data2
WHERE Promotions_Hesitations = " ";

SELECT
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(promotions_hesitations, ';', n.n), ';', -1)) AS word
FROM dummy_data
JOIN (
    SELECT 1 AS n
    UNION ALL SELECT 2
    UNION ALL SELECT 3
    UNION ALL SELECT 4
    UNION ALL SELECT 5
    UNION ALL SELECT 6
    UNION ALL SELECT 7
) n
ON CHAR_LENGTH(promotions_hesitations) - CHAR_LENGTH(REPLACE(promotions_hesitations, ';', '')) >= n.n - 1;

SELECT
  word,
  COUNT(*) AS frequency
FROM (
  SELECT
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(promotions_hesitations, ';', n.n), ';', -1)) AS word
  FROM dummy_data
  JOIN (
      SELECT 1 AS n
      UNION ALL SELECT 2
      UNION ALL SELECT 3
      UNION ALL SELECT 4
      UNION ALL SELECT 5
      UNION ALL SELECT 6
      UNION ALL SELECT 7
  ) n
  ON CHAR_LENGTH(promotions_hesitations) - CHAR_LENGTH(REPLACE(promotions_hesitations, ';', '')) >= n.n - 1
) AS words
GROUP BY word
ORDER BY frequency DESC;





