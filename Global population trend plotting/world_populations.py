import matplotlib.pyplot as plt
import pandas as pd

# import world population data
world_data = pd.DataFrame(pd.read_csv('WPP2019_TotalPopulationBySex.csv'))

# create DateFrame containing columns for year, city, record type, and population
filtered_world_data = world_data.iloc[:, [1, 3, 4, 6, 7, 8, 9]]

# create series for variant column
variant = world_data.iloc[:, 3]

# create Boolean series dictionary of variants to subset DataFrame
variant_dict = {'medium': [variant == 'Medium', 'Medium'],
                'high': [variant == 'High', 'High'],
                'low': [variant == 'Low', 'Low'],
                'constant fertility': [variant == 'Constant fertility', 'Constant fertility'],
                'instant replacement': [variant == 'Instant replacement', 'Instant replacement'],
                'zero migration': [variant == 'Zero migration', 'Zero migration'],
                'constant mortality': [variant == 'Constant mortality', 'Constant mortality'],
                'no change': [variant == 'No change', 'No change'],
                'momentum': [variant == 'Momentum', 'Momentum'],
                'median pi': [variant == 'Median PI', 'Median PI'],
                'upper 80 pi': [variant == 'Upper 80 PI', 'Upper 80 PI'],
                'lower 80 pi': [variant == 'Lower 80 PI', 'Lower 80 PI'],
                'upper 95 pi': [variant == 'Upper 95 PI', 'Upper 95 PI'],
                'lower 95 pi': [variant == 'Lower 95 PI', 'Lower 95 PI'],
                }

# create series for country column
country = world_data.iloc[:, 1]

# create series for time column
time = world_data.iloc[:, 4]

# create Boolean series dictionary of countries to subset DataFrame & label plots
location_dict = {}
for label, row in country.drop_duplicates().iteritems():
    location_dict.update({row.lower(): [country == row, row]})

# create dictionary of plotting metrics for input string mapping
metric_dict = {'total population': ['PopTotal', 'Total Population', '(millions)'],
               'female population': ['PopFemale', 'Female Population', '(millions)'],
               'male population': ['PopMale', 'Male Population', '(millions)'],
               'population density': ['PopDensity', 'Population Density', '(ppl/sq km)']
               }

# input plotting data
cmd = ''
while cmd not in ['no', 'quit', 'end', 'cancel']:
    for key, value in metric_dict.items():
        print(value[1])
    print('\n')
    sel_metric = input('Choose a metric: ').lower()
    print('\n')
    while sel_metric not in metric_dict.keys():
        print("That's not a valid metric... try again.")
        for key, value in metric_dict.items():
            print(value[1])
        print('\n')
        sel_metric = input('Choose a metric: ').lower()
        print('\n')
    for key, value in location_dict.items():
        print(value[1])
    print('\n')
    sel_location = input('Choose a location: ').lower()
    print('\n')
    while sel_location not in location_dict.keys():
        print("That's not a valid location... try again.")
        for key, value in location_dict.items():
            print(value[1])
        print('\n')
        sel_location = input('Choose a location: ').lower()
        print('\n')
    for key, value in variant_dict.items():
        print(value[1])
    print('\n')
    sel_variant = input('Choose a model variant: ').lower()
    print('\n')
    while sel_variant not in variant_dict.keys():
        print("That's not a valid model variant... try again.")
        for key, value in variant_dict.items():
            print(value[1])
        print('\n')
        sel_variant = input('Choose a variant: ').lower()
        print('\n')

    # plot titles and axis labels from filtered
    plt.figure(figsize=(12, 6))
    plt.title("Projected " + str([metric_dict[sel_metric][1]]).strip("\'[").strip("]\'") + ' of ' + location_dict[sel_location][1] + ', 1950 - 2100\n' + '(' + variant_dict[sel_variant][1] + ' model variant)', fontsize=15)
    plt.xlabel('Year', fontsize=12, labelpad=12)
    plt.ylabel(str([metric_dict[sel_metric][1]]).strip("\'[").strip("]\'") + ' ' + str([metric_dict[sel_metric][2]]).strip("\'[").strip("]\'"), fontsize=12, labelpad=12)
    plt.grid(b=True, which='both', linestyle='--', color='gray')

    # scaling for population density y-axis
    scale_factor = 1000
    if sel_metric == 'population density':
        scale_factor = 1

    # time and selected metric up to 2019
    x_up_to_2020 = filtered_world_data[variant_dict['medium'][0]][location_dict[sel_location][0]][time < 2020]['Time']
    y_up_to_2020 = filtered_world_data[variant_dict['medium'][0]][location_dict[sel_location][0]][time < 2020][metric_dict[sel_metric][0]] / scale_factor

    # time, selected metric, and selected model variant 2020 and beyond
    x_after_2020 = filtered_world_data[variant_dict[sel_variant][0]][location_dict[sel_location][0]][time >= 2020]['Time']
    y_after_2020 = filtered_world_data[variant_dict[sel_variant][0]][location_dict[sel_location][0]][time >= 2020][metric_dict[sel_metric][0]] / scale_factor

    # plot data up to 2019 as solid blue, past 2020 as dashed blue
    plt.plot(x_up_to_2020.iloc[::-1], y_up_to_2020.iloc[::-1], 'b-')
    plt.plot(x_after_2020.iloc[::-1], y_after_2020.iloc[::-1], 'b--')
    plt.show()
    cmd = input('Plot more data? ')
    print('\n')
