import pandas as pd
import matplotlib.pyplot as plt
import geopandas as gpd

# pull data from .csv
data = pd.read_csv('global-solar-stations-inventory231217-2.csv', encoding='latin1')


# pull GeoPandas mapping data
world = gpd.read_file(gpd.datasets.get_path('naturalearth_lowres'))


# get x-y location data from .csv & make GeoPandas DataFrame
solar_gdf = gpd.GeoDataFrame(data, geometry=gpd.points_from_xy(data.Longitude, data.Latitude))
solar_gdf.set_crs(epsg=4326, inplace=True)

solar_gdf = solar_gdf.to_crs(world.crs)


# make a series of unique countries & reset index
solar_gdf_unique_countries = solar_gdf.Country.drop_duplicates().reset_index(drop=True)


# filter mapping data for Asia & Africa only
ax = world[world.continent.isin(['Asia', 'Africa'])].plot(color='white', edgecolor='black', figsize=(13, 7))


# define point colors
colors = ['mediumvioletred', 'red', 'orange', 'gold', 'saddlebrown', 'lime', 'aqua', 'royalblue', 'blueviolet']


# plot points by country
for index, country in solar_gdf_unique_countries.items():
    solar_gdf[solar_gdf['Country'] == country].plot(ax=ax, marker='o', color=colors[index], markersize=6)

# legend, axes labels, & figure title
plt.legend(solar_gdf_unique_countries, framealpha=1)
plt.xlabel('Latitude', fontsize=12)
plt.ylabel('Longitude', fontsize=12)
plt.title('World Bank Global Solar Station Inventory', fontsize=17)

plt.show()
