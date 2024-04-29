import pandas as pd
import matplotlib.pyplot as plt
from scipy.interpolate import interp1d

df = pd.read_csv('./sample_data.csv')
df.drop('Unnamed: 0', axis=1, inplace=True)
df.drop(0, inplace=True)
time_since_diagnosis = [i for i in range(11)]

fig, ax = plt.subplots()

for i in list(df.columns):
    f = interp1d(time_since_diagnosis, df[i], kind='cubic')
    y_smooth = f(time_since_diagnosis)
    ax.plot(time_since_diagnosis, y_smooth)

ax.set(xlabel='Time Since Diagnosis (Years)', ylabel='Survival Rate (%)',
    title='Survival Rates for Different Ages for Stomach Cancer')

ax.grid()
ax.invert_yaxis()
ax.set_ylim(0, 100)
plt.show()
