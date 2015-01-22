# FILE: semantic_net.rb
# Author: Michael Huelsman
# Description:
# 	For full description see semantic_net.md in the design folder
# Notes:

require_relative 'semantic_node'

class SemanticNet
	attr_accessor :nodes

	def initialize
		nodes = Array.new()
	end

	def addNode name
	end

	def addConnection from, to, type
	end

	def getNode name
	end
end