CREATE DATABASE admission_cards;
USE admission_cards;

-- saw the table
SELECT * FROM student_admission_record_dirty;

-- Find missing names
SELECT * 
FROM student_admission_record_dirty
WHERE Name IS NULL OR TRIM(Name) = '';

-- Find duplicate names (same name repeated)
SELECT Name, COUNT(*) AS count
FROM student_admission_record_dirty
GROUP BY Name
HAVING COUNT(*) > 1;

-- Add a temporary auto-increment column
ALTER TABLE student_admission_record_dirty 
ADD COLUMN temp_id INT AUTO_INCREMENT PRIMARY KEY;

-- Delete Duplicate Values
DELETE t1
FROM student_admission_record_dirty t1
JOIN student_admission_record_dirty t2 
  ON t1.Name = t2.Name 
  AND t1.temp_id > t2.temp_id;

-- Remove the temporary column
ALTER TABLE student_admission_record_dirty 
DROP COLUMN temp_id;

-- Find out Any duplicate values 
SELECT Name, COUNT(*) AS count
FROM student_admission_record_dirty
GROUP BY Name
HAVING COUNT(*) > 1;


-- Find null values 
SELECT *
FROM student_admission_record_dirty
WHERE Name IS NULL;

-- Remove null values
DELETE FROM student_admission_record_dirty
WHERE Name IS NULL;

-- fetch only how many duplicate values in name column 
select * from student_admission_record_dirty;

-- Capitalize first letter, lowercase the rest
UPDATE student_admission_record_dirty
SET Name = CONCAT(UCASE(LEFT(TRIM(Name), 1)), LCASE(SUBSTRING(TRIM(Name), 2)))
WHERE Name IS NOT NULL AND Name <> '';

-- Find invalid ages
SELECT * 
FROM student_admission_record_dirty
WHERE Age IS NULL OR Age < 15 OR Age > 30;

-- Replace out-of-range ages with NULL
UPDATE student_admission_record_dirty
SET Age = NULL
WHERE Age < 15 OR Age > 30;

-- Normalize gender to 'Male' or 'Female'
select * from student_admission_record_dirty;
UPDATE student_admission_record_dirty
SET Gender = CASE
    WHEN LOWER(Gender) IN ('male', 'm') THEN 'Male'
    WHEN LOWER(Gender) IN ('female', 'f') THEN 'Female'
    ELSE NULL
END;

-- Verify counts after cleaning
SELECT Gender, COUNT(*) AS Total
FROM student_admission_record_dirty
GROUP BY Gender;
select * from student_admission_record_dirty;

-- Ensure test scores are between 0 and 100
UPDATE student_admission_record_dirty
SET `Admission Test Score` = NULL
WHERE `Admission Test Score` < 0 OR `Admission Test Score` > 100;

-- Ensure percentages are between 0 and 100
UPDATE student_admission_record_dirty
SET `High School Percentage` = NULL
WHERE `High School Percentage` < 0 OR `High School Percentage` > 100;

-- Capitalize first letter of city names
UPDATE student_admission_record_dirty
SET City = CONCAT(UCASE(LEFT(TRIM(City), 1)), LCASE(SUBSTRING(TRIM(City), 2)))
WHERE City IS NOT NULL AND City <> '';

-- Normalize values like 'accept', 'rejected', 'rej' etc.
UPDATE student_admission_record_dirty
SET `Admission Status` = CASE
    WHEN LOWER(`Admission Status`) LIKE '%accept%' THEN 'Accepted'
    WHEN LOWER(`Admission Status`) LIKE '%reject%' THEN 'Rejected'
    ELSE NULL
END;

-- Automatically assign status based on marks
UPDATE student_admission_record_dirty
SET `Admission Status` = CASE
    WHEN `Admission Status` IS NULL 
         AND `Admission Test Score` >= 75 
         AND `High School Percentage` >= 70 THEN 'Accepted'
    WHEN `Admission Status` IS NULL THEN 'Rejected'
    ELSE `Admission Status`
END;

-- Replace Empty Strings with NULL
UPDATE student_admission_record_dirty
SET 
    Name = NULLIF(TRIM(Name), ''),
    Gender = NULLIF(TRIM(Gender), ''),
    City	 = NULLIF(TRIM(City), ''),
    `High School Percentage` = NULLIF(TRIM(`High School Percentage`), ''),
    `Admission Status` = NULLIF(TRIM(`Admission Status`), '');
    
-- fetch the table details
select * from student_admission_record_dirty;
