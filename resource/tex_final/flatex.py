#!/usr/bin/python

import re

reComment = re.compile(r"",re.M)
reInput = re.compile(r"(^%|[^\\]%).*$|\\(input|include|bibliography)\{([a-zA-Z0-9/._,]*)\}",re.M)

def flatten(filename):
	print "Flattening",filename
	infile = open(filename)
	content = infile.read()
	nextWrite=0
	for m in reInput.finditer(content):
		cmd = m.group(2)
		name = m.group(3)
		if m.group(1):
			if options.strip:
				out.write(content[nextWrite:m.start()]+m.group(1))
				nextWrite=m.end()
			continue
		print cmd,name
		out.write(content[nextWrite:m.start()])
		if (cmd == "input") or (cmd == "include"):
                        fname,fext = path.splitext(name)
                        if fext:
                                flatten(name)
                        else:
                                flatten(name+".tex")
		elif (cmd == "bibliography"):
			flatten(mainfile+".bbl")
		else:
			print "Unknown command",cmd
		nextWrite=m.end()
	out.write(content[nextWrite:])
	infile.close()


import optparse, cStringIO
from os import path

parser = optparse.OptionParser(usage="flatex.py [options] infile outfile")
parser.add_option("-s","--strip",action="store_true", dest="strip", help="strip comments")
(options,args) = parser.parse_args()
mainfile,ext = path.splitext(args[0])
out = cStringIO.StringIO()
flatten(args[0])
outfile = open(args[1],"w")
for l in out.getvalue().split("\n"):
#	print l
	if l.strip() != "%":
		outfile.write(l+"\n")
outfile.close()

