CREATE TABLE genres (
	id  INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100),
	PRIMARY KEY(id)
);

CREATE TABLE music_albums (
	id  INT,
	on_spotify BOOLEAN,
	FOREIGN KEY(id) REFERENCES item(id)
);