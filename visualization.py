import psycopg2
import matplotlib.pyplot as plt

username = 'omivan'
password = '0104'
database = 'lab4_games'
host = 'localhost'
port = '5432'


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
ORDER BY
  COUNT(DISTINCT p.game_id) + COUNT(DISTINCT d.game_id) DESC
LIMIT 5;
'''
query_2 = '''
SELECT genre.name AS genre_name, COUNT(game_genre.genre_id) AS usage_count
FROM genre
LEFT JOIN game_genre ON genre.genre_id = game_genre.genre_id
GROUP BY genre.name
ORDER BY COUNT(game_genre.genre_id) DESC
LIMIT 5;
'''
query_3 = '''
SELECT company.name, COALESCE(SUM(game.users_number), 0) AS total_users
FROM company
LEFT JOIN publish ON company.company_id = publish.company_id
LEFT JOIN game ON publish.game_id = game.game_id
GROUP BY company.company_id
ORDER BY COALESCE(SUM(game.users_number), 0) DESC 
LIMIT 5;
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

with conn:
    cur = conn.cursor()

    cur.execute(query_1)
    companies = []
    total = []

    for row in cur:
        companies.append(row[0])
        total.append(row[1])

    x_range = range(len(companies))

    figure, (bar_ax, pie_ax, graph_ax) = plt.subplots(1, 3)
    bar = bar_ax.bar(x_range, total)
    bar_ax.bar_label(bar, label_type='center')  # потрібен новий matplotlib
    bar_ax.set_xticks(x_range)
    bar_ax.set_xticklabels(companies, rotation=45, ha='right')
    bar_ax.set_xlabel('Компанії')
    bar_ax.set_ylabel('Кількість разів')
    bar_ax.set_title('Кількість разів компанія була згадана як publisher або developer(топ 5 DESC)')
    cur.execute(query_2)
    genres = []
    total = []

    for row in cur:
        genres.append(row[0])
        total.append(row[1])

    x_range = range(len(genres))
    pie_ax.pie(total, labels=genres, autopct='%1.1f%%')
    pie_ax.set_title('Частка кожного жанру в іграх(топ 5 DESC)')

    cur.execute(query_3)
    companies = []
    users_num = []

    for row in cur:
        companies.append(row[0])
        users_num.append(row[1])

    mark_color = 'blue'
    graph_ax.plot(companies, users_num, color=mark_color, marker='o')

    for qnt, price in zip(companies, users_num):
        graph_ax.annotate(price, xy=(qnt, price), color=mark_color,
                          xytext=(7, 2), textcoords='offset points')

    graph_ax.set_xlabel('Назва компанії')
    graph_ax.set_ylabel('Кількість користувачів')
    graph_ax.set_xticklabels(companies, rotation=45, ha="right")
    graph_ax.plot(companies, users_num, color='blue', marker='o')
    graph_ax.set_title('Топ 5 компанії за кількістю користувачів')

mng = plt.get_current_fig_manager()
mng.full_screen_toggle()
# mng.resize(1400, 600)

plt.show()
