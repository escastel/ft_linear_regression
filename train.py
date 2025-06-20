import pandas as pd
import sys
import os
import json
import csv

def	read_csv(fd):
	if not fd.lower().endswith('.csv'):
		print(f"Error: File '{fd}' is not a .csv.")
		exit(1)
	try:
		data = pd.read_csv(fd)
	except FileNotFoundError:
		print(f"File {fd} not found.")
		exit(1)

	x = data[data.columns[0]].values
	y = data[data.columns[1]].values
	print(x, y)

if __name__ == "__main__":
	if len(sys.argv) != 2 :
		print("Use: python3 train.py file.csv")
		exit(1)
	read_csv(sys.argv[1])
