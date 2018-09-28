def query(orig_arr, seach_criteria_hash)
  orig_arr.select do |inner_hash|
    inner_hash[:name].downcase.start_with?(seach_criteria_hash[:q]) # use a start_with? poss w downcase
    && inner_hash[:price] >= seach_criteria_hash[:price_min]
    && inner_hash[:price] <= seach_criteria_hash[:price_max]
  end
end