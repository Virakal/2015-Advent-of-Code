require 'digest'

def mine_for key
  digest = Digest::MD5.new

  i = 1

  while true do
    to_try = key.to_s + i.to_s
    hash = digest.hexdigest to_try
    return i if hash.start_with? '00000'
    i += 1
  end
end

puts mine_for 'ckczppom'
