# FILE: semantic_index_distance.rb
# Author: Michael Huelsman
# Description:
# 	Actually runs the SID algorithm
# Notes:


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

def SID c, caseLib, semanticNet, activationStart
	clearCaseLibActivation(caseLib)
	c.details.each_index do |i|
		c.details[i].each do |key, value|
			next if(value == nil)
			value.each do |element|
				clearSemanticNet(semanticNet.clone)
				SIDActivationSpread(semanticNet.getNode(element), i, key, activationStart/value.size()) #balance for multiple inputs
			end
		end
	end
end

def SIDActivationSpread node, index, key, currentActiveLevel
	return if(currentActiveLevel <= 0)
	return if(currentActiveLevel <= node.activation)
	previous = node.activation
	node.activation = currentActiveLevel
	node.getAssocCases.each do |c|
		next if(c.activation == nil) # Only true for new case which is not in library
		if(c.details[index][key] != nil && c.details[index][key].include?(node.name)) # provide support for multi 
			c.activation += currentActiveLevel/c.details[index][key].size() #suppress activation for balance
			c.activation -= previous/c.details[index][key].size()
		end
	end
	node.getConnections.each do |connect|
		nexttActiveLevel = currentActiveLevel - SemanticNode.getConnectionStrength(connect[0])
		SIDActivationSpread(connect[1],index,key,nexttActiveLevel)
	end
end

