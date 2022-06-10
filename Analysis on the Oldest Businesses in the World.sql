--1. The oldest business in the world
SELECT TOP 1 *
FROM businesses
ORDER BY year_founded;
--LIMIT 1

--2. How many businesses were founded before 1000?
SELECT COUNT(*) as businesses_founded_before_1000
FROM businesses
WHERE year_founded < 1000;

--3. Which businesses were founded before 1000?
SELECT *
FROM businesses
WHERE year_founded < 1000;

--4. Exploring the categories (Joining dbo.categories to dbo.businesses)
SELECT 
	business,
	year_founded,
	b.category_code,
	category
FROM businesses as b
JOIN categories as cat
ON b.category_code = cat.category_code;

--5. Counting the categories
SELECT 
	category,
	COUNT(*) as businesses_per_category
FROM businesses as b
JOIN categories as cat
ON b.category_code = cat.category_code
GROUP BY category
ORDER BY businesses_per_category DESC;

--6. Oldest business by continent
SELECT
	continent,
	MIN(year_founded) as Oldest_year_founded
FROM businesses as b
LEFT JOIN countries as c
ON b.country_code = c.country_code
GROUP BY continent;

--7. Joining everything for further analysis
SELECT
	business,
	year_founded,
	category,
	country,
	continent
FROM businesses as b
JOIN categories as cat
ON b.category_code = cat.category_code
JOIN countries as c
on b.country_code = c.country_code;

--8. Counting categories by continent
SELECT
	continent,
	COUNT(*) as business_per_continent
FROM categories as cat
JOIN businesses as b
ON cat.category_code = b.category_code
JOIN countries as c
ON b.country_code = c.country_code
GROUP BY continent
ORDER BY business_per_continent DESC;

--9. Filtering counts by continent and category
SELECT continent, category, COUNT(*) as business_per_category
FROM businesses as b
JOIN countries as c
ON b.country_code = c.country_code
JOIN categories as cat
ON b.category_code = cat.category_code
GROUP BY continent, category
ORDER BY continent, category;