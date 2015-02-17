require_relative 'case/case'
require_relative 'case/case_initial'
require_relative 'semantic_network/semantic_initial'
require_relative 'semantic_network/semantic_net'
require_relative 'semantic_network/semantic_node'
require_relative 'SID/semantic_index_distance'

def run
	net = initializeSemanticNet('semantic.net')
	caseLib = [
		initalizeCase('case_library/bloodsport.case',net.clone),
		initalizeCase('case_library/commando.case',net.clone)
	]
	match = initalizeCase('case_library/enter_the_dragon.case',net.clone)
	SID(match, caseLib, net)
	caseLib.each do |c|
		puts c
		puts c.name + ',' + c.activation.to_s
		puts c.details
		puts "\n\n\n\n\n\n\n"
	end
	puts match
	puts match.name + ',' + match.activation.to_s
	puts match.details
	puts net.getNode('martial-arts').getAssocCases
	return 'done'
end
