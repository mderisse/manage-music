CREATE TABLE songs (
	id INTEGER PRIMARY KEY,
	title TEXT,
	album_id INTEGER REFERENCES albums
);

CREATE TABLE albums (
	id INTEGER PRIMARY KEY,
	name TEXT,
	artist_id INTEGER REFERENCES artists
);

CREATE TABLE artists (
	id INTEGER PRIMARY KEY,
	name TEXT
);
