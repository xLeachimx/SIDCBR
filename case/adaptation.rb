require_relative 'case'


#returns a solution for to as adapted from the solution for from
def adapt from to
	solution = from.solution
	if from.details[0][:weapon].include?(solution[:weapon]) #is the defeating weapon the hero's
		solution[:weapon] = to.details[0][:weapon].sample(1) if to.details[0][:weapon] != nil
	elsif from.deatils[1][:weapon].include?(solution[:weapon]) #is the defeating weapon the villians
		solution[:weapon] = to.details[1][:weapon].sample(1) if to.details[1][:weapon] != nil
	end
	return solution
end