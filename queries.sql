-- how many times company was mentioned as publisher or developer
SELECT
  c.name AS company_name,
  COUNT(DISTINCT p.game_id) + COUNT(DISTINCT d.game_id) AS total_count
FROM
  company c
LEFT JOIN
  publish p ON c.company_id = p.company_id
LEFT JOIN
  develop d ON c.company_id = d.company_id
GROUP BY
  c.company_id, c.name
ORDER BY
  COUNT(DISTINCT p.game_id) + COUNT(DISTINCT d.game_id) DESC
LIMIT 5;

-- how many times each genre was mentioned
SELECT genre.name AS genre_name, COUNT(game_genre.genre_id) AS usage_count
FROM genre
LEFT JOIN game_genre ON genre.genre_id = game_genre.genre_id
GROUP BY genre.name
ORDER BY COUNT(game_genre.genre_id) DESC
LIMIT 5;

-- number of users
SELECT company.name, COALESCE(SUM(game.users_number), 0) AS total_users
FROM company
LEFT JOIN publish ON company.company_id = publish.company_id
LEFT JOIN game ON publish.game_id = game.game_id
GROUP BY company.company_id
ORDER BY COALESCE(SUM(game.users_number), 0) DESC
LIMIT 5;





