import matplotlib.pyplot as plt
import pandas as pd

df = pd.read_csv('./data.csv')

print(df['Age'])
print(df['5-Year Relative Survival (%)'])

fig, ax = plt.subplots()

fruits = ['apple', 'blueberry', 'cherry', 'orange']
five_yr_survival_rates = list(df['5-Year Relative Survival (%)'])
bar_labels = list(df['Age'])

ax.bar(bar_labels, five_yr_survival_rates, label=bar_labels)

ax.set_ylabel('5 year survival rate')
ax.set_title('5 Year Survival Rate for HER2+ Breast Cancer')
ax.legend(title='Age Ranges')

plt.show()