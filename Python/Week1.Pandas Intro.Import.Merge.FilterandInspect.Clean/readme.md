# Data Frames. 

## The how-to repository for all your basic data frame requirements. 
- Planning, mapping and sourcing your data. 
- Import csv files and call in sql tables. 
- Merge multiple tables. 
- Filter and inspect the data for duplicates and other cleaning tasks. 
- How to visualise the data (EDA) and wrangle it. 

## Planning, mapping and sourcing your data. 
Draw a table of how you plan to use your data. You need to think through how you are going to get to your goal before you start. 
Here is a good example: 

<img src="https://github.com/simples707data/IronHack/blob/main/Python/Week1.Pandas%20Intro.Import.Merge.FilterandInspect.Clean/good_example_data_planning.png"
     width = 400px; />

## How to import a csv file:

import pandas as pd

import csv file
df = pd.read_csv('iris_dirty.csv')
df.head() 

import csv file and define column names
df = pd.read_csv('iris_dirty.csv', names = ['sepal_length', 'sepal_width', 'petal_length', 'petal_width', 'class'])
df.head() 

## How to call in an sql file:
[See this jupyter notebook.](https://github.com/simples707data/IronHack/blob/main/Python/Week1.Pandas%20Intro.Import.Merge.FilterandInspect.Clean/Connecting%20with%20a%20table%20in%20sql.ipynb)

## How to merge multiple files/tables. And changing column names
[Merging files notebook](https://github.com/simples707data/IronHack/blob/main/Python/Week1.Pandas%20Intro.Import.Merge.FilterandInspect.Clean/Merging%20files.tables%20and%20changing%20column%20names.ipynb)

## Filter and inspect the data for duplicates and other cleaning tasks
[Filtering for different views](https://github.com/simples707data/IronHack/blob/main/Python/Week1.Pandas%20Intro.Import.Merge.FilterandInspect.Clean/Filtering.ipynb)
Cleaning for duplicates. 
