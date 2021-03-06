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
		'case_library/predator.case',
		'case_library/cyborg.case',
		'case_library/blade_runner.case',
		'case_library/first_blood.case',
		'case_library/rambo_first_blood_part_two.case',
		'case_library/rambo_three.case',
		'case_library/rocky.case',
		'case_library/demolition_man.case',
		'case_library/die_hard_two.case',
	]
end

def createCaseLib filenames, net
	caseLib = []
	filenames.each do |filename|
		caseLib.push(initalizeCase(filename, net.clone))
	end
	return caseLib
end


def run thoughtLevel
	net = initializeSemanticNet('semantic.net')
	caseLib = createCaseLib(Cases::CASEFILES, net)
	match = initalizeCase('case_library/die_hard.case',net)
	SID(match, caseLib, net, thoughtLevel)
	caseLib.sort!{|x, y| y.activation <=> x.activation}
	puts 'Upon considering the narrative of:'
	puts match.narrateCase
	puts "\n\nI have decided that it is most like this narrative:"
	puts caseLib[0].narrateCase
	puts caseLib[0].activation
	puts "\n\nI propose this solution:"
	match.setSolution(adapt(caseLib[0],match))
	puts match.narrateSolution
	caseLib.each do |c|
		print c.name
		print ":"
		puts c.activation
	end
	caseLib[0].traces.each do |t|
		puts "Trace for:"
		if t[0] == 0
			print "Hero "
		elsif t[0] == 1
			print "Villian "
		elsif t[0] == 2
			print "World "
		end
		puts t[1]
		puts t[2..t.size()].join(" to ")
		puts
	end
	return 'done'
end
