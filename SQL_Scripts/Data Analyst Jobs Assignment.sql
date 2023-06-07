--#### Provide the SQL queries and answers for the following questions/tasks using the data_analyst_jobs table you have created in PostgreSQL:

--1.	How many rows are in the data_analyst_jobs table? 1793

-- SELECT COUNT(*) 
-- FROM data_analyst_jobs;

--2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row? ExxonMobil

-- SELECT *
-- FROM data_analyst_jobs
-- LIMIT 10;

--3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky? 21 in TN. 27 in either. 6 in KY.

-- SELECT COUNT(*)
-- FROM data_analyst_jobs
-- WHERE location = 'TN';

-- SELECT COUNT(*)
-- FROM data_analyst_jobs
-- WHERE location = 'KY';

-- SELECT COUNT(*)
-- FROM data_analyst_jobs
-- WHERE location IN ('TN', 'KY');

-- SELECT DISTINCT location
-- FROM data_analyst_jobs;

--4.	How many postings in Tennessee have a star rating above 4? 3

-- SELECT COUNT(*)
-- FROM data_analyst_jobs
-- WHERE location = 'TN' AND star_rating > 4;

--5.	How many postings in the dataset have a review count between 500 and 1000? 151

-- SELECT COUNT(*)
-- FROM data_analyst_jobs
-- WHERE review_count BETWEEN 500 AND 1000;

--6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating? NE

-- SELECT location AS state, AVG(star_rating) AS avg_rating
-- FROM data_analyst_jobs
-- GROUP BY location
-- ORDER BY avg_rating DESC;

--7.	Select unique job titles from the data_analyst_jobs table. How many are there? 881

-- SELECT DISTINCT title
-- FROM data_analyst_jobs;

-- SELECT COUNT (DISTINCT title)
-- FROM data_analyst_jobs;

--8.	How many unique job titles are there for California companies? 230

-- SELECT COUNT (DISTINCT title)
-- FROM data_analyst_jobs
-- WHERE location = 'CA';

--9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations? 71

-- SELECT company, AVG(star_rating)
-- FROM data_analyst_jobs
-- GROUP BY company
-- HAVING SUM(review_count) > 5000;

--10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating? Google. The rating is 4.3.

-- SELECT company, AVG(star_rating)
-- FROM data_analyst_jobs
-- GROUP BY company
-- HAVING SUM(review_count) > 5000
-- ORDER BY AVG(star_rating) DESC;


--11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 754

-- SELECT DISTINCT title
-- FROM data_analyst_jobs
-- WHERE title LIKE '%Analyst%';

-- SELECT COUNT(DISTINCT title)
-- FROM data_analyst_jobs
-- WHERE title LIKE '%Analyst%';


--12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common? 26 don't contain either. They almost all are either in uppercase or lowercase.

-- SELECT COUNT(DISTINCT title) AS num_titles
-- FROM data_analyst_jobs
-- WHERE title NOT LIKE '%Analyst%'
--   AND title NOT LIKE '%Analytics%';
 
-- SELECT DISTINCT title
-- FROM data_analyst_jobs
-- WHERE title NOT LIKE '%Analyst%'
--   AND title NOT LIKE '%Analytics%';

--**BONUS:**
--You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 

 -- Disregard any postings where the domain is NULL. 
 -- Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
  -- Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
  --Internet and Software, Banks and Financial Services, and Consulting and Business Services are the top 3 on this list. 
--   I & S: 62
--   B & F: 61
--   C & B: 57
--   HC: 52

-- SELECT *
-- FROM data_analyst_jobs
-- LIMIT 10;

-- SELECT domain, COUNT(*) AS num_jobs
-- FROM data_analyst_jobs
-- WHERE skill LIKE '%SQL%'
--   AND days_since_posting > 21
--   AND domain IS NOT NULL
-- GROUP BY domain
-- ORDER BY num_jobs DESC
-- LIMIT 4;

