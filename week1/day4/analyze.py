import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('./clinvar_result.tsv', sep='\t')

for a in ['Germline classification', 'Variant type', 'Molecular consequence']:
    germ_line_classification = list(df[a])
    germ_line_classification_headings = list(set(germ_line_classification))
    germ_line_classification_counts = {}

    fig, ax = plt.subplots()

    for i in germ_line_classification_headings:
        if a == 'Molecular consequence':
            if germ_line_classification.count(i) < 200:
                continue
            else:
                germ_line_classification_counts.update({
                    i: (germ_line_classification.count(i)/len(germ_line_classification)*100)
                })
        else:
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

    explode = [0.1 for i in range(len(germ_line_classification_counts))]

    ax.pie(counts, labels=labels, explode=explode)
    ax.set(title=f'Distribution of {a}s for genes linked to stomach cancer')
    plt.show()