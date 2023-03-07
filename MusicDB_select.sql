-- ==============Домашнее задание к лекции «Select-запросы, выборки из одной таблицы»

-- 1.название и год выхода альбомов, вышедших в 2018 году;
SELECT a.name, a.year FROM albums a
WHERE YEAR=2018;

-- 2.название и продолжительность самого длительного трека;
SELECT s.name, s.duration
FROM songs s
ORDER BY s.duration DESC  
LIMIT 1;

-- 3.название треков, продолжительность которых не менее 3,5 минуты;
SELECT s.name,s.duration 
FROM songs s
WHERE s.duration>='00:03:30';

-- 4.названия сборников, вышедших в период с 2018 по 2020 год включительно;
SELECT a.name, a.year FROM albums a
WHERE YEAR BETWEEN 2018 AND 2020;

-- 5.исполнители, чье имя состоит из 1 слова;
SELECT m.name 
FROM musicians m
WHERE  m.name NOT LIKE '% %';

-- 6.название треков, которые содержат слово "мой"/"my".
SELECT s.name
FROM songs s 
WHERE lower(s.name) LIKE ANY (ARRAY['% my %','my %','% my','% мой %','% мой','мой %']);
