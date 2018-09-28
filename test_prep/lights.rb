def switch(light)
  if light == 'off'
    'on'
  elsif light == 'on'
    'off'
  end
end

def off_on_array(n)
  light_arr = []
  n.times do
    light_arr << 'off'
  end

num = n

n.times do
    light_arr.map! do |el|
      if (light_arr.index(el) + 1) % (n - num + 1) == 0
        switch(el)
      else
        el
      end
    end
    num -= 1
  end
  light_arr
end

print off_on_array(5)