# FILE: main.rb
# Author: Michael Huelsman
# Description:
# 	The actual conglomorating program
# Notes:


require_relative 'case/case'
require_relative 'case/adaptation'
require_relative 'case/case_initial'
require_relative 'semantic_network/semantic_initial'
require_relative 'semantic_network/semantic_net'
require_relative 'semantic_network/semantic_node'
require_relative 'SID/semantic_index_distance'

module Cases
	CASEFILES = [
		'case_library/bloodsport.case',
		'case_library/commando.case',
		'case_library/enter_the_dragon.case',
	]
end

def createCaseLib filenames, net
	caseLib = []
	filenames.each do |filename|
		caseLib.push(initalizeCase(filename, net.clone))
	end
	return caseLib
end


def run
	net = initializeSemanticNet('semantic.net')
	caseLib = createCaseLib(Cases::CASEFILES, net)
	match = initalizeCase('case_library/die_hard.case',net.clone)
	SID(match, caseLib, net, 5)
	caseLib.sort!{|x, y| y.activation <=> x.activation}
	puts 'Upon considering the narrative of:'
	puts match.narrateCase
	puts "\n\nI have decided that it is most like this narrative"
	puts caseLib[0].narrateCase
	puts caseLib[0].activation
	puts "\n\nI propose this solution:"
	match.setSolution(adapt(caseLib[0],match))
	puts match.narrateSolution
	return 'done'
end
