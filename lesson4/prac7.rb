munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |_, inner_hash|
  if inner_hash["age"] <= 17
    inner_hash["age_group"] = "kid"
  elsif inner_hash["age"] >= 65
    inner_hash["age_group"] = "senior"
  else
    inner_hash["age_group"] = "adult"
  end
end

puts munsters