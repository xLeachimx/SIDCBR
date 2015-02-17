require_relative 'semantic_net'

def initializeSemanticNet filename
	sNet = SemanticNet.new
	f = File.open(filename, "r")
	contents = f.read
	lines = contents.split("\n")
	lines.each do |l|
		l.downcase!
		next if(l[0] == '#')
		elements = l.split(" ")
		sNet.addNode(elements[0]) if(!sNet.isNode(elements[0]))
		sNet.addNode(elements[2]) if(!sNet.isNode(elements[2]))		
		sNet.addConnection(elements[0],elements[2],elements[1])
	end
	return sNet
end