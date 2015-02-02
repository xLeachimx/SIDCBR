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
		@nodes.push(SemanticNode.new(name))
	end

	def addConnection from, to, type
		getNode(from).addConnection(getNode(to),type)
	end

	def getNode name
		@nodes[@nodes.index{|x| x.name == name}]
	end
end