require_relative 'case'


def initalizeCase filename
	newCase = Case.new
	f = File.open(filename, "r")
	contents = f.read
	lines = contents.split("\n")
	hero = {}
	villian = {}
	world = {}
	lines.each do |l|
		l.downcase!
		next if(l[0] == '#')
		elements = l.split(" ")
		if(element[0] == 'hero')
			hero[element[1].to_sym] = element[2]
		elsif(element[0] == 'villian')
			villian[element[1].to_sym] = element[2]
		elsif(element[0] == 'world')
			world[element[1].to_sym] = element[2]
		end
	end
	newCase.setHero(hero)
	newCase.setVillian(villian)
	newCase.setWorld(world)
	return newCase
end