import psycopg2
import matplotlib.pyplot as plt

username = 'omivan'
password = '0104'
database = 'lab4_games'
host = 'localhost'
port = '5432'

query_3 = '''
SELECT company.name, COALESCE(SUM(game.users_number), 0) AS total_users
FROM company
LEFT JOIN publish ON company.company_id = publish.company_id
LEFT JOIN game ON publish.game_id = game.game_id
GROUP BY company.company_id
ORDER BY total_users DESC 
LIMIT 4;
'''
query_2 = '''
SELECT genre.name AS genre_name, COUNT(game_genre.genre_id) AS usage_count
FROM genre
LEFT JOIN game_genre ON genre.genre_id = game_genre.genre_id
GROUP BY genre.name
ORDER BY genre.name;
'''
query_1 = '''
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
LIMIT 5;
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

with conn:
    cur = conn.cursor()

    cur.execute(query_1)

    print('Кількість разів компанія була згадана як publisher або developer')
    for row in cur:
        print(f'Компанія: {row[0]}, Кількість разів: {row[1]}')

    cur.execute(query_2)

    print('\nЧастка кожного жанру в іграх')
    for row in cur:
        print(f'Жанр: {row[0]}, Кількість ігор: {row[1]}')

    cur.execute(query_3)

    print('\nТоп 4 компанії за кількістю користувачів')
    for row in cur:
        print(f'Компанія: {row[0]}, кількість користувачів: {row[1]}')