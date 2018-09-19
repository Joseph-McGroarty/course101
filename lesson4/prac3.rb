flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones = Hash.new flintstones.each {|key| flintstones[key] = flintstones.index(key)}
puts flintstones