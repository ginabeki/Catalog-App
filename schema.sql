
-- Create Author table 
CREATE TABLE Author {
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  PRIMARY KEY(id)
};

-- Create Label table
CREATE TABLE label (
	id  INT GENERATED ALWAYS AS IDENTITY,
	title VARCHAR(50),
    color VARCHAR(50),
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

-- Create Game table 
CREATE TABLE Game {
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL,
  item_id INTEGER,
  PRIMARY KEY(id),
  CONSTRAINT fk_item FOREIGN KEY(item_id) references item(id) ON DELETE CASCADE
};

-- Create Book table
CREATE TABLE book (
	id INT,
  publisher VARCHAR(100),
	cover_state VARCHAR(50),
	FOREIGN KEY(id) REFERENCES item(id)
);

