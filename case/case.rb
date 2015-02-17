class Case
	attr_accessor :solution
	attr_accessor :details
	attr_accessor :activation

	@@generic_hero = {
		goal: nil,
		involved_with: nil,
		job: nil,
		weapon: nil
	}
	@@generic_villian = {
		weapon: nil,
		goal: nil,
		actor: nil
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
	end

	def setHero h
		@details[0] = h
		@details[0].each do |key, value|
			unless(value == nil)
				if(!@semanticNet.isNode(value))
					@semanticNet.addNode(value)
				end
				@semanticNet.getNode(value).addCaseAssoc(self)
			end
		end
	end

	def setVillain v
		@details[1] = v
		@details[1].each do |key, value|
			unless(value == nil)
				if(!@semanticNet.isNode(value))
					@semanticNet.addNode(value)
				end
				@semanticNet.getNode(value).addCaseAssoc(self)
			end
		end
	end

	def setWorld w
		@details[2] = w
		@details[2].each do |key, value|
			unless(value == nil)
				if(!@semanticNet.isNode(value))
					@semanticNet.addNode(value)
				end
				@semanticNet.getNode(value).addCaseAssoc(self)
			end
		end

	end

	def setSolution s
		@solution = s
	end
end