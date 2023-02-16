-- Create Game table 
CREATE TABLE Game {
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL
  item_id INTEGER,
  PRIMARY KEY(id),
  CONSTRAINT fk_item FOREIGN KEY(item_id) references Item(id) ON DELETE CASCADE
};

-- Create Author table 
CREATE TABLE Author {
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  PRIMARY KEY(id)
};
