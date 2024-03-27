INSERT INTO musical_genre (id, name)
VALUES
(1, 'Pank-rock'),
(2, 'Industrial-metal'),
(3, 'Alternative rock'),
(4, 'Indie rock');

INSERT INTO artist_list (id, name_artist)
VALUES
(1, 'Горшок'),
(2, 'Till Lindemann'),
(3, 'Lauri Ylönen'),
(4, 'Алексей Горшенёв'),
(5, 'Станислав Шклярский');

INSERT INTO genre_artist (genre_id, artist_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 4);

INSERT INTO albums (id, name_album, release)
VALUES
(1, 'Ели мясо мужики', '01.12.1999'),
(2, 'Zeit', '29.04.2022'),
(3, 'Dead Letters', '21.03.2003'),
(4, 'Артист', '20.07.2016'),
(5, 'ОВЗЛ', '20.11.2020');

INSERT INTO artists_albums (albums_id, artist_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO tracks_list (id, track_name, lasting, album_id)
VALUES
(1, 'Ели мясо мужики', '00:02:14', 1),
(2, 'Zeit', '00:05:21', 2),
(3, 'Angst', '00:03:44', 2),
(4, 'First day of my life', '00:03:45', 3),
(5, 'Time to Burn', '00:04:32', 3),
(6, 'ОВЗЛ', '00:03:21', 5),
(7, 'Тени на теле', '00:03:27', 5),
(8, 'Ртуть', '00:03:28', 5),
(9, 'Надежда', '00:04:00', 4),
(10, 'Обнимай', '00:04:15', 4);

INSERT INTO collected (id, collected_name, release)
VALUES
(1, 'Страшные сказки', '20.08.2007'),
(2, 'Последняя песня', '20.04.2018'),
(3, 'The Best', '03.07.2004'),
(4, 'Лучшие песни', '11.02.2009');

INSERT INTO tracks_collected (track_id, collected_id)
VALUES
(1, 1),
(1, 4);