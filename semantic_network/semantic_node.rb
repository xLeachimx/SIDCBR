# FILE: semantic_node.rb
# Author: Michael Huelsman
# Description:
# 	For full description see semantic_node.md in the design folder
# Notes:

class SemanticNode
	attr_accessor :name
	attr_accessor :activation

	@@validConnections = ["isa","canbe","leadsto","comesfrom","describedby","descriptionof"]
	@@connectionStrength = [1,2,3,3,5,5]

	def initialize name
		@name = name
		@connections = []
		@cases = []
		@activation = 0
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

	def addCaseAssoc c
		@cases.push(c)
		return
	end

	def getAssocCases
		return @cases
	end

	def self.getConnectionStrength type
		return false if not @@validConnections.include?(type)
		location = @@validConnections.index(type)
		return @@connectionStrength[location]
	end
end