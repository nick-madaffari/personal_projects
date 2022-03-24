import requests
import json
import mysql.connector
from datetime import datetime

# connecting to the database
connection = mysql.connector.connect(
    host='localhost',
    database='iqair_api',
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

# list of countries, states, and cities to grab data for
locations = [
    ('Mexico', 'Jalisco', 'Guadalajara'),
    ('Mexico', 'Mexico City', 'Mexico City'),
    ('Mexico', 'Guanajuato', 'Leon'),
    ('USA', 'Florida', 'Miami'),
    ('USA', 'Florida', 'Jacksonville'),
    ('USA', 'Florida', 'Tampa')
]

# filling tables from API
api_key = 'your-api-key-goes-here'

for location in locations:
    country = location[0]
    state = location[1]
    city = location[2]

    response_api = requests.get(
        f'http://api.airvisual.com/v2/city?city={city}&state={state}&country={country}&key={api_key}')
    data = response_api.text
    parse_json = json.loads(data)

    # grab datetime
    dt = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    # grab weather data
    weather = parse_json['data']['current']['weather']
    temperature = weather['tp']
    pressure = weather['pr']
    humidity = weather['hu']
    wind_speed = weather['ws']
    wind_direction = weather['wd']
    weather_data = [dt, country, state, city, temperature, pressure, humidity, wind_speed, wind_direction]

    # grab pollution data
    pollution = parse_json['data']['current']['pollution']
    aqi_us = pollution['aqius']
    aqi_cn = pollution['aqicn']
    pollution_data = [dt, country, state, city, aqi_us, aqi_cn]

    # insert data into MySQL tables using stored procedures
    cursor.callproc('insert_pollution_data', pollution_data)
    cursor.callproc('insert_weather_data', weather_data)
    connection.commit()

connection.close()