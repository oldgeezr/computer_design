f = open('text', 'r')
g = open('lol', 'w')	
for i in f:

	f1 = i[0:2]
	f2 = i[2:4]
	f3 = i[4:6]
	f4 = i[6:8]

	g.write(f4 + f3 + f2 + f1)
	print i + ": " + f4 + f3 + f2 + f1
