import mysql.connector
from bs4 import BeautifulSoup as soup
from urllib.request import urlopen as uReq
import unicodedata
from datetime import datetime

# connecting to the database
connection = mysql.connector.connect(
    host='localhost',
    database='numbeo_col',
    user='root',
    password='password'
)

# displaying database information
if connection.is_connected():
    db_Info = connection.get_server_info()
    print("Connected to MySQL Server version", db_Info)
    cursor = connection.cursor()
    cursor.execute("select database();")
    record = cursor.fetchone()
    print("You're connected to database:", record, '\n\n')

# creating a cursor object using the cursor() method
cursor = connection.cursor()

# get list of cities from database
cursor.execute('SELECT city_name FROM cities')

cities = []
for i in cursor.fetchall():
    cities.extend(i)

# capitalize all first letters & add hyphens
cities = [city.title().replace(' ', '-') for city in cities]

# fix Cairo string
cities[0] = 'Cairo-Egypt'

# loop through web pages for each city
for index, city in enumerate(cities):
    req_url = f'https://www.numbeo.com/cost-of-living/in/{city}?displayCurrency=USD'

    # opening connection, grabbing page
    uClient = uReq(req_url)
    page_html = uClient.read()
    uClient.close()

    # html parsing
    page_soup = soup(page_html, 'html.parser')

    # grabs table data rows as a list of html strings
    all_rows_html = page_soup.findAll('tr')

    # select rows for each category
    restaurant_cost_rows_html = all_rows_html[2:10]
    market_cost_rows_html = all_rows_html[11:30]
    transportation_cost_rows_html = all_rows_html[31:39]
    utilities_cost_rows_html = all_rows_html[40:43]
    leisure_cost_rows_html = all_rows_html[44:47]
    clothing_cost_rows_html = all_rows_html[51:55]
    rent_cost_rows_html = all_rows_html[56:60]

    # extract costs from each row in each category
    def get_costs(cost_rows_html):
        """This function extracts costs as floats from the html rows for each category"""

        costs = []
        for row in cost_rows_html:
            cost = row.find('td', {'class': 'priceValue'}).text
            cost = cost.replace(u'\xa0', unicodedata.normalize("NFKC", u'\xa0'))
            cost = cost.replace(',', '')
            cost = cost.strip(' $')
            cost = float(cost)
            costs.append(cost)

        return costs

    # get lists of costs for each category
    restaurant_data = get_costs(restaurant_cost_rows_html)
    market_data = get_costs(market_cost_rows_html)
    transportation_data = get_costs(transportation_cost_rows_html)
    utilities_data = get_costs(utilities_cost_rows_html)
    leisure_data = get_costs(leisure_cost_rows_html)
    clothing_data = get_costs(clothing_cost_rows_html)
    rent_data = get_costs(rent_cost_rows_html)

    # create a list of categories & their data sets to loop through
    category_data = [
        ('restaurant', restaurant_data),
        ('market', market_data),
        ('transportation', transportation_data),
        ('utilities', utilities_data),
        ('leisure', leisure_data),
        ('clothing', clothing_data),
        ('rent', rent_data)
    ]

    # get city_id for update data
    city_id = index + 1

    # perform update for each category using stored procedures
    for category in category_data:
        dt = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        update_data = [city_id, dt]

        cursor.callproc('insert_update_data', update_data)
        cursor.callproc(f'insert_{category[0]}_data', category[1])
    connection.commit()

# close the database connection
connection.close()