# FILE: main.rb
# Author: Michael Huelsman
# Description:
# 	The actual conglomorating program
# Notes:


require_relative 'case/case'
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
	match = caseLib[2]
	SID(match, caseLib, net, 5)
	caseLib.sort!{|x, y| y.activation <=> x.activation}
	caseLib.each do |c|
		puts c
		puts c.name + ',' + c.activation.to_s
		puts c.details
		puts "\n\n\n"
	end
	puts "Those were matched to:" 
	puts match
	puts match.name
	puts match.details

	puts 'Links to martial-arts'
	puts net.getNode('martial-arts').getAssocCases
	return 'done'
end
