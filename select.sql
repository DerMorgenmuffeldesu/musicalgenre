SELECT track_name, lasting
FROM tracks_list
WHERE lasting = (SELECT MAX(lasting) FROM tracks_list);

SELECT track_name
FROM tracks_list
WHERE lasting >= '00:03:50';
 
SELECT collected_name
FROM collected
WHERE EXTRACT(year FROM release) BETWEEN 2018 AND 2020;

SELECT name_artist
FROM artist_list
WHERE name_artist NOT LIKE '% %';

SELECT track_name
FROM tracks_list
WHERE (track_name LIKE '%мой%') OR (track_name LIKE '%my%');

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

SELECT a.name_artist, al.name_album, al.release
FROM artist_list a
JOIN artists_albums aa ON a.id = aa.artist_id
JOIN albums al ON aa.albums_id = al.id
WHERE EXTRACT(YEAR FROM release) = 2020;

SELECT collected_name
FROM collected
WHERE release IN (
    SELECT release
    FROM collected
    JOIN artist_list ON collected.id = artist_list.id
    WHERE name_artist = 'Lauri Ylönen'
);