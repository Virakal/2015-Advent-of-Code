require 'benchmark'

def calculate amount, containers
  combos = 0

  1.upto containers.size do |i|
    containers.combination(i).each do |combo|
      combos += 1 if combo.reduce(0, :+) == amount
    end
  end

  return combos
end

containers = [
  50,
  44,
  11,
  49,
  42,
  46,
  18,
  32,
  26,
  40,
  21,
  7,
  18,
  43,
  10,
  47,
  36,
  24,
  22,
  40,
]

puts Benchmark.measure {
  puts calculate 150, containers
}
