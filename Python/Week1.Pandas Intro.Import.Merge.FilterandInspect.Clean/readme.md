# Data Frames. 

## The how-to repository for all your basic data frame requirements. 
- Planning, mapping and sourcing your data. 
- Import csv files and call in sql tables. 
- Merge multiple files. 
- Filter and inspect the data for duplicates and other cleaning tasks. 
- How to visualise the data (EDA) and wrangle it. 

## Planning, mapping and sourcing your data. 
Draw a table of how you plan to use your data. You need to think through how you are going to get to your goal before you start. 
Here is a good example: 

https://github.com/simples707data/IronHack/blob/main/Python/Week1.Pandas%20Intro.Import.Merge.FilterandInspect.Clean/good_example_data_planning.png

## How to import a csv file:

import pandas as pd

import csv file
df = pd.read_csv('iris_dirty.csv')
df.head() 

import csv file and define column names
df = pd.read_csv('iris_dirty.csv', names = ['sepal_length', 'sepal_width', 'petal_length', 'petal_width', 'class'])
df.head() 


