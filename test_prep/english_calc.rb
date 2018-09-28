def computer(english)
  input_arr = english.split(' ')

  translator_hash = {'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4,
                    'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8,
                    'nine' => 9, '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
                    '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

  result = translator_hash[input_arr[0]]

  input_arr.each_with_index do |word, index|
    next if index == 0
    next if index.odd?
    operator_word = input_arr[index - 1]

    if operator_word == 'plus'
      result += translator_hash[word]
    elsif operator_word == 'minus'
      result -= translator_hash[word]
    elsif operator_word == 'times'
      result *= translator_hash[word]
    elsif operator_word == 'dividedby' && word != 0
      result /= translator_hash[word]
    end
  end
  result
end

puts computer('two dividedby two')
puts computer('seven times six')
puts computer('zero dividedby 8')
puts computer('two plus two minus three')
puts computer('three minus one plus five minus 4 plus six plus 7 minus 4')