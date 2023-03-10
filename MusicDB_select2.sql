-- =================«Группировки, выборки из нескольких таблиц»

-- 1.количество исполнителей в каждом жанре;
SELECT g."name", t2."count"
FROM genres g 
LEFT JOIN (SELECT mg.genre_id, count(DISTINCT mg.musician_id) AS "count"
			FROM musician_genre mg
			GROUP BY mg.genre_id ) t2
ON t2.genre_id=g.genre_id 

-- 2.количество треков, вошедших в альбомы 2019-2020 годов;
SELECT count(s.name) AS "Кол-во песен"
FROM albums a 
LEFT JOIN songs s 
ON a.album_id = s.album_id 
WHERE a."year"  BETWEEN 2019 AND 2020

-- 3.средняя продолжительность треков по каждому альбому;
SELECT a.album_id, a."name", avg(s.duration) 
FROM albums a 
LEFT JOIN songs s 
ON a.album_id = s.album_id
GROUP BY a.album_id 
ORDER BY a.album_id 


-- 4.все исполнители, которые не выпустили альбомы в 2020 году;
SELECT m."name"
FROM musicians m 
LEFT JOIN musician_album ma 
	ON m.musician_id =ma.musician_id 
LEFT JOIN (SELECT *
			FROM albums
			WHERE YEAR=2020) a
	ON ma.album_id = a.album_id
GROUP BY m."name"
HAVING max(a.YEAR) IS NULL 


-- 5.названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT c.collection_id, c."name" 
FROM collections c 
LEFT JOIN songs_collections sc
	ON c.collection_id = sc.collection_id 
LEFT JOIN songs s
	ON sc.song_id = s.song_id
LEFT JOIN albums a 
	ON s.album_id = a.album_id 
LEFT JOIN musician_album ma 
	ON a.album_id = ma.album_id 
LEFT JOIN musicians m 
	ON ma.musician_id = m.musician_id
WHERE m."name" = 'Земфира'

-- 6.название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT c.collection_id, c."name", count(DISTINCT mg.genre_id)
FROM collections c 
LEFT JOIN songs_collections sc
	ON c.collection_id = sc.collection_id 
LEFT JOIN songs s
	ON sc.song_id = s.song_id
LEFT JOIN albums a 
	ON s.album_id = a.album_id 
LEFT JOIN musician_album ma 
	ON a.album_id = ma.album_id 
LEFT JOIN musicians m 
	ON ma.musician_id = m.musician_id
LEFT JOIN musician_genre mg 
	ON mg.musician_id = m.musician_id 
GROUP BY c.collection_id, c."name"
HAVING count(DISTINCT mg.genre_id)>1

-- 7. наименование треков, которые не входят в сборники
SELECT s."name"
FROM songs s
LEFT JOIN songs_collections sc
	ON sc.song_id = s.song_id
WHERE sc.collection_id IS NULL

-- 8.исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT m.name
FROM songs s
LEFT JOIN albums a 
	ON s.album_id = a.album_id 
LEFT JOIN musician_album ma 
	ON a.album_id = ma.album_id 
LEFT JOIN musicians m 
	ON ma.musician_id = m.musician_id
WHERE s.duration = (SELECT min(s2.duration)
					FROM songs s2)
			
					
-- 9.название альбомов, содержащих наименьшее количество треков.
SELECT a."name", count(s.song_id) AS count
FROM albums a 
LEFT JOIN songs s 
	ON s.album_id = a.album_id 
GROUP BY a."name" 
HAVING count(s.song_id)= (SELECT count(s2.song_id) AS count
						FROM songs s2
						GROUP BY s2.album_id
						ORDER BY count
						LIMIT 1);

