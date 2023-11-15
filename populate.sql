-- Insert data into 'company' table
INSERT INTO company (company_id, location, name) VALUES
(1, 'United States', 'Valve'),
(2, 'South Korea', 'IndigoBlue Game Studio'),
(3, 'South Korea', 'PsychoFlux Entertainment'),
(4, 'United Kingdom', 'NEXT Studios'),
(5, 'United Kingdom', 'Team17'),
(6, 'United States', 'Vertigo Gaming Inc'),
(7, 'South Korea', 'DoubleC Games'),
(8, 'China', '2P Games'),
(9, 'United States', 'IndieLeague Studio'),
(10, 'United States', 'Simon Codrington'),
(11, 'United States', 'Villain Role'),
(12, 'Germany', 'Kubold'),
(13, 'United States', 'LFiO Studio'),
(14, 'Netherlands', 'Fireroot Studios'),
(15, 'United States', 'Rockstar Games'),
(16, 'Poland', 'CD Projekt');

-- Insert data into 'genre' table
INSERT INTO genre (genre_id, name) VALUES
(1001, 'Action'),
(1002, 'Adventure'),
(1003, 'RPG'),
(1004, 'Indie'),
(1005, 'Strategy'),
(1006, 'Simulation');

-- Insert data into 'game' table
INSERT INTO game (game_id, name, release_date, users_number) VALUES
(101, 'Counter-Strike', '2000-01-01', 10000000),
(102, 'ASCENXION', '2021-02-15', 20000),
(103, 'Crown Trick', '2020-03-20', 200000),
(104, 'Cook, Serve, Delicious! 3?!', '2020-03-20', 100000),
(105, 'Zengeon', '2019-03-20', 100000),
(106, 'Cube Defender', '2022-03-20', 20000),
(107, 'Tower of Origin2-Worms Nest', '2022-03-20', 20000),
(108, 'Hellish Quart', '2021-03-20', 200000),
(109, 'SurReal Subway', '2022-03-20', 20000),
(110, 'Rogue Reaper', '2022-03-20', 200000),
(111, 'Grand Theft Auto V', '2013-08-01', 20000000),
(112, 'Cyberpunk 2077', '2023-01-06', 15000000);


-- Insert data into 'game_genre' table
INSERT INTO game_genre (genre_id, game_id) VALUES
(1001, 101),
(1001, 102),
(1002, 102),
(1004, 102),
(1002, 103),
(1003, 103),
(1004, 103),
(1005, 103),
(1001, 104),
(1004, 104),
(1005, 104),
(1006, 104),
(1002, 105),
(1003, 105),
(1004, 106),
(1003, 107),
(1004, 107),
(1001, 108),
(1004, 109),
(1001, 110),
(1002, 110),
(1004, 110),
(1001, 111),
(1002, 111),
(1001, 112);






-- Insert data into 'Develop' table
INSERT INTO Develop (game_id, company_id) VALUES
(101, 1),
(102, 2),
(103, 4),
(104, 6),
(105, 9),
(106, 10),
(107, 11),
(108, 12),
(109, 13),
(110, 14),
(111, 15),
(112, 16);

-- Insert data into 'Publish' table
INSERT INTO Publish (game_id, company_id) VALUES
(101, 1),
(102, 3),
(103, 4),
(103, 5),
(104, 6),
(105, 8),
(106, 10),
(107, 11),
(108, 12),
(109, 13),
(110, 14),
(111, 15),
(112, 16);


