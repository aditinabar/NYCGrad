import pandas as pd
from pandas import DataFrame
#Read CSV, make 'School Name' first column
df = pd.read_csv('Graduation_Outcomes_by_SchoolLevel_Gender_2005-2011.csv', index_col = 'School Name')

#Select only schools with a cohort of at least 5
df2 = df[df['Total Cohort Num'] > 5]

#Subset df2 to include only the first 7 vectors
df3 = df2[range(1,8)]

print df3.head()

#df3.to_csv('Grad_by_SchoolGender.csv')