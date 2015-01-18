# FILE: semantic_node.rb
# Author: Michael Huelsman
# Description:
# 	For full description see semantic_node.md in the design folder
# Notes:

class SemanticNode
	attr_accessor :name

	@@validConnections = ["isa"]

	def initalize name
		@name = name
		@connections = []
	end

	def addConnection other, type
		if @@validConnections.include?(type)
			@connections.push([type,other])
			return true
		end
		return false
	end

	def getConnections
		return @connections
	end
end