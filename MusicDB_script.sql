create table if not exists musicians(
	musician_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

create table if not exists albums(
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT null,
	year INTEGER not null
);

create table if not exists MusicianAlbum(
	album_id INTEGER references albums(album_id),
	musician_id INTEGER references musicians(musician_id)
);

create table if not exists Songs(
	song_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT null,
	album_id INTEGER references albums(album_id),
	duration TIME
);

create table if not exists Collections(
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT null,
	year INTEGER not null
);

create table if not exists SongsCollections(
	song_id INTEGER references Songs(song_id),
	collection_id INTEGER references Collections(collection_id)
);

create table if not exists Genres(
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

create table if not exists MusicianGenre(
	genre_id INTEGER references Genres(genre_id),
	musician_id INTEGER references musicians(musician_id)
);
