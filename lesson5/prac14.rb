new_arr = []

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.each do |key, info|
  if info[:type] == 'fruit'
    new_arr << info[:colors].map {|color| color.capitalize}
  elsif info[:type] == 'vegetable'
    new_arr << info[:size].upcase
  end
end

print new_arr