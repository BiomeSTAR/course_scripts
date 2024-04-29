import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('./clinvar_result.tsv', sep='\t')
germ_line_classification = list(df['Germline classification'])
germ_line_classification_headings = list(set(germ_line_classification))
germ_line_classification_counts = {}

fig, ax = plt.subplots()

for i in germ_line_classification_headings:
    if germ_line_classification.count(i) < 10:
        continue
    else:
        germ_line_classification_counts.update({
            i: (germ_line_classification.count(i)/len(germ_line_classification)*100)
        })

counts = []
labels = []
for i in germ_line_classification_counts.items():
    counts.append(i[1])
    labels.append(f'{i[0]}: {round(i[1], 2)}%')

explode = [0.07 for i in range(len(germ_line_classification_counts))]

ax.pie(counts, labels=labels, explode=explode)
ax.set(title='Distribution of germline classifications for genes linked to stomach cancer')
plt.show()