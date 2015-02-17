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
		elsif(element[0] == 'villian')
		else
			world[element[1].to_sym] = 
		end
			
	end
	return newCase
end