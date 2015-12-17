def calc time, input
  deer = parse_reindeer input

  time.times do |s|
    deer.each do |d|
      d[:travelled] += d[:speed] if d[:state] == :moving
      d[:duration] += 1

      if d[:state] == :moving and d[:duration] == d[:fly_time]
        d[:duration] = 0
        d[:state] = :resting
      elsif d[:state] == :resting and d[:duration] == d[:rest_time]
        d[:duration] = 0
        d[:state] = :moving
      end
    end
  end

  return (deer.max_by { |d| d[:travelled] })[:travelled]
end

def parse_reindeer input
  reindeer = []
  re = /(?<name>.+) can fly (?<speed>\d+) km\/s for (?<fly_time>\d+) seconds, but then must rest for (?<rest_time>\d+) seconds\./

  input.lines.each do |line|
    match = line.match re
    reindeer << {
      name: match['name'],
      speed: match['speed'].to_i,
      fly_time: match['fly_time'].to_i,
      rest_time: match['rest_time'].to_i,
      state: :moving,
      duration: 0,
      travelled: 0,
    }
  end

  return reindeer
end

input = <<END
Vixen can fly 19 km/s for 7 seconds, but then must rest for 124 seconds.
Rudolph can fly 3 km/s for 15 seconds, but then must rest for 28 seconds.
Donner can fly 19 km/s for 9 seconds, but then must rest for 164 seconds.
Blitzen can fly 19 km/s for 9 seconds, but then must rest for 158 seconds.
Comet can fly 13 km/s for 7 seconds, but then must rest for 82 seconds.
Cupid can fly 25 km/s for 6 seconds, but then must rest for 145 seconds.
Dasher can fly 14 km/s for 3 seconds, but then must rest for 38 seconds.
Dancer can fly 3 km/s for 16 seconds, but then must rest for 37 seconds.
Prancer can fly 25 km/s for 6 seconds, but then must rest for 143 seconds.
END

puts calc 2503, input
