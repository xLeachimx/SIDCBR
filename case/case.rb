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

	def narrateCase
		narrative = "In " + @name " the main character"
		if @details[0][:job]
			narrative += " has a job as"
			@details[0][:job].each{|j| narrative += ' ' + j + ','}
			narrative.slice!(-1)
			narratvie += ' and '
		end
		if @details[0][:involved_with]
			narrative += " is involved with"
			@details[0][:involved_with].each{|j| narrative += ' ' + j + ','}
			narrative.slice!(-1)
			narrative += ' and '
		end
		if @details[0][:goal]
			narrative += " has goal(s) of"
			@details[0][:involved_with].each{|j| narrative += ' ' + j + ','}
			narrative.slice!(-1)
		end

		narrative += '.'

		if @details[0][:weapon]
			narrative += " The main character has"
			@details[0][:weapon].each{|j| narrative += ' ' + j + ','}
			narrative.slice!(-1)
			narrative += ' as weapons.'
		end

		narrative += 'The villian on the other hand'

		if @details[1][:job]
			narrative += " has a job as"
			@details[0][:job].each{|j| narrative += ' ' + j + ','}
			narrative.slice!(-1)
			narratvie += ' and '
		end
		if @details[1][:goal]
			narrative += " has goal(s) of"
			@details[1][:involved_with].each{|j| narrative += ' ' + j + ','}
			narrative.slice!(-1)
		end

		narrative += '.'

		if @details[1][:weapon]
			narrative += " The main villian has"
			@details[1][:weapon].each{|j| narrative += ' ' + j + ','}
			narrative.slice!(-1)
			narrative += ' as weapons.'
		end

		if @details[2][:type]
			narrative += 'All of the events that unfold are told in a world of '
			@details[2][:type].each{|j| narrative += ' ' + j + ','}
			narrative.slice!(-1)
		end
		return narrative
	end

	def narrateSolution
		narrative = 'The story ends with the main character in a'
		narrative += ' ' + @solution[:difficulty] if(@solution[:difficulty])
		narrative += ' fight which end with the main villian'
		if(@solution[:lethal])
			narrative += ' being killed.'
		else
			narrative += ' being spared.'
		end
		if @solution[:weapon]
			narrative += ' The main character managed to do this through his use of '
			@solution[:weapon].each{|j| narrative += ' ' + j + ','}
			narrative.slice!(-1)
			narrative += '.'
		end
		if @solution[:help]
			narrative += ' Of course he was not alone in this fight, he had help from his friends.'
		end
		return narrative
	end
end