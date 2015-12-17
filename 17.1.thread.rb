require 'thread'

def calculate amount, containers
  combos = 0
  mutex = Mutex.new
  threads = []

  1.upto containers.size do |i|
    threads << Thread.new do
      containers.combination(i).each do |combo|
        mutex.synchronize { combos += 1 } if combo.reduce(0, :+) == amount
      end
    end
  end

  threads.map(&:join)

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

puts calculate 150, containers
