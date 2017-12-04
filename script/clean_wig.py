import sys
from collections import defaultdict

pos = defaultdict(int)

with open(sys.argv[1]) as file:
	for line in file:
		lst = line.strip().split('\t')
		if lst[0] != 'variableStep':
			pos[lst[0]] += 1

output = open(sys.argv[1]+'.clean.wig', 'w')
with open(sys.argv[1]) as file:
	for line in file:
		lst = line.strip().split('\t')
		if lst[0] == 'variableStep' or pos[lst[0]] == 1:
			output.write(line)

