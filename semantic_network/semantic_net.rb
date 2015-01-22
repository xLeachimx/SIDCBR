# FILE: semantic_net.rb
# Author: Michael Huelsman
# Description:
# 	For full description see semantic_net.md in the design folder
# Notes:

require_relative 'semantic_node'

class SemanticNet
	attr_accessor :nodes

	def initialize
		@nodes = Array.new()
	end

	def addNode name
		if @nodes.length == 0
			@nodes.push(SemanticNode.new(name))
			return
		end
		for i in 0...@nodes.length
			if name < @nodes[i].name
				@nodes.insert(i,SemanticNode.new(name))
				return
		end
	end

	def addConnection from, to, type
		getNode(from).addConnection(getNode(type),type)
	end

	def getNode name
		@nodes.bsearch{|x| x.name == name}.clone
	end
end