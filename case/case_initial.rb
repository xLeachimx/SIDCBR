# FILE: case_initial.rb
# Author: Michael Huelsman
# Description:
# 	Inits a case from file
# Notes:

require_relative 'case'


def initalizeCase filename, sNet
	newCase = Case.new(sNet)
	newCase.name = filename
	f = File.open(filename, "r")
	contents = f.read
	lines = contents.split("\n")
	hero = {}
	villain = {}
	world = {}
	lines.each do |l|
		l.downcase!
		next if(l[0] == '#')
		elements = l.split(" ")
		elements[2] = nil if(elements[2] == "nil")
		if(elements[0] == 'hero')
			hero[elements[1].to_sym] = elements[2]
		elsif(elements[0] == 'villain')
			villain[elements[1].to_sym] = elements[2]
		elsif(elements[0] == 'world')
			world[elements[1].to_sym] = elements[2]
		end
	end
	newCase.setHero(hero)
	newCase.setVillain(villain)
	newCase.setWorld(world)
	return newCase
end