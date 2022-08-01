import matplotlib as mpl
import pandas as pd
import numpy as np
from matplotlib import pyplot as plt


def print_bar_chart(stats, figure_save_path = 'saved_figure', parameter_to_plot='r', width = 0.34, fontsize = 8, figsize = (10,3)):

	fig = plt.figure(figsize=figsize)
	ax = plt.gca()

	stats = pd.read_csv(stats)
	imgs = stats['img']
	y1 = stats['r'][0:17]
	y2 = stats['r'][17:]

	x1 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]

	plt.bar([i-width/2 for i in x1], y2, width=width, label="Mitochondria",color="gray",edgecolor='black')
	plt.bar([i+width/2 for i in x1], y1, width=width, label="DNA",color="0.85",edgecolor='black')

	plt.legend(loc=1,borderaxespad=0,frameon=False, fontsize=fontsize, edgecolor= None)

	ax.set_ylabel(parameter_to_plot,rotation=0,labelpad=8)
	ax.set_xlabel('Testing sets',labelpad=8)
	ax.set_yticks([0.0,0.2,0.4,0.6,0.8,1.0])
	ax.set_xticks(np.arange(len(x1))+1)
	ax.set_xticklabels(np.array(x1))
	ax.set_title('(b)')
	#ax.set_xlim(-.5, len(x1))

	plt.savefig(figure_save_path, bbox_inches='tight', dpi=300)
	plt.close()  


if __name__ == '__main__':
	print_bar_chart('stats.csv')