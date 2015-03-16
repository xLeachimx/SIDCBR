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
	c.activation = nil
	c.details.each_index do |i|
		c.details[i].each do |key, value|
			next if(value == nil)
			value.each do |element|
				clearSemanticNet(semanticNet.clone)
				SIDActivationSpread(semanticNet.getNode(element), i, key, activationStart/value.size(),[i,key]) #balance for multiple inputs
			end
		end
	end
end

def SIDActivationSpread node, index, key, currentActiveLevel, currentTrace
	return if(currentActiveLevel <= 0)
	return if(currentActiveLevel <= node.activation)
	previous = node.activation
	node.activation = currentActiveLevel
	node.getAssocCases.each do |c|
		next if(c.activation == nil) # Only true for new case which is not in library/is querying case
		if(c.details[index][key] != nil && c.details[index][key].include?(node.name)) # provide support for multi 
			c.activation += currentActiveLevel/c.details[index][key].size() #suppress activation for balance
			c.activation -= previous/c.details[index][key].size()
			c.traces.pop if(c.traces != [] && c.traces[-1][0] == currentTrace[0] && c.traces[-1][1] == currentTrace[1])
			currentTrace.push(node.name)
			c.traces.push(currentTrace.clone)
			currentTrace.pop
		end
	end
	node.getConnections.each do |connect|
		connectionStr = 0
		if(SemanticNode.getConnectionStrength(connect[0]) < 0)
			count = 0
			node.getConnections.each do |c|
				if(c[0] == connect[0])
					count += 1
				end
			end
			connectionStr = count * SemanticNode.getConnectionStrength(connect[0]).abs
		else
			connectionStr = SemanticNode.getConnectionStrength(connect[0])
		end
		nexttActiveLevel = currentActiveLevel - connectionStr
		currentTrace.push(node.name)
		SIDActivationSpread(connect[1],index,key,nexttActiveLevel,currentTrace)
		currentTrace.pop
	end
end

