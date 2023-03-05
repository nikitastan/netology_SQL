SELECT a.name, a.year FROM albums a
WHERE YEAR=2018;

SELECT s.name, s.duration
FROM songs s
ORDER BY s.duration DESC  
LIMIT 1;

SELECT s.name,s.duration 
FROM songs s
WHERE s.duration>='00:03:30';

SELECT a.name, a.year FROM albums a
WHERE YEAR BETWEEN 2018 AND 2020;

SELECT m.name 
FROM musicians m
WHERE  m.name NOT LIKE '% %';

SELECT s.name
FROM songs s 
WHERE lower(s.name) LIKE ANY (ARRAY['% my %','my %','% my','% мой %','% мой','мой %']);