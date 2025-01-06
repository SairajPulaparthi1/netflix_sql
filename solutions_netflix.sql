-- Netflix Project 
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix 
(
	show_id	VARCHAR(6),
	type	VARCHAR(10),
	title	VARCHAR(150),
	director VARCHAR(208),	
	casts	VARCHAR(1000),	
	country	VARCHAR(150),
	date_added	VARCHAR(50),
	release_year	INT, 	
	rating	VARCHAR(10),
	duration	VARCHAR(15),
	listed_in	VARCHAR(100),
	description	VARCHAR(250)
);

SELECT * FROM netflix
SELECT 
	DISTINCT type
FROM netflix;

SELECT * FROM netflix;

-- 15 Buisness Problems
-- 1. Count the number of movies as tv shows.

SELECT
	type,
	COUNT(*) as total_count
FROM netflix
GROUP BY type

-- 2 Find the most common rating for movies and TV shows?
SELECT
	type,
	rating
FROM

(SELECT
	type,
	rating,
	COUNT(*),
	RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) as ranking
FROM netflix
GROUP BY 1, 2
) as table_one
WHERE 
	ranking = 1

--3. List all movies released in a specific year(e.g., 2020)
SELECT * FROM netflix;

--filter the data by 2020
--filter only movies
SELECT * FROM netflix
WHERE 
	type= 'Movie'
	AND
	release_year=2020

-- 4 Find the top 5 countries with the most content on Netflix
SELECT 
	UNNEST(STRING_TO_ARRAY(country, ',')) as new_country,
	COUNT(show_id) as total_id
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

-- 5 Identify the longest movie?

SELECT * FROM netflix
WHERE 
	type = 'Movie'
	AND
	duration = (SELECT MAX(duration) FROM netflix)






