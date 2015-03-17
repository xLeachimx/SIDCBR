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
	attr_accessor :traces

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
		@name = ''
		@traces = []
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
		narrative = "In " + @name + " the main character"
		if @details[0][:job]
			narrative += " has a job as "
			narrative += @details[0][:job].join(' and ')
			narrative += ' and' if @details[0][:involved_with] || @details[0][:goal]
		end
		if @details[0][:involved_with]
			narrative += " is involved with"
			narrative += @details[0][:involved_with].join(' and ')
			narrative += ' and' if @details[0][:goal]
		end
		if @details[0][:goal]
			narrative += " has goal(s) of"
			narrative += @details[0][:goal].join(' and ')
		end

		narrative += '.'

		if @details[0][:weapon]
			narrative += " The main character has "
			narrative += @details[0][:weapon].join(' and ')
			narrative += ' as weapons.'
		end

		narrative += ' The villian on the other hand'

		if @details[1][:job]
			narrative += " has a job as "
			narrative += @details[1][:job].join(' and ')
			narrative += ' and' if @details[0][:goal]
		end
		if @details[1][:goal]
			narrative += " has goal(s) of "
			narrative += @details[1][:goal].join(' and ')
		end

		narrative += '.'

		if @details[1][:weapon]
			narrative += " The main villian has"
			narrative += @details[1][:weapon].join(' and ')
			narrative += ' as weapons.'
		end

		if @details[2][:type]
			narrative += ' All of the events that unfold are told in the world of the '
			narrative += @details[2][:type].join(' and ')
		end
		return narrative
	end

	def narrateSolution
		narrative = 'The story ends with the main character in a'
		narrative += ' ' + @solution[:difficulty].join(' and ') if @solution[:difficulty]
		narrative += ' fight which ends with the main villian'
		if(@solution[:lethal])
			narrative += ' being killed.'
		else
			narrative += ' being spared.'
		end
		if @solution[:weapon]
			narrative += ' The main character managed to do this through his use of'
			narrative += @solution[:weapon].join(' and ')
			narrative += '.'
		end
		if @solution[:help]
			narrative += ' Of course he was not alone in this fight, he had help from his friends.'
		end
		return narrative
	end
end