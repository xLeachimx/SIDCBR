require_relative '../semantic_network/semantic_node'
require_relative '../semantic_network/semantic_net'
require_relative '../case/case'

def clearCaseLibActivation caseLib
	caseLib.each do |c|
		c.activation = 0
	end
end

def clearSemanticNet semanticNet
	semanticNet.nodes.each do |n|
		n.activation = 0
	end
end

def SID c caseLib semanticNet
	clearCaseLibActivation(caseLib)
	c.details.each_index do |i|
		c.details[i].each do |key, value|
			next if(value == nil)
			clearSemanticNet(semanticNet.clone)
			SIDActivationSpread(semanticNet.getNode(value), i, key, 10)
		end
	end
end

def SIDActivationSpread node, index, key, currentActiveLevel
	return if(currentActiveLevel <= 0)
	return if(currentActiveLevel <= node.activation)
	previous = node.activation
	node.activation = currentActiveLevel
	node.getAssocCase.each do |c|
		if(c[i][key] == node.name)
			c.activation += currentActiveLevel
			c.activation -= previous
		end
	end
	node.getConnections.each do |connect|
		nexttActiveLevel = currentActiveLevel - SemanticNode.getConnectionStrength(connect[0])
		SIDActivationSpread(connect[1],index,key,nexttActiveLevel)
	end
end

