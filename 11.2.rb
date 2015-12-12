PASS_LENGTH = 8

def find_next_pass pass
  new_pass = pass

  while true do
    new_pass = increment_pass new_pass
    return new_pass if is_valid new_pass
  end
end

def is_valid pass
  # Check for bad chars
  return false if pass.match(/[iol]/)
  # Check for required pairs
  return false unless pass.match(/(.)\1.*((?!\1).)\2/)
  # Check for straight
  return false unless has_straight pass

  return true
end

def has_straight pass
  0.upto(pass.size - 4) do |n|
    to_test = pass[n..n+2]
    first = pass[n]
    return true if to_test == [first, first.succ, first.succ.succ].join
  end

  return false
end

def increment_pass pass
  replacement = ''
  pass.chars.reverse.each do |char|
    raise 'Crap' if replacement.size > 8

    if char == 'z'
      replacement += 'a'
    else
      succ = char.succ
      succ.succ! if succ.match(/[iol]/) # Skip bad chars early

      replacement = succ + replacement
      break
    end
  end

  return pass[0..(7 - replacement.size)] + replacement
end

puts find_next_pass(find_next_pass 'hepxcrrq')
