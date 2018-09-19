def select_fruit(argument)
  keys = argument.keys
  selected = []
  counter = 0

  loop do
    if argument[keys[counter]] == 'Fruit'
      selected << [keys[counter], argument[keys[counter]]]
    end
    counter += 1
    break if counter == argument.size

  end
  selected.to_h
end


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

 puts select_fruit(produce)