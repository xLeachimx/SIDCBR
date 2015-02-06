class Case
	attr_accessor :solution
	attr_accessor :details

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
		@details = {
			hero: @@generic_hero,
			villian: @@generic_villian,
			world: @@generic_world,
		}
		@solution = @@generic_solution
		@semanticNet = semanticNet
	end

	def setHero h
		@details[:hero] = h
		@details[:hero].each{|key, value|} do
			if(@semanticNet.isNode(value))
				@semanticNet.addNode(value)
			end
			@semanticNet.getNode(value).addCaseAssoc(self)
		end
	end

	def setVillain v
		@details[:villian] = v
		@details[:villian].each{|key, value|} do
			if(@semanticNet.isNode(value))
				@semanticNet.addNode(value)
			end
			@semanticNet.getNode(value).addCaseAssoc(self)
		end
	end

	def setWorld w
		@details[:world] = w
		@details[:world].each{|key, value|} do
			if(@semanticNet.isNode(value))
				@semanticNet.addNode(value)
			end
			@semanticNet.getNode(value).addCaseAssoc(self)
		end

	end

	def setSolution s
		@solution = s
	end
end