CREATE TABLE game
(
  game_id INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  release_date DATE NOT NULL,
  users_number INT NOT NULL,
  PRIMARY KEY (game_id)
);

CREATE TABLE company
(
  company_id INT NOT NULL,
  location VARCHAR(50) NOT NULL,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (company_id)
);

CREATE TABLE genre
(
  genre_id INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (genre_id)
);

CREATE TABLE publish
(
  game_id INT NOT NULL,
  company_id INT NOT NULL,
  PRIMARY KEY (game_id, company_id),
  FOREIGN KEY (game_id) REFERENCES game(game_id),
  FOREIGN KEY (company_id) REFERENCES company(company_id)
);

CREATE TABLE develop
(
  game_id INT NOT NULL,
  company_id INT NOT NULL,
  PRIMARY KEY (game_id, company_id),
  FOREIGN KEY (game_id) REFERENCES game(game_id),
  FOREIGN KEY (company_id) REFERENCES company(company_id)
);

CREATE TABLE game_genre
(
  genre_id INT NOT NULL,
  game_id INT NOT NULL,
  PRIMARY KEY (genre_id, game_id),
  FOREIGN KEY (genre_id) REFERENCES genre(genre_id),
  FOREIGN KEY (game_id) REFERENCES game(game_id)
);