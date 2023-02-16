-- Create Genre table
CREATE TABLE genres (
	id  INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100),
	PRIMARY KEY(id)
);

-- Create Item table
CREATE TABLE item (
	id  INT GENERATED ALWAYS AS IDENTITY,
	genre_id INT,
	author_id INT,
	label_id INT,
	publish_date DATE,
	archived BOOLEAN,
	PRIMARY KEY(id),
	FOREIGN KEY (genre_id) REFERENCES genres (id),
	FOREIGN KEY (author_id) REFERENCES author (id),
	FOREIGN KEY (label_id) REFERENCES label (id)

);

-- Create MusicAlbum table
CREATE TABLE music_albums (
	id  INT,
	on_spotify BOOLEAN,
	FOREIGN KEY(id) REFERENCES item(id)
);