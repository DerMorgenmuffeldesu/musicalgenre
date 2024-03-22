CREATE TABLE IF NOT EXISTS musical_genre (
	id SERIAL PRIMARY KEY, 
	name VARCHAR(60) NOT NULL,
	name INTEGER UNIQUE
);

CREATE TABLE IF NOT EXISTS genre_artist (
	PRIMARY KEY(genre_id, artist_id),
	genre_id INTEGER NOT NULL REFERENCES artist_list(id),
	artist_id INTEGER NOT NULL REFERENCES musical_genre(id)
);

CREATE TABLE IF NOT EXISTS artist_list (
	id SERIAL PRIMARY KEY, 
	name_artist VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS artists_albums (
	PRIMARY key(albums_id, artist_id), 
	albums_id INTEGER NOT NULL REFERENCES albums(id),
	artist_id INTEGER NOT NULL REFERENCES artist_list(id)
);

CREATE TABLE IF NOT EXISTS albums (
	id SERIAL PRIMARY KEY, 
	name_album VARCHAR(60) NOT NULL,
	release DATE
);

CREATE TABLE IF NOT EXISTS tracks_list (
	id SERIAL PRIMARY KEY, 
	track_name VARCHAR(60) NOT NULL,
	lasting TIME(600),
	album_id INTEGER REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS tracks_collected (
	PRIMARY key(track_id, collected_id),
	track_id INTEGER NOT NULL REFERENCES tracks_list(id),
	collected_id INTEGER NOT NULL REFERENCES collected(id)
);

CREATE TABLE IF NOT EXISTS collected (
	id SERIAL PRIMARY KEY, 
	collected_name VARCHAR(60) NOT NULL,
	release DATE
);