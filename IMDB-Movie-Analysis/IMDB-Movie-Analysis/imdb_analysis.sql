-- =====================================================
-- IMDB Movie Industry Analytics
-- Author: Surendra Kumar
-- Dataset: IMDB_Movies
-- =====================================================

-- 1. Total Movies

SELECT COUNT(*) AS total_movies
FROM imdb_movies;

-- =====================================================
-- 2. Average IMDB Rating

SELECT
    ROUND(AVG(imdb_score),2) AS average_rating
FROM imdb_movies;

-- =====================================================
-- 3. Top 10 Highest Rated Movies

SELECT
    movie_title,
    imdb_score
FROM imdb_movies
ORDER BY imdb_score DESC
LIMIT 10;

-- =====================================================
-- 4. Most Common Genres

SELECT
    genres,
    COUNT(*) AS movie_count
FROM imdb_movies
GROUP BY genres
ORDER BY movie_count DESC
LIMIT 10;

-- =====================================================
-- 5. Highest Grossing Movies

SELECT
    movie_title,
    gross
FROM imdb_movies
WHERE gross IS NOT NULL
ORDER BY gross DESC
LIMIT 10;

-- =====================================================
-- 6. Highest Budget Movies

SELECT
    movie_title,
    budget
FROM imdb_movies
WHERE budget IS NOT NULL
ORDER BY budget DESC
LIMIT 10;

-- =====================================================
-- 7. Profitability Analysis

SELECT
    movie_title,
    budget,
    gross,
    (gross - budget) AS profit
FROM imdb_movies
WHERE budget IS NOT NULL
AND gross IS NOT NULL
ORDER BY profit DESC
LIMIT 20;

-- =====================================================
-- 8. Average Rating by Genre

SELECT
    genres,
    ROUND(AVG(imdb_score),2) AS avg_rating
FROM imdb_movies
GROUP BY genres
ORDER BY avg_rating DESC;

-- =====================================================
-- 9. Movies Released Per Year

SELECT
    title_year,
    COUNT(*) AS total_movies
FROM imdb_movies
WHERE title_year IS NOT NULL
GROUP BY title_year
ORDER BY title_year;

-- =====================================================
-- 10. Revenue Trend by Year

SELECT
    title_year,
    SUM(gross) AS total_revenue
FROM imdb_movies
WHERE title_year IS NOT NULL
GROUP BY title_year
ORDER BY title_year;

-- =====================================================
-- 11. Most Popular Directors

SELECT
    director_name,
    COUNT(*) AS total_movies
FROM imdb_movies
GROUP BY director_name
ORDER BY total_movies DESC
LIMIT 20;

-- =====================================================
-- 12. Top Movies by User Votes

SELECT
    movie_title,
    num_voted_users
FROM imdb_movies
ORDER BY num_voted_users DESC
LIMIT 20;

-- =====================================================
-- 13. Average Revenue by Genre

SELECT
    genres,
    ROUND(AVG(gross),0) AS average_revenue
FROM imdb_movies
WHERE gross IS NOT NULL
GROUP BY genres
ORDER BY average_revenue DESC;

-- =====================================================
-- 14. Average Budget by Genre

SELECT
    genres,
    ROUND(AVG(budget),0) AS average_budget
FROM imdb_movies
WHERE budget IS NOT NULL
GROUP BY genres
ORDER BY average_budget DESC;
