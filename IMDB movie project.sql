-- a) Can you get all data about movies?
SELECT *
FROM movies;
-- b) How do you get all data about directors?
SELECT *
FROM directors;
-- c) Check how many movies are present in IMDB.
SELECT COUNT(*) AS total_movies
FROM movies;		
-- d) Find these 3 directors: James Cameron, Luc Besson, John Woo
SELECT *
FROM directors
WHERE name IN ('James Cameron', 'Luc Besson', 'John Woo');
-- e) Find all directors with name starting with S.
SELECT *
FROM directors
WHERE name LIKE 'S%';
-- f) Count female directors.
SELECT COUNT(*) AS female_directors
FROM directors
WHERE gender = 1;
-- g) Find the name of the 10th first women director.
SELECT name
FROM directors
WHERE gender = 1
ORDER BY id
LIMIT 1 OFFSET 9;
-- h) What are the 3 most popular movies?
SELECT original_title, popularity
FROM movies
ORDER BY popularity DESC
LIMIT 3;
-- i) What are the 3 most bankable movies?
SELECT original_title, revenue
FROM movies
ORDER BY revenue DESC
LIMIT 3;
-- j) What is the most awarded average vote since January 1st, 2000?
SELECT original_title, vote_average
FROM movies
WHERE release_date >= '2000-01-01'
ORDER BY vote_average DESC
LIMIT 1;
-- k) Which movie(s) were directed by Brenda Chapman?
SELECT m.original_title
FROM movies m
JOIN directors d
ON m.director_id = d.id
WHERE d.name = 'Brenda Chapman';
-- l) Which director made the most movies?
SELECT d.name, COUNT(*) AS movie_count
FROM directors d
JOIN movies m
ON d.id = m.director_id
GROUP BY d.id, d.name
ORDER BY movie_count DESC
LIMIT 1;
-- m) Which director is the most bankable?
SELECT d.name, SUM(m.revenue) AS total_revenue
FROM directors d
JOIN movies m
ON d.id = m.director_id
GROUP BY d.id, d.name
ORDER BY total_revenue DESC
LIMIT 1;
