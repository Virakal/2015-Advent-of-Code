def parse instructions
  dists = parse_distances instructions
  shortest_path = {path: nil, dist: nil}

  dists.keys.each do |place1|
  dists.keys.each do |place2|
  dists.keys.each do |place3|
  dists.keys.each do |place4|
  dists.keys.each do |place5|
  dists.keys.each do |place6|
  dists.keys.each do |place7|
  dists.keys.each do |place8|
  	path = [place1, place2, place3, place4, place5, place6, place7, place8]
  	next if path.uniq.size != path.size

  	distance =
  	  dists[place1][place2] +
  	  dists[place2][place3] +
  	  dists[place3][place4] +
  	  dists[place4][place5] +
  	  dists[place5][place6] +
  	  dists[place6][place7] +
  	  dists[place7][place8]

  	if shortest_path[:dist] == nil or shortest_path[:dist] > distance
  	  shortest_path = {
  	  	dist: distance,
  	  	path: path
  	  }
	end
  end
  end
  end
  end
  end
  end
  end
  end

  puts shortest_path.inspect
end

def parse_distances instructions
  d = {}
  re = /^(?<from>\w+) to (?<to>\w+) = (?<dist>\d+)$/

  instructions.lines.each do |line|
  	matches = line.match re

  	d[matches[:from]] ||= {}
  	d[matches[:to]] ||= {}
  	d[matches[:from]][matches[:to]] = matches[:dist].to_i
  	d[matches[:to]][matches[:from]] = matches[:dist].to_i
  end

  return d
end

instructions = <<END
Tristram to AlphaCentauri = 34
Tristram to Snowdin = 100
Tristram to Tambi = 63
Tristram to Faerun = 108
Tristram to Norrath = 111
Tristram to Straylight = 89
Tristram to Arbre = 132
AlphaCentauri to Snowdin = 4
AlphaCentauri to Tambi = 79
AlphaCentauri to Faerun = 44
AlphaCentauri to Norrath = 147
AlphaCentauri to Straylight = 133
AlphaCentauri to Arbre = 74
Snowdin to Tambi = 105
Snowdin to Faerun = 95
Snowdin to Norrath = 48
Snowdin to Straylight = 88
Snowdin to Arbre = 7
Tambi to Faerun = 68
Tambi to Norrath = 134
Tambi to Straylight = 107
Tambi to Arbre = 40
Faerun to Norrath = 11
Faerun to Straylight = 66
Faerun to Arbre = 144
Norrath to Straylight = 115
Norrath to Arbre = 135
Straylight to Arbre = 127
END

puts parse instructions
