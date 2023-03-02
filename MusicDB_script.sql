create table if not exists musicians(
	musician_id INTEGER PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

create table if not exists albums(
	album_id INTEGER PRIMARY KEY,
	name VARCHAR(40) NOT null,
	year INTEGER not null
);

create table if not exists MusicianAlbum(
	id INTEGER PRIMARY KEY,
	album_id INTEGER references albums(album_id),
	musician_id INTEGER references musicians(musician_id)
);

create table if not exists Songs(
	song_id INTEGER PRIMARY KEY,
	name VARCHAR(40) NOT null,
	album_id INTEGER references albums(album_id),
	duration TIME
);

create table if not exists Songs(
	song_id INTEGER PRIMARY KEY,
	name VARCHAR(40) NOT null,
	album_id INTEGER references albums(album_id),
	duration TIME
);

create table if not exists Collections(
	collection_id INTEGER PRIMARY KEY,
	name VARCHAR(40) NOT null,
	year INTEGER not null
);

create table if not exists SongsCollections(
	id INTEGER PRIMARY KEY,
	song_id INTEGER references Songs(song_id),
	collection_id INTEGER references Collections(collection_id)
);

create table if not exists Genres(
	genre_id INTEGER PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

create table if not exists MusicianGenre(
	id INTEGER PRIMARY KEY,
	genre_id INTEGER references Genres(genre_id),
	musician_id INTEGER references musicians(musician_id)
);