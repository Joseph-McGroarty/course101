#create a diamond of * with size rows and the widest part has size *s

=begin
def diamond(size)
  counter = 1
  (size / 2 - 1).times do
    puts '*'
    counter.times { print '**'}
    counter += 1
  end
  counter -= 3
  ((size / 2) -1).times do
    (counter * 2).times { print '*'}
    puts '*'
    counter -= 1
  end
end
=end
def diamond(size)
  counter = 2
  loop do
    puts '*'
    counter.times { print '*'}
    if counter >= size - 1
      puts '*'
      break
    end
    counter += 2
  end
  second_counter = size / 2
  loop do
    counter.times { print '*'}
    puts '*'
    break if counter <= 1
    counter -= 2
  end
#4.times { print '*'}
#puts '*'

#2.times { print '*'}
#puts '*'

#puts '*'
end

diamond(7)