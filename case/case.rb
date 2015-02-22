# FILE: case.rb
# Author: Michael Huelsman
# Description:
# 	For full description see case.md in the design folder
# Notes:


class Case
	attr_accessor :solution
	attr_accessor :details
	attr_accessor :activation
	attr_accessor :name

	@@generic_hero = {
		goal: nil,
		involved_with: nil,
		job: nil,
		weapon: nil
	}
	@@generic_villian = {
		weapon: nil,
		goal: nil,
		job: nil
	}
	@@generic_world = {
		type: nil
	}
	@@generic_solution = {
		lethal: nil,
		weapon: nil,
		difficulty: nil,
		help: nil
	}

	def initialize semanticNet
		@details = [@@generic_hero, @@generic_villian, @@generic_world]

		@solution = @@generic_solution
		@semanticNet = semanticNet
		name = ''
	end

	def setHero h
		@details[0] = h
		@details[0].each do |key, value|
			unless(value == nil)
				value.each do |element|
					if(!@semanticNet.isNode(element))
						@semanticNet.addNode(element)
					end
					@semanticNet.getNode(element).addCaseAssoc(self)
				end
			end
		end
	end

	def setVillain v
		@details[1] = v
		@details[1].each do |key, value|
			unless(value == nil)
				value.each do |element|
					if(!@semanticNet.isNode(element))
						@semanticNet.addNode(element)
					end
					@semanticNet.getNode(element).addCaseAssoc(self)
				end
			end
		end
	end

	def setWorld w
		@details[2] = w
		@details[2].each do |key, value|
			unless(value == nil)
				value.each do |element|
					if(!@semanticNet.isNode(element))
						@semanticNet.addNode(element)
					end
					@semanticNet.getNode(element).addCaseAssoc(self)
				end
			end
		end

	end

	def setSolution s
		@solution = s
	end
end