class Case
	attr_accessor :solution
	attr_accessor :details

	@@generic_hero = {
	}
	@@generic_villian = {
	}
	@@generic_world = {
	}
	@@generic_solution = {
	}

	def initialize
		@details = {
			hero: nil,
			villian: nil,
			world: nil,
			solution: nil
		}
	end

	def setHero h
		@details[:hero] = h
	end

	def setVillain v
		@details[:villian] = v
	end

	def setWorld w
		@details[:world] = w
	end

	def setSolution s
		@solution = s
	end
end