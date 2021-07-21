-- SQL Bridge Week 1 Assignment
-- SQL Select and Aggregations
-- Donald Butler
-- 07/20/2021

-- 1. Which destination in the flights database is the furthest distance away, based on information 
--     in the flights table. Show the SQL query(s) that support your conclusion
SELECT dest FROM flights ORDER BY distance DESC LIMIT 1;
--    HNL: Honolulu Intl

-- 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
--     the most number of seats? Show the SQL statement(s) that support your result.
SELECT engines, MAX(seats) FROM planes GROUP BY engines ORDER BY engines;

-- 3. Show the total number of flights.
SELECT COUNT(*) FROM flights;

-- 4. Show the total number of flights by airline (carrier).
SELECT carrier, COUNT(*) FROM flights GROUP BY carrier;

-- 5. Show all of the airlines, ordered by number of flights in descending order.
SELECT carrier, COUNT(*) FROM flights GROUP BY carrier ORDER BY COUNT(*) DESC;

-- 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
SELECT carrier, COUNT(*) FROM flights GROUP BY carrier ORDER BY COUNT(*) DESC LIMIT 5;

-- 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
--    flights in descending order.
SELECT carrier, COUNT(*) FROM flights WHERE distance >= 1000 GROUP BY carrier ORDER BY COUNT(*) DESC LIMIT 5;

-- 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and
--    write down both the question, and the query that answers the question.

