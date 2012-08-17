# Mo's Revenge
# http://www.mopub.com/about/coding-challenges/
#
# Author: ttran
#
# Mos revenge is essentially a shortest path problem where the nodes are the mile markers. There are two types of edges: a jetstream or Mo 
# simply flying the mile between markers at the rate indicated by the input. I assume that jetstreams cannot cost negative energy ie grant
# energy, so Dijkstra's should be sufficient.
#
# We should note that the that it is possible for Mo to fly to adjacent mile markers, including the previous mile marker. This is to account
# for the situation in which the input file is something like:
#
# 50
# 0 10 10
# 9 20 10
#
# In the scenario above, it is important to be able to go backwards to catch a jet stream.
import re
import sys

# Essentially a node on a graph. tracks the neighbors and distance to origin (mile marker 0)
class MileMarker:
	def __init__(self, a_num, a_lastMarker, a_defaultCost):
		self.neighbors = []
		
		if (a_num > 0):
			self.neighbors.append({'marker': a_num - 1, 'cost': a_defaultCost})
		if (a_num < a_lastMarker):
			self.neighbors.append({'marker': a_num + 1, 'cost': a_defaultCost})
		
		self.prev = max(a_num - 1, 0)
		self.distance = a_num * a_defaultCost #distance to first node
		self.isJetStream = False # tracking this because we only want to print the jet streams

################################################################################

### PARSE THE FILE ###
if (len(sys.argv) < 1):
	print "Missing jet streams file."
	sys.exit()

filename = sys.argv[1]
jetFile = open(filename, 'r')

# first line is the default energy cost to travel from mile marker n to n+1
defaultCost = int(jetFile.readline())

# get the rest of the content, which is all jetstream data.
jetStreams = {}
endMile = 0 #track the largest mile marker, which is the destination
jetstreamRe = re.compile('([0-9]*) ([0-9]*) ([0-9]*)')

lines = jetFile.readlines()
for line in lines:
	# Parse the line
	matches = jetstreamRe.search(line)
	(startMarker, endMarker, energyCost) = matches.groups()
	startMarker = int(startMarker)
	endMarker = int(endMarker)
	energyCost = int(energyCost)
	
	if (endMarker > endMile):
		endMile = endMarker
	
	if (not startMarker in jetStreams):
		jetStreams[startMarker] = []
	
	jetStreams[startMarker].append({'marker': endMarker, 'cost': energyCost})
	
### BUILD THE GRAPH ###
unvisited = {}
visited = {}
for i in range(endMile+1):
	unvisited[i] = MileMarker(i, endMile, defaultCost)
	if (i in jetStreams):
		for jetStream in jetStreams[i]:
			unvisited[i].neighbors.append(jetStream)
			

### FIND SHORTEST PATH ###
currentNode = 0 #start with starting mile marker

while (len(unvisited) > 0):
	current = unvisited[currentNode]
	
	#examine each neighbor to see if they can be benefited by going through the current node
	for neighbor in current.neighbors:
		if (neighbor['marker'] in unvisited): #we will only examine 'unvisited' nodes
			cost = neighbor['cost']
			
			if (unvisited[neighbor['marker']].distance > current.distance + cost):
				# the current node provides a shorter path to the origin than what is currently 
				# available to this neighbor
				unvisited[neighbor['marker']].distance = current.distance + cost
				unvisited[neighbor['marker']].prev = currentNode
				
				if ((neighbor['marker'] != currentNode + 1 and neighbor['marker'] != currentNode -1) or cost < defaultCost): # using a jet stream.
					unvisited[neighbor['marker']].isJetStream = True #noting this so we can print out the jet streams only later
			
	# mark the node as visited
	visited[currentNode] = unvisited.pop(currentNode)
	
	# search for the current node, which is determined by the one with the lowest distance
	# normally, in Dijkstra's algorithm, we have to worry about the unvisited nodes not
	# having a path to the origin, but since Mo can always fly on his own power, we don't 
	# have to worry about that scenario.
	lowest = float("inf")
	for marker in unvisited:
		if (unvisited[marker].distance < lowest):
			lowest = unvisited[marker].distance
			currentNode = marker
			
### DISPLAY THE RESULT ###
currentNode = endMile
jsPath = []

while (currentNode > 0):
	if (visited[currentNode].isJetStream):
		jsPath.insert(0, (visited[currentNode].prev, currentNode))
	currentNode = visited[currentNode].prev
	
print 'Total cost of ' + str(visited[endMile].distance) + ' using the path:'
print jsPath