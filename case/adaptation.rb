require_relative 'case'


#returns a solution for to as adapted from the solution for from
def adapt from, to
	solution = from.solution
	solution[:weapon].each_index do |i|
		if from.details[0][:weapon].include?(solution[:weapon][i]) #is the defeating weapon the hero's
			solution[:weapon][i] = to.details[0][:weapon].sample(1) if to.details[0][:weapon] != nil
		elsif from.details[1][:weapon].include?(solution[:weapon][i]) #is the defeating weapon the villians
			solution[:weapon][i] = to.details[1][:weapon].sample(1) if to.details[1][:weapon] != nil
		end
	end
	return solution
end