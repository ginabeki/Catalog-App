CREATE TABLE label (
	id  INT GENERATED ALWAYS AS IDENTITY,
	title VARCHAR(50),
    color VARCHAR(50)
	PRIMARY KEY(id)
);

CREATE TABLE book (
	id  INT,
    publisher VARCHAR(100),
	cover_state VARCHAR(50),
	FOREIGN KEY(id) REFERENCES item(id)
);