SELECT track_name, lasting
FROM tracks_list
WHERE lasting = (SELECT MAX(lasting) FROM tracks_list);

SELECT track_name
FROM tracks_list
WHERE lasting >= '00:03:30'
 
SELECT collected_name
FROM collected
WHERE EXTRACT(year FROM release) BETWEEN 2018 AND 2020;

SELECT name_artist
FROM artist_list
WHERE name_artist NOT LIKE '% %';

SELECT track_name
FROM tracks_list
WHERE (track_name ILIKE 'my%')  
OR (track_name ILIKE '% my%')  
OR (track_name ILIKE '% my')   
OR (track_name = 'my');        

-- 3 задание
SELECT artist_id, COUNT(DISTINCT genre_id) AS num_artists
FROM genre_artist
GROUP BY artist_id;

SELECT COUNT(*) AS num_tracks
FROM tracks_list
WHERE album_id IN (
  SELECT id
  FROM albums
  WHERE EXTRACT(YEAR FROM release) BETWEEN (2019) AND (2020)
);

SELECT album_id, AVG(lasting) AS avg_duration
FROM tracks_list
GROUP BY album_id;

-- или:
SELECT a.name_album, 
       AVG(EXTRACT(EPOCH FROM t.lasting)) AS avg_duration
FROM albums a
JOIN tracks_list t ON a.id = t.album_id
GROUP BY a.name_album;

SELECT name_artist
FROM artist_list
WHERE id NOT IN (
  SELECT artist_id
  FROM artists_albums aa
  JOIN albums al ON aa.albums_id = al.id
  WHERE EXTRACT(YEAR FROM al.release) = 2020
);

-- or(?):
SELECT name_artist
FROM artist_list
WHERE id NOT IN (
    SELECT artist_id
    FROM artist_list 
    JOIN artists_albums aa ON name_artist = name_artist
    JOIN albums al ON aa.albums_id = al.id
    WHERE EXTRACT(YEAR FROM release) = 2020
);

SELECT DISTINCT collected_name
FROM collected c
JOIN tracks_collected tic ON c.id = tic.collected_id
JOIN tracks_list t ON tic.track_id = t.id
JOIN albums a ON t.album_id = a.id
JOIN artists_albums aa ON a.id = aa.albums_id
JOIN artist_list al ON aa.artist_id = al.id
WHERE al.name_artist = 'Горшок';