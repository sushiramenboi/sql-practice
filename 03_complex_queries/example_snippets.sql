-- Select key horse details for quick review.
-- Include horses in the 15.0-16.0 height range, or those born in 2020+.
SELECT RegisteredName, Height, BirthDate
FROM Horse
WHERE Height BETWEEN 15.0 AND 16.0
   OR BirthDate >= '2020-01-01';






-- Selects movie title and year from Movie table
-- Joins Rating table to get the description of each rating
-- LEFT JOIN ensures all movies are included, even if they have no rating
-- If a movie has no matching RatingCode, Description will be NULL
SELECT Movie.Title, Movie.Year, Rating.Description  
FROM Movie  
LEFT JOIN Rating  
ON Movie.RatingCode = Rating.Code;

