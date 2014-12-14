import pandas as pd
from pandas import DataFrame

df = pd.read_csv('Graduation_Outcomes_by_SchoolLevel_Gender_2005-2011.csv', index_col = 'School Name')
df2 = df[df['Total Cohort Num'] > 5]
df3 = df2[range(1,8)]

print df3

df3.to_csv('Grad_by_SchoolGender.csv')